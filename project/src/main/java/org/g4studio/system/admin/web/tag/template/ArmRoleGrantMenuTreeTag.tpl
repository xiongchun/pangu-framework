<!-- 由<G4Studio:arm.RoleGrantMenuTree/>标签生成的代码开始 -->
<div id="${key}TreeDiv"></div>
<script type="text/javascript">
Ext.onReady(function() {
#foreach($menu in $menuList)
	var node_${menu.menuid} = new Ext.tree.TreeNode({
		text:'${menu.menuname}',	
#if(${menu.checked} == "false")
	checked:false,
#else
    checked:true,
#end
        menuid:'${menu.menuid}',
		id:'id_node_${menu.menuid}'
	});
#end

#foreach($menu in $menuList)
#if(${menu.isRoot}!="true")
	node_${menu.parentid}.appendChild(node_${menu.menuid});
#end
#end

var ${key}Tree = new Ext.tree.TreePanel({
			autoHeight : false,
			autoWidth : false,
			autoScroll : true,
			animate : false,
			rootVisible : true,
			border : false,
			containerScroll : true,
			applyTo : '${key}TreeDiv',
			tbar : [{
				text : '保存',
				id : '${key}_saveBtn',
				iconCls : 'acceptIcon',
				handler : function() {
				         if (runMode == '0') {
							Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						  }	
					     var checkedNodes = ${key}Tree.getChecked();
					     var menuid = "";
						 for(var i = 0; i < checkedNodes.length; i++) {
						   var checkNode = checkedNodes[i];
					       menuid = menuid + checkNode.attributes.menuid + "," ;  
						 }
						 saveGrant(menuid);
				 }
		    }, '-', {
				text : '展开',
				iconCls : 'expand-allIcon',
				handler : function() {
					${key}Tree.expandAll();
				}
		    }, '-', {
				text : '收缩',
				iconCls : 'collapse-allIcon',
				handler : function() {
					${key}Tree.collapseAll();
				}
		    }],
			root : node_01
  });
//以下两句为避免不能选中较深子节点的特殊处理
  ${key}Tree.expandAll();
  ${key}Tree.collapseAll();
#foreach($menu in $menuList)
#if(${menu.expanded}=="true")
	node_${menu.menuid}.expand();
#end
#end

//保存授权数据
function saveGrant(pMenuid){
		showWaitMsg();
		Ext.Ajax.request({
					url : './role.do?reqCode=saveGrant',
					success : function(response) {
						var resultArray = Ext.util.JSON.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					failure : function(response) {
						var resultArray = Ext.util.JSON.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					params : {
						menuid : pMenuid,
						key: '${authorizelevel}'
					}
				});
}

/** ***************** 级联选中支持开始 ******************** */
function cascadeParent() {
	var pn = this.parentNode;
	if (!pn || !Ext.isBoolean(this.attributes.checked))
		return;
	if (this.attributes.checked) {// 级联选中
		pn.getUI().toggleCheck(true);
	} else {// 级联未选中
		var b = true;
		Ext.each(pn.childNodes, function(n) {
					if (n.getUI().isChecked()) {
						return b = false;
					}
					return true;
				});
		if (b)
			pn.getUI().toggleCheck(false);
	}
	pn.cascadeParent();
}
function cascadeChildren() {
	var ch = this.attributes.checked;
	if (!Ext.isBoolean(ch))
		return;
	Ext.each(this.childNodes, function(n) {

				n.getUI().toggleCheck(ch);
				n.cascadeChildren();
			});
}
// 为TreeNode对象添加级联父节点和子节点的方法
Ext.apply(Ext.tree.TreeNode.prototype, {
			cascadeParent : cascadeParent,
			cascadeChildren : cascadeChildren
		});
// Checkbox被点击后级联父节点和子节点
Ext.override(Ext.tree.TreeEventModel, {
			onCheckboxClick : Ext.tree.TreeEventModel.prototype.onCheckboxClick
					.createSequence(function(e, node) {
								node.cascadeParent();
								node.cascadeChildren();
							})
		});
/** ***************** 级联选中支持结束 ******************** */
	
})
</script>
<!-- 由<G4Studio:arm.RoleGrantMenuTree/>标签生成的代码结束 -->