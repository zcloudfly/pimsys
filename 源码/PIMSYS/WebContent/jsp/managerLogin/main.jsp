<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/metro-orange/accordion.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/ui-sunny/datagrid.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/metro-green/searchbox.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.edatagrid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/treegrid-dnd.js"></script>
	<style type="text/css">  
        .logo {  
            width: 220px;  
            height: 50px;  
            line-height: 50px;  
            text-align: center;  
            font-weight: bold;  
            font-size: 20px;  
            float: left;  
            color: #000;  
        }  
        .logout {  
            float: right;  
            padding: 30px 15px 0 0;  
            color: ;  
        }  
    </style>
   
	<script type="text/javascript"> 
      
 $(function(){ }); 
    function addTabs(name,iconCls,url){
           
			if(!$("#tt").tabs('exists',name)){
				$("#tt").tabs('add',{
					title:name,
					iconCls:iconCls,
					href:'${pageContext.request.contextPath}/'+url,
					closable:true,
					tools:[{
						iconCls:'icon-mini-refresh',
						handler:function(){
							refreshTab(name);
						},
					}]
				});
			}else{
				$("#tt").tabs('select',name);
			}
		}
	
	function refreshTab(name){
			var tab = $("#tt").tabs('getTab',name);
			tab.panel('refresh');
		}         
	</script>
  </head>
  <body   class="easyui-layout">
     <div data-options="region:'north'" style="background:#5FC1B8;height:60px;">
        <div class="logo">用户个人信息管理系统</div>  
		<div class="logout"><a href="${pageContext.request.contextPath }/jsp/managerLogin/login.jsp">登陆</a></div>  
		<div class="logout">您好,${sessionScope.user.uName } <a href="${pageContext.request.contextPath }/jsp/managerLogin/login.jsp">退出</a></div>  
     </div> 
         
    <div data-options="region:'west',title:'功能导航'" style="width:200px;padding:1px">
        <div id="aa"  class="easyui-accordion" data-options="fit:true,closable:true" style="background:#EACECE;width:300px;height:100px;">   
                <div title="用户管理" data-options="iconCls:'icon-man'" style="overflow:auto;padding:10px;">
                    <li><a id='jsp/user/user.jsp' title="用户列表" onclick="addTabs(title,'',id)">用户列表</a></li>
                </div>
                <div title="部门管理" data-options="iconCls:'icon-filter'" style="padding:10px;">
                    <li><a id='jsp/dept/dept.jsp' title="部门维护" onclick="addTabs(title,'',id)">部门维护</a></li>
                </div>
                <div title="职位管理"  data-options="iconCls:'icon-man'"  style="overflow:auto;padding:10px;">
                    <li><a id='jsp/pos/pos.jsp' title="职位信息" onclick="addTabs(title,'',id)">职位信息</a></li>
                </div>
                <div title="角色管理"  data-options="iconCls:'icon-man',selected:true"  style="overflow:auto;padding:10px;">
                    <li><a id='jsp/role/role.jsp' title="角色信息" onclick="addTabs(title,'',id)">角色信息</a></li>
                </div>
            </div>
        </div> 
    </div>
    
    <div data-options="region:'center'" >
			   <div id="tt" class="easyui-tabs" data-options="fit:true" >   
			          <div   title="首页" style=" height:60px;background:#EBF0F1;font-size:25;padding:100px" ><h1>
			          
			                                        welcome to用户信息管理系统！
			          <h1></div>  
			         
			     
		      </div> 
          </div> 
   
<script type="text/javascript">
//部门集合
var deptList=[];
$.ajax({
	  url:'${pageContext.request.contextPath}/dept/query',
		type:'get',
		dataType:'json',
		async:false,
		success:function(res){
			$.each(res,function(i,n){
				var map={};
				map['text']=n.name;
				map['value']=n.id
				deptList.push(map);
			});
		}
});

function getText(list,value){
	$.each(list,function(i,n){
		if(n['value']==value){
			value= n['text'];
		}
	});
	return value;
}
</script>    
 </body>
</html>
