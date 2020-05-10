<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div style="text-align: center; padding-top:40px">
	<form id="roleForm"  method="post">
	<input type="hidden" id="roleId" style="width:260px;" name="id" value='${param.id }'/>
		<div style="margin: 10px">
			角色名字:&nbsp;&nbsp;
			<input class="text" id='roleName' style="width:260px;" name="name" /><br/>
		</div>
		
		<div style="margin: 10px">
			角色状态:&nbsp;&nbsp;
				<select  id="sr" class="easyui-combobox" name="sts" style="width:260px;"  >   
				    <option value="1">在用</option>   
				    <option value="0">撤销</option>   
				</select>  
			<br/>
		</div>
	</form>
	  

	
	<script type="text/javascript">
	
   
	var id=$('#roleId').val();
	if(id.length>0){
		$.ajax({
			url:'${pageContext.request.contextPath}/role/getOne?id='+id,
			async:false,
			success:function(ret){
				$("#roleName").val(ret.name);
				var timeTask=window.setInterval(function(){
					console.log(ret)
					if($('#sr').combobox().length>0){
						$('#sr').combobox('setValue', ret.sts);
					    window.clearInterval(timeTask);
					}
				},100);
			}
		});
	}

	</script>
</div>