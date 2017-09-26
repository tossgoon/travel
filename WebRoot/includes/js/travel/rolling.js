var speed = 100; // 数字越大速度越慢
var tab = document.getElementById("demo");
var tab1 = document.getElementById("demo1");
var tab2 = document.getElementById("demo2");
tab2.innerHTML = tab1.innerHTML;
function Marquee() {
	if (tab2.offsetWidth - tab.scrollLeft <= 0)
		tab.scrollLeft -= tab1.offsetWidth;
	else {
		tab.scrollLeft++;
	}
}
var MyMar = setInterval(Marquee, speed);




//植物的轮播
var tabp1 = document.getElementById("demop1");
var tabp2 = document.getElementById("demop2");
tabp2.innerHTML = tabp1.innerHTML;
function Marqueep() {
	if (tabp2.offsetWidth - tab.scrollLeft <= 0)
		tab.scrollLeft -= tabp1.offsetWidth;
	else {
		tab.scrollLeft++;
	}
}
var MyMarp = setInterval(Marqueep, speed);
//景观的轮播
var tabs1 = document.getElementById("demos1");
var tabs2 = document.getElementById("demos2");
tabs2.innerHTML = tabs1.innerHTML;
function Marquees() {
	if (tabs2.offsetWidth - tab.scrollLeft <= 0)
		tab.scrollLeft -= tabs1.offsetWidth;
	else {
		tab.scrollLeft++;
	}
}
var MyMars = setInterval(Marquees, speed);

tab.onmouseover = function() {
	clearInterval(MyMar);
	clearInterval(MyMarp);
	clearInterval(MyMars);
};
tab.onmouseout = function() {
	MyMar = setInterval(Marquee, speed);
	MyMarp = setInterval(Marqueep, speed);
	MyMars = setInterval(Marquees, speed);
};





