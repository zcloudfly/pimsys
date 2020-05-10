<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div style="text-align: center; padding-top:40px">
	<form id="postForm"  method="post">
	<input type="hidden" id="posId" style="width:260px;" name="id" value='${param.id }'/>
		<div style="margin: 10px">
			部门名字:&nbsp;&nbsp;
			<input class="text" style="width:260px;" name="posName" /><br/>
		</div>
		<div style="margin: 10px">
			职位层级:&nbsp;&nbsp;
				<select id="s11" class="easyui-combobox" name="level" style="width:260px;"  >  
                 <option value=1>一级</option> 
                 <option value=2>二级</option> 
                 <option value=3>三级</option> 
                 </select>
		</div>
		<div style="margin: 10px">
			职位状态:&nbsp;&nbsp;
				<select  id="s22" class="easyui-combobox" name="sts" style="width:260px;"  >   
				    <option value="1">在用</option>   
				    <option value="0">撤销</option>   
				</select>  
			<br/>
		</div>
	</form>
	  

	
	<script type="text/javascript">
	
   
	var id=$('#posId').val();
	if(id.length>0){
		$.ajax({
			url:'${pageContext.request.contextPath}/position/getOne?id='+id,
			async:false,
			success:function(ret){
				$("input[name=posName]").val(ret.posName);
				var timeTask=window.setInterval(function(){
					console.log()
					if($('#s22').combobox().length>0){
						$('#s11').combobox('setValue', ret.level);
						$('#s22').combobox('setValue', ret.sts);
					    window.clearInterval(timeTask);
					}
				},100);
			}
		});
	}

	</script>
</div>