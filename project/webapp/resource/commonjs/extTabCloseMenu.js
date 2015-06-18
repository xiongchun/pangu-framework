/**
 * eRedLab实验室官方网站：TabPanel右键关闭Tab卡片插件
 * @author 熊春
 */
 
Ext.ux.TabCloseMenu = function(){
    var tabs, menu, ctxItem;
    this.init = function(tp){
        tabs = tp;
        tabs.on('contextmenu', onContextMenu);
    }

    function onContextMenu(ts, item, e){
        if(!menu){ 
            menu = new Ext.menu.Menu([{
                id: tabs.id + '-close',
                text: '关闭当前标签页',
                iconCls:'applicationIcon', 
                handler : function(){
                    tabs.remove(ctxItem);
                }
            },{
                id: tabs.id + '-close-others',
                text: '关闭其它标签页',
                iconCls:'application_doubleIcon', 
                handler : function(){
                    tabs.items.each(function(item){
                        if(item.closable && item != ctxItem){
                            tabs.remove(item);
                        }
                    });
                }
            },{
                id: tabs.id + '-close-all',
                text: '关闭全部标签页',
                iconCls:'application_cascadeIcon', 
                handler : function(){
                    tabs.items.each(function(item){
                        if(item.closable){
                            tabs.remove(item);
                        }
                    });
                }
            },'-',{
                id: tabs.id + '-cancel',
                text: '取消',
                iconCls:'tbar_synchronizeIcon', 
                handler : function(){
                	menu.hide();
                }
            }]);
        }
        ctxItem = item;
        var items = menu.items;
        items.get(tabs.id + '-close').setDisabled(!item.closable);
        var disableOthers = true;
        tabs.items.each(function(){
            if(this != item && this.closable){
                disableOthers = false;
                return false;
            }
        });
        items.get(tabs.id + '-close-others').setDisabled(disableOthers);
        var disableAll = true;
        tabs.items.each(function(){
            if(this.closable){
                disableAll = false;
                return false;
            }
        });
        items.get(tabs.id + '-close-all').setDisabled(disableAll);
        menu.showAt(e.getPoint());
    }
};