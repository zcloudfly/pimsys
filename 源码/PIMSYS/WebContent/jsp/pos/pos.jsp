<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div data-options="region:'east',border:false" >
	 <ul id="posttr"></ul>
</div>  
<div id="postButtons" disply="none">
	<a id="poscc1" href="javascript:;"  class="easyui-linkbutton" onclick="savepost();" data-options="iconCls:'icon-save'">保存</a>
	<a  id="poscc2" href="javascript:;" class="easyui-linkbutton" onclick="closepost();">关闭</a>
</div>  
<div id="postadd">
	<a id="addbut"  class="easyui-linkbutton" onclick="postaddDialog();" data-options="plain:true,iconCls:'icon-add'">添加部门</a>
</div>
<div id="postDialog"></div>
<script type="text/javascript">
$("#poscc1").css("display","none");
$("#poscc2").css("display","none");

$('#posttr').treegrid({    
    url:'${pageContext.request.contextPath}/position/page', 
    //updateUrl:'${pageContext.request.contextPath}/position/update',
    //checkOnSelect:false,
   // selectOnCheck:false,
    singleSelect:true,
    //fit:true,
    autoSave:true,
    idField:'id', 
    fitColumns:true,
    treeField:'name',
    toolbar:'#postadd',   
    pagination:true,
	pageList:[2,5,7,10],
	pageSize:5,
	pageNumber:1,
	async:false,
    columns:[[    
          
        {title:'id',field:'id', width:60,align:'left',hidden:true},  
        {title:'职位名称',field:'posName', width:60,align:'left'},    
        {title:'职位级别',field:'level',width:60,align:'center'},    
        {field:'operatorTime',title:'创建时间',width:60,align:'center'},
        {title:'创建人',field:'operatorId'},    
        {title:'在用/撤销（1/0）',field:'sts',width:60,align:'center'},        
        {field:'option',title:'操作',width:50,align:'center',
			formatter:function(value,row,index){
				var contentFormat = 
				"<a href='javascript:;' id="+row.id+" onclick='posteditDialog(id)' class='posupd'>修改</a>"+
				"&nbsp<a  href='javascript:;' id="+row.id+" onclick='deleteposRow(id)'  class='delete'>删除</a>";
				return contentFormat;
			}
		},    
    ]],
   
    
}); 


function deleteposRow(id){
	console.log(id,'gggg')
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
	    if (r){    
	    	$.ajax({
	    		url:'${pageContext.request.contextPath}/position/delete?id='+id,
	    		success:function(ret){
	    			if(ret=='ok'){
	    				alert("删除成功！");
	    		    	$('#posttr').treegrid('reload');  
	    			}else{
	    				alert("删除失败！");
	    			}
	    		}
	    	});
	    	
	    }    
	}); 
	
}
function postaddDialog(){
	    $('#posId').val('');
        $("#poscc1").css("display","inline");
        $("#poscc2").css("display","inline");
		$("#postDialog").dialog({
			title:'添加部门',
			iconCls:'icon-add',
			width:500,
			height:250,
			modal:true,
			buttons:'#postButtons',
			href:'jsp/pos/posadd.jsp',
		});
	} 	
function posteditDialog(id){
	  //var row=$('#posttr').datagrid('getSelected');

		  $("#poscc1").css("display","inline");
		  $("#poscc2").css("display","inline");
			$("#postDialog").dialog({
				title:'编辑部门',
				iconCls:'icon-edit',
				width:500,
				height:250,
				modal:true,
				buttons:'#postButtons',
				href:'jsp/pos/posadd.jsp?id='+id,
			});
	 
		}
	
function savepost(){
		$("#postForm").form('submit',{
			url:"${pageContext.request.contextPath}/position/insert",	
			success: function(data){
				if(data=="ok"){
			$("#postDialog").dialog('close');
			$('#posttr').treegrid('reload');
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

function closepost(){
	$("#postDialog").dialog('close');
	$('#posttr').treegrid('reload');
}
</script>