<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/login_style.css" type="text/css" rel="stylesheet">
<link href="css/main_css.css" type="text/css" rel="stylesheet">
<link href="css/grade_style.css" type="text/css" rel="stylesheet">
<link href="css/feedback_style.css" type="text/css" rel="stylesheet">
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
</script>
</head>
<body>
<%
String usernumber;
if(session.getAttribute("usernumber")!=null)
	usernumber=(String)session.getAttribute("usernumber");
else
{
	usernumber="";
}

int pageCount;
int curPage = 1;  
int PAGESIZE=10;
ResultSet rs = (ResultSet)request.getAttribute("result2");
rs.last();
int size;
size = rs.getRow();
pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
   String tmp = (String)request.getAttribute("curPage");
   if(tmp==null||tmp.equals(""))
   {
	   tmp="1";
   }
   curPage=Integer.parseInt(tmp);
   if(curPage>=pageCount)
   curPage = pageCount;
   boolean flag = rs.absolute((curPage-1)*PAGESIZE+1); 
   int count=0;
%>
<div id="nav">
	<div id="titlelogo">
		<img src="img/titlelogo.png" alt="titlelogo">
	</div>
	<div id="btq">
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
	<div id="grade_nav"> 
		<div id="grade_home"></div>
		<div id="grade_grade"></div>
		<div id="grade_deyu"></div>
		<div id="grade_feedback"></div>
	</div>
	<div id="sql">
	<table> 
    <tr>
   <th>序号</th>
   <th>班级</th>
   <th>姓名</th>
   <th>加分原因</th>
   <th>类型</th>
   <th>分数</th>
   <th>时间</th>
   </tr> 
   
   <% 
   do
   {
	   if(count>=PAGESIZE)
		   break;
	   
	   count++;
	   
	   %>
	   
      <tr>
      <td><%=rs.getString(1) %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getString(4) %></td>
      <td><%=rs.getString(5) %></td>
      <td><%=rs.getString(6) %></td>
      <td><%=rs.getString(7) %></td>
	   </tr>
	 
	   
	   <% 
   }while(rs.next());
 
	rs.close();
%>

   
</table>
	
	<div id="grade_bt">
			<button id="bt1" class="button" onclick="bt1()">第一页</button>
			<button id="bt2" class="button" onclick="bt2()">上一页</button>
			<span id="page">第<%=curPage %>页/共<%=pageCount %>页</span >
			<button id="bt3" class="button" onclick="bt3()">下一页</button>
			<button id="bt4" class="button" onclick="bt4()">最后一页</button>
		</div>

	</div>

 
</div>

<script type="text/javascript">
function bt1() {
	
	window.location.href="moralquery?year=${year}&month=${month}&page=1";
	
}


function bt2() {
	var curPage= "<%=curPage-1%>";
	window.location.href="moralquery?year=${year}&month=${month}&page="+curPage;
}


function bt3() {
	var curPage= "<%=curPage+1%>";
	window.location.href="moralquery?year=${year}&month=${month}&page="+curPage;
}


function bt4() {
	var curPage ="<%=pageCount%>";
	window.location.href="moralquery?year=${year}&month=${month}&page="+curPage;
}

</script>
</body>
</html>