<!-- 由<G4Studio:arm.SelectUserTree/>标签生成的代码开始 -->
<div id="selectUserTreeDiv"></div>
<script type="text/javascript">
Ext.onReady(function() {
#foreach($dept in $deptList)
	var node_${dept.deptid} = new Ext.tree.TreeNode({
		text:'${dept.deptname}',	
		id:'id_node_${dept.deptid}'
	});
#end
#foreach($user in $userList)
	var node_${user.userid} = new Ext.tree.TreeNode({
		text:'${user.username}',
#if(${user.checked} == "true")
	 checked:true,
#else
    checked:false,	
#end
		userid:'${user.userid}',
#if(${user.usertype} == "1")
	iconCls:'user_femaleIcon',
#else
    iconCls:'userIcon',
#end
		id:'id_node_${user.userid}'
	});
#end

#foreach($dept in $deptList)
#if(${dept.isroot}!="true")
	node_${dept.parentid}.appendChild(node_${dept.deptid});
#end
#end
#foreach($user in $userList)
	node_${user.deptid}.appendChild(node_${user.userid});
#end

var selectUserTree = new Ext.tree.TreePanel({
			autoHeight : false,
			autoWidth : false,
			autoScroll : true,
			animate : false,
			rootVisible : true,
			border : false,
			containerScroll : true,
			applyTo : 'selectUserTreeDiv',
			tbar : [{
				text : '保存',
				id : 'selectUser_saveBtn',
				iconCls : 'acceptIcon',
				handler : function() {
				         if (runMode == '0') {
							Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						  }				
					     var checkedNodes = selectUserTree.getChecked();
					     var userid = "";
						 for(var i = 0; i < checkedNodes.length; i++) {
						   var checkNode = checkedNodes[i];
					       userid = userid + checkNode.attributes.userid + "," ;  
						 }
						 saveUser(userid);
				 }
		    }, '-', {
				text : '展开',
				iconCls : 'expand-allIcon',
				handler : function() {
					selectUserTree.expandAll();
				}
		    }, '-', {
				text : '收缩',
				iconCls : 'collapse-allIcon',
				handler : function() {
					selectUserTree.collapseAll();
				}
		    }],
			root : node_${deptid}
  });
  //node_${deptid}.expand();
  selectUserTree.expandAll();

//保存授权数据
function saveUser(pUserid){
		showWaitMsg();
		Ext.Ajax.request({
					url : './role.do?reqCode=saveUser',
					success : function(response) {
						var resultArray = Ext.util.JSON.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					failure : function(response) {
						var resultArray = Ext.util.JSON.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					params : {
						userid : pUserid
					}
				});
}
	
})
</script>
<!-- 由<G4Studio:arm.SelectUserTree/>标签生成的代码结束 -->