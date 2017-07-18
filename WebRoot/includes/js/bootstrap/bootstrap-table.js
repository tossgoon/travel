/// <reference path="jquery-1.8.3.min.js" />
var dateTimeFormat = "yyyy-MM-dd hh:mm:ss";
var searchdateOpts = {
	language : 'zh-CN',
	weekStart : 1,
	todayBtn : 1,
	autoclose : 1,
	todayHighlight : 1,
	startView : 2,
	forceParse : 0,
	showMeridian : 1,
	minView : 2,
	format : 'yyyy-mm-dd'
}

Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
		if (this[i].name && val.name) {
			if (this[i].name == val.name)
				return i;
		} else {
			if (this[i] == val)
				return i;
		}
	}
	return -1;
};
!function($) {

	'use strict';
	var sprintf = function(str) {
		var args = arguments, flag = true, i = 1;

		str = str.replace(/%s/g, function() {
			var arg = args[i++];

			if (typeof arg === 'undefined') {
				flag = false;
				return '';
			}
			return arg;
		});
		if (flag) {
			return str;
		}
		return '';
	};

	var BootstrapTable = function(el, options) {
		this.options = options;
		this.$el = $(el);
		this.$el_ = this.$el.clone();

		this.init();
	};

	BootstrapTable.DEFAULTS = {
		classes : 'table table-hover',
		height : undefined,
		undefinedText : '',
		sortName : undefined,
		sortOrder : 'asc',
		striped : false,
		columns : [],
		data : [],
		method : 'POST',
		url : undefined,
		queryParams : {},
		pagination : false,
		sidePagination : 'client', // client or server
		totalRows : 0, // server side need to set
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 10, 25, 50, 100 ],
		search : false,
		multiSelect : false,
		selectItemName : 'btSelectItem',
		showHeader : true,
		showColumns : false,
		showPageList : false,
		idField : undefined,
		pidField : undefined,
		expandField : undefined,
		expandLevel : undefined,
		rootValue : null,
		groupField : undefined,
		groupFields : [],
		showGroupCount : true,
		showGroupView : false,
		showSummaryView : false,
		showQuickSearch : false,
		showVirtualView : false,
		virtualPageSize : 5000,
		virtualRowHeight : 31,
		groupExpand : false,
		groupSort : false,
		toolsInRightBar : [],
		toolsInLeftBar : [],
		toolsInColumn : [],
		gridTitle : null,
		enbaleHorizontalScrollBar : true,
		headerHeight : 38,
		fixedColumns : false,
		editable : false,
		expandCls : "glyphicon-menu-down",
		collapseCls : "glyphicon-menu-right",
		showPageInfo : true,
		showCheckColumn : true,
		cbxStopPropagation : true,

		formatLoadingMessage : function() {
			return 'Loading, please wait…';
		},
		formatRecordsPerPage : function(pageNumber) {
			return sprintf('%s records per page', pageNumber);
		},
		formatShowingRows : function(pageFrom, pageTo, totalRows) {
			return sprintf('Showing %s to %s of %s rows', pageFrom, pageTo, totalRows);
		},
		formatSearch : function() {
			return 'Search';
		},
		formatNoMatches : function() {
			return 'No matching records found';
		},

		onClickRow : function(item) {
			return false;
		},
		onDblClickRow : function(item) {
			return false;
		},
		onSort : function(name, order) {
			return false;
		},
		onCheck : function(row) {
			return false;
		},
		onUncheck : function(row) {
			return false;
		},
		onCheckAll : function() {
			return false;
		},
		onUncheckAll : function() {
			return false;
		}
	};

	BootstrapTable.prototype.init = function() {
		this.initContainer();
		this.initHeader();
		this.initHeaderGroup();
		this.initData();
		this.initToolbar();
		this.initPagination();
		this.initBody();
		this.initServer();
	};

	BootstrapTable.prototype.initContainer = function() {
		this.$container = $([ '<div class="bootstrap-table">', '<div class="fixed-table-toolbar"></div>', '<div class="fixed-table-container">', '<div class="fixed-table-body">', '<div class="fixed-table-loading">', this.options.formatLoadingMessage(), '</div>', '</div>', '</div>', '<div class="fixed-table-pagination"></div>', '</div>' ].join(''));

		this.$container.insertAfter(this.$el);
		this.$container.find('.fixed-table-body').append(this.$el);
		this.$container.after('<div class="clearfix"></div>');
		this.$loading = this.$container.find('.fixed-table-loading').css({
			"padding-top" : "3px",
			"z-index" : "28"
		});
		this.$el.addClass(this.options.classes);
		if (this.options.striped) {
			this.$el.addClass('table-striped');
		}
		// 滚动的时候固定header的位置，左右滚动条都是fixed-table-container的
		var that = this;
		that.$table = this.$container.find('.fixed-table-body table');
		that.$fixedtablebody = this.$container.find('.fixed-table-body');
		that.$fixedtablecontainer = this.$container.find('.fixed-table-container');
		that.$table.css({
			"width" : "100%"
		});
		that.$fixedtablebody.css({
			"overflow" : "visible",
			"height" : "auto"
		});
		that.$fixedtablecontainer.css({
			"overflow" : "auto"
		});
		that.$fixedtablecontainer.scroll(function() {
			// 水平滚动
			var scrollLeft = that.$fixedtablecontainer.scrollLeft();
			if (that.currentScrollLeft != scrollLeft) {
				that.currentScrollLeft = scrollLeft;
				that.$loading.css({
					"left" : scrollLeft,
					"width" : that.$loading.width() + "px"
				});
			}
			// 垂直滚动
			var scrollTop = that.$fixedtablecontainer.scrollTop();
			if (that.currentScrollTop != scrollTop) {
				that.currentScrollTop = scrollTop;
				var headerHeight = that.$header.height();
				that.$header.css({
					"top" : scrollTop
				});
				that.$loading.css({
					"top" : scrollTop + headerHeight,
					"height" : that.$loading.height() + "px"
				});
				if (that.options.showVirtualView) {
					that.createVirtualView(scrollTop);
				}
				that.setFootTop();
			}
		});
	};

	BootstrapTable.prototype.isHorizontalScrolling = function() {
		var that = this;
		return that.$header.width() > that.$fixedtablecontainer.width();
	}

	BootstrapTable.prototype.isVerticalScrolling = function() {
		var that = this;
		var footHeight = that.$foot ? that.$foot.height() : 0;
		return that.$fixedtablebody.height() > that.$fixedtablecontainer.height() - that.$header.height() - footHeight;
	}

	BootstrapTable.prototype.setFootTop = function() {
		var that = this;
		if (that.$foot) {
			var headerHeight = that.$header.height();
			var containerHeight = that.$fixedtablecontainer.height();
			var tfootTop = that.$header.position().top + containerHeight + headerHeight - 1;
			if (that.isHorizontalScrolling()) {
				tfootTop = tfootTop - 17;// 横向滚动条高度17
			}
			that.$foot.css({
				"top" : tfootTop
			});
		}
	};

	BootstrapTable.prototype.isNumeric = function(e) {
		return !isNaN(parseFloat(e)) && isFinite(e)
	};

	BootstrapTable.prototype.initHeader = function() {
		var that = this, columns = [], visibleColumns = [], html = [];
		this.$header = this.$el.find('thead');
		if (!this.$header.length) {
			// 强制成table，否则position设置成absolute后不会自动拉伸
			this.$header = $('<thead></thead>').css({
				'display' : 'table',
				'position' : 'absolute',
				'top' : '0',
				'left' : '0',
				'z-index' : '18',
				"width" : "100%",
				'background-color' : '#fff'
			}).appendTo(this.$el);
		}

		if (!this.$header.find("tr").length) {
			this.$header.append('<tr class="group_tr"></tr>');
			this.$header.append('<tr class="title_tr"></tr>');
		}

		this.$groupTR = this.$header.find('.group_tr');
		this.$titleTR = this.$header.find('.title_tr');

		this.$header.find('th').each(function() {
			var column = $.extend({}, {
				title : $(this).text()
			}, $(this).data());
			columns.push(column);
		});

		this.options.columns = $.extend(columns, this.options.columns);

		var checkedcolumns = $.grep(that.options.columns, function(col) {
			return col.radio || col.checkbox
		});
		if (checkedcolumns.length == 0) {
			// 没有选择字段则自动创建一个radio的
			var checkcolumn = {
				field : 'checked',
				width : 28
			};
			if (that.options.multiSelect) {
				checkcolumn.checkbox = true;
			} else {
				checkcolumn.radio = true;
			}
			that.options.columns.splice(0, 0, checkcolumn);
		}

		this.header = {
			fields : [],
			styles : {},
			formatters : {},
			sorters : {},
			editors : {},
			summaryColumns : [],
			fieldColumns : {}
		};

		var col_groupFields = [];
		// groupFields优先级：that.options.groupField>that.options.groupFields>col_groupFields
		if (typeof that.options.groupField == "string") {
			// 如果提供了groupField那么强制不显示分组记录数和显示分组视图（建模数据集字段属性那边用）
			that.options.groupFields = that.options.groupField.split(",");
			that.options.showGroupCount = false;
			that.options.showGroupView = true;
			that.options.groupSort = false;
		}

		var filterIconCSS = {
			"font-size" : "6px",
			"padding" : "5px",
			"cursor" : "pointer",
			"color" : "#aaa",
			"border" : "0px",
			"border-radius" : "0px",
			"background-color" : "#f9f9f9"
		};

		var filterInputCSS = {
			"border" : "0px",
			"height" : "30px",
			"padding" : "5px",
			"box-shadow" : "none"
		};

		$.each(this.options.columns, function(i, column) {
			var field = column.field;
			var ischeckcolumn = false;
			var text = '', style = sprintf('vertical-align: %s; ', column.valign), order = that.options.sortOrder || column.order || 'asc';

			column.visible = typeof column.visible === 'undefined' ? true : column.visible;
			if (!column.visible) {
				return;
			}
			var groupIndex = that.isNumeric(column.groupIndex) ? parseInt(column.groupIndex) : -1;
			if (groupIndex > -1) {
				col_groupFields[groupIndex] = column.field;
			}
			if (column.radio || column.checkbox) {
				ischeckcolumn = true;
				that.options.multiSelect = column.checkbox;
				that.options.haschecked = true;
			}
			if (column.mergeGroupName) {
				that.existMergeGroupName = true;
			} else {
				column.mergeGroupName = "";
			}
			if (!column.titleAlign) {
				column.titleAlign = "center";
			}

			var gth = $("<th></th>").text(column.mergeGroupName).appendTo(that.$groupTR);

			if (!column.width) {
				column.width = ischeckcolumn ? 25 : 150;
			}

			if (that.isPagination() == false && that.options.showSummaryView && visibleColumns.length == 1 && !column.summary) {
				if (column.width < 100) {
					column.width = 100
				}
				column.summary = {
					name : "计数",
					format : "总共%s条记录",
					position : "foot",
					builtin : true
				};
			}

			if (that.isNumeric(column.width)) {
				style += sprintf('width:%spx;', column.width);
				style += sprintf('min-width:%spx;', column.width);
				if (that.options.showVirtualView || that.options.nowrap || that.options.fixedColumns || column.fixed) {
					style += sprintf('max-width:%spx;overflow:hidden;text-overflow:ellipsis;', column.width);
					if (that.options.showVirtualView || that.options.nowrap) {
						style += "white-space:nowrap;"
					}
				}
			} else {
				style += sprintf('width:%s;', column.width);
			}
			style += sprintf('text-align:%s;', column.titleAlign);
			style += column.sortable ? 'cursor: pointer;' : '';

			visibleColumns.push(column);
			that.header.fields.push(field);
			that.header.styles[field] = style;
			that.header.formatters[field] = column.formatter;
			that.header.sorters[field] = column.sorter;
			that.header.editors[field] = column.editor;
			that.header.fieldColumns[field] = column;
			if (column.summary) {
				that.header.summaryColumns.push(column);
			}
			html.push('<th class="th-text"' + sprintf(' style="%s"', style) + ' data-field="' + column.field + '"' + '>');
			gth.attr("style", style);

			text = column.title;
			if (that.options.sortName === column.field && column.sortable) {
				text += that.getCaretHtml();
			}

			if (column.checkbox) {
				text = '<input name="btSelectAll" type="checkbox" class="checkbox"/>';
				that.header.stateField = column.field;
			}
			if (column.radio) {
				text = '';
				that.header.stateField = column.field;
			}

			html.push(text);
			html.push('</th>');
		});

		if (col_groupFields.length > 0 && that.options.groupFields.length == 0) {
			that.options.groupFields = [];
			$(col_groupFields).each(function(j, field) {
				if (field) {
					that.options.groupFields.push(field);
				}
			});
		}

		that.$titleTR.html(html.join(''));
		var bindsortclick = function(th, i) {
			var visibleColumn = visibleColumns[i];
			if (visibleColumn) {
				th.data(visibleColumn);
				if (visibleColumn.sortable) {
					th.off('click').on('click', $.proxy(that.onSort, that));
				}
			}
		};
		that.$titleTR.find("th").each(function(i) {
			var th = $(this);
			bindsortclick(th, i);
		});
		that.$groupTR.find("th").each(function(i) {
			var th = $(this);
			bindsortclick(th, i);
		});

		if (!that.existMergeGroupName) {
			that.$groupTR.remove();
		}

		this.$selectAll = this.$header.find('[name="btSelectAll"]');
		this.$selectAll.off('click').on('click', function() {
			var checked = $(this).prop('checked');
			that[checked ? 'checkAll' : 'uncheckAll']();
		});
	};

	BootstrapTable.prototype.initHeaderGroup = function() {
		var that = this;
		if (that.existMergeGroupName == true) {
			// 在处理列（colspan）合并
			var mergecell = null;
			$(that.$groupTR).find("th").each(function(i) {
				if (i == 0 && that.options.haschecked == true) {
					return;
				}
				var gth = $(this);
				if (gth.text()) {
					if (!mergecell) {
						mergecell = gth;
					} else {
						if (mergecell.text() == gth.text()) {
							gth.hide();
							var colspan = mergecell.attr("colspan");
							if (!colspan) {
								colspan = 1;
							}
							mergecell.attr("colspan", parseInt(colspan) + 1);
						} else {
							mergecell = gth;
						}
					}
				} else {
					mergecell = null;
				}
			});

			// 先处理行（rowspan）合并
			$(that.$groupTR).find("th").each(function(i) {
				if (i == 0 && that.options.haschecked == true) {
					return;
				}
				var gth = $(this);
				var gtext = gth.text();
				if (!gtext) {
					var titlecell = that.$titleTR.find("th").eq(i);
					var newtext = titlecell.text();
					gth.attr("rowspan", 2).css({
						"vertical-align" : " middle"
					}).text(newtext);
					titlecell.hide();
				}
			});
		} else {
			// 没有列合并分组的时候固定单行高度
			var headerHeight = this.options.headerHeight;
			this.$header.height(headerHeight);
		}

		this.$header.find("tr").each(function() {
			var ths = $(this).find("th");
			ths.first().css("border-left-width", "0px");
		});

		window.setTimeout(function() {
			if (that.options.showHeader) {
				var oh = that.$header.outerHeight();
				that.$header.height(oh);
				that.$fixedtablecontainer.css('padding-top', oh - 1);
				that.$loading.css({
					"top" : oh
				});
			} else {
				that.$header.hide();
				that.$fixedtablecontainer.css('padding-top', 0);
				that.$loading.css({
					"top" : "1"
				});
			}
		}, 10);
	}

	BootstrapTable.prototype.getRowID = function(row) {
		var that = this;
		return that.options.idField ? row[that.options.idField] : that.data.indexOf(row);
	}

	BootstrapTable.prototype.moveUpRow = function(rowid) {
		var that = this;
		var tr = that.getRowTR(rowid);
		var prev = tr.prev();
		if (prev.length > 0) {
			var row = that.getRow(rowid);
			tr.insertBefore(prev);
			var rowindex = that.data.indexOf(row);
			that.data.splice(rowindex, 1);
			that.data.splice(rowindex - 1, 0, row);
		}
	}

	BootstrapTable.prototype.moveDownRow = function(rowid) {
		var that = this;
		var tr = that.getRowTR(rowid);
		var next = tr.next();
		if (next.length > 0) {
			var row = that.getRow(rowid);
			tr.insertAfter(next);
			var rowindex = that.data.indexOf(row);
			that.data.splice(rowindex, 1);
			that.data.splice(rowindex + 1, 0, row);
		}
	}

	BootstrapTable.prototype.getData = function() {
		return this.data;
	}

	BootstrapTable.prototype.getRow = function(rowid) {
		return this.getDataRow(rowid);
	}

	BootstrapTable.prototype.initData = function(data, append) {
		if (append) {
			this.data = this.data.concat(data);
		} else {
			this.data = data || this.options.data;
		}

		this.initSort();
	};

	BootstrapTable.prototype.initSort = function() {
		var name = this.options.sortName, order = this.options.sortOrder === 'desc' ? -1 : 1;
		if (name) {
			var sorter = this.header.sorters[name];
			this.data.sort(function(a, b) {
				if (typeof sorter === 'function') {
					return order * sorter(a[name], b[name]);
				}
				if (typeof sorter === 'string') {
					return order * eval(sorter + '(a[name], b[name])');
				}
				if (a[name] === b[name]) {
					return 0;
				}
				if (a[name] < b[name]) {
					return order * -1;
				}
				return order;
			});
		}
	};

	BootstrapTable.prototype.onSort = function(event) {
		var $this = $(event.currentTarget);

		this.$header.find('span.order').remove();
		this.options.sortName = $this.data('field');
		this.options.sortOrder = $this.data('order') === 'asc' ? 'desc' : 'asc';
		this.options.onSort(this.options.sortName, this.options.sortOrder);

		$this.data('order', this.options.sortOrder);
		$this.append(this.getCaretHtml());

		this.initSort();
		this.initBody();
	};

	BootstrapTable.prototype.initToolbar = function() {
		var that = this, html = [], $pageList, $keepOpen, $search;

		this.$toolbar = this.$container.find('.fixed-table-toolbar');
		var gridid = this.options.gridid;
		if (gridid == undefined) {
			gridid = "";
		}
		if (this.options.gridTitle != null) {
			html = [];
			html.push('<div class="page-list">');
			html.push('</div');
			this.$toolbar.append(html.join(''));
		}

		if (this.options.toolsInLeftBar) {
			html = [];
			html.push('<div class="page-list pull-left leftbar" style="padding-top:5px;padding-right:5px;margin-bottom:0px;">');
			$.each(this.options.toolsInLeftBar, function(i, tool) {
				if (!tool.onclick) {
					tool.onclick = "";
				}
				if (!tool.className) {
					tool.className = "btn-default";
				}
				var onclick = typeof tool.onclick == "function" ? "" : tool.onclick;
				html.push(sprintf('<button class="lefttool btn %s btn-xs mimtool" id="%s" onclick="%s" gridid="%s" title="%s" style="margin:0px 2px;padding-top:2px;padding-left:10px;padding-right:8px;"><span class="glyphicon %s" style="margin-right:3px;"></span></button>', tool.className, tool.id, onclick, gridid, tool.text, tool.iconCls));
			});
			html.push('</div');
			this.$toolbar.append(html.join(''));
			this.$toolbar.find(".lefttool").each(function(i) {
				var lefttool = $(this);
				var toolinfo = that.options.toolsInLeftBar[i];
				if (typeof toolinfo.onclick == "function") {
					lefttool.on("click", toolinfo.onclick);
				}
				lefttool.tooltip({
					html : true,
					delay : 500,
					placement : "bottom",
					title : lefttool.attr("title")
				});
			});

			if (this.options.toolsInLeftBar.length > 0) {
				this.$toolbar.css("min-height", "45px");
				// 防止最后一个tooltip四个字的时候变形
				var leftbar = this.$toolbar.find(".leftbar");
				leftbar.width(this.options.toolsInLeftBar.length * 45);
			}
		}

		if (this.options.toolsInRightBar) {
			html = [];
			html.push('<div class="page-list pull-right rightbar" style="margin-top:4px;">');
			$.each(this.options.toolsInRightBar, function(i, tool) {
				if (!tool.onclick) {
					tool.onclick = "";
				}
				if (!tool.className) {
					tool.className = "btn btn-danger";
				}
				var iconspan = '';
				var onclick = typeof tool.onclick == "function" ? "" : tool.onclick;
				if (tool.iconCls) {
					iconspan = sprintf('<span class="glyphicon %s" style="margin-right:3px;"></span>', tool.iconCls);
				}
				html.push(sprintf('<button class="righttool %s" id="%s" onclick="%s" gridid="%s">%s%s</button>', tool.className, tool.id, onclick, gridid, iconspan, tool.text));
			});
			html.push('</div');
			this.$toolbar.append(html.join(''));
			this.$toolbar.find(".righttool").each(function(i) {
				var righttool = $(this);
				var toolinfo = that.options.toolsInRightBar[i];
				if (typeof toolinfo.onclick == "function") {
					righttool.on("click", toolinfo.onclick);
				}
			});
			if (this.options.toolsInRightBar.length == 0) {
				if (this.options.toolsInLeftBar.length > 0) {
					// 强制一下height,否则会变形
					this.$toolbar.find(".rightbar").height(35);
				}
			}
		}

		if (this.isPagination() && this.options.showPageList) {
			html = [];
			html.push('<div class="page-list">');

			var pageNumber = [ '<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">', '<span class="page-size">', this.options.pageSize, '</span>', ' <span class="caret"></span>', '</button>', '<ul class="dropdown-menu" role="menu">' ];

			$.each(this.options.pageList, function(i, page) {
				var active = page === that.options.pageSize ? ' class="active"' : '';
				pageNumber.push(sprintf('<li%s><a href="javascript:void(0)">%s</a></li>', active, page));
			});
			pageNumber.push('</ul>');

			html.push(this.options.formatRecordsPerPage(pageNumber.join('')));
			html.push('</div>');

			this.$toolbar.append(html.join(''));
			$pageList = this.$toolbar.find('.page-list a');
			$pageList.off('click').on('click', $.proxy(this.onPageListChange, this));
		}

		if (this.options.showColumns) {
			html = [];
			html.push('<div class="columns pull-right keep-open">', '<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">', '<i class="glyphicon glyphicon-th icon-th"></i>', ' <span class="caret"></span>', '</button>', '<ul class="dropdown-menu" role="menu">');

			$.each(this.options.columns, function(i, column) {
				if (column.radio || column.checkbox) {
					return;
				}
				var checked = column.visible ? ' checked="checked"' : '';

				html.push(sprintf('<li>' + '<label><input type="checkbox" value="%s"%s> %s</label>' + '</li>', i, checked, column.title));
			});
			html.push('</ul>', '</div>');

			this.$toolbar.append(html.join(''));

			$keepOpen = this.$toolbar.find('.keep-open label');
			$keepOpen.off('click').on('click', function(event) {
				event.stopPropagation();
				var $this = $(this).find('input');

				that.options.columns[$this.val()].visible = $this.prop('checked');
				that.initHeader();
				that.initBody();
			});
		}

		if (this.options.search) {
			html = [];
			if (this.isTreeGrid()) {
				this.options.clicentSearch = true;
			}
			var createClientSearch = function() {
				that.options.clicentSearch = true;
				html.push('<div class="pull-right search" style="margin-right:2px;margin-top:5px;width:150px;">', sprintf('<input class="form-control" type="text" placeholder="%s">', that.options.formatSearch()), '</div>');
				that.$toolbar.append(html.join(''));
				that.$search = that.$toolbar.find('.search input');
				that.$search.off('keyup').on('keyup', $.proxy(that.onSearch, that));
			};

			if (this.options.clicentSearch) {
				createClientSearch();
			} else if (this.options.dataModel) {
				var showsearchtext = false;
				var showseardate = false;
				for (var i = 0; i < this.options.dataModel.Columns.length; i++) {
					var c = this.options.dataModel.Columns[i];
					if (c.Searchable == "1") {
						if (c.DataType == "date" || c.DataType == "datetime") {
							showseardate = true;
						} else {
							showsearchtext = true;
						}
					}
				}
				if (showsearchtext == true || showseardate == true) {
					this.options.clicentSearch = false
					html.push('<ul class="list-inline pull-right search">');
					if (showsearchtext == true) {
						html.push('<li><input class="form-control searchtext" placeholder="搜索关键字" type="text"/></li>');
					}
					if (showseardate == true) {
						html.push('<li>日期：</li>');
						html.push('<li><input class="form-control searchdate1" placeholder="开始日期" type="text"/></li>');
						html.push('<li>-</li>');
						html.push('<li><input class="form-control searchdate2" placeholder="结束日期" type="text"/></li>');
					}
					if (showsearchtext == true || showseardate == true) {
						html.push('<li><button class="btn btn-danger searchbtn" style="margin-top:-3px;"><span class="glyphicon glyphicon-search" style="margin-right:3px;"></span>搜索</button></li>');
					}
					html.push('</ul>');
					this.$toolbar.append(html.join(''));

					var searchtext = this.$toolbar.find('.searchtext');
					var searchdate1 = this.$toolbar.find('.searchdate1');
					var searchdate2 = this.$toolbar.find('.searchdate2');
					var searchbtn = this.$toolbar.find('.searchbtn');
					if (showseardate == true) {
						searchdate1.datetimepicker(searchdateOpts);
						searchdate2.datetimepicker(searchdateOpts);
					}
					var me = this;
					var dosearch = function() {
						if (!me.options.queryParams) {
							me.options.queryParams = {};
						}
						me.options.queryParams.searchtext = searchtext.val();
						me.options.queryParams.searchdate1 = searchdate1.val();
						me.options.queryParams.searchdate2 = searchdate2.val();
						me.initServer();
					};
					searchbtn.on("click", function() {
						dosearch();
					});
					this.$toolbar.find('.search input').on("keyup", function() {
						if (event.keyCode == 13) {
							dosearch();
						}
					});
				}
			} else {
				createClientSearch();
			}
		}
		if ($.isFunction(that.options.afterInitToolBar)) {
			that.options.afterInitToolBar(that.$toolbar);
		}
	};

	BootstrapTable.prototype.isTreeLeafRow = function(row1, data) {
		var that = this;
		if (that.isTreeGrid()) {
			var result = true;
			if (!data) {
				data = that.data;
			}
			for (var i = 0; i < that.data.length; i++) {
				var row2 = that.data[i];
				if (row2[that.options.pidField] == row1[that.options.idField]) {
					result = false;
					break;
				}
			}
			return result;
		}
		return false;
	}

	BootstrapTable.prototype.getTreeParentRows = function(row1, prows) {
		var that = this;
		if (!prows) {
			prows = [];
		}
		if (that.isTreeGrid()) {
			$(that.data).each(function() {
				var row2 = this;
				if (row2[that.options.idField] == row1[that.options.pidField]) {
					prows.push(row2);
					that.getTreeParentRows(row2, prows);
				}
			});
		}
		return prows;
	}

	BootstrapTable.prototype.initClientSearchData = function() {
		var that = this;
		that.searchText = $.trim(that.searchText);
		if (that.options.clicentSearch == true && that.searchText) {

			var existids = {};
			that.searchData = $.grep(that.data, function(item) {
				for ( var key in item) {
					var visibleCols = $.grep(that.options.columns, function(col) {
						return col.field == key;
					});
					if (visibleCols.length > 0 && typeof item[key] == 'string' && item[key].indexOf(that.searchText) !== -1) {
						existids[item[that.options.idField]] = item;
						return true;
					}
				}
				return false;
			});

			if (that.isTreeGrid()) {
				// 搜索之后把他们的父节点也包含在搜索结果内
				var prows_all = [];
				$(that.searchData).each(function() {
					var row = this;
					var prows = that.getTreeParentRows(row);
					$(prows).each(function() {
						var row2 = this;
						var row2id = row2[that.options.idField];
						if (existids[row2id]) {
						} else {
							existids[row2id] = row2;
							prows_all.push(row2);
						}
					});
				});
				$(prows_all).each(function() {
					var row = this;
					that.searchData.push(row);
				});
			}

		} else {
			that.searchData = that.data;
		}
		if (that.options.showVirtualView && that.currentData) {
			that.options.totalRows = parseInt(that.options.totalRows) + (that.searchData.length - that.currentData.length);
		}
		return that.searchData;
	}

	BootstrapTable.prototype.doSearch = function() {
		var that = this;
		if (that.options.clicentSearch == true) {
			that.initClientSearchData();
			that.resetRows();
			that.initPagination();
			that.initBody();
		}
	}

	BootstrapTable.prototype.onSearch = function(event) {
		var that = this;
		this.searchText = $(event.currentTarget).val();
		if (this.searchText_old != this.searchText) {
			this.searchText_old = this.searchText;
			this.doSearch();
		}
	};

	BootstrapTable.prototype.isPagination = function() {
		var that = this;
		return that.options.pagination && !that.isGroupGrid() && !that.isTreeGrid();
	}

	BootstrapTable.prototype.initPagination = function() {
		this.$pagination = this.$container.find('.fixed-table-pagination');
		if (this.isPagination() == false) {
			return;
		}
		var that = this, html = [], i, from, to, $first, $pre, $next, $last, $number, data = this.searchText ? this.searchData : this.data;

		if (this.options.sidePagination === 'client') {
			this.options.totalRows = data.length;
		}
		this.totalPages = 0;
		if (this.options.totalRows) {
			this.totalPages = ~~((this.options.totalRows - 1) / this.options.pageSize) + 1;
		}
		if (this.totalPages > 0 && this.options.pageNumber > this.totalPages) {
			this.options.pageNumber = this.totalPages;
		}
		this.pageFrom = (this.options.pageNumber - 1) * this.options.pageSize + 1;
		this.pageTo = this.options.pageNumber * this.options.pageSize;
		if (this.pageTo > this.options.totalRows) {
			this.pageTo = this.options.totalRows;
		}
		html.push('<div class="pull-left pagination">', '<div class="pagination-info">', this.options.formatShowingRows(this.pageFrom, this.pageTo, this.options.totalRows), '</div>', '</div>', '<div class="pull-right">', '<ul class="pagination">', '<li class="page-first"><a href="javascript:void(0)">&lt;&lt;</a></li>', '<li class="page-pre"><a href="javascript:void(0)">&lt;</a></li>');

		if (this.totalPages < 5) {
			from = 1;
			to = this.totalPages;
		} else {
			from = this.options.pageNumber - 2;
			to = from + 4;
			if (from < 1) {
				from = 1;
				to = 5;
			}
			if (to > this.totalPages) {
				to = this.totalPages;
				from = to - 4;
			}
		}
		for (i = from; i <= to; i++) {
			html.push('<li class="page-number' + (i === this.options.pageNumber ? ' active' : '') + '">', '<a href="javascript:void(0)">', i, '</a>', '</li>');
		}

		html.push('<li class="page-next"><a href="javascript:void(0)">&gt;</a></li>', '<li class="page-last"><a href="javascript:void(0)">&gt;&gt;</a></li>', '</ul>', '</div>');

		this.$pagination.html(html.join(''));

		if (that.options.showPageInfo == false) {
			this.$pagination.find(".pull-left").hide();
		}

		$first = this.$pagination.find('.page-first');
		$pre = this.$pagination.find('.page-pre');
		$next = this.$pagination.find('.page-next');
		$last = this.$pagination.find('.page-last');
		$number = this.$pagination.find('.page-number');

		if (this.options.pageNumber <= 1) {
			$first.addClass('disabled');
			$pre.addClass('disabled');
		}
		if (this.options.pageNumber >= this.totalPages) {
			$next.addClass('disabled');
			$last.addClass('disabled');
		}
		$first.off('click').on('click', $.proxy(this.onPageFirst, this));
		$pre.off('click').on('click', $.proxy(this.onPagePre, this));
		$next.off('click').on('click', $.proxy(this.onPageNext, this));
		$last.off('click').on('click', $.proxy(this.onPageLast, this));
		$number.off('click').on('click', $.proxy(this.onPageNumber, this));

		var paginationinfo = this.$pagination.find(".pagination-info").css({
			"float" : "left"
		});
		var gointodiv = $('<div style="float:right;margin-top:5px;"><span>，跳转到第</span><input class="pageindex" type="text" style="width:35px;height:25px;margin-left:5px;margin-right:5px;border:1px solid #ccc;text-align:center;"/><span>页</span><button class="btn btn-default btngopage" style="margin-left:5px;padding:0px;padding-left:5px;padding-right:5px;height:25px;min-width:0px;">GO</button></div>').insertAfter(paginationinfo);
		var pageindexinput = gointodiv.find(".pageindex");
		var btngopage = gointodiv.find(".btngopage");
		pageindexinput.val(this.options.pageNumber);
		// pageindexinput.focus();//不能focus，否则滚动条会自动滚到最下面
		pageindexinput.off('keydown').on("keydown", function(e) {
			if (e.keyCode == "13") {
				btngopage.click();
			} else {
				if (e.which == 189) {
					return false;
				}
				return util.checkIsInputNumber(e);
			}
		});
		btngopage.off('click').on("click", function() {
			var pindex = pageindexinput.val();
			if (that.isNumeric(pindex)) {
				pindex = parseInt(pindex);
				that.options.pageNumber = pindex;
				that.doPaging();
			}
		});
	};

	BootstrapTable.prototype.onPageListChange = function(event) {
		var $this = $(event.currentTarget);

		$this.parent().addClass('active').siblings().removeClass('active');
		this.options.pageSize = +$this.text();
		this.$toolbar.find('.page-size').text(this.options.pageSize);
		this.doPaging();
	};

	BootstrapTable.prototype.doPaging = function() {
		if (this.options.sidePagination == "server") {
			this.initServer();
		} else {
			this.resetRows();
			this.initPagination();
			this.initBody();
		}
	};

	BootstrapTable.prototype.onPageFirst = function() {
		this.options.pageNumber = 1;
		this.doPaging();
	};

	BootstrapTable.prototype.onPagePre = function() {
		this.options.pageNumber--;
		this.doPaging();
	};

	BootstrapTable.prototype.onPageNext = function() {
		this.options.pageNumber++;
		this.doPaging();
	};

	BootstrapTable.prototype.onPageLast = function() {
		this.options.pageNumber = this.totalPages;
		this.doPaging();
	};

	BootstrapTable.prototype.onPageNumber = function(event) {
		this.options.pageNumber = +$(event.currentTarget).text();
		this.doPaging();
	};

	BootstrapTable.prototype.getCheckColumn = function() {
		var that = this;
		var col = null;
		$(that.options.columns).each(function() {
			var cc = this;
			if (cc.checkbox || cc.radio) {
				col = cc;
			}
		});
		return col;
	};

	BootstrapTable.prototype.updateRows = function(rows) {
		var that = this;
		var doUpdateRow = function(row) {
			var idfield = that.options.idField;
			if (!idfield) {
				idfield = "rowid";
			}
			var id = row[idfield];
			if (id != undefined) {
				var row2 = that.getRow(id);
				if (row2) {
					for ( var p in row) {
						row2[p] = row[p];
					}
				} else {
					that.data.push(row);

					if (that.options.totalRows) {
						that.options.totalRows = parseInt(that.options.totalRows) + 1;
					}
				}
			}
		}
		that.saveGridStates();
		if ($.isArray(rows)) {
			$(rows).each(function() {
				var row = this;
				doUpdateRow(row);
			});
		} else if (typeof rows == "object") {
			doUpdateRow(rows);
		}
		that.initBody();
		that.initPagination();
	};
	BootstrapTable.prototype.addRows = function(rows) {
		var that = this;
		that.insertRows(rows);
	};

	BootstrapTable.prototype.insertRows = function(rows, rowid) {
		var that = this;
		that.saveGridStates();
		$(rows).each(function(i) {
			var row = this;
			if (!rowid && rowid != 0) {
				that.data.push(row);
			} else {
				var row2 = that.getRow(rowid);
				var index = that.data.indexOf(row2);
				that.data.splice(index + i, 0, row);
			}
			if (that.options.totalRows) {
				that.options.totalRows = parseInt(that.options.totalRows) + 1;
			}
		});
		that.initBody();
		that.initPagination();
	};

	BootstrapTable.prototype.deleteRows = function(ids) {
		var that = this;
		that.saveGridStates();
		var dodeleterow = function(id) {
			var row = that.getRow(id);
			var index = that.data.indexOf(row);
			if (index > -1) {
				that.data.splice(index, 1);
				if (that.options.totalRows) {
					that.options.totalRows = parseInt(that.options.totalRows) - 1;
				}
			}
		}
		if ($.isArray(ids)) {
			$(ids).each(function() {
				var id = this;
				dodeleterow(id);
			});
		} else {
			dodeleterow(ids);
		}
		that.initBody();
		that.initPagination();
	};

	BootstrapTable.prototype.getFormatedValue = function(item, field) {
		var that = this;
		var value = item[field];
		if ($.isFunction(that.options.formatValue)) {
			var oldvalue = value;
			value = that.options.formatValue(field, oldvalue);
			if (value == undefined) {
				value = oldvalue;
			}
		} else if ($.isFunction(that.header.formatters[field])) {
			value = that.header.formatters[field](value, item);
		} else if (typeof that.header.formatters[field] === 'string') {
			value = eval(that.header.formatters[field] + '(value, item)');
		}
		return value;
	};

	BootstrapTable.prototype.getColumnStyle = function(column) {
		var that = this;
		var tdstyle = that.header.styles[column.field];
		if (column.contentAlign) {
			tdstyle = tdstyle + "text-align:" + column.contentAlign + ";";
		}
		if (column.style) {
			tdstyle = tdstyle + column.style;
		}
		return tdstyle;
	}

	BootstrapTable.prototype.getGroupedRows = function(data, groupNames) {
		var that = this;
		// 计算每个分组名下的记录
		var groupRows = {};
		$(data).each(function() {
			var row = this;
			var grouptext = null;
			var groupFullName = [];
			var groupFullName_parent = [];
			var groupFullNameStr = null;
			var groupFullName_parent_Str = null;
			$(that.options.groupFields).each(function(gi, gf) {
				var gn = row[gf] ? row[gf] : " ";// 没有名称，用一个空格位代替
				grouptext = that.header.fieldColumns[gf] ? (that.header.fieldColumns[gf].title + " : " + gn) : gn;
				groupFullName_parent = groupFullName.slice();
				groupFullName.push(gn);
				groupFullNameStr = groupFullName.join("_");
				if (!groupRows[groupFullNameStr]) {
					var parentid = groupFullName_parent.join("_");
					groupNames.push(groupFullNameStr);
					groupRows[groupFullNameStr] = {
						groupid : groupFullNameStr,
						parentid : parentid,
						grouptext : grouptext,
						grouplevel : groupFullName.length - 1,
						groupcount : 0,
						rows : []
					};
				}
			});
			groupRows[groupFullNameStr].rows.push(row);
		});
		// 分组名称排序
		if (that.options.groupSort) {
			groupNames = groupNames.sort();
		}
		// 计算每个分组下的记录数
		$(groupNames).each(function(i, gn1) {
			var grow1 = groupRows[gn1];
			if (grow1.rows.length > 0) {
				grow1.groupcount = grow1.rows.length;
			} else {
				$(groupNames).each(function(j, gn2) {
					if (gn2.indexOf(gn1) == 0) {
						var grow2 = groupRows[gn2];
						grow1.groupcount = grow1.groupcount + grow2.rows.length;
					}
				});
			}
		});
		return groupRows;
	}

	BootstrapTable.prototype.getDecimalPlaces = function(field) {
		var that = this;
		var column = that.header.fieldColumns[field];
		var decimalPlaces = column ? column.decimalPlaces : 2;
		if (!decimalPlaces && decimalPlaces != "0") {
			decimalPlaces = 2;
		}
		return parseInt(decimalPlaces);
	}

	BootstrapTable.prototype.getFormatedMoney = function(innerText, field) {
		var that = this;
		if (that.isNumeric(innerText)) {
			var str = parseFloat(innerText).toFixed(that.getDecimalPlaces(field));
			var newStr = "";
			var count = 0;
			var dotindex = str.indexOf(".");
			if (dotindex < 0) {
				for (var i = str.length - 1; i >= 0; i--) {
					if (count % 3 == 0 && count != 0) {
						newStr = str.charAt(i) + "," + newStr;
					} else {
						newStr = str.charAt(i) + newStr;
					}
					count++;
				}
				str = newStr;
			} else {
				var decimals = str.substring(dotindex);
				for (var i = dotindex - 1; i >= 0; i--) {
					if (count % 3 == 0 && count != 0) {
						newStr = str.charAt(i) + "," + newStr;
					} else {
						newStr = str.charAt(i) + newStr;
					}
					count++;
				}
				str = newStr + decimals;
			}
			innerText = "￥" + str;
		} else {
			innerText = "";
		}
		return innerText;
	}

	BootstrapTable.prototype.setContainerHeight = function() {
		var that = this;
		if (this.options.height) {
			var toolbarHeight = +that.$toolbar.outerHeight();
			var paginationHeight = +that.$pagination.outerHeight();
			var height = that.options.height - toolbarHeight - paginationHeight - 2;
			var headertrs = that.$header.find("tr");
			if (headertrs.length > 1) {
				height = height - that.$header.height() + that.options.headerHeight + 15;
			}
			that.$fixedtablecontainer.css({
				"height" : height + "px",
				"max-height" : height + "px",
			});
		} else {
			that.$fixedtablecontainer.height("auto");
		}
	}

	BootstrapTable.prototype.initBody = function() {
		var that = this;
		var flow_state_field = "flow_state";
		var that = this, html = [], data = that.searchText ? this.searchData : this.data;
		that.currentHTML = html;
		that.currentData = data;
		if (typeof that.options.beforeShow == "function") {
			that.options.beforeShow(data, that);
		}
		var childmodules = [];
		try {
			childmodules = getChildModules(that.options.moduleid);
		} catch (e) {
		}
		this.$body = this.$el.find('tbody');
		that.setContainerHeight();
		that.options.defaultcheckedrow = false;
		if (!that.options.selectItemName) {
			that.options.selectItemName = "btSelectItem";
		}
		if (!this.$body.length) {
			this.$body = $('<tbody></tbody>').appendTo(this.$el);
		}

		if (this.isPagination() == false || (this.isPagination() == true && this.options.sidePagination == "server")) {
			this.pageFrom = 1;
			this.pageTo = data.length;
		}

		var gridid = this.options.gridid;

		var createtbodyrow = function(item, index, level, parentid) {
			var trhtml = [];
			var tdhtml = [];
			var checked = false;
			var id = that.options.idField ? item[that.options.idField] : index;
			$(that.header.fields).each(function(j, field) {
				var text = '', type = '';
				var value = that.getFormatedValue(item, field);
				var column = that.header.fieldColumns[field];
				var innerText = (value === undefined || value === null) ? that.options.undefinedText : value;
				if (column.displaylength && typeof (innerText) == 'string' && innerText.length > column.displaylength) {
					// 清除html标记stripHTML在util.js里头定义了
					try {
						innerText = innerText.stripHTML().substring(0, column.displaylength) + "...";
					} catch (e) {
					}
				}
				if (column.format == "money") {
					innerText = that.getFormatedMoney(innerText, field);
				}
				var tdStyle = that.getColumnStyle(column);
				text = [ '<td ' + (column.className ? 'class="' + column.className + '" ' : '') + 'style="' + tdStyle + '">', innerText, '</td>' ].join('');

				if (column.checkbox || column.radio) {
					var idValue = id;
					type = column.checkbox ? 'checkbox' : type;
					type = column.radio ? 'radio' : type;
					if (that.options.checkedids) {
						if (!(that.options.checkedids instanceof Array)) {
							that.options.checkedids = that.options.checkedids.split(",");
						}
						checked = that.options.checkedids.indexOf(idValue) > -1;
					} else if (that.reloadParams) {
						checked = idValue == that.reloadParams.selectedValue;
					}
					if (checked) {
						that.options.defaultcheckedrow = true;
					}
					item[that.header.stateField] = checked;
					text = [ '<td' + sprintf(' style="%s"', that.header.styles[field]) + '>', '<input class="checkbox"' + sprintf(' name="%s"', that.options.selectItemName) + sprintf(' type="%s"', type) + sprintf(' value="%s"', id) + sprintf(' checked="%s"', checked == true ? 'checked' : undefined) + ' />', '</td>' ].join('');
				}
				tdhtml.push(text);
			});
			var charWith = 22;
			$(childmodules).each(function(mi, module) {
				if (that.options.dataModel) {
					$(that.options.dataModel.Details).each(function(i, detail) {
						if (module.dataid == detail.DetailDataID && detail.DisplayType != "页面方式") {
							var len = module.modulename.length;
							var gtWidth = charWith * len;
							var style = sprintf('style="width:%spx;min-width:%spx;max-width:%spx;"', gtWidth, gtWidth, gtWidth);
							tdhtml.push(sprintf('<td class="grid-tool childmodule" onclick="showChildModule(this);return false;" gridid="%s" cmid="%s" %s>%s</td>', gridid, module.moduleid, style, module.modulename));
						}
					});
				}
			});
			if (that.options.toolsInColumn) {
				$(that.options.toolsInColumn).each(function(ti, tool) {
					var dataDisabled = false;
					var isEdit = tool.id == "btnEdit" || tool.text == "编辑";
					var isDel = tool.id == "btnDelete" || tool.text == "删除";
					if (item[flow_state_field]) {
						var flow_state = item[flow_state_field];
						if (flow_state != null && flow_state != 22 && flow_state != 23 && flow_state != "") {
							dataDisabled = true;
						}
					}
					var len = tool.text.length;
					var style = style = 'style="width:' + charWith * len + 'px;"';
					if (dataDisabled == true) {
						var text = tool.text;
						if (isEdit == true) {
							text = "查看";
						}
						if (isDel == true) {
							text = "";
						}
						tdhtml.push(sprintf('<td class="grid-tool columntool" onclick="checkGridRow(this); %s" gridid="%s" %s>%s</td>', tool.onclick, gridid, style, text));
					} else {
						tdhtml.push(sprintf('<td class="grid-tool columntool" onclick="checkGridRow(this); %s" gridid="%s" %s>%s</td>', tool.onclick, gridid, style, tool.text));
					}
				});
			}

			var currentrowCls = that.currentrowid == id ? 'class="currentrow"' : '';
			if (currentrowCls) {
				that.options.defaultcheckedrow = true;
			}
			if (that.isTreeGrid()) {
				var isparent = item["isparent"];// 固定一个isparent字段表示是父节点
				var dataisparent = (isparent == "1") ? 'data-isparent="1"' : '';
				parentid = item[that.options.pidField];
				trhtml.push('<tr ' + currentrowCls + ' data-rowid="' + id + '" data-parentid="' + parentid + '" data-level="' + level + '" ' + dataisparent + '>');
			} else {
				trhtml.push('<tr ' + currentrowCls + ' data-rowid="' + id + '"');
				if (parentid || parentid == 0) {
					trhtml.push(' data-parentid="' + parentid + '"');
				}
				if (level || level == 0) {
					trhtml.push(' data-level="' + level + '"');
				}
				trhtml.push('>');
			}
			$(tdhtml).each(function(i, str) {
				trhtml.push(str);
			});
			trhtml.push('</tr>');

			if (that.options.showVirtualView) {
				var trObj = {
					rowid : id,
					level : level,
					parentid : parentid,
					tr : trhtml.join('')
				};
				html.push(trObj);
			} else {
				html.push(trhtml.join(''));
			}
		};

		if (that.isGroupGrid()) {
			var rowindex = 0;
			var groupNames = [];
			var isGroupSummary = that.existGroupSummary();
			var groupRows = that.getGroupedRows(data, groupNames);
			var colspan = that.options.columns.length + that.options.toolsInColumn.length + childmodules.length;
			$(groupNames).each(function(gi, gn) {
				var trhtml = [];
				var groupRow = groupRows[gn];
				var grouptext = groupRow.grouptext;
				if (that.options.showGroupCount) {
					grouptext = grouptext + '&nbsp;(' + groupRow.groupcount + ')';
				}
				trhtml.push('<tr class="grouprow" data-groupid="' + groupRow.groupid + '" data-parentid="' + groupRow.parentid + '" data-level=' + groupRow.grouplevel + ' data-isparent="1">');
				trhtml.push('<td colspan="' + colspan + '"><span class="grouptext" style="font-weight:bold;">' + grouptext + '</span></td>');
				trhtml.push('</tr>');
				if (that.options.showVirtualView) {
					html.push({
						rowid : groupRow.groupid,
						level : groupRow.grouplevel,
						parentid : groupRow.parentid,
						tr : trhtml.join(''),
						isgroup : true
					});
				} else {
					html.push(trhtml.join(''));
				}

				$(groupRow.rows).each(function() {
					var item = this;
					createtbodyrow(item, rowindex++, groupRow.grouplevel + 1, groupRow.groupid);
				});
				if (isGroupSummary && groupRow.rows.length > 0) {
					// 创建分组统计
					trhtml = []
					var summaryid = "summary_" + groupRow.groupid;
					var summaryValues = that.getSummaryValues(groupRow.rows);
					trhtml.push('<tr class="summaryrow" data-rowid="' + summaryid + '" data-parentid="' + groupRow.groupid + '">');
					that.$titleTR.find("th").each(function() {
						var field = $(this).data("field");
						var tdCls = "";
						var summaryName = '';
						var summaryText = '';
						var summaryVal = summaryValues[field];
						if (summaryVal && (!summaryVal.position || summaryVal.position == "group")) {
							summaryName = summaryVal.name;
							summaryText = summaryVal.builtin ? summaryVal.text : summaryVal.value;
							tdCls = summaryVal.ismoney ? ' class="money"' : '';
						}
						trhtml.push('<td' + tdCls + ' style="' + that.header.styles[field] + '" title="' + summaryName + '">' + summaryText + '</td>');
					});
					trhtml.push('</tr>');

					if (that.options.showVirtualView) {
						html.push({
							rowid : summaryid,
							parentid : groupRow.groupid,
							tr : trhtml.join(''),
							issummary : true
						});
					} else {
						html.push(trhtml.join(''));
					}
				}
			});
		} else if (that.isTreeGrid()) {
			var i = 0;
			var createtreegridrow = function(parent, level) {
				$(data).each(function() {
					var item = this;
					var idval = item[that.options.idField];
					var pval = item[that.options.pidField];
					if (!pval) {
						pval = 0;
					}
					if (level == 0 && idval == pval) {
						// level=0表示创建根节点idval == pval也默认成是根节点
						item[that.options.pidField] = that.options.rootValue;
						pval = that.options.rootValue;
					}
					if (pval == parent || (!parent && !pval)) {
						createtbodyrow(item, i++, level);
						createtreegridrow(idval, level + 1);
					}
				});
			};
			createtreegridrow(that.options.rootValue, 0);
		} else {
			for (var i = this.pageFrom - 1; i < this.pageTo; i++) {
				var item = data[i];
				createtbodyrow(item, i);
			}
		}

		if (that.options.showVirtualView) {
			that.initVirtualBody(html);
			that.createVirtualView();
		} else {
			if (!html.length) {
				that.showNoRecords();
			} else {
				that.$body.html(html.join(''));
			}
			that.doAfterSetBody();
		}
	};

	BootstrapTable.prototype.initVirtualBody = function(html) {
		var that = this;
		if (that.virtualBody) {
			that.virtualBody.length = 0;
		}
		that.virtualBody = html;
		// visible，collapsed和isparent这些状态数据单独在that.virtualBodyStatus中维护
		if (!that.virtualBodyStatus) {
			that.virtualBodyStatus = {};
		}
		var vbs = that.virtualBodyStatus;
		var expandLevel = that.options.expandLevel ? that.options.expandLevel : 0;
		for (var i = 0; i < that.virtualBody.length; i++) {
			var trObj = that.virtualBody[i];
			var rowid = trObj.rowid;
			trObj.index = i;// 这边统一初始化index;
			if (!vbs[rowid]) {
				var vbsObj = {
					visible : true,
					collapsed : false,
				}
				if (that.isGroupGrid() || that.isTreeGrid()) {
					var level = parseInt(trObj.level);
					var nextObj = that.virtualBody[i + 1];
					if (nextObj && nextObj.parentid == rowid) {
						vbsObj.collapsed = level >= expandLevel;
					}
					vbsObj.visible = level <= expandLevel;
				}
				var pvbsObj = vbs[trObj.parentid];
				if (pvbsObj) {
					// 如果上级不可见或者折叠了那么自己也不可见
					if (!pvbsObj.visible || pvbsObj.collapsed) {
						vbsObj.visible = false;
					}
				}
				vbs[rowid] = vbsObj;
			}
			if (trObj.parentid) {
				vbs[trObj.parentid].isparent = true;
			}
		}
	}

	BootstrapTable.prototype.showNoRecords = function() {
		var that = this;
		var html = [ '<tr class="no-records-found">', sprintf('<td colspan="%s">%s</td>', this.header.fields.length, this.options.formatNoMatches()), '</tr>' ];
		that.$body.html(html.join(''));
	}

	BootstrapTable.prototype.getVirtualRowCount = function() {
		var that = this;
		var rowHeight = that.options.virtualRowHeight;
		var visibleHeight = that.$fixedtablecontainer.height();
		return Math.round(visibleHeight / rowHeight);
	}

	BootstrapTable.prototype.getVirtualAllVisibleTRS = function(fromIndex, toIndex) {
		var that = this;
		var allVisibleTRS = [];
		if (!fromIndex) {
			fromIndex = 0;
		}
		if (!toIndex) {
			toIndex = that.virtualBody.length - 1;
		}
		for (var i = fromIndex; i < toIndex + 1; i++) {
			var trObj = that.virtualBody[i];
			var vbsObj = that.virtualBodyStatus[trObj.rowid];
			if (vbsObj && vbsObj.visible) {
				allVisibleTRS.push(trObj.tr);
			}
		}
		return allVisibleTRS;
	}
	BootstrapTable.prototype.createVirtualView = function(scrollTop) {
		var that = this;
		if (that.virtualBody) {
			// 在可编辑状态
			if (that.options.editable && $.isFunction(that.endEdit)) {
				that.endEdit();
			}
			// 先保存记录选中的状态
			var currrowid = that.getCurrentKeyValue();
			if (currrowid) {
				that.currentrowid = currrowid;
			}
			if (!that.virtualCheckedRows) {
				that.virtualCheckedRows = {};
			}
			that.$body.find("tr").each(function() {
				var tr = $(this);
				var rowid = tr.attr("data-rowid");
				if (rowid) {
					that.virtualCheckedRows[rowid] = tr.find(".checkbox").prop("checked");
				}
			});

			var visibleHeight = that.$fixedtablecontainer.height();
			var rowHeight = that.options.virtualRowHeight;
			var rowCount = that.getVirtualRowCount();
			var scrollTop = scrollTop == undefined ? that.$fixedtablecontainer.scrollTop() : scrollTop;
			var beginRowIndex = Math.round(scrollTop / rowHeight);
			// 获取所有可见的tr
			var allVisibleTRS = that.getVirtualAllVisibleTRS(), newTRS = [];
			// 从可见的tr中根据滚动条位置和表格高度可显示的记录数来生成newhtml
			for (var i = beginRowIndex; i < (beginRowIndex + rowCount) && i < allVisibleTRS.length; i++) {
				newTRS.push(allVisibleTRS[i]);
			}
			that.$body.empty().html(newTRS.join('')).find("tr").height(rowHeight);

			// 计算滚动条高度
			var scrollHeight = rowHeight * allVisibleTRS.length;
			var remainder = visibleHeight % rowHeight;
			if (remainder < rowHeight / 2) {
				scrollHeight = scrollHeight + remainder;
			}
			that.$fixedtablebody.css({
				"padding-top" : scrollTop + "px",
				"height" : scrollHeight + "px"
			});

			if (allVisibleTRS.length == 0) {
				that.showNoRecords();
			}
			that.doAfterSetBody();

			// 设置默认勾选和当前选中行
			that.$body.find("tr").each(function() {
				var tr = $(this);
				var rowid = tr.attr("data-rowid");
				if (rowid) {
					if (that.currentrowid) {
						tr.removeClass("currentrow")
					}
					if (rowid == that.currentrowid) {
						tr.click();
					}
					if (that.virtualCheckedRows[rowid] == true) {
						tr.find(".checkbox").click();
					}
				}
			});
		}
	}

	BootstrapTable.prototype.doAfterSetBody = function() {
		var that = this;
		var data = that.currentData;
		var noRecordsTd = this.$body.find(".no-records-found td");
		if (noRecordsTd.length == 1) {
			noRecordsTd.width(that.$header.height());
		}
		if (data && data.length > 0) {
			if (that.isTreeGrid()) {
				that.initTreeGrid();
			} else if (that.isGroupGrid()) {
				that.initGroupGrid();
			}
			that.setTableAutoWidth();
		}

		// 绑定第一列单击事件
		that.initFirstTDClick();
		that.initCheckGridRow();
		that.initEditable();
		that.createSummaryFoot(data);
		that.clearGridStates();

		if (!that.options.height) {
			that.$body.parent().css({
				"border-bottom" : "none",
				"border-bottom-left-radius" : "4px",
				"border-bottom-right-radius" : "4px"
			});
		}

		that.resetView();
		if (data && data.length > 0) {
			if (!that.options.defaultcheckedrow && !that.isGroupGrid()) {
				that.$body.find("tr:first").click();
			}
		}
		if ($.isFunction(that.options.afterLoad)) {
			that.options.afterLoad(data, that);
		} else if ($.isArray(that.options.afterLoad)) {
			// afterLoad支持数组函数列表的方式
			$(that.options.afterLoad).each(function() {
				var fn = this;
				fn.call(fn, data, that);
			});
		}

		if (that.options.showCheckColumn == false) {
			that.$header.find("tr").each(function() {
				$(this).find("th:eq(0)").hide();
			});
			that.$body.find("tr").each(function() {
				$(this).find("td:eq(0)").hide();
			});
		}
	}

	BootstrapTable.prototype.getSummaryValues = function(data) {
		var that = this;
		var summaryValues = {};
		if (that.isSummaryGrid() > 0) {
			$(that.header.summaryColumns).each(function() {
				var column = this;
				if (summaryValues[column.field] == undefined) {
					summaryValues[column.field] = $.extend({
						field : column.field,
						ismoney : column.format == "money",
						text : null,
						value : null
					}, column.summary);
				}
			});
			$(data).each(function() {
				var row = this;
				$(that.header.summaryColumns).each(function() {
					var column = this;
					var summaryname = column.summary.name;
					var v1 = summaryValues[column.field].value;
					var v2 = row[column.field];
					if (summaryname == "小计" || summaryname == "合计" || summaryname == "均值" || summaryname == "最大值" || summaryname == "最小值") {
						v2 = that.isNumeric(v2) ? parseFloat(v2) : 0;
						if (summaryname == "最大值") {
							summaryValues[column.field].value = v1 == null ? v2 : (v1 < v2 ? v2 : v1);
						} else if (summaryname == "最小值") {
							summaryValues[column.field].value = v1 == null ? v2 : (v1 > v2 ? v2 : v1);
						} else {
							summaryValues[column.field].value = v1 == null ? v2 : (v1 + v2);
						}
					}
				});
			});

			for ( var field in summaryValues) {
				var summaryVal = summaryValues[field];
				if (data.length > 0) {
					if (summaryVal.name == "均值") {
						summaryVal.value = parseFloat(summaryVal.value / data.length).toFixed(that.getDecimalPlaces(field))
					}
				}
				if (summaryVal.ismoney) {
					summaryVal.value = that.getFormatedMoney(summaryVal.value, field);
				}
				if (summaryVal.name == "计数") {
					summaryVal.value = summaryVal.builtin ? that.options.totalRows : data.length;
				}
				if (summaryVal.format) {
					summaryVal.text = sprintf(summaryVal.format, summaryVal.value);
				} else {
					summaryVal.text = summaryVal.name + '=' + summaryVal.value;
				}
			}
		}
		return summaryValues;
	}

	BootstrapTable.prototype.createSummaryFoot = function(data) {
		var that = this;
		// 计数，小计，合计，均值，最大值，最小值
		if (that.existFootSummary()) {
			var summaryValues = that.getSummaryValues(data);
			that.$foot = that.$el.find("tfoot");
			if (that.$foot.length == 0) {
				that.$foot = $('<tfoot></tfoot>').css({
					'display' : 'table',
					'position' : 'absolute',
					'bottom' : '0',
					'left' : '0',
					'z-index' : '18',
					"width" : "100%",
					'background-color' : '#fff'
				}).appendTo(that.$el);
			}
			var summaryTR = that.$foot.find(".summaryrow");
			if (summaryTR.length == 0) {
				summaryTR = $('<tr class="summaryrow"></tr>').css({
					'height' : '28px',
					'font-weight' : 'bold'
				}).appendTo(that.$foot);
			}
			summaryTR.empty();
			that.$titleTR.find("th").each(function() {
				var th = $(this);
				var summaryTD = $('<td></td>').attr({
					'style' : th.attr('style')
				}).appendTo(summaryTR).show();
				var summaryVal = summaryValues[th.data("field")];
				if (summaryVal && (!summaryVal.position || summaryVal.position == "foot")) {
					if (summaryVal.ismoney) {
						summaryTD.addClass("money");
					}
					if (summaryVal.builtin) {
						summaryTD.text(summaryVal.text);
					} else {
						summaryTD.text(summaryVal.value);
						summaryTD.attr("title", summaryVal.name);
					}
				}
			});

			that.$fixedtablecontainer.css({
				"padding-bottom" : that.$foot.height() + "px"
			});

			if (window.epplus == "1") {
				that.$table.find(".summaryrow td").each(function() {
					var td = $(this);
					var title = td.attr("title");
					if (title) {
						td.tooltip({
							delay : 500,
							title : title
						});
					}
				});
			}
		}
	}

	BootstrapTable.prototype.initCheckGridRow = function() {
		var that = this;

		var tr_click = function() {
			var tr = $(this);
			checkGridRow(tr);
			var rowid = tr.attr("data-rowid");
			var dataRow = that.getDataRow(rowid);
			if (typeof that.options.onClickRow == "function") {
				that.options.onClickRow(dataRow, tr);
			}
		};

		this.$body.find("tr").off("click", tr_click).on('click', tr_click);

		var tr_dblclick = function(e) {
			if ($(e.target).is(".toggle")) {
				return;
			}
			var tr = $(this);
			var rowid = tr.attr("data-rowid");
			var dataRow = that.getDataRow(rowid);
			if (typeof that.options.onDblClickRow == "function") {
				that.options.onDblClickRow(dataRow, tr);
			}
		};

		this.$body.find("tr").off("dblclick", tr_dblclick).on('dblclick', tr_dblclick);

		var selectItem_click = function(event) {
			if (that.options.cbxStopPropagation) {
				event.stopImmediatePropagation();
			}
			
			var cbx = $(this);
			var tr = cbx.parents("tr");
			var checked = cbx.prop('checked');
			var id = cbx.attr('value');
			var type = cbx.attr('type');
			var dataRow = that.getDataRow(id);
			if (type.toLowerCase() == "radio") {
				if (!checked) {
					checked = true;
				}
				$.each(that.data, function(i, row) {
					row[that.header.stateField] = false;
				});
			}
			dataRow[that.header.stateField] = checked;
			that.options[checked ? 'onCheck' : 'onUncheck'](dataRow);
			if (type == "checkbox" && that.isTreeGrid()) {
				// 自动勾选子级
				var rowid = cbx.parents("tr").attr("data-rowid");
				that.$body.find("tr[data-parentid='" + rowid + "']").find(selItemFilter).click().prop('checked', checked);
			}

			// 勾选的时候也强制定位当前行
			if (type == "checkbox") {
				setCurrentRowCls(tr);
			}

			// // 给选中的记录设置背景颜色
			// var checkedcls = "checkedrow";
			// if (checked) {
			// tr.addClass(checkedcls);
			// } else {
			// tr.removeClass(checkedcls);
			// }
		};

		var selItemFilter = '[name="' + that.options.selectItemName + '"]';
		this.$selectItem = this.$body.find(selItemFilter);
		this.$selectItem.off("click", selectItem_click).on('click', selectItem_click);
	}

	BootstrapTable.prototype.initFirstTDClick = function() {
		var that = this;
		if (!that.options.firstTDClick) {
			that.options.firstTDClick = "";
		}
		if (that.options.firstTDClick || that.options.firstTDClick2) {
			var onclick = "checkGridRow(this);" + that.options.firstTDClick;
			that.$body.find("tr").each(function() {
				var tr = $(this);
				if (tr.hasClass("grouprow") || tr.hasClass("summaryrow")) {
				} else {
					var td = tr.find("td").eq(1);
					if (td.length > 0) {
						var textspan = td.find(".text");
						if (textspan.length > 0) {
							td = textspan;
						}
						td.addClass("grid-tool");
						td.attr({
							"gridid" : that.options.gridid,
							"onclick" : onclick
						});
						if (that.options.firstTDClick2) {
							td.on("click", function() {
								that.options.firstTDClick2();
							});
						}
					}
				}
			});
		}

		// 给td关联click事件，给外部扩展(如通用列表的数据钻取功能)
		var cols = $.grep(that.options.columns, function(col) {
			return $.isFunction(col.onclick);
		});
		if (cols && cols.length > 0) {
			that.$body.find("tr td").on("click", function() {
				var td = $(this);
				var tr = td.parent();
				if (tr.hasClass("grouprow") || tr.hasClass("summaryrow")) {
					return;
				}

				var rowid = tr.attr("data-rowid");
				if (rowid) {
					var column = that.options.columns[td.index()];
					if (column && $.isFunction(column.onclick)) {
						// 当前行
						var row = that.getRow(rowid);
						// 勾选的行
						var rows = that.getSelectedRows();
						column.onclick({
							td : td,
							rowid : rowid,
							row : row,
							rows : rows,
							column : column,
							table : that
						});
					}
				}
			});
		}
	}

	BootstrapTable.prototype.setGroupFields = function(groupFields) {
		var that = this;
		that.options.groupFields = groupFields;
		$(that.options.columns).each(function(i, column) {
			column.groupIndex = undefined;
		});

		$(that.options.groupFields).each(function(i, field) {
			if (that.header.fieldColumns[field]) {
				that.header.fieldColumns[field].groupIndex = i;
			}
		});
		that.virtualBodyStatus = null;
		that.initBody();
	}

	BootstrapTable.prototype.isSummaryGrid = function() {
		var that = this;
		return that.options.showSummaryView && that.header.summaryColumns.length > 0;
	}

	BootstrapTable.prototype.existGroupSummary = function() {
		var that = this;
		var gs = $.grep(that.header.summaryColumns, function(col) {
			return !col.summary.position || col.summary.position == "group";
		});
		return that.isSummaryGrid() && gs.length > 0;
	}

	BootstrapTable.prototype.existFootSummary = function() {
		var that = this;
		var gs = $.grep(that.header.summaryColumns, function(col) {
			return !col.summary.position || col.summary.position == "foot";
		});
		return that.isSummaryGrid() && gs.length > 0;
	}

	BootstrapTable.prototype.isTreeGrid = function() {
		var that = this;
		var nopid = !that.options.pidField;
		return !nopid;
	}

	BootstrapTable.prototype.isGroupGrid = function() {
		var that = this;
		return that.options.showGroupView && that.options.groupFields && that.options.groupFields.length > 0;
	}

	BootstrapTable.prototype.setTableAutoWidth = function() {
		var that = this;
		if (that.isGroupGrid()) {
		} else {
			var headtrs = that.$table.find("thead tr");
			var th_len = headtrs.first().find("th").length;
			var td_len = that.$body.find("tr:first td").length;
			if (th_len < td_len) {
				that.$body.find("tr:first .grid-tool").each(function(i) {
					var gt = $(this);
					if (gt.hasClass("childmodule") || gt.hasClass("columntool")) {
						var emptyth = $("<th class='emptyth'></th>").attr({
							"rowspan" : headtrs.length,
							"style" : gt.attr("style")
						}).appendTo(headtrs.first());
						if (i > 0) {
							emptyth.css({
								"border-left" : "0px"
							});
						}
					}
				});
			}
		}

		if (that.isHorizontalScrolling()) {
		} else {
			// 自动拉伸，宽度自适应
			that.$table.width("100%");
			if (!that.isGroupGrid()) {
				var toid = window.setTimeout(function() {
					that.$titleTR.find("th").each(function(i) {
						var title_th = $(this);
						var td = that.$body.find("td:nth-child(" + (i + 1) + "):visible:last");
						var width = that.options.isv2 ? td.width() : td.outerWidth();
						if (width) {
							var widthCss = {
								"width" : width + "px",
								"max-width" : width + "px"
							};
							title_th.css(widthCss);
							that.$groupTR.find("th").eq(i).css(widthCss);
						}
					});
					window.clearTimeout(toid);
				});
			}
		}
	}

	BootstrapTable.prototype.initGroupGrid = function() {
		var that = this;
		if (!that.isGroupGrid()) {
			return;
		}
		var grouprowCls = "grouprow";
		var grouprowCls2 = "." + grouprowCls;
		var expandCls = that.options.expandCls;
		var collapseCls = that.options.collapseCls;
		var grouprows = that.$body.find(grouprowCls2);
		var showGroupGridChildRows = function(tr) {
			var childRows = tr.siblings("tr[data-parentid='" + tr.attr("data-groupid") + "']");
			childRows.each(function() {
				var childrow = $(this).show();
				var isExpend = childrow.find(".toggle").hasClass(expandCls);
				if (isExpend) {
					showGroupGridChildRows(childrow);
				}
			});
			return childRows;
		}
		var hideGroupGridChildRows = function(tr) {
			var childRows = tr.siblings("tr[data-parentid='" + tr.attr("data-groupid") + "']");
			childRows.each(function() {
				var childrow = $(this).hide();
				var groupid = childrow.attr("data-groupid");
				if (groupid) {
					hideGroupGridChildRows(childrow);
				}
			});
			return childRows;
		};
		var showVirtualGroupGridChildRows = function(groupid) {
			if (that.virtualBody) {
				for (var i = 0; i < that.virtualBody.length; i++) {
					var trObj = that.virtualBody[i];
					if (trObj.parentid == groupid) {
						var vbsObj = that.virtualBodyStatus[trObj.rowid];
						vbsObj.visible = true;
						if (trObj.isgroup && !vbsObj.collapsed) {
							showVirtualGroupGridChildRows(trObj.rowid);
						}
					}
				}
			}
		};
		var hideVirtualGroupGridChildRows = function(groupid) {
			if (that.virtualBody) {
				for (var i = 0; i < that.virtualBody.length; i++) {
					var trObj = that.virtualBody[i];
					if (trObj.parentid == groupid) {
						that.virtualBodyStatus[trObj.rowid].visible = false;
						if (trObj.isgroup) {
							hideVirtualGroupGridChildRows(trObj.rowid);
						}
					}
				}
			}
		};

		var group_toggle_click = function(event) {
			event.stopImmediatePropagation();
			var toggle = $(this);
			var tr = toggle.parents("tr");
			if (toggle.hasClass(expandCls)) {
				that.collapseGroupGridRow(tr);
			} else {
				that.expendGroupGridRow(tr);
			}
		};

		that.expendGroupGridRow = function(tr) {
			if (typeof tr == "string") {
				tr = that.getRowTR(tr);
			}
			var groupid = tr.attr("data-groupid");
			var toggle = tr.find(".toggle");
			toggle.removeClass(collapseCls);
			toggle.addClass(expandCls);
			if (tr.is(":visible")) {
				showGroupGridChildRows(tr);
				if (that.options.showVirtualView) {
					if (that.$loading.is("visible") == false) {
						that.virtualBodyStatus[groupid].collapsed = false
						showVirtualGroupGridChildRows(groupid);
						that.createVirtualView();
					}
				}
			}
			return tr;
		};

		that.collapseGroupGridRow = function(tr) {
			if (typeof tr == "string") {
				tr = that.getRowTR(tr);
			}
			var groupid = tr.attr("data-groupid");
			var toggle = tr.find(".toggle");
			toggle.removeClass(expandCls);
			toggle.addClass(collapseCls);
			hideGroupGridChildRows(tr);
			if (that.options.showVirtualView) {
				if (that.$loading.is("visible") == false) {
					that.virtualBodyStatus[groupid].collapsed = true
					hideVirtualGroupGridChildRows(groupid);
					that.createVirtualView();
				}
			}
			return tr;
		};
		grouprows.each(function() {
			var collapsed = false;
			var grouprow = $(this);
			var grouptextSpan = grouprow.find(".grouptext");
			var groupid = grouprow.data("groupid");
			var grouplevel = grouprow.data("level");
			var marginleft = grouplevel == 0 ? 4 : 24 * (grouplevel);
			if (that.options.showVirtualView) {
				var vbsObj = that.virtualBodyStatus[groupid];
				collapsed = vbsObj && vbsObj.collapsed;
			}
			var toggleCls = collapsed ? collapseCls : expandCls;
			var toggle = $('<span class="toggle glyphicon"></span>').css({
				"margin-left" : marginleft + "px",
				"margin-right" : "6px"
			}).addClass(toggleCls).insertBefore(grouptextSpan).on("click", group_toggle_click);
			if (that.options.showVirtualView) {
			} else {
				if (that.groupGridStates) {
					var ggs = that.groupGridStates[groupid];
					if (ggs) {
						if (toggleCls == expandCls && ggs.collapsed) {
							toggle.click();
						}
					}
				}
			}
		});
	};

	BootstrapTable.prototype.existChildRows = function(tr) {
		var that = this;
		var result = false;
		if (that.isGroupGrid()) {
			result = tr.attr("data-groupid") == tr.next().attr("data-parentid");
		} else if (that.isTreeGrid()) {
			result = tr.attr("data-rowid") == tr.next().attr("data-parentid");
		}
		if (result == false) {
			if (that.options.showVirtualView) {
				var rowid = tr.attr("data-rowid");
				var vbsObj = that.virtualBodyStatus[rowid];
				result = vbsObj.isparent;
			}
		}
		return result;
	}

	BootstrapTable.prototype.initTreeGrid = function() {
		var that = this;
		if (!that.isTreeGrid()) {
			return;
		}

		var expandCls = that.options.expandCls;
		var collapseCls = that.options.collapseCls;

		var expandColIndex = 0;
		var checkColumn = that.getCheckColumn();
		if (that.options.expandField) {
			that.$titleTR.find("th").each(function(i) {
				if ($(this).attr("data-field") == that.options.expandField) {
					expandColIndex = i;
				}
			});
		} else {
			expandColIndex = (checkColumn == null ? 0 : 1);
		}
		var showTreeGridChildRows = function(tr) {
			var childRows = tr.siblings("tr[data-parentid='" + tr.attr("data-rowid") + "']");
			childRows.each(function() {
				var childrow = $(this);
				childrow.show();
				if (that.existChildRows(childrow)) {
					if (childrow.find(".toggle").hasClass(expandCls)) {
						showTreeGridChildRows(childrow);
					}
				}
			});
			return childRows;
		};

		var showVirtualTreeGridChildRows = function(rowid) {
			if (that.virtualBody) {
				for (var i = 0; i < that.virtualBody.length; i++) {
					var trObj = that.virtualBody[i];
					if (trObj.parentid == rowid) {
						var vbsObj = that.virtualBodyStatus[trObj.rowid];
						vbsObj.visible = true;
						if (vbsObj.isparent && !vbsObj.collapsed) {
							showVirtualTreeGridChildRows(trObj.rowid);
						}
					}
				}
			}
		};

		var hideTreeGridChildRows = function(tr) {
			var childRows = tr.siblings("tr[data-parentid='" + tr.attr("data-rowid") + "']");
			childRows.each(function() {
				var childrow = $(this).hide();
				if (that.existChildRows(childrow)) {
					hideTreeGridChildRows(childrow);
				}
			});
			return childRows;
		};

		var hideVirtualTreeGridChildRows = function(rowid) {
			if (that.virtualBody) {
				for (var i = 0; i < that.virtualBody.length; i++) {
					var trObj = that.virtualBody[i];
					if (trObj.parentid == rowid) {
						var vbsObj = that.virtualBodyStatus[trObj.rowid];
						vbsObj.visible = false;
						if (vbsObj.isparent) {
							hideVirtualTreeGridChildRows(trObj.rowid);
						}
					}
				}
			}
		};

		var tree_toggle_click = function(event) {
			event.stopImmediatePropagation();
			var toggle = $(this);
			var tr = toggle.parents("tr");
			var isExpend = toggle.hasClass(expandCls);
			if (isExpend) {
				that.collapseTreeGridRow(tr);
			} else {
				that.expendTreeGridRow(tr);
			}
		};
		var appendTreeGridLeafRow = function(row, parenttr, aftertr) {
			var index = aftertr.index();
			that.data.splice(index, 0, row);
			var newtr = parenttr.clone();
			var newlevel = parseInt(parenttr.attr("data-level")) + 1;
			var newrowid = that.getRowID(row);
			var indent = 18 * newlevel;
			newtr.attr({
				"data-rowid" : newrowid,
				"data-parentid" : parenttr.attr("data-rowid"),
				"data-level" : newlevel
			});
			newtr.find("[name=" + that.options.selectItemName + "]").val(newrowid);
			var toggle = newtr.find(".toggle");
			toggle.parents().css({
				"padding-left" : indent + "px"
			});
			toggle.remove();
			newtr.find("td").each(function(i, td) {
				var field = that.header.fields[i];
				td = $(td);
				if (i > 0) {
					var txt = that.getFormatedValue(row, field);
					var textspan = td.find(".text");
					if (textspan.length > 0) {
						textspan.text(txt);
					} else {
						td.html(txt);
					}
				}
			});
			newtr.insertAfter(aftertr);
			return newtr;
		};

		that.expendTreeGridRow = function(tr) {
			if (typeof tr == "string") {
				tr = that.getRowTR(tr);
			}
			var rowid = tr.attr("data-rowid");
			var toggle = tr.find(".toggle");
			toggle.removeClass(collapseCls);
			toggle.addClass(expandCls);
			if (tr.is(":visible")) {
				var childs = showTreeGridChildRows(tr);
				if (childs.length == 0) {
					if ($.isFunction(that.options.loadTreeLeafRows)) {
						var rowid = tr.attr("data-rowid");
						var row = that.getRow(rowid);
						that.options.loadTreeLeafRows({
							tr : tr,
							row : row,
							table : that
						}, function(leafrows) {
							var aftertr = tr;
							$(leafrows).each(function(i, row) {
								aftertr = appendTreeGridLeafRow(row, tr, aftertr);
							});
							that.initCheckGridRow();
							$(leafrows).each(function(i, row) {
								if (row.checked == true) {
									var rowid = that.getRowID(row);
									that.getRowTR(rowid).click();
								}
							});
						});
					}
				}
				if (that.options.showVirtualView) {
					if (that.$loading.is("visible") == false) {
						that.virtualBodyStatus[rowid].collapsed = false;
						showVirtualTreeGridChildRows(rowid);
						that.createVirtualView();
					}
				}
			}
			return tr;
		};
		that.collapseTreeGridRow = function(tr) {
			if (typeof tr == "string") {
				tr = that.getRowTR(tr);
			}
			var rowid = tr.attr("data-rowid");
			var toggle = tr.find(".toggle");
			toggle.removeClass(expandCls);
			toggle.addClass(collapseCls);
			hideTreeGridChildRows(tr);
			if (that.options.showVirtualView) {
				if (that.$loading.is("visible") == false) {
					that.virtualBodyStatus[rowid].collapsed = true;
					hideVirtualTreeGridChildRows(rowid);
					that.createVirtualView();
				}
			}
			return tr;
		};
		var getAllParentRowID2 = function(rowid, rows) {
			that.getRowTR(rowid).each(function() {
				var tr = $(this);
				var rid = tr.attr("data-parentid");
				if (rid && rid != "null") {
					rows.push(rid);
					getAllParentRowID2(rid, rows);
				}
			});
		};

		that.getAllParentRowID = function(rowid) {
			var rows = [];
			getAllParentRowID2(rowid, rows);
			return rows;
		}

		var getAllChildRowID2 = function(rowid, rows) {
			that.$body.find("tr[data-parentid='" + rowid + "']").each(function() {
				var tr = $(this);
				var rid = tr.attr("data-rowid");
				rows.push(rid);
				getAllChildRowID2(rid, rows);
			});
		};
		that.getAllChildRowID = function(rowid) {
			var rows = [];
			getAllChildRowID2(rowid, rows);
			return rows;
		}
		that.getChildRowID = function(rowid) {
			var rows = [];
			that.$body.find("tr[data-parentid='" + rowid + "']").each(function() {
				var tr = $(this);
				var rid = tr.attr("data-rowid");
				rows.push(rid);
			});
			return rows;
		};
		this.$body.find("tr").each(function() {
			var tr = $(this);
			var rowid = tr.attr("data-rowid");
			var parentid = tr.attr("data-parentid");
			var level = parseInt(tr.attr("data-level"));
			var firsttd = tr.find("td").eq(expandColIndex);
			var indent = 5 + 18 * level;
			var tdtext = firsttd.html();
			firsttd.empty().css({
				"text-align" : "left",
				"padding-left" : indent + "px"
			})
			var existchild = that.existChildRows(tr);
			var isparent = tr.attr("data-isparent");
			if (isparent == "1") {
				tr.removeAttr("data-isparent");
				existchild = true;
			}
			if (existchild) {
				var iconspan = $("<span class='toggle glyphicon'></span>").addClass(collapseCls).appendTo(firsttd).on("click", tree_toggle_click);
				if (that.options.showVirtualView) {
					var vbsObj = that.virtualBodyStatus[rowid];
					if (iconspan && vbsObj && !vbsObj.collapsed) {
						iconspan.removeClass(collapseCls).addClass(expandCls);
					}
				}
			}
			var textspan = $("<span class='text' style='margin-left:5px;'></span>").html(tdtext).appendTo(firsttd);
			if (that.options.showVirtualView) {
			} else {
				if (level == 0) {
				} else {
					tr.hide();
				}
			}
		});
		if (that.options.showVirtualView) {
		} else {
			if (that.treeGridStates || that.options.expandLevel) {
				that.$body.find("tr").each(function() {
					var tr = $(this);
					if (that.treeGridStates) {
						var rowid = tr.attr("data-rowid");
						var state = that.treeGridStates[rowid];
						if (state && state.collapsed == false) {
							that.expendTreeGridRow(tr);
						}
					} else {
						var level = parseInt(tr.attr("data-level"));
						if (level < that.options.expandLevel) {
							that.expendTreeGridRow(tr);
						}
					}
				});
			}
		}
		// 如果有自动勾选了的也自动展开
		that.$body.find("tr").each(function() {
			var tr = $(this);
			var cbx = tr.find("[name=" + that.options.selectItemName + "]");
			if (cbx.prop("checked")) {
				var prows = that.getAllParentRowID(tr.attr("data-rowid"));
				prows = prows.reverse();
				$(prows).each(function(i, rowid) {
					var ptr = that.getRowTR(rowid);
					that.expendTreeGridRow(ptr);
				});
				if (tr.find(".toggle").length > 0) {
					that.expendTreeGridRow(tr);
				}
			}
		});
	}

	BootstrapTable.prototype.initEditable = function() {
		var that = this;
		// 编辑单元格
		if (!that.options.editable) {
			return;
		}
		var editorCls = "ez-td-editor";
		var editorInputCls = "ez-td-editor-input";
		var getEditorInput = function(editor) {
			var editorInput = editor.find("." + editorInputCls);
			if (editorInput.length == 0) {
				editorInput = editor.find("input");
			}
			if (editorInput.length == 0) {
				editorInput = editor.find("textarea");
			}
			if (editorInput.length == 0) {
				editorInput = editor.find("select");
			}
			if (editorInput.length == 0) {
				editorInput = editor
			}
			return editorInput;
		};
		that.endEdit = function() {
			var editor = that.$body.find("." + editorCls);
			if (editor.length > 0) {
				var td = editor.parents("td");
				var tr = td.parents("tr");
				var textHtml = editor.parent(editor);
				var editorInput = getEditorInput(editor);
				var field = that.header.fields[td.index()];
				var editorinfo = that.header.editors[field];
				var rowid = tr.attr("data-rowid");
				var row = that.getRow(rowid);
				var oldvalue = textHtml.data("oldvalue");
				var newvalue = editorInput.val();
				if (editorInput.attr("type") == "checkbox") {
					var checked = editorInput.prop("checked");
					newvalue = checked ? 1 : 0;
				}
				var endParams = {
					field : field,
					rowid : rowid,
					oldValue : oldvalue,
					newValue : newvalue,
					row : row,
					editor : editor,
					data : that.data,
					td : td,
					table : that
				};
				if (typeof editorinfo.endEditing == "function") {
					var ok = editorinfo.endEditing(endParams);
					if (ok == false || ok == 0) {
						editorInput.focus();
						return false;
					}
				}
				row[field] = newvalue;
				if (field == that.options.idField) {
					tr.attr("data-rowid", newvalue);
					tr.find("[name=" + that.options.selectItemName + "]").val(newvalue);
				}
				editor.remove();
				var displayText = that.getFormatedValue(row, field);
				if (displayText || displayText == "") {
					textHtml.text(displayText);
				}
				if (typeof editorinfo.endEdit == "function") {
					editorinfo.endEdit(endParams);
				}
			}
			return true;
		};

		that.setEditor = function(td) {
			var editorInput = td.find("." + editorInputCls);
			if (editorInput.length > 0) {
				return true;// true表示编辑中
			}
			if (!that.endEdit()) {
				return false;
			}
			var field = that.header.fields[td.index()];
			if (!field) {
				return false;
			}
			var editorInfo = that.header.editors[field];
			if (!editorInfo) {
				return false;
			}
			if (typeof editorInfo.createEditor != "function") {
				return false;
			}
			var tr = td.parents("tr").click();
			var rowid = tr.attr("data-rowid");
			var row = that.getRow(rowid);
			if (!row) {
				return false;
			}
			var textHtml = td.find(".text").length == 0 ? td : td.find(".text");
			var oldValue = row[field];
			textHtml.data("oldvalue", oldValue);

			var beginParams = {
				field : field,
				rowid : rowid,
				value : oldValue,
				row : row,
				data : that.data,
				td : td,
				table : that
			};
			if (typeof editorInfo.beginEditing == "function") {
				var ok = editorInfo.beginEditing(beginParams);
				if (ok == false || ok == 0) {
					return;
				}
			}
			var editor = editorInfo.createEditor(beginParams);
			if (editor) {
				textHtml.text("");
				if (typeof editor == "string") {
					editor = $(editor);
				}
				editor.addClass(editorCls).appendTo(textHtml);

				editorInput = getEditorInput(editor)
				if (editorInput.attr("type") == "checkbox") {
					editorInput.prop("checked", oldValue == "1" ? true : false);
				} else {
					editorInput.val(oldValue)
				}
				editorInput.addClass(editorInputCls);

				if (typeof editorInfo.beginEdit == "function") {
					beginParams.editor = editor;
					editorInfo.beginEdit(beginParams);
				}
				var stoid = window.setTimeout(function() {
					editorInput.focus();
				}, 10);
			}
			// true表示编辑中
			return true;
		};

		that.$body.find("tr td").on("click", function(event) {
			var td = $(this);
			if (that.setEditor(td)) {
				event.stopImmediatePropagation();
			}
		});

		that.$fixedtablecontainer.on("click", function() {
			that.endEdit();
		});
	}

	BootstrapTable.prototype.getDataRow = function(id) {
		var that = this;
		var row = null;
		if (that.data) {
			if (that.options.idField) {
				for (var i = 0; i < that.data.length; i++) {
					if (that.data[i][that.options.idField] == id) {
						row = that.data[i];
						break;
					}
				}
			} else {
				row = that.data[id];
			}
		}
		return row;
	};

	BootstrapTable.prototype.saveGroupGridStates = function() {
		var that = this;
		if (that.isGroupGrid()) {
			if (that.options.showVirtualView) {
			} else {
				that.groupGridStates = {};
				that.$body.find("tr .grouprow").each(function() {
					var tr = $(this);
					var toggle = tr.find("td:first").find(".toggle");
					var groupid = tr.attr("data-groupid");
					that.groupGridStates[groupid] = {
						groupid : groupid,
						visible : tr.is(":visible"),
						collapsed : toggle.hasClass(that.options.collapseCls)
					};
				});
			}
		}
	}

	BootstrapTable.prototype.clearGridStates = function() {
		var that = this;
		that.clearGroupGridStates();
		that.clearTreeGridStates()
	}

	BootstrapTable.prototype.clearGroupGridStates = function() {
		var that = this;
		if (that.isGroupGrid()) {
			that.groupGridStates = null;
		}
	}
	BootstrapTable.prototype.saveTreeGridStates = function() {
		var that = this;
		if (that.isTreeGrid()) {
			if (that.options.showVirtualView) {
			} else {
				that.treeGridStates = {};
				that.$body.find("tr").each(function() {
					var tr = $(this);
					var rowid = tr.attr("data-rowid");
					that.treeGridStates[rowid] = {
						rowid : rowid,
						visible : tr.is(":visible"),
						collapsed : tr.find(".toggle").hasClass(that.options.collapseCls)
					};
				});
			}
		}
	}
	BootstrapTable.prototype.clearTreeGridStates = function() {
		var that = this;
		if (this.isTreeGrid()) {
			that.treeGridStates = null;
		}
	}

	BootstrapTable.prototype.getRowTR = function(rowid, body) {
		var that = this;
		if (!body) {
			body = that.$body;
		}
		return body.find("tr[data-rowid='" + rowid + "']");
	}

	BootstrapTable.prototype.getVirtualTRObj = function(rowid) {
		var that = this;
		var result = null;
		if (that.virtualBody) {
			for (var i = 0; i < that.virtualBody.length; i++) {
				var trObj = that.virtualBody[i];
				if (trObj.rowid == rowid) {
					result = trObj;
					break;
				}
			}
		}
		return result;
	}

	BootstrapTable.prototype.setCurrentRow = function(rowid) {
		var that = this;
		var tr = that.getRowTR(rowid).click();
		var doSetCurrentRow = function() {
			if (that.options.showVirtualView) {
				// 定位到记录（有分组则自动展开定位）定位到中间
				var trObj = that.getVirtualTRObj(rowid);
				if (trObj) {
					var currentTRS = that.$body.find("tr");
					if (currentTRS.length > 0) {
						// 展开全部上级
						var parentid = trObj.parentid;
						while (parentid && parentid != "0") {
							for (var i = 0; i < that.virtualBody.length; i++) {
								var trObj2 = that.virtualBody[i];
								if (trObj2.parentid == parentid) {
									var vbsObj1 = that.virtualBodyStatus[trObj2.rowid];
									if (vbsObj1) {
										vbsObj1.visible = true;
									}
								}
							}
							var trObj3 = that.getVirtualTRObj(parentid);
							if (trObj3) {
								var vbsObj2 = that.virtualBodyStatus[parentid];
								if (vbsObj2) {
									vbsObj2.visible = true;
									vbsObj2.collapsed = false;
								}
								parentid = trObj3.parentid;

							} else {
								parentid = false;
							}
						}
						var rowcount = that.getVirtualRowCount();
						var rowHeight = that.options.virtualRowHeight;
						var scrollIndex = that.getVirtualAllVisibleTRS(0, trObj.index).length - Math.round(rowcount / 2) + 3;
						var allVisibleTRS = that.getVirtualAllVisibleTRS();
						// 重新设置滚动条高度
						that.$fixedtablebody.css({
							"height" : rowHeight * allVisibleTRS.length + "px"
						});
						// 定位到滚动条的位置
						that.$fixedtablecontainer.scrollTop(scrollIndex * rowHeight);
						// 单击tr自动选中状态
						var stoid = window.setTimeout(function() {
							that.getRowTR(rowid).click();
							window.clearTimeout(stoid);
						}, 100);
					}
				}
			}
		};
		if (tr.length == 0) {
			doSetCurrentRow();
		} else if (tr.length == 1) {
			if (that.options.showVirtualView) {
				var trObj = that.getVirtualTRObj(tr.attr("data-rowid"));
				if (trObj) {
					// 修改了分组后定位
					var vbsObj = that.virtualBodyStatus[trObj.parentid];
					if (vbsObj && (vbsObj.collapsed || vbsObj.visible == false)) {
						doSetCurrentRow();
					}
				}
			}
		}
	}

	BootstrapTable.prototype.getCurrentKeyValue = function() {
		var that = this;
		var rowid = that.$body.find("tr.currentrow").first().attr("data-rowid");
		return rowid;
	}

	BootstrapTable.prototype.getCurrentRow = function() {
		var that = this;
		var rowid = that.getCurrentKeyValue();
		return that.getRow(rowid);
	}

	BootstrapTable.prototype.getSelectedRow = function() {
		var that = this;
		var rowid = that.getSelectedKeyValue();
		return that.getRow(rowid);
	}

	BootstrapTable.prototype.getSelectedRows = function() {
		var that = this;
		return that.getSelections();
	}

	BootstrapTable.prototype.getSelectedKeyValues = function() {
		var that = this;
		var rowids = [];
		var rows = that.getSelectedRows();
		$(rows).each(function(i, row) {
			var rowid = null;
			if (that.options.idField) {
				rowid = row[that.options.idField];
			} else {
				rowid = that.data.indexOf(row);
			}
			rowids.push(rowid);
		});
		return rowids;
	}

	BootstrapTable.prototype.getSelectedKeyValue = function() {
		var that = this;
		var rowids = that.getSelectedKeyValues();
		return rowids.length == 0 ? null : rowids[0];
	}

	BootstrapTable.prototype.saveGridStates = function() {
		var that = this;
		that.options.checkedids = [];
		var selrows = that.getSelections();
		$(selrows).each(function(i, row) {
			var rowid = null;
			if (that.options.idField) {
				rowid = row[that.options.idField];
			} else {
				rowid = that.data.indexOf(row);
			}
			that.options.checkedids.push(rowid);
		});

		that.currentrowid = that.getCurrentKeyValue();
		that.reloadParams = {
			selectedValue : that.getSelectedKeyValue()
		};
		that.saveGroupGridStates();
		that.saveTreeGridStates();
	}

	BootstrapTable.prototype.refresh = function(ps) {
		var that = this;
		that.saveGridStates();
		that.initBody();
	}

	BootstrapTable.prototype.reload = function(ps) {
		var that = this;
		if ($.isArray(ps)) {
			that.data = ps;
			that.refresh();
		} else {
			if (that.options.idField) {
				that.isReloading = true;
				that.saveGridStates();
				if (!ps) {
					ps = {};
				}
				if (ps.selectedValue) {
					that.currentrowid = ps.selectedValue;
				} else {
					ps.selectedValue = that.getSelectedKeyValue();
				}
			}
			that.reloadParams = ps;
			that.initServer();
		}
	};
	BootstrapTable.prototype.releaseData = function() {
		var that = this;
		if (that.currentData) {
			that.currentData.length = 0;
			that.currentData = null;
		}
		if (that.currentHTML) {
			that.currentHTML.length = 0;
			that.currentHTML = null;
		}
		if (that.virtualBody) {
			that.virtualBody.length = 0;
			that.virtualBody = null;
		}
		if (that.virtualBodyStatus) {
			that.virtualBodyStatus = null;
		}
	}
	BootstrapTable.prototype.initServer = function() {
		var that = this;
		if (that.reloadParams) {
			if (that.reloadParams.url) {
				this.options.url = that.reloadParams.url;
			}
			if (that.reloadParams.queryParams) {
				this.options.queryParams = $.extend(this.options.queryParams, that.reloadParams.queryParams);
			}
		}

		if (!this.options.url) {
			return;
		}

		if (this.isPagination() == true) {
			if (this.options.sidePagination == "server") {
				if (that.options.pageNumber < 1) {
					that.options.pageNumber = 1;
				}
				if (that.totalPages && that.options.pageNumber > that.totalPages) {
					that.options.pageNumber = that.totalPages;
				}
				this.options.queryParams.pageIndex = this.options.pageNumber - 1;
				this.options.queryParams.pageSize = this.options.pageSize;
			}
		}

		this.$loading.show();

		if (!this.options.queryParams) {
			this.options.queryParams = {};
		}
		this.options.queryParams.getTotalRows = 1;

		var params = $.extend({}, this.options.queryParams);

		if (that.reloadParams && that.reloadParams.querytoolwhere) {
			params.querytoolwhere = that.reloadParams.querytoolwhere;
			that.reloadParams.querytoolwhere = null;// 用完一次后马上清空掉
		}

		if ($.isArray(params.globalparams)) {
			params.globalparams = JSON.stringify(params.globalparams);
		}

		if (that.options.showVirtualView) {
			params.pageIndex = 0;
			params.pageSize = that.options.virtualPageSize;
		}

		that.releaseData();

		var logStartTime = new Date();
		var getServerData = function(callback) {
			window.doAjax({
				cache : false,
				type : that.options.method,
				url : that.options.url,
				data : params,
				contextType : "application/json",
				dataType : 'json',
				success : function(rs) {
					callback(rs);
				},
				complete : function() {
					that.$loading.hide();
				}
			});
		}

		getServerData(function(rs) {
			var data = [];
			that.options.ajaxresult = rs;
			if (rs.ok != undefined && rs.ok == false) {
				$('.no-records-found').find('td').text(rs.msg);
				return;
			}
			if (rs.errCode == "timeout") {
				window.location = "signin.jsp"
				return;
			}
			data = $.isArray(rs) ? rs : rs.data;
			that.options.totalRows = rs.totalRows ? rs.totalRows : data.length;

			if (rs.checkedids) {
				that.options.checkedids = rs.checkedids;
			}

			if (rs.logTimes) {
				rs.logTimes["time6"] = new Date();
			}

			that.load(data);

			if (rs.logTimes) {
				rs.logTimes["time7"] = new Date();
			}

			if (rs.logTimes) {
				try {
					for ( var n in rs.logTimes) {
						var date = rs.logTimes[n];
						if (typeof date == "string") {
							rs.logTimes[n] = util.convertToDateTime(date);
						}
					}
					var datainfo = [];
					if (that.options.dataname) {
						datainfo.push("数据集名称：" + that.options.dataname);
					}
					if (params.dataid) {
						datainfo.push("数据集编号：" + params.dataid);
					}
					datainfo.push("数据加载耗时情况如下（单位：毫秒）");
					window.console.info(datainfo.join("，"));
					var t0 = rs.logTimes["time1"].getTime() - logStartTime.getTime();
					window.console.log("发送请求耗时：" + t0);
					var t1 = rs.logTimes["time2"].getTime() - rs.logTimes["time1"].getTime();
					window.console.log("初始化数据集对象耗时：" + t1);
					var t2 = rs.logTimes["time3"].getTime() - rs.logTimes["time2"].getTime();
					window.console.log("获取总记录数耗时：" + t2);
					var t3 = rs.logTimes["time4"].getTime() - rs.logTimes["time3"].getTime();
					window.console.log("获取数据耗时：" + t3);
					var t4 = rs.logTimes["time5"].getTime() - rs.logTimes["time4"].getTime();
					window.console.log("获取字典数据耗时：" + t4);
					var t5 = rs.logTimes["time6"].getTime() - rs.logTimes["time5"].getTime();
					window.console.log("数据转换和返回耗时：" + t5);
					var t6 = rs.logTimes["time7"].getTime() - rs.logTimes["time6"].getTime();
					window.console.log("数据显示耗时：" + t6);
					var t7 = rs.logTimes["time7"].getTime() - logStartTime.getTime();
					window.console.log("总耗时：" + t7);
				} catch (e) {
				}
			}

			if (that.isReloading == true) {
				that.clearTreeGridStates();
				that.isReloading = false;
				if (typeof that.options.afterReload == "function") {
					that.options.afterReload(data, that);
				}
			}

			if (that.options.showVirtualView) {
				var otherTotalRows = parseInt(rs.totalRows) - params.pageSize;
				var totalPages = ~~((parseInt(rs.totalRows) - 1) / params.pageSize) + 1;
				if (totalPages > 1) {
					// 记载剩余数据
					// 加载完毕后刷新一次界面
					var otherDatas = {};
					var otherDataCount = 1;
					var getOtherServerData = function(pi) {
						params.pageIndex = pi;
						params.getTotalRows = 0;
						getServerData(function(rows) {
							otherDatas[pi] = rows;
							otherDataCount += 1;
							if (otherDataCount == totalPages) {
								for (var i1 = 1; i1 < otherDataCount; i1++) {
									var dd = otherDatas[i1];
									for (var i2 = 0; i2 < dd.length; i2++) {
										data.push(dd[i2]);
									}
									dd.length = 0;
								}
								if (rs.logTimes) {
									rs.logTimes["time8"] = new Date();
								}

								that.load(data);

								if (rs.logTimes) {
									rs.logTimes["time9"] = new Date();
								}
								if (rs.logTimes) {
									try {
										var t7 = rs.logTimes["time8"].getTime() - rs.logTimes["time7"].getTime();
										window.console.log("剩余数据获取耗时：" + t7 + "");
										var t8 = rs.logTimes["time9"].getTime() - rs.logTimes["time8"].getTime();
										window.console.log("剩余数据显示耗时：" + t8 + "");
										var t9 = rs.logTimes["time9"].getTime() - rs.logTimes["time7"].getTime();
										window.console.log("总耗时：" + t9 + "");
										var t10 = rs.logTimes["time9"].getTime() - logStartTime.getTime();
										window.console.log("所有总耗时：" + t10 + "");
									} catch (e) {
									}
								}
							}
						});
					}
					if (totalPages > 1) {
						window.console.info("正在加载剩余 " + otherTotalRows + " 条数据，分 " + (totalPages - 1) + " 个包加载，每个包 " + params.pageSize + " 条记录");
					}
					for (var i = 1; i < totalPages; i++) {
						getOtherServerData(i);
					}
				}
			}
		});
	};

	BootstrapTable.prototype.getCaretHtml = function() {
		return [ '<span class="order' + (this.options.sortOrder === 'desc' ? '' : ' dropup') + '">', '<span class="caret" style="margin-left:5px;"></span>', '</span>' ].join('');
	};

	BootstrapTable.prototype.updateRowsState = function(checked) {
		var that = this;

		this.$selectItem.each(function() {
			var id = $(this).attr('value');
			var dataRow = that.getDataRow(id);
			if (dataRow != null) {
				dataRow[that.header.stateField] = checked;
			}
		});
	};

	BootstrapTable.prototype.resetRows = function() {
		var that = this;
		$.each(this.data, function(i, row) {
			that.$selectAll.prop('checked', false);
			that.$selectItem.prop('checked', false);
			row[that.header.stateField] = false;
		});
	};

	BootstrapTable.prototype.resetView = function() {
		var that = this;
		var header = this.header;

		this.$selectAll.prop('checked', this.$selectItem.length > 0 && this.$selectItem.length === this.$selectItem.filter(':checked').length);

		if (typeof that.options.onResetView == "function") {
			that.options.onResetView(that.data);
		}
	};

	BootstrapTable.prototype.load = function(data) {
		this.initData(data);
		this.initClientSearchData();
		this.initPagination();
		this.initBody();
	};

	BootstrapTable.prototype.append = function(data) {
		this.initData(data, true);
		this.initBody();
	};

	BootstrapTable.prototype.mergeCells = function(options) {
		var row = options.index, col = $.inArray(options.field, this.header.fields), rowspan = options.rowspan || 1, colspan = options.colspan || 1, i, j, $tr = this.$body.find("tr"), $td = $tr.eq(row).find("td").eq(col);

		if (row < 0 || col < 0 || row >= this.data.length) {
			return;
		}

		for (i = row; i < row + rowspan; i++) {
			for (j = col; j < col + colspan; j++) {
				$tr.eq(i).find("td").eq(j).hide();
			}
		}

		$td.attr('rowspan', rowspan).attr('colspan', colspan).show();
	};

	BootstrapTable.prototype.getOptions = function() {
		return this.options;
	};

	BootstrapTable.prototype.getSelections = function() {
		var that = this;
		var selRows = null;
		if (that.options.multiSelect && that.isTreeGrid()) {
			selRows = [];// 树形多选时走这边，可能某些默认选中的节点因没父节点而没显示出来
			var selItemFilter = '[name="' + that.options.selectItemName + '"]';
			var trs = that.$body.find("tr").each(function() {
				var tr = $(this);
				var cbx = tr.find(selItemFilter);
				if (cbx.prop("checked")) {
					var row = that.getRow(tr.attr("data-rowid"));
					if (row) {
						selRows.push(row);
					}
				}
			});
		} else {
			selRows = $.grep(this.data, function(row) {
				return row[that.header.stateField];
			});
		}
		return selRows;
	};

	BootstrapTable.prototype.checkAll = function() {
		this.$selectAll.prop('checked', true);
		this.$selectItem.prop('checked', true);
		this.$selectItem.mousedown();// 强制执行下mousedown，表单弹出多选，处理了mousedown时间
		this.updateRowsState(true);
		this.options.onCheckAll();
	};

	BootstrapTable.prototype.uncheckAll = function() {
		this.$selectAll.prop('checked', false);
		this.$selectItem.prop('checked', false);
		this.$selectItem.mousedown();
		this.updateRowsState(false);
		this.options.onUncheckAll();
	};

	BootstrapTable.prototype.destroy = function() {
		this.$container.next().remove();
		this.$container.replaceWith(this.$el_);
		return this.$el_;
	};

	BootstrapTable.prototype.getExportData = function() {
		var that = this;
		var expdata = [];
		var headers = [];
		var indexs = [];
		var fields = [];
		$(that.header.fields).each(function(ii, ff) {
			if (ff != "checked") {
				var column = that.header.fieldColumns[ff];
				if (column) {
					indexs.push(ii);
					fields.push(ff);
					headers.push(column.title);
				}
			}
		});
		expdata.push(headers);
		if (that.options.showVirtualView) {
			for (var i = 0; i < that.virtualBody.length; i++) {
				var item = [];
				var trObj = that.virtualBody[i];
				var tr = $(trObj.tr);
				if (tr.is(".grouprow")) {
					item.push(tr.find(".grouptext").text())
					item.push("grouprow");
				} else {
					var td = tr.find("td");
					$(indexs).each(function(ii, vv) {
						item.push(td.eq(vv).text());
					});
					if (tr.is(".summaryrow")) {
						item.push("summaryrow");
					}
				}
				tr.empty().remove();
				tr = null;
				expdata.push(item);
			}
		} else {
			$(that.currentData).each(function(i, row) {
				var item = [];
				$(fields).each(function(ii, ff) {
					item.push(that.getFormatedValue(row, ff));
				});
				expdata.push(item);
			});
		}

		if (that.$foot) {
			var td = that.$foot.find(".summaryrow td");
			if (td.length > 0) {
				var item = [];
				$(indexs).each(function(ii, vv) {
					item.push(td.eq(vv).text());
				});
				item.push("summaryrow");
				expdata.push(item);
			}
		}
		return expdata;
	};

	// BOOTSTRAP TABLE PLUGIN DEFINITION
	// =======================

	$.fn.bootstrapTable = function(option, param1, param2, param3, param4, param5) {
		var value = this;
		var allowedMethods = [ 'getOptions', 'reload', 'getSelections', 'load', 'append', 'mergeCells', 'checkAll', 'uncheckAll', 'destroy', 'resetView', 'getChildRowID', 'getAllChildRowID', 'getAllParentRowID', 'getData', 'getRow', 'updateRows', 'deleteRows', 'insertRows', 'addRows', 'getSelectedKeyValue', 'getCurrentKeyValue', 'endEdit', 'moveUpRow', 'moveDownRow', 'refresh', "getCurrentRow", "setCurrentRow", "getSelectedRow", "getSelectedRows", "getSelectedKeyValues", "collapseTreeGridRow", "expendTreeGridRow", "collapseGroupGridRow", "expendGroupGridRow", "setGroupFields", "getExportData" ];
		this.each(function() {
			var $this = $(this), data = $this.data('bootstrap.table'), options = $.extend({}, BootstrapTable.DEFAULTS, $this.data(), typeof option === 'object' && option);

			if (!data && option && typeof option == "object") {
				$this.data('bootstrap.table', (data = new BootstrapTable(this, options)));
			}
			if (typeof option === 'string') {
				if ($.inArray(option, allowedMethods) < 0) {
					throw "Unknown method: " + option;
				}
				value = data[option](param1, param2, param3, param4, param5);
			}
		});

		return value;
	};

	$.fn.bootstrapTable.Constructor = BootstrapTable;
	$.fn.bootstrapTable.defaults = BootstrapTable.DEFAULTS;

	// BOOTSTRAP TABLE INIT
	// =======================

	$(function() {
		$('[data-toggle="table"]').bootstrapTable();
	});

}(jQuery);

