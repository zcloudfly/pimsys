<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div style="text-align: center; padding-top:40px">
	<form id="deptForm"  method="post">
	<input type="hidden" id="deptId" style="width:260px;" name="id" value='${param.id }'/>
		<div style="margin: 10px">
			部门名字:&nbsp;&nbsp;
			<input id="deptName" class="easyui-textbox" style="width:260px;" name="name" /><br/>
		</div>
		<div style="margin: 10px">
			上级部门:&nbsp;&nbsp;
				<select id="s1" class="easyui-combobox" name="parentId" style="width:260px;" 
                 data-options=" editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/dept/query'" >  
                 <option >---请选择---</option> 
                 </select>
		</div>
		<div style="margin: 10px">
			部门状态:&nbsp;&nbsp;
				<select  id="s2" class="easyui-combobox" name="sts" style="width:260px;"  data-options=" editable:false">   
				    <option value=1>运作</option>   
				    <option value=0>撤销</option>   
				</select>  
			<br/>
		</div>
	</form>
	<script type="text/javascript">
	var id=$('#deptId').val();
	console.log(id)
	if(id.length>0){
		$.ajax({
			url:'${pageContext.request.contextPath}/dept/selectById?id='+id,
			async:false,
			success:function(ret){
				console.log(ret)
				$("#deptName").val(ret.name);
				var timeTask=window.setInterval(function(){
					console.log(1)
					if($('#s1').combobox().length>0){
						$('#s1').combobox('setValue', ret.parentId);
						$('#s2').combobox('setValue', ret.sts);
					    window.clearInterval(timeTask);
					}
				},100);
			}
		});
	}
	</script>
</div>