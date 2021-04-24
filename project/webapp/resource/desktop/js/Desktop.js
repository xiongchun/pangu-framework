/*
 * ! Ext JS Library 3.1.0 Copyright(c) 2006-2009 Ext JS, LLC licensing@extjs.com
 * http://www.extjs.com/license
 */
Ext.Desktop = function(app) {
	this.taskbar = new Ext.ux.TaskBar(app);
	var taskbar = this.taskbar;

	var desktopEl = Ext.get('x-desktop');
	var taskbarEl = Ext.get('ux-taskbar');
	var shortcuts = Ext.get('x-shortcuts');

	var windows = new Ext.WindowGroup();
	var activeWindow;

	function minimizeWin(win) {
		win.minimized = true;
		win.hide();
	}

	function markActive(win) {
		if (activeWindow && activeWindow != win) {
			markInactive(activeWindow);
		}
		taskbar.setActiveButton(win.taskButton);
		activeWindow = win;
		Ext.fly(win.taskButton.el).addClass('active-win');
		win.minimized = false;
	}

	function markInactive(win) {
		if (win == activeWindow) {
			activeWindow = null;
			Ext.fly(win.taskButton.el).removeClass('active-win');
		}
	}

	function removeWin(win) {
		taskbar.removeTaskButton(win.taskButton);
		layout();
	}

	function layout() {
		desktopEl
				.setHeight(Ext.lib.Dom.getViewHeight() - taskbarEl.getHeight());
	}
	Ext.EventManager.onWindowResize(layout);

	this.layout = layout;

	this.createWindow = function(config, cls) {
		var win = new (cls || Ext.Window)(Ext.applyIf(config || {}, {
					manager : windows,
					minimizable : true,
					maximizable : true
				}));
		win.render(desktopEl);
		win.taskButton = taskbar.addTaskButton(win);

		win.cmenu = new Ext.menu.Menu({
					items : [

					]
				});

		win.animateTarget = win.taskButton.el;

		win.on({
					'activate' : {
						fn : markActive
					},
					'beforeshow' : {
						fn : markActive
					},
					'deactivate' : {
						fn : markInactive
					},
					'minimize' : {
						fn : minimizeWin
					},
					'close' : {
						fn : removeWin
					}
				});

		layout();
		return win;
	};

	this.getManager = function() {
		return windows;
	};

	this.getWindow = function(id) {
		return windows.get(id);
	}

	this.getWinWidth = function() {
		var width = Ext.lib.Dom.getViewWidth();
		return width < 200 ? 200 : width;
	}

	this.getWinHeight = function() {
		var height = (Ext.lib.Dom.getViewHeight() - taskbarEl.getHeight());
		return height < 100 ? 100 : height;
	}

	this.getWinX = function(width) {
		return (Ext.lib.Dom.getViewWidth() - width) / 2
	}

	this.getWinY = function(height) {
		return (Ext.lib.Dom.getViewHeight() - taskbarEl.getHeight() - height)
				/ 2;
	}

	layout();

	if (shortcuts) {
		shortcuts.on('click', function(e, t) {
					if (t = e.getTarget('dt', shortcuts)) {
						e.stopEvent();
						var module = app.getModule(t.id
								.replace('-shortcut', ''));
						if (module) {
							module.createWindow();
						}
					}
				});
	}

	// 实现图标多列布局开始 modified by xiongchun
	var btnHeight = 61;
	var btnWidth = 64;
	var btnPadding = 15;
	var col = null;
	var row = null;
	function initColRow() {
		col = {
			index : 1,
			x : btnPadding
		};
		row = {
			index : 1,
			y : btnPadding
		};
	}
	initColRow();
	function isOverflow(y) {
		if (y > (Ext.lib.Dom.getViewHeight() - taskbarEl.getHeight())) {
			return true;
		}
		return false;
	}
	this.setXY = function(item) {
		var bottom = row.y + btnHeight, overflow = isOverflow(row.y + btnHeight);

		if (overflow && bottom > (btnHeight + btnPadding)) {
			col = {
				index : col.index++,
				x : col.x + btnWidth + btnPadding
			};
			row = {
				index : 1,
				y : btnPadding
			};
		}

		Ext.fly(item).setXY([col.x, row.y]);

		row.index++;
		row.y = row.y + btnHeight + btnPadding;
	};
	this.handleUpdate = function() {
		initColRow();
		// var items=shortcuts.dom.children;
		var items = Ext.query("dt", shortcuts.dom);
		for (var i = 0, len = items.length; i < len; i++) {
			this.setXY(items[i]);
		}
	}
	this.handleUpdate();
	Ext.EventManager.onWindowResize(this.handleUpdate, this, {
				delay : 200
			});
	// 实现图标多列布局结束 modified by xiongchun
};