package com.page;

import java.sql.Timestamp;

public class SplitPage {

	public SplitPage() {
		// TODO Auto-generated constructor stub

	}

	public SplitPage(int totalRows, int pageRow) {
		this.totalRow = totalRows;
		if(pageRow==0)
		{
			this.pageRow=10;
		}
		else{
			this.pageRow = pageRow;
		}
		this.totalPage = this.totalRow / this.pageRow
				+ ((this.totalRow % this.pageRow == 0) ? 0 : 1);
	}

	// 声明一些变量
	private int pageRow = 10;// 每页显示记录数
	private int totalRow = 0;// 总的记录数，有数据库操作类DAO提供
	private int currentPage = 1;// 当前的页面
	private int firstPage = 1;// 首页位置
	private int totalPage = 1;// 总的页面数,默认为一页

	public int getPageRow() {
		return pageRow;
	}

	/**
	 * 重新设置每页显示的记录数
	 * 
	 * @param pageRow
	 *            新的每页显示记录数
	 */
	public void setPageRow(int pageRow) {
		if (pageRow == 0) {
			pageRow = 10;
		}
		this.pageRow = pageRow;// 修改每页的记录数
		this.totalPage = this.totalRow / this.pageRow
				+ ((this.totalRow % this.pageRow == 0) ? 0 : 1);

	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {// 设置分页对象的总记录属性后,就应该根据每页面显示记录数,计算得到总的页面数
		this.totalRow = totalRow;
		this.totalPage = this.totalRow / this.pageRow
				+ ((this.totalRow % this.pageRow == 0) ? 0 : 1);
		// System.out.println("当前页" + this.currentPage);
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	// 不应该提供方法设置总页面数,它是计算得到的
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
