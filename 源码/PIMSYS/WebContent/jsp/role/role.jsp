<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div data-options="region:'east',border:false" >
	 <ul id="roletr"></ul>
</div>  
<div id="roleButtons" disply="none">
	<a id="rolecc1" href="javascript:;"  class="easyui-linkbutton" onclick="saverole();" data-options="iconCls:'icon-save'">保存</a>
	<a  id="rolecc2" href="javascript:;" class="easyui-linkbutton" onclick="closerole();">关闭</a>
</div>  
<div id="roleadd">
	<a id="addrole"  class="easyui-linkbutton" onclick="roleaddDialog();" data-options="plain:true,iconCls:'icon-add'">添加部门</a>
</div>
<div id="roleDialog"></div>
<script type="text/javascript">
$("#rolecc1").css("display","none");
$("#rolecc2").css("display","none");

$('#roletr').treegrid({    
    url:'${pageContext.request.contextPath}/role/page', 
    //updateUrl:'${pageContext.request.contextPath}/roleition/update',
    //checkOnSelect:false,
   // selectOnCheck:false,
    singleSelect:true,
    //fit:true,
    autoSave:true,
    idField:'id', 
    fitColumns:true,
    treeField:'name',
    toolbar:'#roleadd',   
    pagination:true,
	pageList:[2,5,7,10],
	pageSize:5,
	pageNumber:1,
	async:false,
    columns:[[    
          
        {title:'id',field:'id', width:60,align:'left',hidden:true},  
        {title:'角色名称',field:'name', width:60,align:'left'},    
        {field:'operatorTime',title:'创建时间',width:60,align:'center'},
        {title:'创建人',field:'operatorId'},    
        {title:'在用/撤销（1/0）',field:'sts',width:60,align:'center'},        
        {field:'option',title:'操作',width:50,align:'center',
			formatter:function(value,row,index){
				var contentFormat = 
				"<a href='javascript:;' id="+row.id+" onclick='roleeditDialog(id)' class='roleupd'>修改</a>"+
				"&nbsp<a  href='javascript:;' id="+row.id+" onclick='deleteroleRow(id)'  class='delete'>删除</a>";
				return contentFormat;
			}
		},    
    ]],
   
    
}); 


function deleteroleRow(id){
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
	    if (r){    
	    	$.ajax({
	    		url:'${pageContext.request.contextPath}/role/delete?id='+id,
	    		success:function(ret){
	    			if(ret=='ok'){
	    				alert("删除成功！");
	    		    	$('#roletr').treegrid('reload');  
	    			}else{
	    				alert("删除失败！");
	    			}
	    		}
	    	});
	    	
	    }    
	}); 
	
}
function roleaddDialog(){
	    $('#roleId').val('');
        $("#rolecc1").css("display","inline");
        $("#rolecc2").css("display","inline");
		$("#roleDialog").dialog({
			title:'添加部门',
			iconCls:'icon-add',
			width:500,
			height:250,
			modal:true,
			buttons:'#roleButtons',
			href:'jsp/role/roleAdd.jsp',
		});
	} 	
function roleeditDialog(id){
	  //var row=$('#roletr').datagrid('getSelected');

		  $("#rolecc1").css("display","inline");
		  $("#rolecc2").css("display","inline");
			$("#roleDialog").dialog({
				title:'编辑部门',
				iconCls:'icon-edit',
				width:500,
				height:250,
				modal:true,
				buttons:'#roleButtons',
				href:'jsp/role/roleAdd.jsp?id='+id,
			});
	 
		}
	
function saverole(){
		$("#roleForm").form('submit',{
			url:"${pageContext.request.contextPath}/role/insert",	
			success: function(data){
				if(data=="ok"){
			$("#roleDialog").dialog('close');
			$('#roletr').treegrid('reload');
				$.messager.show({
					title:'提示',
					msg:"添加成功!"
				});
			}else{
			alert("添加失败");
			}
			}
		});
}

function closerole(){
	$("#roleDialog").dialog('close');
	$('#roletr').treegrid('reload');
}
</script>