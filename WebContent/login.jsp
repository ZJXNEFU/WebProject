<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jdbc.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>综合素质考评中心管理系统</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/login_style.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
	if(request.getParameter("username")!=null&&!request.getParameter("username").equals("")){
		String stunum = request.getParameter("username");
		String password = request.getParameter("password");
		
		String sql = "select * from username where STUDENTNUMBER='"+stunum+"'";
		Jdbc jdbc;
		jdbc = new Jdbc();
		Connection con = jdbc.getConnection();
		Statement stmt;
		ResultSet rs;
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(sql);
		if(rs.next()==false){
			out.print("<script>alert('账号不存在')</script>");
		}else if(!rs.getString(2).equals(password)){
				out.print("<script>alert('密码输入错误')</script>");
		}else{
			String username = rs.getString(3);
			response.sendRedirect("main.jsp");
			session.setAttribute("usernumber", stunum);
			session.setAttribute("password", password);
			session.setAttribute("username", username);
		}
			
	}
	
	
%>
<script type="text/javascript">
	
	function a(){
		var username = document.getElementById("stunum").value;
		var password = document.getElementById("pass").value;
		var prmpt = document.getElementById("prmpt");
		if(username==null||username==""){
			prmpt.innerHTML = "学号不能为空！";
			return false;
		}else if(password==null||password==""){
			prmpt.innerHTML = "密码不能为空！";
			return false;
		}else {
			return true;
		}
	}
	function b(){
		var prmpt = document.getElementById("prmpt");
		prmpt.innerHTML = "学号不能为空！";
	}
</script>

<div id="nav">
	<div id="titlelogo">
		<img src="img/titlelogo.png" alt="titlelogo">
	</div>
</div>
<div id="main">
	<div id="wel">
		<div id="wel1">
			欢迎使用
		</div>
		<div id="wel2">
			<h1>综合素质考评中心管理系统</h1>
		</div>
	</div>
	<div id="log">
		<form action="login.jsp" method="post" onsubmit="return a()">
		<div id="frame">
			<div id="logo">
				<img src="img/logo.png" alt="logo">
			</div>
			<div id="warn"><span id="prmpt"></span></div>
			<div id="username">
				<input id="stunum" name="username" type="text" class="text" placeholder="请输入学号">
			</div>
			<div id="password">
				<input id="pass" name="password" type="password" class="text" placeholder="请输入密码" >
			</div>
			<div id="sbmt">
				<input type="submit" class="button" value="登录">
			</div>
		</div>
		</form>
	</div>
</div>
<div id="bottom">
	© 2017 NEFU_ICEC
</div>


</body>
</html>