<!-- 由<G4Studio:arm.SelectRoleTree/>标签生成的代码开始 -->
<div id="selectRoleTreeDiv"></div>
<script type="text/javascript">
Ext.onReady(function() {
#foreach($dept in $deptList)
	var node_${dept.deptid} = new Ext.tree.TreeNode({
		text:'${dept.deptname}',	
		id:'id_node_${dept.deptid}'
	});
#end
#foreach($role in $roleList)
	var node_${role.roleid} = new Ext.tree.TreeNode({
		text:'${role.rolename}',
#if(${role.checked} == "true")
	 checked:true,
#else
    checked:false,	
#end
		roleid:'${role.roleid}',
#if(${role.roletype} == "1")
	iconCls:'medal_silver_3Icon',
#else
    iconCls:'medal_gold_1Icon',
#end
		id:'id_node_${role.roleid}'
	});
#end

#foreach($dept in $deptList)
#if(${dept.isroot}!="true")
	node_${dept.parentid}.appendChild(node_${dept.deptid});
#end
#end
#foreach($role in $roleList)
	node_${role.deptid}.appendChild(node_${role.roleid});
#end

var selectRoleTree = new Ext.tree.TreePanel({
			autoHeight : false,
			autoWidth : false,
			autoScroll : true,
			animate : false,
			rootVisible : true,
			border : false,
			containerScroll : true,
			applyTo : 'selectRoleTreeDiv',
			tbar : [{
				text : '保存',
				id : 'selectRole_saveBtn',
				iconCls : 'acceptIcon',
				handler : function() {
				         if (runMode == '0') {
							Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						  }				
					     var checkedNodes = selectRoleTree.getChecked();
					     var roleid = "";
						 for(var i = 0; i < checkedNodes.length; i++) {
						   var checkNode = checkedNodes[i];
					       roleid = roleid + checkNode.attributes.roleid + "," ;  
						 }
						 saveSelectedRole(roleid);
				 }
		    }, '-', {
				text : '展开',
				iconCls : 'expand-allIcon',
				handler : function() {
					selectRoleTree.expandAll();
				}
		    }, '-', {
				text : '收缩',
				iconCls : 'collapse-allIcon',
				handler : function() {
					selectRoleTree.collapseAll();
				}
		    }],
			root : node_${deptid}
  });
  //node_${deptid}.expand();
  selectRoleTree.expandAll();

//保存授权数据
function saveSelectedRole(pRoleid){
		showWaitMsg();
		Ext.Ajax.request({
					url : './user.do?reqCode=saveSelectedRole',
					success : function(response) {
						var resultArray = Ext.util.JSON.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					failure : function(response) {
						var resultArray = Ext.util.JSON.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					params : {
						roleid : pRoleid
					}
				});
}
	
})
</script>
<!-- 由<G4Studio:arm.SelectRoleTree/>标签生成的代码结束 -->