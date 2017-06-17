/**
 * 由AOS用户http://git.oschina.net/papio提交的PR整理 (http://git.oschina.net/osworks/AOS/pulls/7)
 * 
 * 汉字与拼音互转工具，根据导入的字典文件的不同支持不同
 * 对于多音字目前只是将所有可能的组合输出，准确识别多音字需要完善的词库，而词库文件往往比字库还要大，所以不太适合web环境。
 */
Ext.define('AOS.ux.TreeFilter', {
    filterByText: function(text) {
        this.filterBy(text, 'text');
    },
    filterBy: function(text, by) {
 
        this.clearFilter();
 
        var view = this.getView(),
            me = this,
            nodesAndParents = [];
 
        //找到匹配的节点并展开.
        //添加匹配的节点和他们的父节点到nodesAndParents数组.
        this.getRootNode().cascadeBy(function(tree, view) {
            var currNode = this;
            if (currNode && currNode.data[by] && 
            (currNode.data[by].toString().toLowerCase().indexOf(text.toLowerCase()) > -1 ||
             pinyinUtil.getFirstLetter(currNode.data[by].toString()).toLowerCase().indexOf(text.toLowerCase()) > -1 )) {
                me.expandPath(currNode.getPath());
 
                while (currNode.parentNode) {
                    nodesAndParents.push(currNode.id);
                    currNode = currNode.parentNode;
                }
            }
        }, null, [me, view]);
 
        //将不在nodesAndParents数组中的节点隐藏
        this.getRootNode().cascadeBy(function(tree, view) {
            var uiNode = view.getNodeByRecord(this);
 
            if (uiNode && !Ext.Array.contains(nodesAndParents, this.id)) {
                Ext.get(uiNode).setDisplayed('none');
            }
        }, null, [me, view]);
    },
 
    clearFilter: function() {
        var view = this.getView();
 
        this.getRootNode().cascadeBy(function(tree, view) {
            var uiNode = view.getNodeByRecord(this);
 
            if (uiNode) {
                Ext.get(uiNode).setDisplayed('table-row');
            }
        }, null, [this, view]);
    }
});

/**
 * 具备过滤能力的树组件
 */
Ext.define('AOS.ux.TreeFilterPanel',{
    extend:'Ext.tree.Panel',
    //混入这个类
    mixins:['AOS.ux.TreeFilter']
});