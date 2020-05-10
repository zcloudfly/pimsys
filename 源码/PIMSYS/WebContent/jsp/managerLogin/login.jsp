<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript"> 
 
     var buts=[{text:"提交",
	           handler:function(){
	                             $("#form1").form("submit",{	                             
	                                  url:"${pageContext.request.contextPath}/manager/login",
	                                  onSubmit:function(){return $("#form1").form("validate");},
	                                  success:function(s){                                  
	                                         if(s=="error"){
	                                          alert("登录失败，请重试！");        					      
	                                         }else
	                                         location.href="${pageContext.request.contextPath}/jsp/managerLogin/main.jsp";
	                                        }
	                                 });
	                             } ,
	               iconCls:"icon-ok"
	               
	               },
	           {text:"重置",
	            handler:function(){
	                   $("#dd").dialog({    
           url:"${pageContext.request.contextPath}/jsp/managerLogin/loginfrom.jsp", });
		           	  
	               },
	            iconCls:"icon-cancel"
	           }];
	     var tools=[{iconCls:'icon-add',text:'注册',
	    	         width:80,
	                 handler:function(){
	                
                      $("#dd2").dialog({
                     title:"--------注册--------",
                     iconCls:"icon-add",
                     href:"${pageContext.request.contextPath}/jsp/managerLogin/regist.jsp",
                     buttons:buts2
                     });
                }}];
          var buts2=[{text:"提交",
	           handler:function(){
	                             $("#form2").form("submit",{	                             
	                                  url:"${pageContext.request.contextPath}/manager/regist",
	                                 onSubmit:function(){return $("#form2").form("validate");},
	                                  success:function(s){
	                                         if(s=="error"){
	                                          alert("添加失败，请重试！");        					      
	                                         }else{
	                                         alert("注册成功，请登录~");
	                                         $("#dd").dialog({   
                                             url:"${pageContext.request.contextPath}/jsp/managerLogin/login.jsp", });
	                                         }
	                                        }
	                                 });
	                             } ,
	               iconCls:"icon-ok"
	               
	               },
	           {text:"重置",
	            handler:function(){
	                   $("#dd2").dialog({    
           url:"${pageContext.request.contextPath}/jsp/managerLogin/loginfrom.jsp", });
		           	  
	               },
	            iconCls:"icon-cancel"
	           }];
	</script>
  </head>
  <body background="${pageContext.request.contextPath }/image/286906.jpg">
   <div>
      <div id="dd" class="easyui-dialog" title="登录" style="width:400px;height:200px;"   
        data-options="iconCls:'icon-save',
                      resizable:true,
                      modal:true,
                      href:'${pageContext.request.contextPath}/jsp/managerLogin/loginfrom.jsp',
                      buttons:buts,
                      toolbar:tools
                      ">   
       
</div>  
    <div id="dd2" class="" style="width:300px;height:200px;padding:10px"></div>
   </div>
  




  </body>
</html>
