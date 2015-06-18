/**
 * viewport自适应布局实例
 * 
 * @author XiongChun
 * @since 2010-11-27
 */
Ext.onReady(function() {
			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [{
									region : 'north',
									margins : '3 3 3 3',
									split : true,
									title : 'north',
									collapsible : true,
									height : 80,
									html : '这是north区域'
								}, {
									region : 'south',
									margins : '3 3 3 3',
									split : true,
									title : 'south',
									collapsible : true,
									height : 50,
									html : '这是south区域'
								}, {
									region : 'west',
									margins : '3 3 3 3',
									split : true,
									title : 'west',
									collapsible : true,
									width:150,
									html : '这是west区域'
								}, {
									region : 'east',
									margins : '3 3 3 3',
									split : true,
									title : 'east',
									collapsible : true,
									width:100,
									html : '这是east区域'
								}, {
									region : 'center',
									html : '这是center区域'
								}]
					});
		});