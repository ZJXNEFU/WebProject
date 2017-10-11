<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jdbc.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>thanks</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/login_style.css" type="text/css" rel="stylesheet">
<link href="css/main_css.css" type="text/css" rel="stylesheet">
<link href="css/grade_style.css" type="text/css" rel="stylesheet">
<link href="css/feedback_style.css" type="text/css" rel="stylesheet">
</head>
<script>
	window.onload = function(){
		var obj = document.getElementById("grade_home");
		obj.onclick=function(){
			window.location.href="main.jsp";
		}
		var obj2 = document.getElementById("grade_grade");
		obj2.onclick=function(){
			window.location.href="scorequery.jsp";
		}
		var obj3 = document.getElementById("grade_deyu");
		obj3.onclick=function(){
			window.location.href="moralquery.jsp";
		}
		var obj4 = document.getElementById("grade_feedback");
		obj4.onclick=function(){
			window.location.href="feedback.jsp";
		}
	}
	function quit() {
		window.location.href="QuitLogin";
	}
	function fanhui() {
		window.location.href="main.jsp";
	}
	
</script>
<body>
  <%
  String usernumber="";
  String username="";
  request.setCharacterEncoding("utf-8");
  String back=request.getParameter("textaa");
  if(session.getAttribute("username")!=null&&session.getAttribute("usernumber")!=null)
  {
	  usernumber=(String)session.getAttribute("usernumber");
	  username = (String)session.getAttribute("username");
	  Jdbc jdbc = new Jdbc();
	  Connection con;
	  con=jdbc.getConnection();
	  String sql = "insert into feedback (STUDENTNAME,STUDENTNUMBER,FANKUI) values ('"+username+"','"+usernumber+"','"+back+"')";
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate(sql);
	  stmt.close();
	  con.close();
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
		<div id="feedback_text">感谢您的反馈！</div>
		<div class="sel">
			<button id="search" class="button" onclick="fanhui()">返回首页</button>
		</div>
	</div>
</div>

</body>
</html>