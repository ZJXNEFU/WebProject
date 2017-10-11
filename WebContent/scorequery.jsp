<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<title>成绩查询</title> 
<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/login_style.css" type="text/css" rel="stylesheet">
<link href="css/main_css.css" type="text/css" rel="stylesheet">
<link href="css/grade_style.css" type="text/css" rel="stylesheet">
<script>
	window.onload = function(){
		var obj = document.getElementById("grade_home");
		obj.onclick=function(){
			window.location.href="main.html";
		}
		var obj2 = document.getElementById("grade_grade");
		obj2.onclick=function(){
			window.location.href="#";
		}
		var obj3 = document.getElementById("grade_deyu");
		obj3.onclick=function(){
			window.location.href="#";
		}
		var obj4 = document.getElementById("grade_feedback");
		obj4.onclick=function(){
			window.location.href="#";
		}
	}
	function quit() {
		window.location.href="QuitLogin";
	}
</script>
<script language="JavaScript" type="text/javascript"> 

function Dsy() 
{ 
this.Items = {}; 
} 
Dsy.prototype.add = function(id,iArray) 
{ 
this.Items[id] = iArray; 
} 
Dsy.prototype.Exists = function(id) 
{ 
if(typeof(this.Items[id]) == "undefined") return false; 
return true; 
} 

function change(v){ 
var str="0"; 
for(i=0;i<v;i++){ str+=("_"+(document.getElementById(s[i]).selectedIndex-1));}; 
var ss=document.getElementById(s[v]); 
with(ss){ 
length = 0; 
options[0]=new Option(opt0[v],opt0[v]); 
if(v && document.getElementById(s[v-1]).selectedIndex>0 || !v) 
{ 
if(dsy.Exists(str)){ 
ar = dsy.Items[str]; 
for(i=0;i<ar.length;i++)options[length]=new Option(ar[i],ar[i]); 
if(v)options[1].selected = true; 
} 
} 
if(++v<s.length){change(v);} 
} 
} 

var dsy = new Dsy(); 

dsy.add("0",["13级","14级","15级","16级" ]); 

dsy.add("0_0",["计算机","软件","信管"]); 
dsy.add("0_0_0",["一班","二班","三班","四班","五班","六班"]); 
dsy.add("0_0_1",["一班","二班","三班","四班","五班","六班"]);
dsy.add("0_0_2",["一班","二班","三班","四班","五班","六班"]);

dsy.add("0_1",["计算机","软件","信管"]); 
dsy.add("0_1_0",["一班","二班","三班","四班","五班","六班"]); 
dsy.add("0_1_1",["一班","二班","三班","四班","五班","六班"]);
dsy.add("0_1_2",["一班","二班","三班","四班","五班","六班"]);

dsy.add("0_2",["计算机","软件","信管"]); 
dsy.add("0_2_0",["一班","二班","三班","四班","五班","六班"]);
dsy.add("0_2_1",["一班","二班","三班","四班","五班","六班"]); 
dsy.add("0_2_2",["一班","二班","三班","四班","五班","六班"]);
</script> 
<script language = "JavaScript" type="text/javascript"> 

var s=["select1","select2","select3"]; 
var opt0 = ["年级","专业","班级"]; 
function setup() 
{ 
for(i=0;i<s.length-1;i++) 
document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")"); 
change(0); 
} 
</script> 
</head>
<body onload="setup()">
<%  String usernumber;
    if(session.getAttribute("usernumber")!=null)
	usernumber= (String)session.getAttribute("usernumber");
    else
    {
    	usernumber="";
    }

%>

<div id="nav">
	<div id="titlelogo">
		<img src="img/titlelogo.png" alt="titlelogo">
	</div>
	<div id="btq">
		<button id="quit" class="button" onclick="quit()">退出登录</button>
	</div>
	<div id="user">
		<span id="name"><%=usernumber %></span>
	</div>
	<div id="tx">
		<img id="touxiang" src="img/touxiang.jpg" alt="touxiang">
	</div>
</div>
<div id="main">
	<div id="grade_nav"> 
		<div id="grade_home"></div>
		<div id="grade_grade"></div>
		<div id="grade_deyu"></div>
		<div id="grade_feedback"></div>
	</div>
	<div id="sql">
	    <div id="tit">
			<span class="tit">成绩查询</span>
		</div>
	<form name="frm" method="post" action="scoreQuery"> 
	    <div id="sel1" class="sel">
	    <span class="sel_span">年级:</span>
	    <select id="select1" name="s1"><option>年级</option></select>
	    </div>
	    <div id="sel2" class="sel">
	    <span class="sel_span">专业:</span>
	    <select id="select2" name="s2"><option>专业</option></select>
	    </div>
	    <div id="sel3" class="sel">
	    <span class="sel_span">班级:</span>
	    <select id="select3" name="s3"><option>班级</option></select>
	    </div>
	    <div class="sel">
	    <input id="search" class="button" type="submit" value="查询" >
	    </div>
	   
	</form>
	</div>

</div>
</body>
</html>