(function($) {
	'use strict';

	$.extend($.fn.bootstrapTable.defaults, {
		formatLoadingMessage : function() {
			return '正在加载数据，请稍候……';
		},
		formatRecordsPerPage : function(pageNumber) {
			return '每页显示 ' + pageNumber + ' 条记录';
		},
		formatShowingRows : function(pageFrom, pageTo, totalRows) {
			return '显示第 ' + pageFrom + ' 到第 ' + pageTo + ' 条记录，总共 ' + totalRows + ' 条记录';
		},
		formatSearch : function() {
			return '搜索';
		},
		formatNoMatches : function() {
			return '没有记录';
		}
	});
})(jQuery);

function setCurrentRowCls(tr) {
	var currentrowCls = "currentrow"
	tr.siblings().removeClass(currentrowCls);
	tr.addClass(currentrowCls);
}

function checkGridRow(item) {
	item = $(item);
	var tr = item.is("tr") ? item : item.parents("tr");
	if (tr.hasClass("grouprow") || tr.hasClass("summaryrow")) {
		return;
	}
	setCurrentRowCls(tr);
	tr.find('.checkbox').each(function() {
		var cbx = $(this);
		if (cbx.attr("type") == "radio") {
			cbx.prop("checked", true);
			cbx.click();
		}
	});
}