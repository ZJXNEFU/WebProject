<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/login_style.css" type="text/css" rel="stylesheet">
<link href="css/main_css.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/photo.css" />
</head>
<body>
<%
	String usernumber =(String)session.getAttribute("usernumber");
String password =(String)session.getAttribute("password");
String username =(String)session.getAttribute("username");
if(username==null||username.equals(""))
	response.sendRedirect("login.jsp");
%>

<div id="nav">
	<div id="titlelogo">
		<img src="img/titlelogo.png" alt="titlelogo">
	</div>
	    <div>
	    
	    </div>
		<div id="btq"style="cursor:pointer;">
			<a href="#"></a>
		<button id="quit" class="button"  onclick="quit()">退出登录</button>
	</div>
	<div id="user">
		<span id="name"><%=usernumber %></span>
	</div>
	<div id="tx">
		<img id="touxiang" src="img/touxiang.jpg" alt="touxiang">
	</div>
</div>
<div id="main">
	<div id="left">
		<div id="ltop">
			<div id="main_tx">
				<img id="main_touxiang" src="img/touxiang.jpg" alt="touxiang">
			</div>
			<div id="main_n">
				<span id="main_name"><b><%=username %></b></span>
			</div>
			<div id="main_un">
				<span id="main_username"><%=usernumber %></span>
			</div>
			<div class="clear"></div>
		</div>
		<div id="lbtm">
			<div id="main_pic">
			<div id="banner_tabs" class="flexslider">
  <ul class="slides">
    <li> <img alt="" style="background: url(img/16zhulou.jpg) no-repeat center;width:100%;height:100%;Background-size:100%;" src="img/alpha.png"> </li>
    <li> <img alt="" style="background: url(img/6.jpg) no-repeat center;width:100%;height:100%;Background-size:100%;" src="img/alpha.png"> </li>
   
     
  </ul>
  <ul class="flex-direction-nav">
    <li><a class="flex-prev" href="javascript:;">Previous</a></li>
    <li><a class="flex-next" href="javascript:;">Next</a></li>
  </ul>
  <ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
    <li><a>1</a></li>
    <li><a>2</a></li>

  </ol>
</div>
			
			</div>
			
			<div class="clear"></div>
		</div>
	</div>
	<div id="right">
<div id="grade">
			<input type="button" id="bt_grade" class="button" value="成绩查询" style="cursor:pointer;" onclick="location.href='scorequery.jsp'" >
			<div class="clear"></div>
		</div>
		<div id="deyu">
		
			<input type="button" id="bt_deyu" class="button"  value="德育查询" style="cursor:pointer;" onclick="location.href='moralquery.jsp'">
			<div class="clear"></div>
		</div>
		<div id="feedback">
			
			<input type="button" id="bt_feedback" class="button" value="反馈" style="cursor:pointer;" onclick="location.href='feedback.jsp'">
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	
</div>




</body>
<script type="text/javascript">
function quit() {

		window.location.href="QuitLogin";

	
}
</script>
<script src="js/jquery.js"></script> 
<script src="js/photo.js"></script> 
<script src="js/slider.js"></script>
</html>