<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


     <div data-options="region:'center',border:false">
       <table id="userdg" ></table>
    </div>
	


<div id="counterDialog"></div>
 

<div id="courseButtons1" disply="none">
	<a id="cc11" href="javascript:;"  class="easyui-linkbutton" onclick="savecounter();" data-options="iconCls:'icon-save'">保存Counter</a>
	<a  id="cc22" href="javascript:;" class="easyui-linkbutton" onclick="closecounter();">关闭c</a>
</div>
<script >
	
	   /**
		*  $.extend  用以后的多个参数来扩展第一个参数的对象      这个函数的返回值为最终扩展之后的结果值
		*   //保护默认值对象
		*	console.log($.extend({},{"name":"张三"},{"name":"小黑","age":13},{"name":"王五","bir":"2018-12-12"}));
		*/
 $(function(){
  $("#addbut").css("display","none");
  $("#cc1").css("display","none");
  $("#cc2").css("display","none");
  
   $("#addbut1").css("display","none");
  $("#cc11").css("display","none");
  $("#cc22").css("display","none");
 
  });
		//角色集合
		 var roleList=[];
		  $.ajax({
			  url:'${pageContext.request.contextPath}/role/query',
				type:'get',
				dataType:'json',
				async:false,
				success:function(res){
					$.each(res,function(i,n){
						var map={};
						map['text']=n.name;
						map['value']=n.id
						roleList.push(map);
					});
				}
		  });
		 //职位集合
		  var posList=[];
		  $.ajax({
			  url:'${pageContext.request.contextPath}/position/query',
				type:'get',
				dataType:'json',
				async:false,
				success:function(res){
					$.each(res,function(i,n){
						var map={};
						map['text']=n.posName;
						map['value']=n.id
						posList.push(map);
					});
				}
		  });
		 
   
	var uid="";
	var $userdg = $("#userdg");
	
	$userdg.edatagrid({
		//fit:true,
		//height:500,
		async:false,
		fitColumns:true,
		autoSave:true,
		checkOnSelect:false,
	    selectOnCheck:false,
		singleSelect:true,
		toolbar:'#usertb',
		pagination:true,
		pageList:[1,2,4,7],
		pageSize:2,
		pageNumber:1,
		url:'${pageContext.request.contextPath}/user/page',
		updateUrl:'${pageContext.request.contextPath}/user/update',
		columns:[[
		    {field:'id',title:'',hidden:true},
			{field:'uName',title:'用户名',width:50,align:'center'},
			{field:'telephone',title:'电话',width:40}, 
			{field:'roleId',title:'角色',width:50,align:'center',
				formatter:function(value,row,index){
					 return getText(roleList,value);
				},
				editor:{
					type:'combobox',
					options:{
						panelHeight:60,
						editable:false,
						valueField: 'value',
						textField: 'text',
						data: roleList
					}
				}
			}, 
			{field:'depId',title:'部门',width:50,align:'center',
				formatter:function(value,row,index){
					return getText(deptList,value);
				},
				editor:{
					type:'combobox',
					options:{
						panelHeight:60,
						editable:false,
						valueField: 'value',
						textField: 'text',
						data: deptList
					}
				}
			}, 
			{field:'positionId',title:'职位',width:50,align:'center',
				formatter:function(value,row,index){
					 return getText(posList,value);
				},
				editor:{
					type:'combobox',
					options:{
						panelHeight:60,
						editable:false,
						valueField: 'value',
						textField: 'text',
						data: posList
					}
				}
			}, 
			{field:'sts',title:'状态',width:60,
				formatter:function(value,row,index){
					if( row.sts=='1'){return '正常';}
					else if( row.sts=='2'){return '锁定';}
					else if( row.sts=='0'){return '注销';}
				},
				editor:{
						type:'combobox',
						options:{
							panelHeight:60,
							editable:false,
							valueField: 'value',
							textField: 'text',
							data: [{text:"正常",value:"1"},
									{text:"锁定",value:"2"},
									{text:"注销",value:"0"}]
						}
					} 
			}, 
			{field:'opratorTime',title:'更新时间'},
			{field:'option',title:'操作',width:50,align:'center',
				formatter:function(value,row,index){
					var contentFormat = 
					"<a href='javascript:;' id='upd1_"+ index +"' onclick='editRow1("+index+")' class='upd'>修改</a>"+
					"<a id='save1_"+ index +"' href='javascript:;' onclick='saveRow1("+index+")' style='display:none;' class='save'>保存</a>";
					return contentFormat;
				}
			},
		]],
		
		onSave:function(row){
		 
			$(".upd").linkbutton({
				plain:true,
				iconCls:'icon-edit',
			});
			$(".save").linkbutton({
				plain:true,
				iconCls:'icon-edit',
				
		    });
		}, 
		onLoadSuccess:function(){
			
			$(".upd").linkbutton({
				plain:true,
				iconCls:'icon-edit',
			});
			$(".save").linkbutton({
				plain:true,
				iconCls:'icon-edit',
			});
		}
	});
	
	
	
	
	function saveuser(){
		$("#userForm").form('submit',{
			url:"${pageContext.request.contextPath}/shuffimg/insert",	
			success: function(map){
				map = $.parseJSON(map);
				console.log(map);
				$userDialog.dialog('close');
				$userdg.datagrid('reload');
				$.messager.show({
					title:'提示',
					msg:map.message,
					
				});
			}
		});
	}
	function closeuser(){
	$userDialog.dialog('close');
	}
	//开始编辑一行
	function editRow1(index){
		$("#upd1_"+index).css("display","none");
		$("#save1_"+index).css("display","inline");
		$userdg.datagrid('beginEdit',index);
	}
	function saveRow1(index){
	   $("#upd1_"+index).css("display","inline");
	   $("#save1_"+index).css("display","none");
	   $userdg.datagrid("endEdit",index);
	   alert("更新成功！");
	}

</script>



   