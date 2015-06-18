#foreach($menu in $menuList)
	var node_${menu.menuid} = new Ext.tree.TreeNode({
		text:'${menu.menuname}',
		listeners: {
          'click': function(){
#if(${menu.request})
             addTab('${menu.request}','${menu.menuname}','${menu.menuid}','${menu.menupath}','${menu.icon}');
#end
		   }},
#if(${menu.expanded})
	expanded:${menu.expanded},
#end
#if(${menu.iconcls})
		iconCls:'${menu.iconcls}',
#end
		id:'id_node_${menu.menuid}'
	});
#end
#foreach($menu in $menuList)
#if(${menu.isRoot}=="false")
	node_${menu.parentid}.appendChild(node_${menu.menuid});
#end
#end
	var treePanel_${menuid} = new Ext.tree.TreePanel({
       autoHeight:false,
       autoWidth:false,
       autoScroll:false,
       animate:false,
       rootVisible:false,
       useArrows:true,
       title:'',
       border: false,
       containerScroll:true,
       applyTo:'div.card.${menuid}',
	   root:node_${menuid}
	});