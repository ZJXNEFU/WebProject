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
<title>Insert title here</title>

<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/login_style.css" type="text/css" rel="stylesheet">
<link href="css/main_css.css" type="text/css" rel="stylesheet">
<link href="css/grade_style.css" type="text/css" rel="stylesheet">
<script>
			// 定义二维数组:
			var arr = new Array(4);
			arr[0] = new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
			arr[1] = new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
			arr[2] = new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
			arr[3] = new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
</script>
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
</script>

</head>
<body>
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
   <div id="tit">
			<span class="tit">德育查询</span>
		</div>
                <form  action="moralquery" method="post">
               <div id="sel1" class="sel">
               <span class="sel_span">年级:</span>
                <select id="select1" name="year" onchange="selmonth(this.value)">
                    
					<option value="0">13级</option>
					<option value="1">14级</option>
					<option value="2">15级</option>
					<option value="3">16级</option>
				</select>
               </div>
               
				<div id="sel2" class="sel">
				<span class="sel_span">月份:</span>
				
				<select name="month" id="select2" >
					<option>一月</option>
				</select>
				
				</div>

                     <script>
                        function selmonth(index){

	                      var months=arr[index];
	                      var monthSelobj=document.getElementsByName("month")[0];
	                      monthSelobj.innerHTML="<option >一月</option>";
	                      for(var i=0;i<months.length;i++){
		
		                  monthSelobj.innerHTML+="<option>"+months[i]+"</option>";
	                      };
	
	                      }
	                </script>
	            <input type="submit" value="查询" id="search" class="button" >
		           </form>

</div>

</div>
<script type="text/javascript">
function quit() {

		window.location.href="QuitLogin";

	
}
</script>
</body>
</html>