	<%@page pageEncoding="UTF-8"%>  
	<div class="headlogo" id="logoindex" style="background-image:url(<%=contextPath%>/includes/image/topbackg.png);background-repeat: repeat-x;">
		<div style="width:1100px;margin:0 auto;">
			<img alt="" style="margin-top:30px;width:900px;"
				src="<%=contextPath%>/includes/image/toptitle.png">
		</div> 
	</div>
	<div class="navbarhead">
		<ul style="margin:0 auto;width:1180px;">
			<li><a href="<%=contextPath%>/visitor/first.action">首页</a></li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" target="_blank">
                    	保护区介绍
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/show.action?id=24" target="_blank">保护区简介</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=54" target="_blank">保护区历史</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=55" target="_blank">组织机构</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=56" target="_blank">人员编制</a></li>
                    <li><a href="<%=contextPath%>/visitor/show.action?id=57" target="_blank">工作职能</a></li>
                </ul>
            </li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    	保护区动态
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=1"  target="_blank">工作动态</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=3"  target="_blank">政务公开</a></li>
                </ul>
            </li>
			<li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=2">政策法规</a></li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    	保护区防护
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=13"  target="_blank">野生动植物保护</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=8"  target="_blank">防火管理</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=9"  target="_blank">防虫管理</a></li>
                </ul>
            </li>
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    	科普知识
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=5"  target="_blank">保护区动物</a></li>
                    <li><a href="<%=contextPath%>/visitor/querypage.action?pagesize=10&pagenum=1&type=10"  target="_blank">保护区植物</a></li>
                </ul>
            </li>
			<li><a href="<%=contextPath%>/weather/weather.jsp" target="_blank">气象数据</a></li>
			<li><a href="<%=contextPath%>/visitor/show.action?id=50" target="_blank">联系我们</a></li>
			<li><a href="<%=contextPath%>/travel/user/login.jsp" target="_blank">OA办公系统</a></li>
		</ul>
	</div>