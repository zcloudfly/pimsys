<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div data-options="region:'east',border:false" >
	 <ul id="depttr"></ul>
</div>  
<div id="deptButtons" disply="none">
	<a id="cc1" href="javascript:;"  class="easyui-linkbutton" onclick="savedept();" data-options="iconCls:'icon-save'">保存</a>
	<a  id="cc2" href="javascript:;" class="easyui-linkbutton" onclick="closedept();">关闭</a>
</div>  
<div id="deptadd">
	<a id="addbut"  class="easyui-linkbutton" onclick="deptaddDialog();" data-options="plain:true,iconCls:'icon-add'">添加部门</a>
    <a id="editbut"  class="easyui-linkbutton" onclick="depteditDialog();" data-options="plain:true,iconCls:'icon-edit'">编辑部门</a>
</div>
<div id="deptDialog"></div>
<script type="text/javascript">
$("#cc1").css("display","none");
$("#cc2").css("display","none");

$('#depttr').treegrid({    
    url:'${pageContext.request.contextPath}/dept/page', 
    //updateUrl:'${pageContext.request.contextPath}/', 
    //fit:true,
    autoSave:true,
    idField:'id', 
    fitColumns:true,
    treeField:'name',
    toolbar:'#deptadd',   
    pagination:true,
	pageList:[2,5,7,10],
	pageSize:5,
	pageNumber:1,
    columns:[[    
        {title:'',field:'',checkbox:true},    
        {title:'id',field:'id', width:60,align:'left',hidden:true},  
        {title:'部门名称',field:'name', width:60,align:'left'},    
        {title:'上级部门',field:'parentId',width:60,align:'center',
        	formatter:function(value,row,index){
				return getText(deptList,value);
			}
        },    
        {field:'operatorTime',title:'创建时间',width:60,align:'center'},
        {title:'创建人',field:'operatorId'},    
        {title:'运作/撤销（1/0）',field:'sts',width:60,align:'center'},        
        {field:'option',title:'操作',width:50,align:'center',
			formatter:function(value,row,index){
				var contentFormat = 
				"<a id='save1_"+ index +"' href='javascript:;' onclick='deleteRow("+row.id+")'  class='delete'>删除</a>";
				return contentFormat;
			}
		},    
          
      
        
    ]]    
}); 

function deleteRow(id){
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
	    if (r){    
	    	$.ajax({
	    		url:'${pageContext.request.contextPath}/dept/delete?id='+id,
	    		success:function(ret){
	    			if(ret=='ok'){
	    				alert("删除成功！");
	    		    	$('#depttr').treegrid('reload');  
	    			}else{
	    				alert("删除失败！");
	    			}
	    		}
	    	});
	    	
	    }    
	}); 
	
}
function deptaddDialog(){
	    $('#deptId').val('');
        $("#cc1").css("display","inline");
        $("#cc2").css("display","inline");
		$("#deptDialog").dialog({
			title:'添加部门',
			iconCls:'icon-add',
			width:500,
			height:250,
			modal:true,
			buttons:'#deptButtons',
			href:'jsp/dept/deptadd.jsp',
		});
	} 	
function depteditDialog(){
	  var row=$('#depttr').datagrid('getSelected');
	  if(row){
		  $("#cc1").css("display","inline");
		  $("#cc2").css("display","inline");
			$("#deptDialog").dialog({
				title:'编辑部门',
				iconCls:'icon-edit',
				width:500,
				height:250,
				modal:true,
				buttons:'#deptButtons',
				href:'jsp/dept/deptadd.jsp?id='+row.id,
			});
	  }else{
		  alert("请选择一行！")
	  }
		}
	
function savedept(){
		$("#deptForm").form('submit',{
			url:"${pageContext.request.contextPath}/dept/insert",	
			success: function(data){
				if(data=="ok"){
			$("#deptDialog").dialog('close');
			$('#depttr').treegrid('reload');
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

function closedept(){
	$("#deptDialog").dialog('close');
	$('#depttr').treegrid('reload');
}
</script>