Ext.namespace("Ext.ux.plugins");

if(Ext.isWebKit){
	Ext.grid.GridView.prototype.borderWidth = 0;
}

Ext.ux.plugins.GroupHeaderGrid = function(config) {
	this.config = config;
};

Ext.extend(Ext.ux.plugins.GroupHeaderGrid, Ext.util.Observable, {
	init: function(grid) {
		Ext.applyIf(grid.colModel, this.config);
		Ext.apply(grid.getView(), this.viewConfig);
	},

	viewConfig: {
		initTemplates: function() {
			this.constructor.prototype.initTemplates.apply(this, arguments);
			var ts = this.templates || {};
			if (!ts.gcell) {
				ts.gcell = new Ext.XTemplate(
					'<td class="x-grid3-hd x-grid3-gcell x-grid3-td-{id} ux-grid-hd-group-row-{row} {cls}" style="{style}">',
					'<div {tooltip} class="x-grid3-hd-inner x-grid3-hd-{id}" unselectable="on" style="{istyle}" id="{domid}">',
                    this.grid.enableHdMenu ? '<a class="x-grid3-hd-btn" href="#"></a>' : '',
					'{value}</div></td>'
				);
			}
			this.templates = ts;
			this.hrowRe = new RegExp("ux-grid-hd-group-row-(\\d+)", "");
		},

		renderHeaders: function() {
			var ts = this.templates, headers = [], cm = this.cm, rows = cm.rows, tstyle = 'width:' + this.getTotalWidth() + ';';
			for (var row = 0, rlen = rows.length; row < rlen; row++) {
				var r = rows[row], cells = [];
				for (var i = 0, gcol = 0, len = r.length; i < len; i++) {
					var group = r[i];
					group.colspan = group.colspan || 1;
					var id = this.getColumnId(group.dataIndex ? cm.findColumnIndex(group.dataIndex) : gcol);
					var gs = Ext.ux.plugins.GroupHeaderGrid.prototype.getGroupStyle.call(this, group, gcol);
					cells[i] = ts.gcell.apply({
						cls: (group.header&&!group.rowmerge) ? 'ux-grid-hd-group-cell' : 'ux-grid-hd-nogroup-cell',
						id: id,
						domid:group.domid,
						row: row,
						style: 'width:' + gs.width + ';' + (gs.hidden ? 'display:none;' : '') + (group.align ? 'text-align:' + group.align + ';' : ''),
						tooltip: group.tooltip ? (Ext.QuickTips.isEnabled() ? 'ext:qtip' : 'title') + '="' + group.tooltip + '"' : '',
						istyle: group.align == 'right' ? 'padding-right:16px' : '',
						btn: this.grid.enableHdMenu && group.header,
						value: group.header || '&nbsp;'
					});
					gcol += group.colspan;
				}
				headers[row] = ts.header.apply({
					tstyle: tstyle,
					cells: cells.join('')
				});
			}
			headers.push(this.constructor.prototype.renderHeaders.apply(this, arguments));
			return headers.join('');
		},

		onColumnWidthUpdated : function(){
			this.constructor.prototype.onColumnWidthUpdated.apply(this, arguments);
			Ext.ux.plugins.GroupHeaderGrid.prototype.updateGroupStyles.call(this);
		},

		onAllColumnWidthsUpdated : function(){
			this.constructor.prototype.onAllColumnWidthsUpdated.apply(this, arguments);
			Ext.ux.plugins.GroupHeaderGrid.prototype.updateGroupStyles.call(this);
		},

		onColumnHiddenUpdated : function(){
			this.constructor.prototype.onColumnHiddenUpdated.apply(this, arguments);
			Ext.ux.plugins.GroupHeaderGrid.prototype.updateGroupStyles.call(this);
		},

		getHeaderCell : function(index){
			return this.mainHd.query(this.cellSelector)[index];
		},

		findHeaderCell : function(el){
			return el ? this.fly(el).findParent('td.x-grid3-hd', this.cellSelectorDepth) : false;
		},

		findHeaderIndex : function(el){
			var cell = this.findHeaderCell(el);
			return cell ? this.getCellIndex(cell) : false;
		},

		updateSortIcon : function(col, dir){
			var sc = this.sortClasses;
			var hds = this.mainHd.select(this.cellSelector).removeClass(sc);
			hds.item(col).addClass(sc[dir == "DESC" ? 1 : 0]);
		},

	    handleHdMenuClick : function(item){
	        var index = this.hdCtxIndex,
	            cm = this.cm, 
	            ds = this.ds,
	            id = item.getItemId();
	        switch(id){
	            case 'asc':
	                ds.sort(cm.getDataIndex(index), 'ASC');
	                break;
	            case 'desc':
	                ds.sort(cm.getDataIndex(index), 'DESC');
	                break;
	            default:
					if(id.substr(0, 5) == 'group'){
						var i = id.split('-'),
							row = parseInt(i[1], 10), col = parseInt(i[2], 10),
							r = this.cm.rows[row], group, gcol = 0;
						for (var i = 0, len = r.length; i < len; i++) {
							group = r[i];
							if (col >= gcol && col < gcol + group.colspan) {
								break;
							}
							gcol += group.colspan;
						}
						if(item.checked){
							var max = cm.getColumnsBy(this.isHideableColumn, this).length;
							for (var i = gcol, len = gcol + group.colspan; i < len; i++){
								if(!cm.isHidden(i)){
									max--;
								}
							}
							if(max < 1){
								this.onDenyColumnHide();
								return false;
							}
						}
						for (var i = gcol, len = gcol + group.colspan; i < len; i++){
				            if(cm.config[i].fixed !== true && cm.config[i].hideable !== false){
								cm.setHidden(i, item.checked);
							}
						}
					}else{
		                index = cm.getIndexById(id.substr(4));
		                if(index != -1){
		                    if(item.checked && cm.getColumnsBy(this.isHideableColumn, this).length <= 1){
		                        this.onDenyColumnHide();
		                        return false;
		                    }
		                    cm.setHidden(index, item.checked);
		                }
					}
					item.checked = !item.checked;
					if(item.menu){
						var updateChildren = function(menu){
							menu.items.each(function(childItem){
								if(!childItem.disabled){
									childItem.setChecked(item.checked, false);
									if(childItem.menu){
										updateChildren(childItem.menu);
									}
								}
							});
						}
						updateChildren(item.menu);
					}
					var parentMenu = item, parentItem;
					while(parentMenu = parentMenu.parentMenu){
						console.log(parentMenu);
						if(!parentMenu.parentMenu ||
							!(parentItem = parentMenu.parentMenu.items.get(parentMenu.getItemId())) ||
							!parentItem.setChecked){
							break;
						}
						var checked = parentMenu.items.findIndexBy(function(m){
							return m.checked;
						}) >= 0;
						parentItem.setChecked(checked, true);
					}
					item.checked = !item.checked;
	        }
	        return true;
	    },

		beforeColMenuShow : function(){
			var cm = this.cm, rows = this.cm.rows;
			this.colMenu.removeAll();
			for(var col = 0, clen = cm.getColumnCount(); col < clen; col++){
				var menu = this.colMenu, text = cm.getColumnHeader(col);
				if(cm.config[col].fixed !== true && cm.config[col].hideable !== false){
					for (var row = 0, rlen = rows.length; row < rlen; row++) {
						var r = rows[row], group, gcol = 0;
						for (var i = 0, len = r.length; i < len; i++) {
							group = r[i];
							if (col >= gcol && col < gcol + group.colspan) {
								break;
							}
							gcol += group.colspan;
						}
						if (group && group.header) {
							if (cm.hierarchicalColMenu) {
								var gid = 'group-' + row + '-' + gcol;
								var item = menu.items.item(gid);
								var submenu = item ? item.menu : null;
								if (!submenu) {
									submenu = new Ext.menu.Menu({itemId: gid});
									submenu.on("itemclick", this.handleHdMenuClick, this);
									var checked = false, disabled = true;
									for(var c = gcol, lc = gcol + group.colspan; c < lc; c++){
										if(!cm.isHidden(c)){
											checked = true;
										}
										if(cm.config[c].hideable !== false){
											disabled = false;
										}
									}
									menu.add({
										itemId: gid,
										text: group.header,
										menu: submenu,
										hideOnClick:false,
										checked: checked,
										disabled: disabled
									});
								}
								menu = submenu;
							} else {
								text = group.header + ' ' + text;
							}
						}
					}
					menu.add(new Ext.menu.CheckItem({
						itemId: "col-"+cm.getColumnId(col),
						text: text,
						checked: !cm.isHidden(col),
						hideOnClick:false,
						disabled: cm.config[col].hideable === false
					}));
				}
			}
		},

		renderUI : function(){
			this.constructor.prototype.renderUI.apply(this, arguments);
			Ext.apply(this.columnDrop, Ext.ux.plugins.GroupHeaderGrid.prototype.columnDropConfig);
		}
	},

	columnDropConfig : {
		getTargetFromEvent : function(e){
			var t = Ext.lib.Event.getTarget(e);
			return this.view.findHeaderCell(t);
		},

		positionIndicator : function(h, n, e){
			var data = Ext.ux.plugins.GroupHeaderGrid.prototype.getDragDropData.call(this, h, n, e);
			if (data === false) {
				return false;
			}
			var px = data.px + this.proxyOffsets[0];
			this.proxyTop.setLeftTop(px, data.r.top + this.proxyOffsets[1]);
			this.proxyTop.show();
			this.proxyBottom.setLeftTop(px, data.r.bottom);
			this.proxyBottom.show();
			return data.pt;
		},

		onNodeDrop : function(n, dd, e, data){
			var h = data.header;
			if(h != n){
				var d = Ext.ux.plugins.GroupHeaderGrid.prototype.getDragDropData.call(this, h, n, e);
				if (d === false) {
					return false;
				}
				var cm = this.grid.colModel, right = d.oldIndex < d.newIndex, rows = cm.rows;
				for (var row = d.row, rlen = rows.length; row < rlen; row++) {
					var r = rows[row], len = r.length, fromIx = 0, span = 1, toIx = len;
					for (var i = 0, gcol = 0; i < len; i++) {
						var group = r[i];
						if (d.oldIndex >= gcol && d.oldIndex < gcol + group.colspan) {
							fromIx = i;
						}
						if (d.oldIndex + d.colspan - 1 >= gcol && d.oldIndex + d.colspan - 1 < gcol + group.colspan) {
							span = i - fromIx + 1;
						}
						if (d.newIndex >= gcol && d.newIndex < gcol + group.colspan) {
							toIx = i;
						}
						gcol += group.colspan;
					}
					var groups = r.splice(fromIx, span);
					rows[row] = r.splice(0, toIx - (right ? span : 0)).concat(groups).concat(r);
				}
				for (var c = 0; c < d.colspan; c++) {
					var oldIx = d.oldIndex + (right ? 0 : c), newIx = d.newIndex + (right ? -1 : c);
					cm.moveColumn(oldIx, newIx);
					this.grid.fireEvent("columnmove", oldIx, newIx);
				}
				return true;
			}
			return false;
		}
	},

	getGroupStyle: function(group, gcol) {
		var width = 0, hidden = true;
		for (var i = gcol, len = gcol + group.colspan; i < len; i++) {
			if (!this.cm.isHidden(i)) {
				var cw = this.cm.getColumnWidth(i);
				if(typeof cw == 'number'){
					width += cw;
				}
				hidden = false;
			}
		}
		return {
			width: (Ext.isBorderBox ? width : Math.max(width - this.borderWidth, 0)) + 'px',
			hidden: hidden
		};
	},

	updateGroupStyles: function(col) {
		var tables = this.mainHd.query('.x-grid3-header-offset > table'), tw = this.getTotalWidth(), rows = this.cm.rows;
		for (var row = 0; row < tables.length; row++) {
			tables[row].style.width = tw;
			if (row < rows.length) {
				var cells = tables[row].firstChild.firstChild.childNodes;
				for (var i = 0, gcol = 0; i < cells.length; i++) {
					var group = rows[row][i];
					if ((typeof col != 'number') || (col >= gcol && col < gcol + group.colspan)) {
						var gs = Ext.ux.plugins.GroupHeaderGrid.prototype.getGroupStyle.call(this, group, gcol);
						cells[i].style.width = gs.width;
						cells[i].style.display = gs.hidden ? 'none' : '';
					}
					gcol += group.colspan;
				}
			}
		}
	},

	getGroupRowIndex : function(el){
		if(el){
			var m = el.className.match(this.hrowRe);
			if(m && m[1]){
				return parseInt(m[1], 10);
			}
		}
		return this.cm.rows.length;
	},

	getGroupSpan : function(row, col) {
		if (row < 0) {
			return {col: 0, colspan: this.cm.getColumnCount()};
		}
		var r = this.cm.rows[row];
		if (r) {
			for(var i = 0, gcol = 0, len = r.length; i < len; i++) {
				var group = r[i];
				if (col >= gcol && col < gcol + group.colspan) {
					return {col: gcol, colspan: group.colspan};
				}
				gcol += group.colspan;
			}
			return {col: gcol, colspan: 0};
		}
		return {col: col, colspan: 1};
	},

	getDragDropData : function(h, n, e){
		if (h.parentNode != n.parentNode) {
			return false;
		}
		var cm = this.grid.colModel;
		var x = Ext.lib.Event.getPageX(e);
		var r = Ext.lib.Dom.getRegion(n.firstChild);
		var px, pt;
		if((r.right - x) <= (r.right-r.left)/2){
			px = r.right+this.view.borderWidth;
			pt = "after";
		}else{
			px = r.left;
			pt = "before";
		}
		var oldIndex = this.view.getCellIndex(h);
		var newIndex = this.view.getCellIndex(n);
		if(cm.isFixed(newIndex)){
			return false;
		}
		var row = Ext.ux.plugins.GroupHeaderGrid.prototype.getGroupRowIndex.call(this.view, h);
		var oldGroup = Ext.ux.plugins.GroupHeaderGrid.prototype.getGroupSpan.call(this.view, row, oldIndex);
		var newGroup = Ext.ux.plugins.GroupHeaderGrid.prototype.getGroupSpan.call(this.view, row, newIndex);
		oldIndex = oldGroup.col;
		newIndex = newGroup.col + (pt == "after" ? newGroup.colspan : 0);
		if(newIndex >= oldGroup.col && newIndex <= oldGroup.col + oldGroup.colspan){
			return false;
		}
		var parentGroup = Ext.ux.plugins.GroupHeaderGrid.prototype.getGroupSpan.call(this.view, row - 1, oldIndex);
		if (newIndex < parentGroup.col || newIndex > parentGroup.col + parentGroup.colspan) {
			return false;
		}
		return {
			r: r,
			px: px,
			pt: pt,
			row: row,
			oldIndex: oldIndex,
			newIndex: newIndex,
			colspan: oldGroup.colspan
		};
	}
});