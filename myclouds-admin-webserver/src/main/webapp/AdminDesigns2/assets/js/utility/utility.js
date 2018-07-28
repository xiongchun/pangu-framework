/*
 * bootbox.js [master branch]
 * http://bootboxjs.com/license.txt
 */
;
(function(e, t) {
   "use strict";
   if (typeof define === "function" && define.amd) {
      define(["jquery"], t)
   } else if (typeof exports === "object") {
      module.exports = t(require("jquery"))
   } else {
      e.bootbox = t(e.jQuery)
   }
})(this, function e(t, n) {
   "use strict";

   function o(e) {
      var t = m[i.locale];
      return t ? t[e] : m.en[e]
   }

   function u(e, n, r) {
      e.stopPropagation();
      e.preventDefault();
      var i = t.isFunction(r) && r(e) === false;
      if (!i) {
         n.modal("hide")
      }
   }

   function a(e) {
      var t, n = 0;
      for (t in e) {
         n++
      }
      return n
   }

   function f(e, n) {
      var r = 0;
      t.each(e, function(e, t) {
         n(e, t, r++)
      })
   }

   function l(e) {
      var n;
      var r;
      if (typeof e !== "object") {
         throw new Error("Please supply an object of options")
      }
      if (!e.message) {
         throw new Error("Please specify a message")
      }
      e = t.extend({}, i, e);
      if (!e.buttons) {
         e.buttons = {}
      }
      e.backdrop = e.backdrop ? "static" : false;
      n = e.buttons;
      r = a(n);
      f(n, function(e, i, s) {
         if (t.isFunction(i)) {
            i = n[e] = {
               callback: i
            }
         }
         if (t.type(i) !== "object") {
            throw new Error("button with key " + e + " must be an object")
         }
         if (!i.label) {
            i.label = e
         }
         if (!i.className) {
            if (r <= 2 && s === r - 1) {
               i.className = "btn-primary"
            } else {
               i.className = "btn-default"
            }
         }
      });
      return e
   }

   function c(e, t) {
      var n = e.length;
      var r = {};
      if (n < 1 || n > 2) {
         throw new Error("Invalid argument length")
      }
      if (n === 2 || typeof e[0] === "string") {
         r[t[0]] = e[0];
         r[t[1]] = e[1]
      } else {
         r = e[0]
      }
      return r
   }

   function h(e, n, r) {
      return t.extend(true, {}, e, c(n, r))
   }

   function p(e, t, n, r) {
      var i = {
         className: "bootbox-" + e,
         buttons: d.apply(null, t)
      };
      return v(h(i, r, n), t)
   }

   function d() {
      var e = {};
      for (var t = 0, n = arguments.length; t < n; t++) {
         var r = arguments[t];
         var i = r.toLowerCase();
         var s = r.toUpperCase();
         e[i] = {
            label: o(s)
         }
      }
      return e
   }

   function v(e, t) {
      var r = {};
      f(t, function(e, t) {
         r[t] = true
      });
      f(e.buttons, function(e) {
         if (r[e] === n) {
            throw new Error("button key " + e + " is not allowed (options are " + t.join("\n") + ")")
         }
      });
      return e
   }
   var r = {
      dialog: "<div class='bootbox modal' tabindex='-1' role='dialog'>" + "<div class='modal-dialog'>" + "<div class='modal-content'>" + "<div class='modal-body'><div class='bootbox-body'></div></div>" + "</div>" + "</div>" + "</div>",
      header: "<div class='modal-header'>" + "<h4 class='modal-title'></h4>" + "</div>",
      footer: "<div class='modal-footer'></div>",
      closeButton: "<button type='button' class='bootbox-close-button close' data-dismiss='modal' aria-hidden='true'>&times;</button>",
      form: "<form class='bootbox-form'></form>",
      inputs: {
         text: "<input class='bootbox-input bootbox-input-text form-control' autocomplete=off type=text />",
         textarea: "<textarea class='bootbox-input bootbox-input-textarea form-control'></textarea>",
         email: "<input class='bootbox-input bootbox-input-email form-control' autocomplete='off' type='email' />",
         select: "<select class='bootbox-input bootbox-input-select form-control'></select>",
         checkbox: "<div class='checkbox'><label><input class='bootbox-input bootbox-input-checkbox' type='checkbox' /></label></div>",
         date: "<input class='bootbox-input bootbox-input-date form-control' autocomplete=off type='date' />",
         time: "<input class='bootbox-input bootbox-input-time form-control' autocomplete=off type='time' />",
         number: "<input class='bootbox-input bootbox-input-number form-control' autocomplete=off type='number' />",
         password: "<input class='bootbox-input bootbox-input-password form-control' autocomplete='off' type='password' />"
      }
   };
   var i = {
      locale: "en",
      backdrop: true,
      animate: true,
      className: null,
      keyboard: false,
      closeButton: true,
      show: true,
      container: "body"
   };
   var s = {};
   s.defineLocale = function(e, t) {
      if (t) {
         m[e] = {
            OK: t.OK,
            CANCEL: t.CANCEL,
            CONFIRM: t.CONFIRM
         };
         return m[e]
      } else {
         delete m[e];
         return null
      }
   };
   s.alert = function() {
      var e;
      e = p("alert", ["ok"], ["message", "callback"], arguments);
      if (e.callback && !t.isFunction(e.callback)) {
         throw new Error("alert requires callback property to be a function when provided")
      }
      e.buttons.ok.callback = e.onEscape = function() {
         if (t.isFunction(e.callback)) {
            return e.callback()
         }
         return true
      };
      return s.dialog(e)
   };
   s.confirm = function() {
      var e;
      e = p("confirm", ["cancel", "confirm"], ["message", "callback"], arguments);
      e.buttons.cancel.callback = e.onEscape = function() {
         return e.callback(false)
      };
      e.buttons.confirm.callback = function() {
         return e.callback(true)
      };
      if (!t.isFunction(e.callback)) {
         throw new Error("confirm requires a callback")
      }
      return s.dialog(e)
   };
   s.prompt = function() {
      var e;
      var i;
      var o;
      var u;
      var a;
      var l;
      var c;
      u = t(r.form);
      i = {
         className: "bootbox-prompt",
         buttons: d("cancel", "confirm"),
         value: "",
         inputType: "text"
      };
      e = v(h(i, arguments, ["title", "callback"]), ["cancel", "confirm"]);
      l = e.show === n ? true : e.show;
      e.message = u;
      e.buttons.cancel.callback = e.onEscape = function() {
         return e.callback(null)
      };
      e.buttons.confirm.callback = function() {
         var n;
         switch (e.inputType) {
            case "text":
            case "textarea":
            case "email":
            case "select":
            case "date":
            case "time":
            case "number":
            case "password":
               n = a.val();
               break;
            case "checkbox":
               var r = a.find("input:checked");
               n = [];
               f(r, function(e, r) {
                  n.push(t(r).val())
               });
               break
         }
         return e.callback(n)
      };
      e.show = false;
      if (!e.title) {
         throw new Error("prompt requires a title")
      }
      if (!t.isFunction(e.callback)) {
         throw new Error("prompt requires a callback")
      }
      if (!r.inputs[e.inputType]) {
         throw new Error("invalid prompt type")
      }
      a = t(r.inputs[e.inputType]);
      switch (e.inputType) {
         case "text":
         case "textarea":
         case "email":
         case "date":
         case "time":
         case "number":
         case "password":
            a.val(e.value);
            break;
         case "select":
            var p = {};
            c = e.inputOptions || [];
            if (!c.length) {
               throw new Error("prompt with select requires options")
            }
            f(c, function(e, r) {
               var i = a;
               if (r.value === n || r.text === n) {
                  throw new Error("given options in wrong format")
               }
               if (r.group) {
                  if (!p[r.group]) {
                     p[r.group] = t("<optgroup/>").attr("label", r.group)
                  }
                  i = p[r.group]
               }
               i.append("<option value='" + r.value + "'>" + r.text + "</option>")
            });
            f(p, function(e, t) {
               a.append(t)
            });
            a.val(e.value);
            break;
         case "checkbox":
            var m = t.isArray(e.value) ? e.value : [e.value];
            c = e.inputOptions || [];
            if (!c.length) {
               throw new Error("prompt with checkbox requires options")
            }
            if (!c[0].value || !c[0].text) {
               throw new Error("given options in wrong format")
            }
            a = t("<div/>");
            f(c, function(n, i) {
               var s = t(r.inputs[e.inputType]);
               s.find("input").attr("value", i.value);
               s.find("label").append(i.text);
               f(m, function(e, t) {
                  if (t === i.value) {
                     s.find("input").prop("checked", true)
                  }
               });
               a.append(s)
            });
            break
      }
      if (e.placeholder) {
         a.attr("placeholder", e.placeholder)
      }
      if (e.pattern) {
         a.attr("pattern", e.pattern)
      }
      u.append(a);
      u.on("submit", function(e) {
         e.preventDefault();
         e.stopPropagation();
         o.find(".btn-primary").click()
      });
      o = s.dialog(e);
      o.off("shown.bs.modal");
      o.on("shown.bs.modal", function() {
         a.focus()
      });
      if (l === true) {
         o.modal("show")
      }
      return o
   };
   s.dialog = function(e) {
      e = l(e);
      var i = t(r.dialog);
      var s = i.find(".modal-dialog");
      var o = i.find(".modal-body");
      var a = e.buttons;
      var c = "";
      var h = {
         onEscape: e.onEscape
      };
      if (t.fn.modal === n) {
         throw new Error("$.fn.modal is not defined; please double check you have included " + "the Bootstrap JavaScript library. See http://getbootstrap.com/javascript/ " + "for more details.")
      }
      f(a, function(e, t) {
         c += "<button data-bb-handler='" + e + "' type='button' class='btn " + t.className + "'>" + t.label + "</button>";
         h[e] = t.callback
      });
      o.find(".bootbox-body").html(e.message);
      if (e.animate === true) {
         i.addClass("fade")
      }
      if (e.className) {
         i.addClass(e.className)
      }
      if (e.size === "large") {
         s.addClass("modal-lg")
      }
      if (e.size === "small") {
         s.addClass("modal-sm")
      }
      if (e.title) {
         o.before(r.header)
      }
      if (e.closeButton) {
         var p = t(r.closeButton);
         if (e.title) {
            i.find(".modal-header").prepend(p)
         } else {
            p.css("margin-top", "-10px").prependTo(o)
         }
      }
      if (e.title) {
         i.find(".modal-title").html(e.title)
      }
      if (c.length) {
         o.after(r.footer);
         i.find(".modal-footer").html(c)
      }
      i.on("hidden.bs.modal", function(e) {
         if (e.target === this) {
            i.remove()
         }
      });
      i.on("shown.bs.modal", function() {
         i.find(".btn-primary:first").focus()
      });
      i.on("escape.close.bb", function(e) {
         if (h.onEscape) {
            u(e, i, h.onEscape)
         }
      });
      i.on("click", ".modal-footer button", function(e) {
         var n = t(this).data("bb-handler");
         u(e, i, h[n])
      });
      i.on("click", ".bootbox-close-button", function(e) {
         u(e, i, h.onEscape)
      });
      i.on("keyup", function(e) {
         if (e.which === 27) {
            i.trigger("escape.close.bb")
         }
      });
      t(e.container).append(i);
      i.modal({
         backdrop: e.backdrop,
         keyboard: e.keyboard || false,
         show: false
      });
      if (e.show) {
         i.modal("show")
      }
      return i
   };
   s.setDefaults = function() {
      var e = {};
      if (arguments.length === 2) {
         e[arguments[0]] = arguments[1]
      } else {
         e = arguments[0]
      }
      t.extend(i, e)
   };
   s.hideAll = function() {
      t(".bootbox").modal("hide");
      return s
   };
   var m = {
      br: {
         OK: "OK",
         CANCEL: "Cancelar",
         CONFIRM: "Sim"
      },
      cs: {
         OK: "OK",
         CANCEL: "Zrušit",
         CONFIRM: "Potvrdit"
      },
      da: {
         OK: "OK",
         CANCEL: "Annuller",
         CONFIRM: "Accepter"
      },
      de: {
         OK: "OK",
         CANCEL: "Abbrechen",
         CONFIRM: "Akzeptieren"
      },
      el: {
         OK: "Εντάξει",
         CANCEL: "Ακύρωση",
         CONFIRM: "Επιβεβαίωση"
      },
      en: {
         OK: "OK",
         CANCEL: "Cancel",
         CONFIRM: "OK"
      },
      es: {
         OK: "OK",
         CANCEL: "Cancelar",
         CONFIRM: "Aceptar"
      },
      et: {
         OK: "OK",
         CANCEL: "Katkesta",
         CONFIRM: "OK"
      },
      fi: {
         OK: "OK",
         CANCEL: "Peruuta",
         CONFIRM: "OK"
      },
      fr: {
         OK: "OK",
         CANCEL: "Annuler",
         CONFIRM: "D'accord"
      },
      he: {
         OK: "אישור",
         CANCEL: "ביטול",
         CONFIRM: "אישור"
      },
      hu: {
         OK: "OK",
         CANCEL: "Mégsem",
         CONFIRM: "Megerősít"
      },
      hr: {
         OK: "OK",
         CANCEL: "Odustani",
         CONFIRM: "Potvrdi"
      },
      id: {
         OK: "OK",
         CANCEL: "Batal",
         CONFIRM: "OK"
      },
      it: {
         OK: "OK",
         CANCEL: "Annulla",
         CONFIRM: "Conferma"
      },
      ja: {
         OK: "OK",
         CANCEL: "キャンセル",
         CONFIRM: "確認"
      },
      lt: {
         OK: "Gerai",
         CANCEL: "Atšaukti",
         CONFIRM: "Patvirtinti"
      },
      lv: {
         OK: "Labi",
         CANCEL: "Atcelt",
         CONFIRM: "Apstiprināt"
      },
      nl: {
         OK: "OK",
         CANCEL: "Annuleren",
         CONFIRM: "Accepteren"
      },
      no: {
         OK: "OK",
         CANCEL: "Avbryt",
         CONFIRM: "OK"
      },
      pl: {
         OK: "OK",
         CANCEL: "Anuluj",
         CONFIRM: "Potwierdź"
      },
      pt: {
         OK: "OK",
         CANCEL: "Cancelar",
         CONFIRM: "Confirmar"
      },
      ru: {
         OK: "OK",
         CANCEL: "Отмена",
         CONFIRM: "Применить"
      },
      sv: {
         OK: "OK",
         CANCEL: "Avbryt",
         CONFIRM: "OK"
      },
      tr: {
         OK: "Tamam",
         CANCEL: "İptal",
         CONFIRM: "Onayla"
      },
      zh_CN: {
         OK: "OK",
         CANCEL: "取消",
         CONFIRM: "确认"
      },
      zh_TW: {
         OK: "OK",
         CANCEL: "取消",
         CONFIRM: "確認"
      }
   };
   s.init = function(n) {
      return e(n || t)
   };
   return s
})

/*
 * FitText.js 1.2
 * Copyright 2011, Dave Rupert http://daverupert.com
 * Released under the WTFPL license
 * http://sam.zoy.org/wtfpl/
 */
;
(function(e) {
   e.fn.fitText = function(t, n) {
      var r = t || 1,
         i = e.extend({
            minFontSize: Number.NEGATIVE_INFINITY,
            maxFontSize: Number.POSITIVE_INFINITY
         }, n);
      return this.each(function() {
         var t = e(this);
         var n = function() {
            t.css("font-size", Math.max(Math.min(t.width() / (r * 10), parseFloat(i.maxFontSize)), parseFloat(i.minFontSize)))
         };
         n();
         e(window).on("resize.fittext orientationchange.fittext", n)
      })
   }
})(jQuery)

/*
 * jQuery.fullscreen library v0.4.2
 * Copyright (c) 2013 Vladimir Zhuravlev
 * @license https://github.com/private-face/jquery.fullscreen/blob/master/LICENSE
 */
;
(function(e) {
   function t(e) {
      return typeof e !== "undefined"
   }

   function n(t, n, r) {
      var i = function() {};
      i.prototype = n.prototype;
      t.prototype = new i;
      t.prototype.constructor = t;
      n.prototype.constructor = n;
      t._super = n.prototype;
      if (r) {
         e.extend(t.prototype, r)
      }
   }

   function s(e, n) {
      var s;
      if (typeof e === "string") {
         n = e;
         e = document
      }
      for (var o = 0; o < r.length; ++o) {
         n = n.replace(r[o][0], r[o][1]);
         for (var u = 0; u < i.length; ++u) {
            s = i[u];
            s += u === 0 ? n : n.charAt(0).toUpperCase() + n.substr(1);
            if (t(e[s])) {
               return e[s]
            }
         }
      }
      return void 0
   }
   var r = [
      ["", ""],
      ["exit", "cancel"],
      ["screen", "Screen"]
   ];
   var i = ["", "o", "ms", "moz", "webkit", "webkitCurrent"];
   var o = navigator.userAgent;
   var u = s("fullscreenEnabled");
   var a = o.indexOf("Android") !== -1 && o.indexOf("Chrome") !== -1;
   var f = !a && t(s("fullscreenElement")) && (!t(u) || u === true);
   var l = e.fn.jquery.split(".");
   var c = parseInt(l[0]) < 2 && parseInt(l[1]) < 7;
   var h = function() {
      this.__options = null;
      this._fullScreenElement = null;
      this.__savedStyles = {}
   };
   h.prototype = {
      _DEFAULT_OPTIONS: {
         styles: {
            boxSizing: "border-box",
            MozBoxSizing: "border-box",
            WebkitBoxSizing: "border-box"
         },
         toggleClass: null
      },
      __documentOverflow: "visible",
      __htmlOverflow: "visible",
      _preventDocumentScroll: function() {
         this.__documentOverflow = e("body")[0].style.overflow;
         this.__htmlOverflow = e("html")[0].style.overflow
      },
      _allowDocumentScroll: function() {
         e("body")[0].style.overflow = this.__documentOverflow;
         e("html")[0].style.overflow = this.__htmlOverflow
      },
      _fullScreenChange: function() {
         if (!this.__options) return;
         if (!this.isFullScreen()) {
            this._allowDocumentScroll();
            this._revertStyles();
            this._triggerEvents();
            this._fullScreenElement = null
         } else {
            this._preventDocumentScroll();
            this._triggerEvents()
         }
      },
      _fullScreenError: function(t) {
         if (!this.__options) return;
         this._revertStyles();
         this._fullScreenElement = null;
         if (t) {
            e(document).trigger("fscreenerror", [t])
         }
      },
      _triggerEvents: function() {
         e(this._fullScreenElement).trigger(this.isFullScreen() ? "fscreenopen" : "fscreenclose");
         e(document).trigger("fscreenchange", [this.isFullScreen(), this._fullScreenElement])
      },
      _saveAndApplyStyles: function() {
         var t = e(this._fullScreenElement);
         this.__savedStyles = {};
         for (var n in this.__options.styles) {
            this.__savedStyles[n] = this._fullScreenElement.style[n];
            this._fullScreenElement.style[n] = this.__options.styles[n]
         }
         if (this.__options.toggleClass) {
            t.addClass(this.__options.toggleClass)
         }
      },
      _revertStyles: function() {
         var t = e(this._fullScreenElement);
         for (var n in this.__options.styles) {
            this._fullScreenElement.style[n] = this.__savedStyles[n]
         }
         if (this.__options.toggleClass) {
            t.removeClass(this.__options.toggleClass)
         }
      },
      open: function(t, n) {
         if (t === this._fullScreenElement) {
            return
         }
         if (this.isFullScreen()) {
            this.exit()
         }
         this._fullScreenElement = t;
         this.__options = e.extend(true, {}, this._DEFAULT_OPTIONS, n);
         this._saveAndApplyStyles()
      },
      exit: null,
      isFullScreen: null,
      isNativelySupported: function() {
         return f
      }
   };
   var p = function() {
      p._super.constructor.apply(this, arguments);
      this.exit = e.proxy(s("exitFullscreen"), document);
      this._DEFAULT_OPTIONS = e.extend(true, {}, this._DEFAULT_OPTIONS, {
         styles: {
            width: "100%",
            height: "100%"
         }
      });
      e(document).bind(this._prefixedString("fullscreenchange") + " MSFullscreenChange", e.proxy(this._fullScreenChange, this)).bind(this._prefixedString("fullscreenerror") + " MSFullscreenError", e.proxy(this._fullScreenError, this))
   };
   n(p, h, {
      VENDOR_PREFIXES: ["", "o", "moz", "webkit"],
      _prefixedString: function(t) {
         return e.map(this.VENDOR_PREFIXES, function(e) {
            return e + t
         }).join(" ")
      },
      open: function(e, t) {
         p._super.open.apply(this, arguments);
         var n = s(e, "requestFullscreen");
         n.call(e)
      },
      exit: e.noop,
      isFullScreen: function() {
         return s("fullscreenElement") !== null
      },
      element: function() {
         return s("fullscreenElement")
      }
   });
   var d = function() {
      d._super.constructor.apply(this, arguments);
      this._DEFAULT_OPTIONS = e.extend({}, this._DEFAULT_OPTIONS, {
         styles: {
            position: "fixed",
            zIndex: "2147483647",
            left: 0,
            top: 0,
            bottom: 0,
            right: 0
         }
      });
      this.__delegateKeydownHandler()
   };
   n(d, h, {
      __isFullScreen: false,
      __delegateKeydownHandler: function() {
         var t = e(document);
         t.delegate("*", "keydown.fullscreen", e.proxy(this.__keydownHandler, this));
         var n = c ? t.data("events") : e._data(document).events;
         var r = n["keydown"];
         if (!c) {
            r.splice(0, 0, r.splice(r.delegateCount - 1, 1)[0])
         } else {
            n.live.unshift(n.live.pop())
         }
      },
      __keydownHandler: function(e) {
         if (this.isFullScreen() && e.which === 27) {
            this.exit();
            return false
         }
         return true
      },
      _revertStyles: function() {
         d._super._revertStyles.apply(this, arguments);
         this._fullScreenElement.offsetHeight
      },
      open: function(e) {
         d._super.open.apply(this, arguments);
         this.__isFullScreen = true;
         this._fullScreenChange()
      },
      exit: function() {
         this.__isFullScreen = false;
         this._fullScreenChange()
      },
      isFullScreen: function() {
         return this.__isFullScreen
      },
      element: function() {
         return this.__isFullScreen ? this._fullScreenElement : null
      }
   });
   e.fullscreen = f ? new p : new d;
   e.fn.fullscreen = function(t) {
      var n = this[0];
      t = e.extend({
         toggleClass: null,
         overflow: "hidden"
      }, t);
      t.styles = {
         overflow: t.overflow
      };
      delete t.overflow;
      if (n) {
         e.fullscreen.open(n, t)
      }
      return this
   }
})(jQuery)

/*
 * Bootstrap Multiselect v0.9.8 (https://github.com/davidstutz/bootstrap-multiselect)
 * Dual licensed under the BSD-3-Clause and the Apache License, Version 2.0.
 * Copyright 2012 - 2014 David Stutz
 */
;
! function(e) {
   "use strict";

   function t(e) {
      return ko.isObservable(e) && !(e.destroyAll === undefined)
   }

   function n(e, t) {
      for (var n = 0; n < e.length; ++n) {
         t(e[n])
      }
   }

   function r(t, n) {
      this.$select = e(t);
      this.options = this.mergeOptions(e.extend({}, n, this.$select.data()));
      this.originalOptions = this.$select.clone()[0].options;
      this.query = "";
      this.searchTimeout = null;
      this.options.multiple = this.$select.attr("multiple") === "multiple";
      this.options.onChange = e.proxy(this.options.onChange, this);
      this.options.onDropdownShow = e.proxy(this.options.onDropdownShow, this);
      this.options.onDropdownHide = e.proxy(this.options.onDropdownHide, this);
      this.options.onDropdownShown = e.proxy(this.options.onDropdownShown, this);
      this.options.onDropdownHidden = e.proxy(this.options.onDropdownHidden, this);
      this.buildContainer();
      this.buildButton();
      this.buildDropdown();
      this.buildSelectAll();
      this.buildDropdownOptions();
      this.buildFilter();
      this.updateButtonText();
      this.updateSelectAll();
      if (this.options.disableIfEmpty && e("option", this.$select).length <= 0) {
         this.disable()
      }
      this.$select.hide().after(this.$container)
   }
   if (typeof ko !== "undefined" && ko.bindingHandlers && !ko.bindingHandlers.multiselect) {
      ko.bindingHandlers.multiselect = {
         init: function(r, i, s, o, u) {
            var a = s().selectedOptions;
            var f = ko.utils.unwrapObservable(i());
            e(r).multiselect(f);
            if (t(a)) {
               e(r).multiselect("select", ko.utils.unwrapObservable(a));
               a.subscribe(function(t) {
                  var i = [],
                     s = [];
                  n(t, function(e) {
                     switch (e.status) {
                        case "added":
                           i.push(e.value);
                           break;
                        case "deleted":
                           s.push(e.value);
                           break
                     }
                  });
                  if (i.length > 0) {
                     e(r).multiselect("select", i)
                  }
                  if (s.length > 0) {
                     e(r).multiselect("deselect", s)
                  }
               }, null, "arrayChange")
            }
         },
         update: function(n, r, i, s, o) {
            var u = i().options,
               a = e(n).data("multiselect"),
               f = ko.utils.unwrapObservable(r());
            if (t(u)) {
               u.subscribe(function(t) {
                  e(n).multiselect("rebuild")
               })
            }
            if (!a) {
               e(n).multiselect(f)
            } else {
               a.updateOriginalOptions()
            }
         }
      }
   }
   r.prototype = {
      defaults: {
         buttonText: function(t, n) {
            if (t.length === 0) {
               return this.nonSelectedText + ' <b class="caret"></b>'
            } else if (t.length == e("option", e(n)).length) {
               return this.allSelectedText + ' <b class="caret"></b>'
            } else if (t.length > this.numberDisplayed) {
               return t.length + " " + this.nSelectedText + ' <b class="caret"></b>'
            } else {
               var r = "";
               t.each(function() {
                  var t = e(this).attr("label") !== undefined ? e(this).attr("label") : e(this).html();
                  r += t + ", "
               });
               return r.substr(0, r.length - 2) + ' <b class="caret"></b>'
            }
         },
         buttonTitle: function(t, n) {
            if (t.length === 0) {
               return this.nonSelectedText
            } else {
               var r = "";
               t.each(function() {
                  r += e(this).text() + ", "
               });
               return r.substr(0, r.length - 2)
            }
         },
         label: function(t) {
            return e(t).attr("label") || e(t).html()
         },
         onChange: function(e, t) {},
         onDropdownShow: function(e) {},
         onDropdownHide: function(e) {},
         onDropdownShown: function(e) {},
         onDropdownHidden: function(e) {},
         buttonClass: "btn btn-default",
         buttonWidth: "auto",
         buttonContainer: '<div class="btn-group" />',
         dropRight: false,
         selectedClass: "active",
         maxHeight: false,
         checkboxName: false,
         includeSelectAllOption: false,
         includeSelectAllIfMoreThan: 0,
         selectAllText: " Select all",
         selectAllValue: "multiselect-all",
         selectAllName: false,
         enableFiltering: false,
         enableCaseInsensitiveFiltering: false,
         enableClickableOptGroups: false,
         filterPlaceholder: "Search",
         filterBehavior: "text",
         includeFilterClearBtn: true,
         preventInputChangeEvent: false,
         nonSelectedText: "None selected",
         nSelectedText: "selected",
         allSelectedText: "All selected",
         numberDisplayed: 3,
         disableIfEmpty: false,
         templates: {
            button: '<button type="button" class="multiselect dropdown-toggle" data-toggle="dropdown"></button>',
            ul: '<ul class="multiselect-container dropdown-menu"></ul>',
            filter: '<li class="multiselect-item filter"><div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control multiselect-search" type="text"></div></li>',
            filterClearBtn: '<span class="input-group-btn"><button class="btn btn-default multiselect-clear-filter" type="button"><i class="glyphicon glyphicon-remove"></i></button></span>',
            li: '<li><a href="javascript:void(0);"><label></label></a></li>',
            divider: '<li class="multiselect-item divider"></li>',
            liGroup: '<li class="multiselect-item multiselect-group"><label></label></li>'
         }
      },
      constructor: r,
      buildContainer: function() {
         this.$container = e(this.options.buttonContainer);
         this.$container.on("show.bs.dropdown", this.options.onDropdownShow);
         this.$container.on("hide.bs.dropdown", this.options.onDropdownHide);
         this.$container.on("shown.bs.dropdown", this.options.onDropdownShown);
         this.$container.on("hidden.bs.dropdown", this.options.onDropdownHidden)
      },
      buildButton: function() {
         this.$button = e(this.options.templates.button).addClass(this.options.buttonClass);
         if (this.$select.prop("disabled")) {
            this.disable()
         } else {
            this.enable()
         }
         if (this.options.buttonWidth && this.options.buttonWidth !== "auto") {
            this.$button.css({
               width: this.options.buttonWidth
            });
            this.$container.css({
               width: this.options.buttonWidth
            })
         }
         var t = this.$select.attr("tabindex");
         if (t) {
            this.$button.attr("tabindex", t)
         }
         this.$container.prepend(this.$button)
      },
      buildDropdown: function() {
         this.$ul = e(this.options.templates.ul);
         if (this.options.dropRight) {
            this.$ul.addClass("pull-right")
         }
         if (this.options.maxHeight) {
            this.$ul.css({
               "max-height": this.options.maxHeight + "px",
               "overflow-y": "auto",
               "overflow-x": "hidden"
            })
         }
         this.$container.append(this.$ul)
      },
      buildDropdownOptions: function() {
         this.$select.children().each(e.proxy(function(t, n) {
            var r = e(n);
            var i = r.prop("tagName").toLowerCase();
            if (r.prop("value") === this.options.selectAllValue) {
               return
            }
            if (i === "optgroup") {
               this.createOptgroup(n)
            } else if (i === "option") {
               if (r.data("role") === "divider") {
                  this.createDivider()
               } else {
                  this.createOptionValue(n)
               }
            }
         }, this));
         e("li input", this.$ul).on("change", e.proxy(function(t) {
            var n = e(t.target);
            var r = n.prop("checked") || false;
            var i = n.val() === this.options.selectAllValue;
            if (this.options.selectedClass) {
               if (r) {
                  n.closest("li").addClass(this.options.selectedClass)
               } else {
                  n.closest("li").removeClass(this.options.selectedClass)
               }
            }
            var s = n.val();
            var o = this.getOptionByValue(s);
            var u = e("option", this.$select).not(o);
            var a = e("input", this.$container).not(n);
            if (i) {
               if (r) {
                  this.selectAll()
               } else {
                  this.deselectAll()
               }
            }
            if (!i) {
               if (r) {
                  o.prop("selected", true);
                  if (this.options.multiple) {
                     o.prop("selected", true)
                  } else {
                     if (this.options.selectedClass) {
                        e(a).closest("li").removeClass(this.options.selectedClass)
                     }
                     e(a).prop("checked", false);
                     u.prop("selected", false);
                     this.$button.click()
                  }
                  if (this.options.selectedClass === "active") {
                     u.closest("a").css("outline", "")
                  }
               } else {
                  o.prop("selected", false)
               }
            }
            this.$select.change();
            this.updateButtonText();
            this.updateSelectAll();
            this.options.onChange(o, r);
            if (this.options.preventInputChangeEvent) {
               return false
            }
         }, this));
         e("li a", this.$ul).on("touchstart click", function(t) {
            t.stopPropagation();
            var n = e(t.target);
            if (document.getSelection().type === "Range") {
               var r = e(this).find("input:first");
               r.prop("checked", !r.prop("checked")).trigger("change")
            }
            if (t.shiftKey) {
               var i = n.prop("checked") || false;
               if (i) {
                  var s = n.closest("li").siblings('li[class="active"]:first');
                  var o = n.closest("li").index();
                  var u = s.index();
                  if (o > u) {
                     n.closest("li").prevUntil(s).each(function() {
                        e(this).find("input:first").prop("checked", true).trigger("change")
                     })
                  } else {
                     n.closest("li").nextUntil(s).each(function() {
                        e(this).find("input:first").prop("checked", true).trigger("change")
                     })
                  }
               }
            }
            n.blur()
         });
         this.$container.off("keydown.multiselect").on("keydown.multiselect", e.proxy(function(t) {
            if (e('input[type="text"]', this.$container).is(":focus")) {
               return
            }
            if (t.keyCode === 9 && this.$container.hasClass("open")) {
               this.$button.click()
            } else {
               var n = e(this.$container).find("li:not(.divider):not(.disabled) a").filter(":visible");
               if (!n.length) {
                  return
               }
               var r = n.index(n.filter(":focus"));
               if (t.keyCode === 38 && r > 0) {
                  r--
               } else if (t.keyCode === 40 && r < n.length - 1) {
                  r++
               } else if (!~r) {
                  r = 0
               }
               var i = n.eq(r);
               i.focus();
               if (t.keyCode === 32 || t.keyCode === 13) {
                  var s = i.find("input");
                  s.prop("checked", !s.prop("checked"));
                  s.change()
               }
               t.stopPropagation();
               t.preventDefault()
            }
         }, this));
         if (this.options.enableClickableOptGroups && this.options.multiple) {
            e("li.multiselect-group", this.$ul).on("click", e.proxy(function(t) {
               t.stopPropagation();
               var n = e(t.target).parent();
               var r = n.nextUntil("li.multiselect-group");
               var i = true;
               var s = r.find("input");
               s.each(function() {
                  i = i && e(this).prop("checked")
               });
               s.prop("checked", !i).trigger("change")
            }, this))
         }
      },
      createOptionValue: function(t) {
         var n = e(t);
         if (n.is(":selected")) {
            n.prop("selected", true)
         }
         var r = this.options.label(t);
         var i = n.val();
         var s = this.options.multiple ? "checkbox" : "radio";
         var o = e(this.options.templates.li);
         var u = e("label", o);
         u.addClass(s);
         var a = e("<input/>").attr("type", s);
         if (this.options.checkboxName) {
            a.attr("name", this.options.checkboxName)
         }
         u.append(a);
         var f = n.prop("selected") || false;
         a.val(i);
         if (i === this.options.selectAllValue) {
            o.addClass("multiselect-item multiselect-all");
            a.parent().parent().addClass("multiselect-all")
         }
         u.append(" " + r);
         u.attr("title", n.attr("title"));
         this.$ul.append(o);
         if (n.is(":disabled")) {
            a.attr("disabled", "disabled").prop("disabled", true).closest("a").attr("tabindex", "-1").closest("li").addClass("disabled")
         }
         a.prop("checked", f);
         if (f && this.options.selectedClass) {
            a.closest("li").addClass(this.options.selectedClass)
         }
      },
      createDivider: function(t) {
         var n = e(this.options.templates.divider);
         this.$ul.append(n)
      },
      createOptgroup: function(t) {
         var n = e(t).prop("label");
         var r = e(this.options.templates.liGroup);
         e("label", r).text(n);
         if (this.options.enableClickableOptGroups) {
            r.addClass("multiselect-group-clickable")
         }
         this.$ul.append(r);
         if (e(t).is(":disabled")) {
            r.addClass("disabled")
         }
         e("option", t).each(e.proxy(function(e, t) {
            this.createOptionValue(t)
         }, this))
      },
      buildSelectAll: function() {
         if (typeof this.options.selectAllValue === "number") {
            this.options.selectAllValue = this.options.selectAllValue.toString()
         }
         var t = this.hasSelectAll();
         if (!t && this.options.includeSelectAllOption && this.options.multiple && e("option", this.$select).length > this.options.includeSelectAllIfMoreThan) {
            if (this.options.includeSelectAllDivider) {
               this.$ul.prepend(e(this.options.templates.divider))
            }
            var n = e(this.options.templates.li);
            e("label", n).addClass("checkbox");
            if (this.options.selectAllName) {
               e("label", n).append('<input type="checkbox" name="' + this.options.selectAllName + '" />')
            } else {
               e("label", n).append('<input type="checkbox" />')
            }
            var r = e("input", n);
            r.val(this.options.selectAllValue);
            n.addClass("multiselect-item multiselect-all");
            r.parent().parent().addClass("multiselect-all");
            e("label", n).append(" " + this.options.selectAllText);
            this.$ul.prepend(n);
            r.prop("checked", false)
         }
      },
      buildFilter: function() {
         if (this.options.enableFiltering || this.options.enableCaseInsensitiveFiltering) {
            var t = Math.max(this.options.enableFiltering, this.options.enableCaseInsensitiveFiltering);
            if (this.$select.find("option").length >= t) {
               this.$filter = e(this.options.templates.filter);
               e("input", this.$filter).attr("placeholder", this.options.filterPlaceholder);
               if (this.options.includeFilterClearBtn) {
                  var n = e(this.options.templates.filterClearBtn);
                  n.on("click", e.proxy(function(t) {
                     clearTimeout(this.searchTimeout);
                     this.$filter.find(".multiselect-search").val("");
                     e("li", this.$ul).show().removeClass("filter-hidden");
                     this.updateSelectAll()
                  }, this));
                  this.$filter.find(".input-group").append(n)
               }
               this.$ul.prepend(this.$filter);
               this.$filter.val(this.query).on("click", function(e) {
                  e.stopPropagation()
               }).on("input keydown", e.proxy(function(t) {
                  if (t.which === 13) {
                     t.preventDefault()
                  }
                  clearTimeout(this.searchTimeout);
                  this.searchTimeout = this.asyncFunction(e.proxy(function() {
                     if (this.query !== t.target.value) {
                        this.query = t.target.value;
                        var n, r;
                        e.each(e("li", this.$ul), e.proxy(function(t, i) {
                           var s = e("input", i).val();
                           var o = e("label", i).text();
                           var u = "";
                           if (this.options.filterBehavior === "text") {
                              u = o
                           } else if (this.options.filterBehavior === "value") {
                              u = s
                           } else if (this.options.filterBehavior === "both") {
                              u = o + "\n" + s
                           }
                           if (s !== this.options.selectAllValue && o) {
                              var a = false;
                              if (this.options.enableCaseInsensitiveFiltering && u.toLowerCase().indexOf(this.query.toLowerCase()) > -1) {
                                 a = true
                              } else if (u.indexOf(this.query) > -1) {
                                 a = true
                              }
                              e(i).toggle(a).toggleClass("filter-hidden", !a);
                              if (e(i).hasClass("multiselect-group")) {
                                 n = i;
                                 r = a
                              } else {
                                 if (a) {
                                    e(n).show().removeClass("filter-hidden")
                                 }
                                 if (!a && r) {
                                    e(i).show().removeClass("filter-hidden")
                                 }
                              }
                           }
                        }, this))
                     }
                     this.updateSelectAll()
                  }, this), 300, this)
               }, this))
            }
         }
      },
      destroy: function() {
         this.$container.remove();
         this.$select.show();
         this.$select.data("multiselect", null)
      },
      refresh: function() {
         e("option", this.$select).each(e.proxy(function(t, n) {
            var r = e("li input", this.$ul).filter(function() {
               return e(this).val() === e(n).val()
            });
            if (e(n).is(":selected")) {
               r.prop("checked", true);
               if (this.options.selectedClass) {
                  r.closest("li").addClass(this.options.selectedClass)
               }
            } else {
               r.prop("checked", false);
               if (this.options.selectedClass) {
                  r.closest("li").removeClass(this.options.selectedClass)
               }
            }
            if (e(n).is(":disabled")) {
               r.attr("disabled", "disabled").prop("disabled", true).closest("li").addClass("disabled")
            } else {
               r.prop("disabled", false).closest("li").removeClass("disabled")
            }
         }, this));
         this.updateButtonText();
         this.updateSelectAll()
      },
      select: function(t, n) {
         if (!e.isArray(t)) {
            t = [t]
         }
         for (var r = 0; r < t.length; r++) {
            var i = t[r];
            if (i === null || i === undefined) {
               continue
            }
            var s = this.getOptionByValue(i);
            var o = this.getInputByValue(i);
            if (s === undefined || o === undefined) {
               continue
            }
            if (!this.options.multiple) {
               this.deselectAll(false)
            }
            if (this.options.selectedClass) {
               o.closest("li").addClass(this.options.selectedClass)
            }
            o.prop("checked", true);
            s.prop("selected", true)
         }
         this.updateButtonText();
         this.updateSelectAll();
         if (n && t.length === 1) {
            this.options.onChange(s, true)
         }
      },
      clearSelection: function() {
         this.deselectAll(false);
         this.updateButtonText();
         this.updateSelectAll()
      },
      deselect: function(t, n) {
         if (!e.isArray(t)) {
            t = [t]
         }
         for (var r = 0; r < t.length; r++) {
            var i = t[r];
            if (i === null || i === undefined) {
               continue
            }
            var s = this.getOptionByValue(i);
            var o = this.getInputByValue(i);
            if (s === undefined || o === undefined) {
               continue
            }
            if (this.options.selectedClass) {
               o.closest("li").removeClass(this.options.selectedClass)
            }
            o.prop("checked", false);
            s.prop("selected", false)
         }
         this.updateButtonText();
         this.updateSelectAll();
         if (n && t.length === 1) {
            this.options.onChange(s, false)
         }
      },
      selectAll: function(t) {
         var t = typeof t === "undefined" ? true : t;
         var n = e("li input[type='checkbox']:enabled", this.$ul);
         var r = n.filter(":visible");
         var i = n.length;
         var s = r.length;
         if (t) {
            r.prop("checked", true);
            e("li:not(.divider):not(.disabled)", this.$ul).filter(":visible").addClass(this.options.selectedClass)
         } else {
            n.prop("checked", true);
            e("li:not(.divider):not(.disabled)", this.$ul).addClass(this.options.selectedClass)
         }
         if (i === s || t === false) {
            e("option:enabled", this.$select).prop("selected", true)
         } else {
            var o = r.map(function() {
               return e(this).val()
            }).get();
            e("option:enabled", this.$select).filter(function(t) {
               return e.inArray(e(this).val(), o) !== -1
            }).prop("selected", true)
         }
      },
      deselectAll: function(t) {
         var t = typeof t === "undefined" ? true : t;
         if (t) {
            var n = e("li input[type='checkbox']:enabled", this.$ul).filter(":visible");
            n.prop("checked", false);
            var r = n.map(function() {
               return e(this).val()
            }).get();
            e("option:enabled", this.$select).filter(function(t) {
               return e.inArray(e(this).val(), r) !== -1
            }).prop("selected", false);
            if (this.options.selectedClass) {
               e("li:not(.divider):not(.disabled)", this.$ul).filter(":visible").removeClass(this.options.selectedClass)
            }
         } else {
            e("li input[type='checkbox']:enabled", this.$ul).prop("checked", false);
            e("option:enabled", this.$select).prop("selected", false);
            if (this.options.selectedClass) {
               e("li:not(.divider):not(.disabled)", this.$ul).removeClass(this.options.selectedClass)
            }
         }
      },
      rebuild: function() {
         this.$ul.html("");
         this.options.multiple = this.$select.attr("multiple") === "multiple";
         this.buildSelectAll();
         this.buildDropdownOptions();
         this.buildFilter();
         this.updateButtonText();
         this.updateSelectAll();
         if (this.options.disableIfEmpty && e("option", this.$select).length <= 0) {
            this.disable()
         }
         if (this.options.dropRight) {
            this.$ul.addClass("pull-right")
         }
      },
      dataprovider: function(t) {
         var r = "";
         var i = 0;
         var s = e("");
         e.each(t, function(t, o) {
            var u;
            if (e.isArray(o.children)) {
               i++;
               u = e("<optgroup/>").attr({
                  label: o.label || "Group " + i
               });
               n(o.children, function(t) {
                  u.append(e("<option/>").attr({
                     value: t.value,
                     label: t.label || t.value,
                     title: t.title,
                     selected: !!t.selected
                  }))
               });
               r += "</optgroup>"
            } else {
               u = e("<option/>").attr({
                  value: o.value,
                  label: o.label || o.value,
                  title: o.title,
                  selected: !!o.selected
               })
            }
            s = s.add(u)
         });
         this.$select.empty().append(s);
         this.rebuild()
      },
      enable: function() {
         this.$select.prop("disabled", false);
         this.$button.prop("disabled", false).removeClass("disabled")
      },
      disable: function() {
         this.$select.prop("disabled", true);
         this.$button.prop("disabled", true).addClass("disabled")
      },
      setOptions: function(e) {
         this.options = this.mergeOptions(e)
      },
      mergeOptions: function(t) {
         return e.extend(true, {}, this.defaults, t)
      },
      hasSelectAll: function() {
         return e("li." + this.options.selectAllValue, this.$ul).length > 0
      },
      updateSelectAll: function() {
         if (this.hasSelectAll()) {
            var t = e("li:not(.multiselect-item):not(.filter-hidden) input:enabled", this.$ul);
            var n = t.length;
            var r = t.filter(":checked").length;
            var i = e("li." + this.options.selectAllValue, this.$ul);
            var s = i.find("input");
            if (r > 0 && r === n) {
               s.prop("checked", true);
               i.addClass(this.options.selectedClass)
            } else {
               s.prop("checked", false);
               i.removeClass(this.options.selectedClass)
            }
         }
      },
      updateButtonText: function() {
         var t = this.getSelected();
         e(".multiselect", this.$container).html(this.options.buttonText(t, this.$select));
         e(".multiselect", this.$container).attr("title", this.options.buttonTitle(t, this.$select))
      },
      getSelected: function() {
         return e("option", this.$select).filter(":selected")
      },
      getOptionByValue: function(t) {
         var n = e("option", this.$select);
         var r = t.toString();
         for (var i = 0; i < n.length; i = i + 1) {
            var s = n[i];
            if (s.value === r) {
               return e(s)
            }
         }
      },
      getInputByValue: function(t) {
         var n = e("li input", this.$ul);
         var r = t.toString();
         for (var i = 0; i < n.length; i = i + 1) {
            var s = n[i];
            if (s.value === r) {
               return e(s)
            }
         }
      },
      updateOriginalOptions: function() {
         this.originalOptions = this.$select.clone()[0].options
      },
      asyncFunction: function(e, t, n) {
         var r = Array.prototype.slice.call(arguments, 3);
         return setTimeout(function() {
            e.apply(n || window, r)
         }, t)
      }
   };
   e.fn.multiselect = function(t, n, i) {
      return this.each(function() {
         var s = e(this).data("multiselect");
         var o = typeof t === "object" && t;
         if (!s) {
            s = new r(this, o);
            e(this).data("multiselect", s)
         }
         if (typeof t === "string") {
            s[t](n, i);
            if (t === "destroy") {
               e(this).data("multiselect", false)
            }
         }
      })
   };
   e.fn.multiselect.Constructor = r;
   e(function() {
      e("select[data-role=multiselect]").multiselect()
   })
}(window.jQuery)

/*
 * Syntax highlighting with language autodetection.
 * https://highlightjs.org/
 */
;
var hljs = new function() {
   function e(e) {
      return e.replace(/&/gm, "&").replace(/</gm, "&lt;").replace(/>/gm, "&gt;")
   }

   function t(e) {
      return e.nodeName.toLowerCase()
   }

   function n(e, t) {
      var n = e && e.exec(t);
      return n && n.index == 0
   }

   function r(e) {
      var t = (e.className + " " + (e.parentNode ? e.parentNode.className : "")).split(/\s+/);
      t = t.map(function(e) {
         return e.replace(/^lang(uage)?-/, "")
      });
      return t.filter(function(e) {
         return w(e) || /no(-?)highlight/.test(e)
      })[0]
   }

   function i(e, t) {
      var n = {};
      for (var r in e) {
         n[r] = e[r]
      }
      if (t) {
         for (var r in t) {
            n[r] = t[r]
         }
      }
      return n
   }

   function s(e) {
      var n = [];
      (function r(e, i) {
         for (var s = e.firstChild; s; s = s.nextSibling) {
            if (s.nodeType == 3) {
               i += s.nodeValue.length
            } else {
               if (s.nodeType == 1) {
                  n.push({
                     event: "start",
                     offset: i,
                     node: s
                  });
                  i = r(s, i);
                  if (!t(s).match(/br|hr|img|input/)) {
                     n.push({
                        event: "stop",
                        offset: i,
                        node: s
                     })
                  }
               }
            }
         }
         return i
      })(e, 0);
      return n
   }

   function o(n, r, i) {
      function a() {
         if (!n.length || !r.length) {
            return n.length ? n : r
         }
         if (n[0].offset != r[0].offset) {
            return n[0].offset < r[0].offset ? n : r
         }
         return r[0].event == "start" ? n : r
      }

      function f(n) {
         function r(t) {
            return " " + t.nodeName + '="' + e(t.value) + '"'
         }
         o += "<" + t(n) + Array.prototype.map.call(n.attributes, r).join("") + ">"
      }

      function l(e) {
         o += "</" + t(e) + ">"
      }

      function c(e) {
         (e.event == "start" ? f : l)(e.node)
      }
      var s = 0;
      var o = "";
      var u = [];
      while (n.length || r.length) {
         var h = a();
         o += e(i.substr(s, h[0].offset - s));
         s = h[0].offset;
         if (h == n) {
            u.reverse().forEach(l);
            do {
               c(h.splice(0, 1)[0]);
               h = a()
            } while (h == n && h.length && h[0].offset == s);
            u.reverse().forEach(f)
         } else {
            if (h[0].event == "start") {
               u.push(h[0].node)
            } else {
               u.pop()
            }
            c(h.splice(0, 1)[0])
         }
      }
      return o + e(i.substr(s))
   }

   function u(e) {
      function t(e) {
         return e && e.source || e
      }

      function n(n, r) {
         return RegExp(t(n), "m" + (e.cI ? "i" : "") + (r ? "g" : ""))
      }

      function r(s, o) {
         if (s.compiled) {
            return
         }
         s.compiled = true;
         s.k = s.k || s.bK;
         if (s.k) {
            var u = {};
            var a = function(t, n) {
               if (e.cI) {
                  n = n.toLowerCase()
               }
               n.split(" ").forEach(function(e) {
                  var n = e.split("|");
                  u[n[0]] = [t, n[1] ? Number(n[1]) : 1]
               })
            };
            if (typeof s.k == "string") {
               a("keyword", s.k)
            } else {
               Object.keys(s.k).forEach(function(e) {
                  a(e, s.k[e])
               })
            }
            s.k = u
         }
         s.lR = n(s.l || /\b[A-Za-z0-9_]+\b/, true);
         if (o) {
            if (s.bK) {
               s.b = "\\b(" + s.bK.split(" ").join("|") + ")\\b"
            }
            if (!s.b) {
               s.b = /\B|\b/
            }
            s.bR = n(s.b);
            if (!s.e && !s.eW) {
               s.e = /\B|\b/
            }
            if (s.e) {
               s.eR = n(s.e)
            }
            s.tE = t(s.e) || "";
            if (s.eW && o.tE) {
               s.tE += (s.e ? "|" : "") + o.tE
            }
         }
         if (s.i) {
            s.iR = n(s.i)
         }
         if (s.r === undefined) {
            s.r = 1
         }
         if (!s.c) {
            s.c = []
         }
         var f = [];
         s.c.forEach(function(e) {
            if (e.v) {
               e.v.forEach(function(t) {
                  f.push(i(e, t))
               })
            } else {
               f.push(e == "self" ? s : e)
            }
         });
         s.c = f;
         s.c.forEach(function(e) {
            r(e, s)
         });
         if (s.starts) {
            r(s.starts, o)
         }
         var l = s.c.map(function(e) {
            return e.bK ? "\\.?(" + e.b + ")\\.?" : e.b
         }).concat([s.tE, s.i]).map(t).filter(Boolean);
         s.t = l.length ? n(l.join("|"), true) : {
            exec: function(e) {
               return null
            }
         }
      }
      r(e)
   }

   function a(t, r, i, s) {
      function o(e, t) {
         for (var r = 0; r < t.c.length; r++) {
            if (n(t.c[r].bR, e)) {
               return t.c[r]
            }
         }
      }

      function l(e, t) {
         if (n(e.eR, t)) {
            return e
         }
         if (e.eW) {
            return l(e.parent, t)
         }
      }

      function c(e, t) {
         return !i && n(t.iR, e)
      }

      function p(e, t) {
         var n = S.cI ? t[0].toLowerCase() : t[0];
         return e.k.hasOwnProperty(n) && e.k[n]
      }

      function d(e, t, n, r) {
         var i = r ? "" : h.classPrefix,
            s = '<span class="' + i,
            o = n ? "" : "</span>";
         s += e + '">';
         return s + t + o
      }

      function v() {
         if (!x.k) {
            return e(k)
         }
         var t = "";
         var n = 0;
         x.lR.lastIndex = 0;
         var r = x.lR.exec(k);
         while (r) {
            t += e(k.substr(n, r.index - n));
            var i = p(x, r);
            if (i) {
               L += i[1];
               t += d(i[0], e(r[0]))
            } else {
               t += e(r[0])
            }
            n = x.lR.lastIndex;
            r = x.lR.exec(k)
         }
         return t + e(k.substr(n))
      }

      function g() {
         if (x.sL && !m[x.sL]) {
            return e(k)
         }
         var t = x.sL ? a(x.sL, k, true, T) : f(k);
         if (x.r > 0) {
            L += t.r
         }
         if (x.subLanguageMode == "continuous") {
            T = t.top
         }
         return d(t.language, t.value, false, true)
      }

      function y() {
         return x.sL !== undefined ? g() : v()
      }

      function b(t, n) {
         var r = t.cN ? d(t.cN, "", true) : "";
         if (t.rB) {
            N += r;
            k = ""
         } else {
            if (t.eB) {
               N += e(n) + r;
               k = ""
            } else {
               N += r;
               k = n
            }
         }
         x = Object.create(t, {
            parent: {
               value: x
            }
         })
      }

      function E(t, n) {
         k += t;
         if (n === undefined) {
            N += y();
            return 0
         }
         var r = o(n, x);
         if (r) {
            N += y();
            b(r, n);
            return r.rB ? 0 : n.length
         }
         var i = l(x, n);
         if (i) {
            var s = x;
            if (!(s.rE || s.eE)) {
               k += n
            }
            N += y();
            do {
               if (x.cN) {
                  N += "</span>"
               }
               L += x.r;
               x = x.parent
            } while (x != i.parent);
            if (s.eE) {
               N += e(n)
            }
            k = "";
            if (i.starts) {
               b(i.starts, "")
            }
            return s.rE ? 0 : n.length
         }
         if (c(n, x)) {
            throw new Error('Illegal lexeme "' + n + '" for mode "' + (x.cN || "<unnamed>") + '"')
         }
         k += n;
         return n.length || 1
      }
      var S = w(t);
      if (!S) {
         throw new Error('Unknown language: "' + t + '"')
      }
      u(S);
      var x = s || S;
      var T;
      var N = "";
      for (var C = x; C != S; C = C.parent) {
         if (C.cN) {
            N = d(C.cN, "", true) + N
         }
      }
      var k = "";
      var L = 0;
      try {
         var A, O, M = 0;
         while (true) {
            x.t.lastIndex = M;
            A = x.t.exec(r);
            if (!A) {
               break
            }
            O = E(r.substr(M, A.index - M), A[0]);
            M = A.index + O
         }
         E(r.substr(M));
         for (var C = x; C.parent; C = C.parent) {
            if (C.cN) {
               N += "</span>"
            }
         }
         return {
            r: L,
            value: N,
            language: t,
            top: x
         }
      } catch (_) {
         if (_.message.indexOf("Illegal") != -1) {
            return {
               r: 0,
               value: e(r)
            }
         } else {
            throw _
         }
      }
   }

   function f(t, n) {
      n = n || h.languages || Object.keys(m);
      var r = {
         r: 0,
         value: e(t)
      };
      var i = r;
      n.forEach(function(e) {
         if (!w(e)) {
            return
         }
         var n = a(e, t, false);
         n.language = e;
         if (n.r > i.r) {
            i = n
         }
         if (n.r > r.r) {
            i = r;
            r = n
         }
      });
      if (i.language) {
         r.second_best = i
      }
      return r
   }

   function l(e) {
      if (h.tabReplace) {
         e = e.replace(/^((<[^>]+>|\t)+)/gm, function(e, t, n, r) {
            return t.replace(/\t/g, h.tabReplace)
         })
      }
      if (h.useBR) {
         e = e.replace(/\n/g, "<br>")
      }
      return e
   }

   function c(e) {
      var t = r(e);
      if (/no(-?)highlight/.test(t)) {
         return
      }
      var n;
      if (h.useBR) {
         n = document.createElementNS("http://www.w3.org/1999/xhtml", "div");
         n.innerHTML = e.innerHTML.replace(/\n/g, "").replace(/<br[ \/]*>/g, "\n")
      } else {
         n = e
      }
      var i = n.textContent;
      var u = t ? a(t, i, true) : f(i);
      var c = s(n);
      if (c.length) {
         var p = document.createElementNS("http://www.w3.org/1999/xhtml", "div");
         p.innerHTML = u.value;
         u.value = o(c, s(p), i)
      }
      u.value = l(u.value);
      e.innerHTML = u.value;
      e.className += " hljs " + (!t && u.language || "");
      e.result = {
         language: u.language,
         re: u.r
      };
      if (u.second_best) {
         e.second_best = {
            language: u.second_best.language,
            re: u.second_best.r
         }
      }
   }

   function p(e) {
      h = i(h, e)
   }

   function d() {
      if (d.called) {
         return
      }
      d.called = true;
      var e = document.querySelectorAll("pre code");
      Array.prototype.forEach.call(e, c)
   }

   function v() {
      addEventListener("DOMContentLoaded", d, false);
      addEventListener("load", d, false)
   }

   function y(e, t) {
      var n = m[e] = t(this);
      if (n.aliases) {
         n.aliases.forEach(function(t) {
            g[t] = e
         })
      }
   }

   function b() {
      return Object.keys(m)
   }

   function w(e) {
      return m[e] || m[g[e]]
   }
   var h = {
      classPrefix: "hljs-",
      tabReplace: null,
      useBR: false,
      languages: undefined
   };
   var m = {};
   var g = {};
   this.highlight = a;
   this.highlightAuto = f;
   this.fixMarkup = l;
   this.highlightBlock = c;
   this.configure = p;
   this.initHighlighting = d;
   this.initHighlightingOnLoad = v;
   this.registerLanguage = y;
   this.listLanguages = b;
   this.getLanguage = w;
   this.inherit = i;
   this.IR = "[a-zA-Z][a-zA-Z0-9_]*";
   this.UIR = "[a-zA-Z_][a-zA-Z0-9_]*";
   this.NR = "\\b\\d+(\\.\\d+)?";
   this.CNR = "(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)";
   this.BNR = "\\b(0b[01]+)";
   this.RSR = "!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~";
   this.BE = {
      b: "\\\\[\\s\\S]",
      r: 0
   };
   this.ASM = {
      cN: "string",
      b: "'",
      e: "'",
      i: "\\n",
      c: [this.BE]
   };
   this.QSM = {
      cN: "string",
      b: '"',
      e: '"',
      i: "\\n",
      c: [this.BE]
   };
   this.PWM = {
      b: /\b(a|an|the|are|I|I'm|isn't|don't|doesn't|won't|but|just|should|pretty|simply|enough|gonna|going|wtf|so|such)\b/
   };
   this.CLCM = {
      cN: "comment",
      b: "//",
      e: "$",
      c: [this.PWM]
   };
   this.CBCM = {
      cN: "comment",
      b: "/\\*",
      e: "\\*/",
      c: [this.PWM]
   };
   this.HCM = {
      cN: "comment",
      b: "#",
      e: "$",
      c: [this.PWM]
   };
   this.NM = {
      cN: "number",
      b: this.NR,
      r: 0
   };
   this.CNM = {
      cN: "number",
      b: this.CNR,
      r: 0
   };
   this.BNM = {
      cN: "number",
      b: this.BNR,
      r: 0
   };
   this.CSSNM = {
      cN: "number",
      b: this.NR + "(%|em|ex|ch|rem|vw|vh|vmin|vmax|cm|mm|in|pt|pc|px|deg|grad|rad|turn|s|ms|Hz|kHz|dpi|dpcm|dppx)?",
      r: 0
   };
   this.RM = {
      cN: "regexp",
      b: /\//,
      e: /\/[gim]*/,
      i: /\n/,
      c: [this.BE, {
         b: /\[/,
         e: /\]/,
         r: 0,
         c: [this.BE]
      }]
   };
   this.TM = {
      cN: "title",
      b: this.IR,
      r: 0
   };
   this.UTM = {
      cN: "title",
      b: this.UIR,
      r: 0
   }
};
hljs.registerLanguage("bash", function(e) {
   var t = {
      cN: "variable",
      v: [{
         b: /\$[\w\d#@][\w\d_]*/
      }, {
         b: /\$\{(.*?)\}/
      }]
   };
   var n = {
      cN: "string",
      b: /"/,
      e: /"/,
      c: [e.BE, t, {
         cN: "variable",
         b: /\$\(/,
         e: /\)/,
         c: [e.BE]
      }]
   };
   var r = {
      cN: "string",
      b: /'/,
      e: /'/
   };
   return {
      aliases: ["sh", "zsh"],
      l: /-?[a-z\.]+/,
      k: {
         keyword: "if then else elif fi for break continue while in do done exit return set declare case esac export exec",
         literal: "true false",
         built_in: "printf echo read cd pwd pushd popd dirs let eval unset typeset readonly getopts source shopt caller type hash bind help sudo",
         operator: "-ne -eq -lt -gt -f -d -e -s -l -a"
      },
      c: [{
         cN: "shebang",
         b: /^#![^\n]+sh\s*$/,
         r: 10
      }, {
         cN: "function",
         b: /\w[\w\d_]*\s*\(\s*\)\s*\{/,
         rB: true,
         c: [e.inherit(e.TM, {
            b: /\w[\w\d_]*/
         })],
         r: 0
      }, e.HCM, e.NM, n, r, t]
   }
});
hljs.registerLanguage("ruby", function(e) {
   var t = "[a-zA-Z_]\\w*[!?=]?|[-+~]\\@|<<|>>|=~|===?|<=>|[<>]=?|\\*\\*|[-/+%^&*~`|]|\\[\\]=?";
   var n = "and false then defined module in return redo if BEGIN retry end for true self when next until do begin unless END rescue nil else break undef not super class case require yield alias while ensure elsif or include attr_reader attr_writer attr_accessor";
   var r = {
      cN: "yardoctag",
      b: "@[A-Za-z]+"
   };
   var i = {
      cN: "value",
      b: "#<",
      e: ">"
   };
   var s = {
      cN: "comment",
      v: [{
         b: "#",
         e: "$",
         c: [r]
      }, {
         b: "^\\=begin",
         e: "^\\=end",
         c: [r],
         r: 10
      }, {
         b: "^__END__",
         e: "\\n$"
      }]
   };
   var o = {
      cN: "subst",
      b: "#\\{",
      e: "}",
      k: n
   };
   var u = {
      cN: "string",
      c: [e.BE, o],
      v: [{
         b: /'/,
         e: /'/
      }, {
         b: /"/,
         e: /"/
      }, {
         b: "%[qw]?\\(",
         e: "\\)"
      }, {
         b: "%[qw]?\\[",
         e: "\\]"
      }, {
         b: "%[qw]?{",
         e: "}"
      }, {
         b: "%[qw]?<",
         e: ">"
      }, {
         b: "%[qw]?/",
         e: "/"
      }, {
         b: "%[qw]?%",
         e: "%"
      }, {
         b: "%[qw]?-",
         e: "-"
      }, {
         b: "%[qw]?\\|",
         e: "\\|"
      }, {
         b: /\B\?(\\\d{1,3}|\\x[A-Fa-f0-9]{1,2}|\\u[A-Fa-f0-9]{4}|\\?\S)\b/
      }]
   };
   var a = {
      cN: "params",
      b: "\\(",
      e: "\\)",
      k: n
   };
   var f = [u, i, s, {
      cN: "class",
      bK: "class module",
      e: "$|;",
      i: /=/,
      c: [e.inherit(e.TM, {
         b: "[A-Za-z_]\\w*(::\\w+)*(\\?|\\!)?"
      }), {
         cN: "inheritance",
         b: "<\\s*",
         c: [{
            cN: "parent",
            b: "(" + e.IR + "::)?" + e.IR
         }]
      }, s]
   }, {
      cN: "function",
      bK: "def",
      e: " |$|;",
      r: 0,
      c: [e.inherit(e.TM, {
         b: t
      }), a, s]
   }, {
      cN: "constant",
      b: "(::)?(\\b[A-Z]\\w*(::)?)+",
      r: 0
   }, {
      cN: "symbol",
      b: e.UIR + "(\\!|\\?)?:",
      r: 0
   }, {
      cN: "symbol",
      b: ":",
      c: [u, {
         b: t
      }],
      r: 0
   }, {
      cN: "number",
      b: "(\\b0[0-7_]+)|(\\b0x[0-9a-fA-F_]+)|(\\b[1-9][0-9_]*(\\.[0-9_]+)?)|[0_]\\b",
      r: 0
   }, {
      cN: "variable",
      b: "(\\$\\W)|((\\$|\\@\\@?)(\\w+))"
   }, {
      b: "(" + e.RSR + ")\\s*",
      c: [i, s, {
         cN: "regexp",
         c: [e.BE, o],
         i: /\n/,
         v: [{
            b: "/",
            e: "/[a-z]*"
         }, {
            b: "%r{",
            e: "}[a-z]*"
         }, {
            b: "%r\\(",
            e: "\\)[a-z]*"
         }, {
            b: "%r!",
            e: "![a-z]*"
         }, {
            b: "%r\\[",
            e: "\\][a-z]*"
         }]
      }],
      r: 0
   }];
   o.c = f;
   a.c = f;
   var l = [{
      b: /^\s*=>/,
      cN: "status",
      starts: {
         e: "$",
         c: f
      }
   }, {
      cN: "prompt",
      b: /^\S[^=>\n]*>+/,
      starts: {
         e: "$",
         c: f
      }
   }];
   return {
      aliases: ["rb", "gemspec", "podspec", "thor", "irb"],
      k: n,
      c: [s].concat(l).concat(f)
   }
});
hljs.registerLanguage("javascript", function(e) {
   return {
      aliases: ["js"],
      k: {
         keyword: "in if for while finally var new function do return void else break catch instanceof with throw case default try this switch continue typeof delete let yield const class",
         literal: "true false null undefined NaN Infinity",
         built_in: "eval isFinite isNaN parseFloat parseInt decodeURI decodeURIComponent encodeURI encodeURIComponent escape unescape Object Function Boolean Error EvalError InternalError RangeError ReferenceError StopIteration SyntaxError TypeError URIError Number Math Date String RegExp Array Float32Array Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray ArrayBuffer DataView JSON Intl arguments require module console window document"
      },
      c: [{
         cN: "pi",
         b: /^\s*('|")use strict('|")/,
         r: 10
      }, e.ASM, e.QSM, e.CLCM, e.CBCM, e.CNM, {
         b: "(" + e.RSR + "|\\b(case|return|throw)\\b)\\s*",
         k: "return throw case",
         c: [e.CLCM, e.CBCM, e.RM, {
            b: /</,
            e: />;/,
            r: 0,
            sL: "xml"
         }],
         r: 0
      }, {
         cN: "function",
         bK: "function",
         e: /\{/,
         eE: true,
         c: [e.inherit(e.TM, {
            b: /[A-Za-z$_][0-9A-Za-z$_]*/
         }), {
            cN: "params",
            b: /\(/,
            e: /\)/,
            c: [e.CLCM, e.CBCM],
            i: /["'\(]/
         }],
         i: /\[|%/
      }, {
         b: /\$[(.]/
      }, {
         b: "\\." + e.IR,
         r: 0
      }]
   }
});
hljs.registerLanguage("xml", function(e) {
   var t = "[A-Za-z0-9\\._:-]+";
   var n = {
      b: /<\?(php)?(?!\w)/,
      e: /\?>/,
      sL: "php",
      subLanguageMode: "continuous"
   };
   var r = {
      eW: true,
      i: /</,
      r: 0,
      c: [n, {
         cN: "attribute",
         b: t,
         r: 0
      }, {
         b: "=",
         r: 0,
         c: [{
            cN: "value",
            v: [{
               b: /"/,
               e: /"/
            }, {
               b: /'/,
               e: /'/
            }, {
               b: /[^\s\/>]+/
            }]
         }]
      }]
   };
   return {
      aliases: ["html", "xhtml", "rss", "atom", "xsl", "plist"],
      cI: true,
      c: [{
         cN: "doctype",
         b: "<!DOCTYPE",
         e: ">",
         r: 10,
         c: [{
            b: "\\[",
            e: "\\]"
         }]
      }, {
         cN: "comment",
         b: "<!--",
         e: "-->",
         r: 10
      }, {
         cN: "cdata",
         b: "<\\!\\[CDATA\\[",
         e: "\\]\\]>",
         r: 10
      }, {
         cN: "tag",
         b: "<style(?=\\s|>|$)",
         e: ">",
         k: {
            title: "style"
         },
         c: [r],
         starts: {
            e: "</style>",
            rE: true,
            sL: "css"
         }
      }, {
         cN: "tag",
         b: "<script(?=\\s|>|$)",
         e: ">",
         k: {
            title: "script"
         },
         c: [r],
         starts: {
            e: "</script>",
            rE: true,
            sL: "javascript"
         }
      }, {
         b: "<%",
         e: "%>",
         sL: "vbscript"
      }, n, {
         cN: "pi",
         b: /<\?\w+/,
         e: /\?>/,
         r: 10
      }, {
         cN: "tag",
         b: "</?",
         e: "/?>",
         c: [{
            cN: "title",
            b: /[^ \/><\n\t]+/,
            r: 0
         }, r]
      }]
   }
});
hljs.registerLanguage("markdown", function(e) {
   return {
      aliases: ["md", "mkdown", "mkd"],
      c: [{
         cN: "header",
         v: [{
            b: "^#{1,6}",
            e: "$"
         }, {
            b: "^.+?\\n[=-]{2,}$"
         }]
      }, {
         b: "<",
         e: ">",
         sL: "xml",
         r: 0
      }, {
         cN: "bullet",
         b: "^([*+-]|(\\d+\\.))\\s+"
      }, {
         cN: "strong",
         b: "[*_]{2}.+?[*_]{2}"
      }, {
         cN: "emphasis",
         v: [{
            b: "\\*.+?\\*"
         }, {
            b: "_.+?_",
            r: 0
         }]
      }, {
         cN: "blockquote",
         b: "^>\\s+",
         e: "$"
      }, {
         cN: "code",
         v: [{
            b: "`.+?`"
         }, {
            b: "^( {4}|	)",
            e: "$",
            r: 0
         }]
      }, {
         cN: "horizontal_rule",
         b: "^[-\\*]{3,}",
         e: "$"
      }, {
         b: "\\[.+?\\][\\(\\[].*?[\\)\\]]",
         rB: true,
         c: [{
            cN: "link_label",
            b: "\\[",
            e: "\\]",
            eB: true,
            rE: true,
            r: 0
         }, {
            cN: "link_url",
            b: "\\]\\(",
            e: "\\)",
            eB: true,
            eE: true
         }, {
            cN: "link_reference",
            b: "\\]\\[",
            e: "\\]",
            eB: true,
            eE: true
         }],
         r: 10
      }, {
         b: "^\\[.+\\]:",
         rB: true,
         c: [{
            cN: "link_reference",
            b: "\\[",
            e: "\\]:",
            eB: true,
            eE: true,
            starts: {
               cN: "link_url",
               e: "$"
            }
         }]
      }]
   }
});
hljs.registerLanguage("css", function(e) {
   var t = "[a-zA-Z-][a-zA-Z0-9_-]*";
   var n = {
      cN: "function",
      b: t + "\\(",
      rB: true,
      eE: true,
      e: "\\("
   };
   return {
      cI: true,
      i: "[=/|']",
      c: [e.CBCM, {
         cN: "id",
         b: "\\#[A-Za-z0-9_-]+"
      }, {
         cN: "class",
         b: "\\.[A-Za-z0-9_-]+",
         r: 0
      }, {
         cN: "attr_selector",
         b: "\\[",
         e: "\\]",
         i: "$"
      }, {
         cN: "pseudo",
         b: ":(:)?[a-zA-Z0-9\\_\\-\\+\\(\\)\\\"\\']+"
      }, {
         cN: "at_rule",
         b: "@(font-face|page)",
         l: "[a-z-]+",
         k: "font-face page"
      }, {
         cN: "at_rule",
         b: "@",
         e: "[{;]",
         c: [{
            cN: "keyword",
            b: /\S+/
         }, {
            b: /\s/,
            eW: true,
            eE: true,
            r: 0,
            c: [n, e.ASM, e.QSM, e.CSSNM]
         }]
      }, {
         cN: "tag",
         b: t,
         r: 0
      }, {
         cN: "rules",
         b: "{",
         e: "}",
         i: "[^\\s]",
         r: 0,
         c: [e.CBCM, {
            cN: "rule",
            b: "[^\\s]",
            rB: true,
            e: ";",
            eW: true,
            c: [{
               cN: "attribute",
               b: "[A-Z\\_\\.\\-]+",
               e: ":",
               eE: true,
               i: "[^\\s]",
               starts: {
                  cN: "value",
                  eW: true,
                  eE: true,
                  c: [n, e.CSSNM, e.QSM, e.ASM, e.CBCM, {
                     cN: "hexcolor",
                     b: "#[0-9A-Fa-f]+"
                  }, {
                     cN: "important",
                     b: "!important"
                  }]
               }
            }]
         }]
      }]
   }
});
hljs.registerLanguage("http", function(e) {
   return {
      i: "\\S",
      c: [{
         cN: "status",
         b: "^HTTP/[0-9\\.]+",
         e: "$",
         c: [{
            cN: "number",
            b: "\\b\\d{3}\\b"
         }]
      }, {
         cN: "request",
         b: "^[A-Z]+ (.*?) HTTP/[0-9\\.]+$",
         rB: true,
         e: "$",
         c: [{
            cN: "string",
            b: " ",
            e: " ",
            eB: true,
            eE: true
         }]
      }, {
         cN: "attribute",
         b: "^\\w",
         e: ": ",
         eE: true,
         i: "\\n|\\s|=",
         starts: {
            cN: "string",
            e: "$"
         }
      }, {
         b: "\\n\\n",
         starts: {
            sL: "",
            eW: true
         }
      }]
   }
});
hljs.registerLanguage("java", function(e) {
   var t = e.UIR + "(<" + e.UIR + ">)?";
   var n = "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws protected public private";
   return {
      aliases: ["jsp"],
      k: n,
      i: /<\//,
      c: [{
         cN: "javadoc",
         b: "/\\*\\*",
         e: "\\*/",
         r: 0,
         c: [{
            cN: "javadoctag",
            b: "(^|\\s)@[A-Za-z]+"
         }]
      }, e.CLCM, e.CBCM, e.ASM, e.QSM, {
         cN: "class",
         bK: "class interface",
         e: /[{;=]/,
         eE: true,
         k: "class interface",
         i: /[:"\[\]]/,
         c: [{
            bK: "extends implements"
         }, e.UTM]
      }, {
         bK: "new",
         e: /\s/,
         r: 0
      }, {
         cN: "function",
         b: "(" + t + "\\s+)+" + e.UIR + "\\s*\\(",
         rB: true,
         e: /[{;=]/,
         eE: true,
         k: n,
         c: [{
            b: e.UIR + "\\s*\\(",
            rB: true,
            c: [e.UTM]
         }, {
            cN: "params",
            b: /\(/,
            e: /\)/,
            k: n,
            c: [e.ASM, e.QSM, e.CNM, e.CBCM]
         }, e.CLCM, e.CBCM]
      }, e.CNM, {
         cN: "annotation",
         b: "@[A-Za-z]+"
      }]
   }
});
hljs.registerLanguage("php", function(e) {
   var t = {
      cN: "variable",
      b: "(\\$|->)+[a-zA-Z_-ÿ][a-zA-Z0-9_-ÿ]*"
   };
   var n = {
      cN: "preprocessor",
      b: /<\?(php)?|\?>/
   };
   var r = {
      cN: "string",
      c: [e.BE, n],
      v: [{
         b: 'b"',
         e: '"'
      }, {
         b: "b'",
         e: "'"
      }, e.inherit(e.ASM, {
         i: null
      }), e.inherit(e.QSM, {
         i: null
      })]
   };
   var i = {
      v: [e.BNM, e.CNM]
   };
   return {
      aliases: ["php3", "php4", "php5", "php6"],
      cI: true,
      k: "and include_once list abstract global private echo interface as static endswitch array null if endwhile or const for endforeach self var while isset public protected exit foreach throw elseif include __FILE__ empty require_once do xor return parent clone use __CLASS__ __LINE__ else break print eval new catch __METHOD__ case exception default die require __FUNCTION__ enddeclare final try switch continue endfor endif declare unset true false trait goto instanceof insteadof __DIR__ __NAMESPACE__ yield finally",
      c: [e.CLCM, e.HCM, {
         cN: "comment",
         b: "/\\*",
         e: "\\*/",
         c: [{
            cN: "phpdoc",
            b: "\\s@[A-Za-z]+"
         }, n]
      }, {
         cN: "comment",
         b: "__halt_compiler.+?;",
         eW: true,
         k: "__halt_compiler",
         l: e.UIR
      }, {
         cN: "string",
         b: "<<<['\"]?\\w+['\"]?$",
         e: "^\\w+;",
         c: [e.BE]
      }, n, t, {
         cN: "function",
         bK: "function",
         e: /[;{]/,
         eE: true,
         i: "\\$|\\[|%",
         c: [e.UTM, {
            cN: "params",
            b: "\\(",
            e: "\\)",
            c: ["self", t, e.CBCM, r, i]
         }]
      }, {
         cN: "class",
         bK: "class interface",
         e: "{",
         eE: true,
         i: /[:\(\$"]/,
         c: [{
            bK: "extends implements"
         }, e.UTM]
      }, {
         bK: "namespace",
         e: ";",
         i: /[\.']/,
         c: [e.UTM]
      }, {
         bK: "use",
         e: ";",
         c: [e.UTM]
      }, {
         b: "=>"
      }, r, i]
   }
});
hljs.registerLanguage("sql", function(e) {
   var t = {
      cN: "comment",
      b: "--",
      e: "$"
   };
   return {
      cI: true,
      i: /[<>]/,
      c: [{
         cN: "operator",
         bK: "begin end start commit rollback savepoint lock alter create drop rename call delete do handler insert load replace select truncate update set show pragma grant merge describe use explain help declare prepare execute deallocate savepoint release unlock purge reset change stop analyze cache flush optimize repair kill install uninstall checksum restore check backup",
         e: /;/,
         eW: true,
         k: {
            keyword: "abs absolute acos action add adddate addtime aes_decrypt aes_encrypt after aggregate all allocate alter analyze and any are as asc ascii asin assertion at atan atan2 atn2 authorization authors avg backup before begin benchmark between bin binlog bit_and bit_count bit_length bit_or bit_xor both by cache call cascade cascaded case cast catalog ceil ceiling chain change changed char_length character_length charindex charset check checksum checksum_agg choose close coalesce coercibility collate collation collationproperty column columns columns_updated commit compress concat concat_ws concurrent connect connection connection_id consistent constraint constraints continue contributors conv convert convert_tz corresponding cos cot count count_big crc32 create cross cume_dist curdate current current_date current_time current_timestamp current_user cursor curtime data database databases datalength date_add date_format date_sub dateadd datediff datefromparts datename datepart datetime2fromparts datetimeoffsetfromparts day dayname dayofmonth dayofweek dayofyear deallocate declare decode default deferrable deferred degrees delayed delete des_decrypt des_encrypt des_key_file desc describe descriptor diagnostics difference disconnect distinct distinctrow div do domain double drop dumpfile each else elt enclosed encode encrypt end end-exec engine engines eomonth errors escape escaped event eventdata events except exception exec execute exists exp explain export_set extended external extract fast fetch field fields find_in_set first first_value floor flush for force foreign format found found_rows from from_base64 from_days from_unixtime full function get get_format get_lock getdate getutcdate global go goto grant grants greatest group group_concat grouping grouping_id gtid_subset gtid_subtract handler having help hex high_priority hosts hour ident_current ident_incr ident_seed identified identity if ifnull ignore iif ilike immediate in index indicator inet6_aton inet6_ntoa inet_aton inet_ntoa infile initially inner innodb input insert install instr intersect into is is_free_lock is_ipv4 is_ipv4_compat is_ipv4_mapped is_not is_not_null is_used_lock isdate isnull isolation join key kill language last last_day last_insert_id last_value lcase lead leading least leaves left len lenght level like limit lines ln load load_file local localtime localtimestamp locate lock log log10 log2 logfile logs low_priority lower lpad ltrim make_set makedate maketime master master_pos_wait match matched max md5 medium merge microsecond mid min minute mod mode module month monthname mutex name_const names national natural nchar next no no_write_to_binlog not now nullif nvarchar oct octet_length of old_password on only open optimize option optionally or ord order outer outfile output pad parse partial partition password patindex percent_rank percentile_cont percentile_disc period_add period_diff pi plugin position pow power pragma precision prepare preserve primary prior privileges procedure procedure_analyze processlist profile profiles public publishingservername purge quarter query quick quote quotename radians rand read references regexp relative relaylog release release_lock rename repair repeat replace replicate reset restore restrict return returns reverse revoke right rlike rollback rollup round row row_count rows rpad rtrim savepoint schema scroll sec_to_time second section select serializable server session session_user set sha sha1 sha2 share show sign sin size slave sleep smalldatetimefromparts snapshot some soname soundex sounds_like space sql sql_big_result sql_buffer_result sql_cache sql_calc_found_rows sql_no_cache sql_small_result sql_variant_property sqlstate sqrt square start starting status std stddev stddev_pop stddev_samp stdev stdevp stop str str_to_date straight_join strcmp string stuff subdate substr substring subtime subtring_index sum switchoffset sysdate sysdatetime sysdatetimeoffset system_user sysutcdatetime table tables tablespace tan temporary terminated tertiary_weights then time time_format time_to_sec timediff timefromparts timestamp timestampadd timestampdiff timezone_hour timezone_minute to to_base64 to_days to_seconds todatetimeoffset trailing transaction translation trigger trigger_nestlevel triggers trim truncate try_cast try_convert try_parse ucase uncompress uncompressed_length unhex unicode uninstall union unique unix_timestamp unknown unlock update upgrade upped upper usage use user user_resources using utc_date utc_time utc_timestamp uuid uuid_short validate_password_strength value values var var_pop var_samp variables variance varp version view warnings week weekday weekofyear weight_string when whenever where with work write xml xor year yearweek zon",
            literal: "true false null",
            built_in: "array bigint binary bit blob boolean char character date dec decimal float int integer interval number numeric real serial smallint varchar varying int8 serial8 text"
         },
         c: [{
            cN: "string",
            b: "'",
            e: "'",
            c: [e.BE, {
               b: "''"
            }]
         }, {
            cN: "string",
            b: '"',
            e: '"',
            c: [e.BE, {
               b: '""'
            }]
         }, {
            cN: "string",
            b: "`",
            e: "`",
            c: [e.BE]
         }, e.CNM, e.CBCM, t]
      }, e.CBCM, t]
   }
});
hljs.registerLanguage("coffeescript", function(e) {
   var t = {
      keyword: "in if for while finally new do return else break catch instanceof throw try this switch continue typeof delete debugger super then unless until loop of by when and or is isnt not",
      literal: "true false null undefined yes no on off",
      reserved: "case default function var void with const let enum export import native __hasProp __extends __slice __bind __indexOf",
      built_in: "npm require console print module global window document"
   };
   var n = "[A-Za-z$_][0-9A-Za-z$_]*";
   var r = e.inherit(e.TM, {
      b: n
   });
   var i = {
      cN: "subst",
      b: /#\{/,
      e: /}/,
      k: t
   };
   var s = [e.BNM, e.inherit(e.CNM, {
      starts: {
         e: "(\\s*/)?",
         r: 0
      }
   }), {
      cN: "string",
      v: [{
         b: /'''/,
         e: /'''/,
         c: [e.BE]
      }, {
         b: /'/,
         e: /'/,
         c: [e.BE]
      }, {
         b: /"""/,
         e: /"""/,
         c: [e.BE, i]
      }, {
         b: /"/,
         e: /"/,
         c: [e.BE, i]
      }]
   }, {
      cN: "regexp",
      v: [{
         b: "///",
         e: "///",
         c: [i, e.HCM]
      }, {
         b: "//[gim]*",
         r: 0
      }, {
         b: /\/(?![ *])(\\\/|.)*?\/[gim]*(?=\W|$)/
      }]
   }, {
      cN: "property",
      b: "@" + n
   }, {
      b: "`",
      e: "`",
      eB: true,
      eE: true,
      sL: "javascript"
   }];
   i.c = s;
   return {
      aliases: ["coffee", "cson", "iced"],
      k: t,
      i: /\/\*/,
      c: s.concat([{
         cN: "comment",
         b: "###",
         e: "###"
      }, e.HCM, {
         cN: "function",
         b: "(^\\s*|\\B)(" + n + "\\s*=\\s*)?(\\(.*\\))?\\s*\\B[-=]>",
         e: "[-=]>",
         rB: true,
         c: [r, {
            cN: "params",
            b: "\\([^\\(]",
            rB: true,
            c: [{
               b: /\(/,
               e: /\)/,
               k: t,
               c: ["self"].concat(s)
            }]
         }]
      }, {
         cN: "class",
         bK: "class",
         e: "$",
         i: /[:="\[\]]/,
         c: [{
            bK: "extends",
            eW: true,
            i: /[:="\[\]]/,
            c: [r]
         }, r]
      }, {
         cN: "attribute",
         b: n + ":",
         e: ":",
         rB: true,
         eE: true,
         r: 0
      }])
   }
});
hljs.registerLanguage("json", function(e) {
   var t = {
      literal: "true false null"
   };
   var n = [e.QSM, e.CNM];
   var r = {
      cN: "value",
      e: ",",
      eW: true,
      eE: true,
      c: n,
      k: t
   };
   var i = {
      b: "{",
      e: "}",
      c: [{
         cN: "attribute",
         b: '\\s*"',
         e: '"\\s*:\\s*',
         eB: true,
         eE: true,
         c: [e.BE],
         i: "\\n",
         starts: r
      }],
      i: "\\S"
   };
   var s = {
      b: "\\[",
      e: "\\]",
      c: [e.inherit(r, {
         cN: null
      })],
      i: "\\S"
   };
   n.splice(n.length, 0, i, s);
   return {
      c: n,
      k: t,
      i: "\\S"
   }
})

/*
 * hoverIntent v1.8.0 // 2014.06.29 // jQuery v1.9.1+
 * http://cherne.net/brian/resources/jquery.hoverIntent.html
 * You may use hoverIntent under the terms of the MIT license. Basically that
 * means you are free to use hoverIntent as long as this header is left intact.
 * Copyright 2007, 2014 Brian Cherne
 */
;
(function($) {
   $.fn.hoverIntent = function(handlerIn, handlerOut, selector) {
      var cfg = {
         interval: 100,
         sensitivity: 6,
         timeout: 0
      };
      if (typeof handlerIn === "object") {
         cfg = $.extend(cfg, handlerIn)
      } else {
         if ($.isFunction(handlerOut)) {
            cfg = $.extend(cfg, {
               over: handlerIn,
               out: handlerOut,
               selector: selector
            })
         } else {
            cfg = $.extend(cfg, {
               over: handlerIn,
               out: handlerIn,
               selector: handlerOut
            })
         }
      }
      var cX, cY, pX, pY;
      var track = function(ev) {
         cX = ev.pageX;
         cY = ev.pageY
      };
      var compare = function(ev, ob) {
         ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
         if (Math.sqrt((pX - cX) * (pX - cX) + (pY - cY) * (pY - cY)) < cfg.sensitivity) {
            $(ob).off("mousemove.hoverIntent", track);
            ob.hoverIntent_s = true;
            return cfg.over.apply(ob, [ev])
         } else {
            pX = cX;
            pY = cY;
            ob.hoverIntent_t = setTimeout(function() {
               compare(ev, ob)
            }, cfg.interval)
         }
      };
      var delay = function(ev, ob) {
         ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
         ob.hoverIntent_s = false;
         return cfg.out.apply(ob, [ev])
      };
      var handleHover = function(e) {
         var ev = $.extend({}, e);
         var ob = this;
         if (ob.hoverIntent_t) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t)
         }
         if (e.type === "mouseenter") {
            pX = ev.pageX;
            pY = ev.pageY;
            $(ob).on("mousemove.hoverIntent", track);
            if (!ob.hoverIntent_s) {
               ob.hoverIntent_t = setTimeout(function() {
                  compare(ev, ob)
               }, cfg.interval)
            }
         } else {
            $(ob).off("mousemove.hoverIntent", track);
            if (ob.hoverIntent_s) {
               ob.hoverIntent_t = setTimeout(function() {
                  delay(ev, ob)
               }, cfg.timeout)
            }
         }
      };
      return this.on({
         "mouseenter.hoverIntent": handleHover,
         "mouseleave.hoverIntent": handleHover
      }, cfg.selector)
   }
})(jQuery);

/*
 * jQuery Expose plugin 1.0
 * Copyright (c) 2013 Jeff Ching
 * http://github.com/chingor13/jquery-expose
 * http://www.opensource.org/licenses/mit-license.php
 */
;
(function(e) {
   function t() {
      e(".expose-overlay").remove();
      e("body").trigger("expose:overlay:removed")
   }

   function n(n, r, i, s, o) {
      var u = e('<div class="expose-overlay"></div>').css({
         position: "absolute",
         top: r + "px",
         left: n + "px",
         width: i - n + "px",
         height: s - r + "px"
      }).appendTo(e("body"));
      if (!o.static) {
         u.bind("click", t)
      }
      e("body").append(u).trigger("expose:overlay:shown", [n, r, i, s, u])
   }
   e.fn.expose = function(t) {
      t = t || {};
      e("body").trigger("expose:init", [this, t]);
      var r = t.padding || 0,
         i = [],
         s = [0],
         o = [];
      this.each(function(t, n) {
         var o = e(n);
         offset = o.offset(), f = offset.left - r, y0 = offset.top - r, l = offset.left + o.outerWidth() + r, y1 = offset.top + o.outerHeight() + r;
         i.push({
            topLeft: {
               x: f,
               y: y0
            },
            bottomRight: {
               x: l,
               y: y1
            }
         });
         s.push(f);
         s.push(l)
      });
      s.push(e(document).width());
      s.sort(function(e, t) {
         return e - t
      });
      var u;
      for (var a = 0; a < s.length; a++) {
         if (u != s[a]) {
            u = s[a];
            o.push(s[a])
         }
      }
      i.sort(function(e, t) {
         return e.topLeft.y - t.topLeft.y
      });
      for (var a = 0; a < o.length - 1; a++) {
         var f = o[a],
            l = o[a + 1],
            c = [];
         for (var h = 0; h < i.length; h++) {
            var p = i[h];
            if (p.topLeft.x <= f && p.bottomRight.x >= l) {
               c.push([p.topLeft.y, p.bottomRight.y])
            }
         }
         var d = [0];
         for (var h = 0; h < c.length; h++) {
            var p = c[h];
            if (p[0] > d[d.length - 1]) {
               d.push(p[0]);
               d.push(p[1])
            } else {
               d.pop();
               d.push(p[1])
            }
         }
         d.push(e(document).height());
         for (var h = 0; h < d.length - 1; h = h + 2) {
            n(f, d[h], l, d[h + 1], t)
         }
      }
      e("body").trigger("expose:shown", this);
      return this
   };
   e(document).bind("expose:hide", t)
})(jQuery)

/*
 * jVectorMap version 1.2.2
 * Copyright 2011-2013, Kirill Lebedev
 * Licensed under the MIT license.
 */
;
(function(e) {
   var t = {
      set: {
         colors: 1,
         values: 1,
         backgroundColor: 1,
         scaleColors: 1,
         normalizeFunction: 1,
         focus: 1
      },
      get: {
         selectedRegions: 1,
         selectedMarkers: 1,
         mapObject: 1,
         regionName: 1
      }
   };
   e.fn.vectorMap = function(e) {
      var n, r, i, n = this.children(".jvectormap-container").data("mapObject");
      if (e === "addMap") jvm.WorldMap.maps[arguments[1]] = arguments[2];
      else {
         if (!(e !== "set" && e !== "get" || !t[e][arguments[1]])) return r = arguments[1].charAt(0).toUpperCase() + arguments[1].substr(1), n[e + r].apply(n, Array.prototype.slice.call(arguments, 2));
         e = e || {}, e.container = this, n = new jvm.WorldMap(e)
      }
      return this
   }
})(jQuery),
function(e) {
   function r(t) {
      var n = t || window.event,
         r = [].slice.call(arguments, 1),
         i = 0,
         s = !0,
         o = 0,
         u = 0;
      return t = e.event.fix(n), t.type = "mousewheel", n.wheelDelta && (i = n.wheelDelta / 120), n.detail && (i = -n.detail / 3), u = i, n.axis !== undefined && n.axis === n.HORIZONTAL_AXIS && (u = 0, o = -1 * i), n.wheelDeltaY !== undefined && (u = n.wheelDeltaY / 120), n.wheelDeltaX !== undefined && (o = -1 * n.wheelDeltaX / 120), r.unshift(t, i, o, u), (e.event.dispatch || e.event.handle).apply(this, r)
   }
   var t = ["DOMMouseScroll", "mousewheel"];
   if (e.event.fixHooks)
      for (var n = t.length; n;) e.event.fixHooks[t[--n]] = e.event.mouseHooks;
   e.event.special.mousewheel = {
      setup: function() {
         if (this.addEventListener)
            for (var e = t.length; e;) this.addEventListener(t[--e], r, !1);
         else this.onmousewheel = r
      },
      teardown: function() {
         if (this.removeEventListener)
            for (var e = t.length; e;) this.removeEventListener(t[--e], r, !1);
         else this.onmousewheel = null
      }
   }, e.fn.extend({
      mousewheel: function(e) {
         return e ? this.bind("mousewheel", e) : this.trigger("mousewheel")
      },
      unmousewheel: function(e) {
         return this.unbind("mousewheel", e)
      }
   })
}(jQuery);
var jvm = {
   inherits: function(e, t) {
      function n() {}
      n.prototype = t.prototype, e.prototype = new n, e.prototype.constructor = e, e.parentClass = t
   },
   mixin: function(e, t) {
      var n;
      for (n in t.prototype) t.prototype.hasOwnProperty(n) && (e.prototype[n] = t.prototype[n])
   },
   min: function(e) {
      var t = Number.MAX_VALUE,
         n;
      if (e instanceof Array)
         for (n = 0; n < e.length; n++) e[n] < t && (t = e[n]);
      else
         for (n in e) e[n] < t && (t = e[n]);
      return t
   },
   max: function(e) {
      var t = Number.MIN_VALUE,
         n;
      if (e instanceof Array)
         for (n = 0; n < e.length; n++) e[n] > t && (t = e[n]);
      else
         for (n in e) e[n] > t && (t = e[n]);
      return t
   },
   keys: function(e) {
      var t = [],
         n;
      for (n in e) t.push(n);
      return t
   },
   values: function(e) {
      var t = [],
         n, r;
      for (r = 0; r < arguments.length; r++) {
         e = arguments[r];
         for (n in e) t.push(e[n])
      }
      return t
   }
};
jvm.$ = jQuery, jvm.AbstractElement = function(e, t) {
   this.node = this.createElement(e), this.name = e, this.properties = {}, t && this.set(t)
}, jvm.AbstractElement.prototype.set = function(e, t) {
   var n;
   if (typeof e == "object")
      for (n in e) this.properties[n] = e[n], this.applyAttr(n, e[n]);
   else this.properties[e] = t, this.applyAttr(e, t)
}, jvm.AbstractElement.prototype.get = function(e) {
   return this.properties[e]
}, jvm.AbstractElement.prototype.applyAttr = function(e, t) {
   this.node.setAttribute(e, t)
}, jvm.AbstractElement.prototype.remove = function() {
   jvm.$(this.node).remove()
}, jvm.AbstractCanvasElement = function(e, t, n) {
   this.container = e, this.setSize(t, n), this.rootElement = new jvm[this.classPrefix + "GroupElement"], this.node.appendChild(this.rootElement.node), this.container.appendChild(this.node)
}, jvm.AbstractCanvasElement.prototype.add = function(e, t) {
   t = t || this.rootElement, t.add(e), e.canvas = this
}, jvm.AbstractCanvasElement.prototype.addPath = function(e, t, n) {
   var r = new jvm[this.classPrefix + "PathElement"](e, t);
   return this.add(r, n), r
}, jvm.AbstractCanvasElement.prototype.addCircle = function(e, t, n) {
   var r = new jvm[this.classPrefix + "CircleElement"](e, t);
   return this.add(r, n), r
}, jvm.AbstractCanvasElement.prototype.addGroup = function(e) {
   var t = new jvm[this.classPrefix + "GroupElement"];
   return e ? e.node.appendChild(t.node) : this.node.appendChild(t.node), t.canvas = this, t
}, jvm.AbstractShapeElement = function(e, t, n) {
   this.style = n || {}, this.style.current = {}, this.isHovered = !1, this.isSelected = !1, this.updateStyle()
}, jvm.AbstractShapeElement.prototype.setHovered = function(e) {
   this.isHovered !== e && (this.isHovered = e, this.updateStyle())
}, jvm.AbstractShapeElement.prototype.setSelected = function(e) {
   this.isSelected !== e && (this.isSelected = e, this.updateStyle(), jvm.$(this.node).trigger("selected", [e]))
}, jvm.AbstractShapeElement.prototype.setStyle = function(e, t) {
   var n = {};
   typeof e == "object" ? n = e : n[e] = t, jvm.$.extend(this.style.current, n), this.updateStyle()
}, jvm.AbstractShapeElement.prototype.updateStyle = function() {
   var e = {};
   jvm.AbstractShapeElement.mergeStyles(e, this.style.initial), jvm.AbstractShapeElement.mergeStyles(e, this.style.current), this.isHovered && jvm.AbstractShapeElement.mergeStyles(e, this.style.hover), this.isSelected && (jvm.AbstractShapeElement.mergeStyles(e, this.style.selected), this.isHovered && jvm.AbstractShapeElement.mergeStyles(e, this.style.selectedHover)), this.set(e)
}, jvm.AbstractShapeElement.mergeStyles = function(e, t) {
   var n;
   t = t || {};
   for (n in t) t[n] === null ? delete e[n] : e[n] = t[n]
}, jvm.SVGElement = function(e, t) {
   jvm.SVGElement.parentClass.apply(this, arguments)
}, jvm.inherits(jvm.SVGElement, jvm.AbstractElement), jvm.SVGElement.svgns = "http://www.w3.org/2000/svg", jvm.SVGElement.prototype.createElement = function(e) {
   return document.createElementNS(jvm.SVGElement.svgns, e)
}, jvm.SVGElement.prototype.addClass = function(e) {
   this.node.setAttribute("class", e)
}, jvm.SVGElement.prototype.getElementCtr = function(e) {
   return jvm["SVG" + e]
}, jvm.SVGElement.prototype.getBBox = function() {
   return this.node.getBBox()
}, jvm.SVGGroupElement = function() {
   jvm.SVGGroupElement.parentClass.call(this, "g")
}, jvm.inherits(jvm.SVGGroupElement, jvm.SVGElement), jvm.SVGGroupElement.prototype.add = function(e) {
   this.node.appendChild(e.node)
}, jvm.SVGCanvasElement = function(e, t, n) {
   this.classPrefix = "SVG", jvm.SVGCanvasElement.parentClass.call(this, "svg"), jvm.AbstractCanvasElement.apply(this, arguments)
}, jvm.inherits(jvm.SVGCanvasElement, jvm.SVGElement), jvm.mixin(jvm.SVGCanvasElement, jvm.AbstractCanvasElement), jvm.SVGCanvasElement.prototype.setSize = function(e, t) {
   this.width = e, this.height = t, this.node.setAttribute("width", e), this.node.setAttribute("height", t)
}, jvm.SVGCanvasElement.prototype.applyTransformParams = function(e, t, n) {
   this.scale = e, this.transX = t, this.transY = n, this.rootElement.node.setAttribute("transform", "scale(" + e + ") translate(" + t + ", " + n + ")")
}, jvm.SVGShapeElement = function(e, t, n) {
   jvm.SVGShapeElement.parentClass.call(this, e, t), jvm.AbstractShapeElement.apply(this, arguments)
}, jvm.inherits(jvm.SVGShapeElement, jvm.SVGElement), jvm.mixin(jvm.SVGShapeElement, jvm.AbstractShapeElement), jvm.SVGPathElement = function(e, t) {
   jvm.SVGPathElement.parentClass.call(this, "path", e, t), this.node.setAttribute("fill-rule", "evenodd")
}, jvm.inherits(jvm.SVGPathElement, jvm.SVGShapeElement), jvm.SVGCircleElement = function(e, t) {
   jvm.SVGCircleElement.parentClass.call(this, "circle", e, t)
}, jvm.inherits(jvm.SVGCircleElement, jvm.SVGShapeElement), jvm.VMLElement = function(e, t) {
   jvm.VMLElement.VMLInitialized || jvm.VMLElement.initializeVML(), jvm.VMLElement.parentClass.apply(this, arguments)
}, jvm.inherits(jvm.VMLElement, jvm.AbstractElement), jvm.VMLElement.VMLInitialized = !1, jvm.VMLElement.initializeVML = function() {
   try {
      document.namespaces.rvml || document.namespaces.add("rvml", "urn:schemas-microsoft-com:vml"), jvm.VMLElement.prototype.createElement = function(e) {
         return document.createElement("<rvml:" + e + ' class="rvml">')
      }
   } catch (e) {
      jvm.VMLElement.prototype.createElement = function(e) {
         return document.createElement("<" + e + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">')
      }
   }
   document.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)"), jvm.VMLElement.VMLInitialized = !0
}, jvm.VMLElement.prototype.getElementCtr = function(e) {
   return jvm["VML" + e]
}, jvm.VMLElement.prototype.addClass = function(e) {
   jvm.$(this.node).addClass(e)
}, jvm.VMLElement.prototype.applyAttr = function(e, t) {
   this.node[e] = t
}, jvm.VMLElement.prototype.getBBox = function() {
   var e = jvm.$(this.node);
   return {
      x: e.position().left / this.canvas.scale,
      y: e.position().top / this.canvas.scale,
      width: e.width() / this.canvas.scale,
      height: e.height() / this.canvas.scale
   }
}, jvm.VMLGroupElement = function() {
   jvm.VMLGroupElement.parentClass.call(this, "group"), this.node.style.left = "0px", this.node.style.top = "0px", this.node.coordorigin = "0 0"
}, jvm.inherits(jvm.VMLGroupElement, jvm.VMLElement), jvm.VMLGroupElement.prototype.add = function(e) {
   this.node.appendChild(e.node)
}, jvm.VMLCanvasElement = function(e, t, n) {
   this.classPrefix = "VML", jvm.VMLCanvasElement.parentClass.call(this, "group"), jvm.AbstractCanvasElement.apply(this, arguments), this.node.style.position = "absolute"
}, jvm.inherits(jvm.VMLCanvasElement, jvm.VMLElement), jvm.mixin(jvm.VMLCanvasElement, jvm.AbstractCanvasElement), jvm.VMLCanvasElement.prototype.setSize = function(e, t) {
   var n, r, i, s;
   this.width = e, this.height = t, this.node.style.width = e + "px", this.node.style.height = t + "px", this.node.coordsize = e + " " + t, this.node.coordorigin = "0 0";
   if (this.rootElement) {
      n = this.rootElement.node.getElementsByTagName("shape");
      for (i = 0, s = n.length; i < s; i++) n[i].coordsize = e + " " + t, n[i].style.width = e + "px", n[i].style.height = t + "px";
      r = this.node.getElementsByTagName("group");
      for (i = 0, s = r.length; i < s; i++) r[i].coordsize = e + " " + t, r[i].style.width = e + "px", r[i].style.height = t + "px"
   }
}, jvm.VMLCanvasElement.prototype.applyTransformParams = function(e, t, n) {
   this.scale = e, this.transX = t, this.transY = n, this.rootElement.node.coordorigin = this.width - t - this.width / 100 + "," + (this.height - n - this.height / 100), this.rootElement.node.coordsize = this.width / e + "," + this.height / e
}, jvm.VMLShapeElement = function(e, t) {
   jvm.VMLShapeElement.parentClass.call(this, e, t), this.fillElement = new jvm.VMLElement("fill"), this.strokeElement = new jvm.VMLElement("stroke"), this.node.appendChild(this.fillElement.node), this.node.appendChild(this.strokeElement.node), this.node.stroked = !1, jvm.AbstractShapeElement.apply(this, arguments)
}, jvm.inherits(jvm.VMLShapeElement, jvm.VMLElement), jvm.mixin(jvm.VMLShapeElement, jvm.AbstractShapeElement), jvm.VMLShapeElement.prototype.applyAttr = function(e, t) {
   switch (e) {
      case "fill":
         this.node.fillcolor = t;
         break;
      case "fill-opacity":
         this.fillElement.node.opacity = Math.round(t * 100) + "%";
         break;
      case "stroke":
         t === "none" ? this.node.stroked = !1 : this.node.stroked = !0, this.node.strokecolor = t;
         break;
      case "stroke-opacity":
         this.strokeElement.node.opacity = Math.round(t * 100) + "%";
         break;
      case "stroke-width":
         parseInt(t, 10) === 0 ? this.node.stroked = !1 : this.node.stroked = !0, this.node.strokeweight = t;
         break;
      case "d":
         this.node.path = jvm.VMLPathElement.pathSvgToVml(t);
         break;
      default:
         jvm.VMLShapeElement.parentClass.prototype.applyAttr.apply(this, arguments)
   }
}, jvm.VMLPathElement = function(e, t) {
   var n = new jvm.VMLElement("skew");
   jvm.VMLPathElement.parentClass.call(this, "shape", e, t), this.node.coordorigin = "0 0", n.node.on = !0, n.node.matrix = "0.01,0,0,0.01,0,0", n.node.offset = "0,0", this.node.appendChild(n.node)
}, jvm.inherits(jvm.VMLPathElement, jvm.VMLShapeElement), jvm.VMLPathElement.prototype.applyAttr = function(e, t) {
   e === "d" ? this.node.path = jvm.VMLPathElement.pathSvgToVml(t) : jvm.VMLShapeElement.prototype.applyAttr.call(this, e, t)
}, jvm.VMLPathElement.pathSvgToVml = function(e) {
   var t = "",
      n = 0,
      r = 0,
      i, s;
   return e = e.replace(/(-?\d+)e(-?\d+)/g, "0"), e.replace(/([MmLlHhVvCcSs])\s*((?:-?\d*(?:\.\d+)?\s*,?\s*)+)/g, function(e, t, o, u) {
      o = o.replace(/(\d)-/g, "$1,-").replace(/^\s+/g, "").replace(/\s+$/g, "").replace(/\s+/g, ",").split(","), o[0] || o.shift();
      for (var a = 0, f = o.length; a < f; a++) o[a] = Math.round(100 * o[a]);
      switch (t) {
         case "m":
            return n += o[0], r += o[1], "t" + o.join(",");
         case "M":
            return n = o[0], r = o[1], "m" + o.join(",");
         case "l":
            return n += o[0], r += o[1], "r" + o.join(",");
         case "L":
            return n = o[0], r = o[1], "l" + o.join(",");
         case "h":
            return n += o[0], "r" + o[0] + ",0";
         case "H":
            return n = o[0], "l" + n + "," + r;
         case "v":
            return r += o[0], "r0," + o[0];
         case "V":
            return r = o[0], "l" + n + "," + r;
         case "c":
            return i = n + o[o.length - 4], s = r + o[o.length - 3], n += o[o.length - 2], r += o[o.length - 1], "v" + o.join(",");
         case "C":
            return i = o[o.length - 4], s = o[o.length - 3], n = o[o.length - 2], r = o[o.length - 1], "c" + o.join(",");
         case "s":
            return o.unshift(r - s), o.unshift(n - i), i = n + o[o.length - 4], s = r + o[o.length - 3], n += o[o.length - 2], r += o[o.length - 1], "v" + o.join(",");
         case "S":
            return o.unshift(r + r - s), o.unshift(n + n - i), i = o[o.length - 4], s = o[o.length - 3], n = o[o.length - 2], r = o[o.length - 1], "c" + o.join(",")
      }
      return ""
   }).replace(/z/g, "e")
}, jvm.VMLCircleElement = function(e, t) {
   jvm.VMLCircleElement.parentClass.call(this, "oval", e, t)
}, jvm.inherits(jvm.VMLCircleElement, jvm.VMLShapeElement), jvm.VMLCircleElement.prototype.applyAttr = function(e, t) {
   switch (e) {
      case "r":
         this.node.style.width = t * 2 + "px", this.node.style.height = t * 2 + "px", this.applyAttr("cx", this.get("cx") || 0), this.applyAttr("cy", this.get("cy") || 0);
         break;
      case "cx":
         if (!t) return;
         this.node.style.left = t - (this.get("r") || 0) + "px";
         break;
      case "cy":
         if (!t) return;
         this.node.style.top = t - (this.get("r") || 0) + "px";
         break;
      default:
         jvm.VMLCircleElement.parentClass.prototype.applyAttr.call(this, e, t)
   }
}, jvm.VectorCanvas = function(e, t, n) {
   return this.mode = window.SVGAngle ? "svg" : "vml", this.mode == "svg" ? this.impl = new jvm.SVGCanvasElement(e, t, n) : this.impl = new jvm.VMLCanvasElement(e, t, n), this.impl
}, jvm.SimpleScale = function(e) {
   this.scale = e
}, jvm.SimpleScale.prototype.getValue = function(e) {
   return e
}, jvm.OrdinalScale = function(e) {
   this.scale = e
}, jvm.OrdinalScale.prototype.getValue = function(e) {
   return this.scale[e]
}, jvm.NumericScale = function(e, t, n, r) {
   this.scale = [], t = t || "linear", e && this.setScale(e), t && this.setNormalizeFunction(t), n && this.setMin(n), r && this.setMax(r)
}, jvm.NumericScale.prototype = {
   setMin: function(e) {
      this.clearMinValue = e, typeof this.normalize == "function" ? this.minValue = this.normalize(e) : this.minValue = e
   },
   setMax: function(e) {
      this.clearMaxValue = e, typeof this.normalize == "function" ? this.maxValue = this.normalize(e) : this.maxValue = e
   },
   setScale: function(e) {
      var t;
      for (t = 0; t < e.length; t++) this.scale[t] = [e[t]]
   },
   setNormalizeFunction: function(e) {
      e === "polynomial" ? this.normalize = function(e) {
         return Math.pow(e, .2)
      } : e === "linear" ? delete this.normalize : this.normalize = e, this.setMin(this.clearMinValue), this.setMax(this.clearMaxValue)
   },
   getValue: function(e) {
      var t = [],
         n = 0,
         r, i = 0,
         s;
      typeof this.normalize == "function" && (e = this.normalize(e));
      for (i = 0; i < this.scale.length - 1; i++) r = this.vectorLength(this.vectorSubtract(this.scale[i + 1], this.scale[i])), t.push(r), n += r;
      s = (this.maxValue - this.minValue) / n;
      for (i = 0; i < t.length; i++) t[i] *= s;
      i = 0, e -= this.minValue;
      while (e - t[i] >= 0) e -= t[i], i++;
      return i == this.scale.length - 1 ? e = this.vectorToNum(this.scale[i]) : e = this.vectorToNum(this.vectorAdd(this.scale[i], this.vectorMult(this.vectorSubtract(this.scale[i + 1], this.scale[i]), e / t[i]))), e
   },
   vectorToNum: function(e) {
      var t = 0,
         n;
      for (n = 0; n < e.length; n++) t += Math.round(e[n]) * Math.pow(256, e.length - n - 1);
      return t
   },
   vectorSubtract: function(e, t) {
      var n = [],
         r;
      for (r = 0; r < e.length; r++) n[r] = e[r] - t[r];
      return n
   },
   vectorAdd: function(e, t) {
      var n = [],
         r;
      for (r = 0; r < e.length; r++) n[r] = e[r] + t[r];
      return n
   },
   vectorMult: function(e, t) {
      var n = [],
         r;
      for (r = 0; r < e.length; r++) n[r] = e[r] * t;
      return n
   },
   vectorLength: function(e) {
      var t = 0,
         n;
      for (n = 0; n < e.length; n++) t += e[n] * e[n];
      return Math.sqrt(t)
   }
}, jvm.ColorScale = function(e, t, n, r) {
   jvm.ColorScale.parentClass.apply(this, arguments)
}, jvm.inherits(jvm.ColorScale, jvm.NumericScale), jvm.ColorScale.prototype.setScale = function(e) {
   var t;
   for (t = 0; t < e.length; t++) this.scale[t] = jvm.ColorScale.rgbToArray(e[t])
}, jvm.ColorScale.prototype.getValue = function(e) {
   return jvm.ColorScale.numToRgb(jvm.ColorScale.parentClass.prototype.getValue.call(this, e))
}, jvm.ColorScale.arrayToRgb = function(e) {
   var t = "#",
      n, r;
   for (r = 0; r < e.length; r++) n = e[r].toString(16), t += n.length == 1 ? "0" + n : n;
   return t
}, jvm.ColorScale.numToRgb = function(e) {
   e = e.toString(16);
   while (e.length < 6) e = "0" + e;
   return "#" + e
}, jvm.ColorScale.rgbToArray = function(e) {
   return e = e.substr(1), [parseInt(e.substr(0, 2), 16), parseInt(e.substr(2, 2), 16), parseInt(e.substr(4, 2), 16)]
}, jvm.DataSeries = function(e, t) {
   var n;
   e = e || {}, e.attribute = e.attribute || "fill", this.elements = t, this.params = e, e.attributes && this.setAttributes(e.attributes), jvm.$.isArray(e.scale) ? (n = e.attribute === "fill" || e.attribute === "stroke" ? jvm.ColorScale : jvm.NumericScale, this.scale = new n(e.scale, e.normalizeFunction, e.min, e.max)) : e.scale ? this.scale = new jvm.OrdinalScale(e.scale) : this.scale = new jvm.SimpleScale(e.scale), this.values = e.values || {}, this.setValues(this.values)
}, jvm.DataSeries.prototype = {
   setAttributes: function(e, t) {
      var n = e,
         r;
      if (typeof e == "string") this.elements[e] && this.elements[e].setStyle(this.params.attribute, t);
      else
         for (r in n) this.elements[r] && this.elements[r].element.setStyle(this.params.attribute, n[r])
   },
   setValues: function(e) {
      var t = Number.MIN_VALUE,
         n = Number.MAX_VALUE,
         r, i, s = {};
      if (this.scale instanceof jvm.OrdinalScale || this.scale instanceof jvm.SimpleScale)
         for (i in e) e[i] ? s[i] = this.scale.getValue(e[i]) : s[i] = this.elements[i].element.style.initial[this.params.attribute];
      else {
         if (!this.params.min || !this.params.max) {
            for (i in e) r = parseFloat(e[i]), r > t && (t = e[i]), r < n && (n = r);
            this.params.min || this.scale.setMin(n), this.params.max || this.scale.setMax(t), this.params.min = n, this.params.max = t
         }
         for (i in e) r = parseFloat(e[i]), isNaN(r) ? s[i] = this.elements[i].element.style.initial[this.params.attribute] : s[i] = this.scale.getValue(r)
      }
      this.setAttributes(s), jvm.$.extend(this.values, e)
   },
   clear: function() {
      var e, t = {};
      for (e in this.values) this.elements[e] && (t[e] = this.elements[e].element.style.initial[this.params.attribute]);
      this.setAttributes(t), this.values = {}
   },
   setScale: function(e) {
      this.scale.setScale(e), this.values && this.setValues(this.values)
   },
   setNormalizeFunction: function(e) {
      this.scale.setNormalizeFunction(e), this.values && this.setValues(this.values)
   }
}, jvm.Proj = {
   degRad: 180 / Math.PI,
   radDeg: Math.PI / 180,
   radius: 6381372,
   sgn: function(e) {
      return e > 0 ? 1 : e < 0 ? -1 : e
   },
   mill: function(e, t, n) {
      return {
         x: this.radius * (t - n) * this.radDeg,
         y: -this.radius * Math.log(Math.tan((45 + .4 * e) * this.radDeg)) / .8
      }
   },
   mill_inv: function(e, t, n) {
      return {
         lat: (2.5 * Math.atan(Math.exp(.8 * t / this.radius)) - 5 * Math.PI / 8) * this.degRad,
         lng: (n * this.radDeg + e / this.radius) * this.degRad
      }
   },
   merc: function(e, t, n) {
      return {
         x: this.radius * (t - n) * this.radDeg,
         y: -this.radius * Math.log(Math.tan(Math.PI / 4 + e * Math.PI / 360))
      }
   },
   merc_inv: function(e, t, n) {
      return {
         lat: (2 * Math.atan(Math.exp(t / this.radius)) - Math.PI / 2) * this.degRad,
         lng: (n * this.radDeg + e / this.radius) * this.degRad
      }
   },
   aea: function(e, t, n) {
      var r = 0,
         i = n * this.radDeg,
         s = 29.5 * this.radDeg,
         o = 45.5 * this.radDeg,
         u = e * this.radDeg,
         a = t * this.radDeg,
         f = (Math.sin(s) + Math.sin(o)) / 2,
         l = Math.cos(s) * Math.cos(s) + 2 * f * Math.sin(s),
         c = f * (a - i),
         h = Math.sqrt(l - 2 * f * Math.sin(u)) / f,
         p = Math.sqrt(l - 2 * f * Math.sin(r)) / f;
      return {
         x: h * Math.sin(c) * this.radius,
         y: -(p - h * Math.cos(c)) * this.radius
      }
   },
   aea_inv: function(e, t, n) {
      var r = e / this.radius,
         i = t / this.radius,
         s = 0,
         o = n * this.radDeg,
         u = 29.5 * this.radDeg,
         a = 45.5 * this.radDeg,
         f = (Math.sin(u) + Math.sin(a)) / 2,
         l = Math.cos(u) * Math.cos(u) + 2 * f * Math.sin(u),
         c = Math.sqrt(l - 2 * f * Math.sin(s)) / f,
         h = Math.sqrt(r * r + (c - i) * (c - i)),
         p = Math.atan(r / (c - i));
      return {
         lat: Math.asin((l - h * h * f * f) / (2 * f)) * this.degRad,
         lng: (o + p / f) * this.degRad
      }
   },
   lcc: function(e, t, n) {
      var r = 0,
         i = n * this.radDeg,
         s = t * this.radDeg,
         o = 33 * this.radDeg,
         u = 45 * this.radDeg,
         a = e * this.radDeg,
         f = Math.log(Math.cos(o) * (1 / Math.cos(u))) / Math.log(Math.tan(Math.PI / 4 + u / 2) * (1 / Math.tan(Math.PI / 4 + o / 2))),
         l = Math.cos(o) * Math.pow(Math.tan(Math.PI / 4 + o / 2), f) / f,
         c = l * Math.pow(1 / Math.tan(Math.PI / 4 + a / 2), f),
         h = l * Math.pow(1 / Math.tan(Math.PI / 4 + r / 2), f);
      return {
         x: c * Math.sin(f * (s - i)) * this.radius,
         y: -(h - c * Math.cos(f * (s - i))) * this.radius
      }
   },
   lcc_inv: function(e, t, n) {
      var r = e / this.radius,
         i = t / this.radius,
         s = 0,
         o = n * this.radDeg,
         u = 33 * this.radDeg,
         a = 45 * this.radDeg,
         f = Math.log(Math.cos(u) * (1 / Math.cos(a))) / Math.log(Math.tan(Math.PI / 4 + a / 2) * (1 / Math.tan(Math.PI / 4 + u / 2))),
         l = Math.cos(u) * Math.pow(Math.tan(Math.PI / 4 + u / 2), f) / f,
         c = l * Math.pow(1 / Math.tan(Math.PI / 4 + s / 2), f),
         h = this.sgn(f) * Math.sqrt(r * r + (c - i) * (c - i)),
         p = Math.atan(r / (c - i));
      return {
         lat: (2 * Math.atan(Math.pow(l / h, 1 / f)) - Math.PI / 2) * this.degRad,
         lng: (o + p / f) * this.degRad
      }
   }
}, jvm.WorldMap = function(e) {
   var t = this,
      n;
   this.params = jvm.$.extend(!0, {}, jvm.WorldMap.defaultParams, e);
   if (!jvm.WorldMap.maps[this.params.map]) throw new Error("Attempt to use map which was not loaded: " + this.params.map);
   this.mapData = jvm.WorldMap.maps[this.params.map], this.markers = {}, this.regions = {}, this.regionsColors = {}, this.regionsData = {}, this.container = jvm.$("<div>").css({
      width: "100%",
      height: "100%"
   }).addClass("jvectormap-container"), this.params.container.append(this.container), this.container.data("mapObject", this), this.container.css({
      position: "relative",
      overflow: "hidden"
   }), this.defaultWidth = this.mapData.width, this.defaultHeight = this.mapData.height, this.setBackgroundColor(this.params.backgroundColor), this.onResize = function() {
      t.setSize()
   }, jvm.$(window).resize(this.onResize);
   for (n in jvm.WorldMap.apiEvents) this.params[n] && this.container.bind(jvm.WorldMap.apiEvents[n] + ".jvectormap", this.params[n]);
   this.canvas = new jvm.VectorCanvas(this.container[0], this.width, this.height), "ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch ? this.params.bindTouchEvents && this.bindContainerTouchEvents() : this.bindContainerEvents(), this.bindElementEvents(), this.createLabel(), this.params.zoomButtons && this.bindZoomButtons(), this.createRegions(), this.createMarkers(this.params.markers || {}), this.setSize(), this.params.focusOn && (typeof this.params.focusOn == "object" ? this.setFocus.call(this, this.params.focusOn.scale, this.params.focusOn.x, this.params.focusOn.y) : this.setFocus.call(this, this.params.focusOn)), this.params.selectedRegions && this.setSelectedRegions(this.params.selectedRegions), this.params.selectedMarkers && this.setSelectedMarkers(this.params.selectedMarkers), this.params.series && this.createSeries()
}, jvm.WorldMap.prototype = {
   transX: 0,
   transY: 0,
   scale: 1,
   baseTransX: 0,
   baseTransY: 0,
   baseScale: 1,
   width: 0,
   height: 0,
   setBackgroundColor: function(e) {
      this.container.css("background-color", e)
   },
   resize: function() {
      var e = this.baseScale;
      this.width / this.height > this.defaultWidth / this.defaultHeight ? (this.baseScale = this.height / this.defaultHeight, this.baseTransX = Math.abs(this.width - this.defaultWidth * this.baseScale) / (2 * this.baseScale)) : (this.baseScale = this.width / this.defaultWidth, this.baseTransY = Math.abs(this.height - this.defaultHeight * this.baseScale) / (2 * this.baseScale)), this.scale *= this.baseScale / e, this.transX *= this.baseScale / e, this.transY *= this.baseScale / e
   },
   setSize: function() {
      this.width = this.container.width(), this.height = this.container.height(), this.resize(), this.canvas.setSize(this.width, this.height), this.applyTransform()
   },
   reset: function() {
      var e, t;
      for (e in this.series)
         for (t = 0; t < this.series[e].length; t++) this.series[e][t].clear();
      this.scale = this.baseScale, this.transX = this.baseTransX, this.transY = this.baseTransY, this.applyTransform()
   },
   applyTransform: function() {
      var e, t, n, r;
      this.defaultWidth * this.scale <= this.width ? (e = (this.width - this.defaultWidth * this.scale) / (2 * this.scale), n = (this.width - this.defaultWidth * this.scale) / (2 * this.scale)) : (e = 0, n = (this.width - this.defaultWidth * this.scale) / this.scale), this.defaultHeight * this.scale <= this.height ? (t = (this.height - this.defaultHeight * this.scale) / (2 * this.scale), r = (this.height - this.defaultHeight * this.scale) / (2 * this.scale)) : (t = 0, r = (this.height - this.defaultHeight * this.scale) / this.scale), this.transY > t ? this.transY = t : this.transY < r && (this.transY = r), this.transX > e ? this.transX = e : this.transX < n && (this.transX = n), this.canvas.applyTransformParams(this.scale, this.transX, this.transY), this.markers && this.repositionMarkers(), this.container.trigger("viewportChange", [this.scale / this.baseScale, this.transX, this.transY])
   },
   bindContainerEvents: function() {
      var e = !1,
         t, n, r = this;
      this.container.mousemove(function(i) {
         return e && (r.transX -= (t - i.pageX) / r.scale, r.transY -= (n - i.pageY) / r.scale, r.applyTransform(), t = i.pageX, n = i.pageY), !1
      }).mousedown(function(r) {
         return e = !0, t = r.pageX, n = r.pageY, !1
      }), jvm.$("body").mouseup(function() {
         e = !1
      }), this.params.zoomOnScroll && this.container.mousewheel(function(e, t, n, i) {
         var s = jvm.$(r.container).offset(),
            o = e.pageX - s.left,
            u = e.pageY - s.top,
            a = Math.pow(1.3, i);
         r.label.hide(), r.setScale(r.scale * a, o, u), e.preventDefault()
      })
   },
   bindContainerTouchEvents: function() {
      var e, t, n = this,
         r, i, s, o, u, a = function(a) {
            var f = a.originalEvent.touches,
               l, c, h, p;
            a.type == "touchstart" && (u = 0), f.length == 1 ? (u == 1 && (h = n.transX, p = n.transY, n.transX -= (r - f[0].pageX) / n.scale, n.transY -= (i - f[0].pageY) / n.scale, n.applyTransform(), n.label.hide(), (h != n.transX || p != n.transY) && a.preventDefault()), r = f[0].pageX, i = f[0].pageY) : f.length == 2 && (u == 2 ? (c = Math.sqrt(Math.pow(f[0].pageX - f[1].pageX, 2) + Math.pow(f[0].pageY - f[1].pageY, 2)) / t, n.setScale(e * c, s, o), n.label.hide(), a.preventDefault()) : (l = jvm.$(n.container).offset(), f[0].pageX > f[1].pageX ? s = f[1].pageX + (f[0].pageX - f[1].pageX) / 2 : s = f[0].pageX + (f[1].pageX - f[0].pageX) / 2, f[0].pageY > f[1].pageY ? o = f[1].pageY + (f[0].pageY - f[1].pageY) / 2 : o = f[0].pageY + (f[1].pageY - f[0].pageY) / 2, s -= l.left, o -= l.top, e = n.scale, t = Math.sqrt(Math.pow(f[0].pageX - f[1].pageX, 2) + Math.pow(f[0].pageY - f[1].pageY, 2)))), u = f.length
         };
      jvm.$(this.container).bind("touchstart", a), jvm.$(this.container).bind("touchmove", a)
   },
   bindElementEvents: function() {
      var e = this,
         t;
      this.container.mousemove(function() {
         t = !0
      }), this.container.delegate("[class~='jvectormap-element']", "mouseover mouseout", function(t) {
         var n = this,
            r = jvm.$(this).attr("class").baseVal ? jvm.$(this).attr("class").baseVal : jvm.$(this).attr("class"),
            i = r.indexOf("jvectormap-region") === -1 ? "marker" : "region",
            s = i == "region" ? jvm.$(this).attr("data-code") : jvm.$(this).attr("data-index"),
            o = i == "region" ? e.regions[s].element : e.markers[s].element,
            u = i == "region" ? e.mapData.paths[s].name : e.markers[s].config.name || "",
            a = jvm.$.Event(i + "LabelShow.jvectormap"),
            f = jvm.$.Event(i + "Over.jvectormap");
         t.type == "mouseover" ? (e.container.trigger(f, [s]), f.isDefaultPrevented() || o.setHovered(!0), e.label.text(u), e.container.trigger(a, [e.label, s]), a.isDefaultPrevented() || (e.label.show(), e.labelWidth = e.label.width(), e.labelHeight = e.label.height())) : (o.setHovered(!1), e.label.hide(), e.container.trigger(i + "Out.jvectormap", [s]))
      }), this.container.delegate("[class~='jvectormap-element']", "mousedown", function(e) {
         t = !1
      }), this.container.delegate("[class~='jvectormap-element']", "mouseup", function(n) {
         var r = this,
            i = jvm.$(this).attr("class").baseVal ? jvm.$(this).attr("class").baseVal : jvm.$(this).attr("class"),
            s = i.indexOf("jvectormap-region") === -1 ? "marker" : "region",
            o = s == "region" ? jvm.$(this).attr("data-code") : jvm.$(this).attr("data-index"),
            u = jvm.$.Event(s + "Click.jvectormap"),
            a = s == "region" ? e.regions[o].element : e.markers[o].element;
         if (!t) {
            e.container.trigger(u, [o]);
            if (s === "region" && e.params.regionsSelectable || s === "marker" && e.params.markersSelectable) u.isDefaultPrevented() || (e.params[s + "sSelectableOne"] && e.clearSelected(s + "s"), a.setSelected(!a.isSelected))
         }
      })
   },
   bindZoomButtons: function() {
      var e = this;
      jvm.$("<div/>").addClass("jvectormap-zoomin").text("+").appendTo(this.container), jvm.$("<div/>").addClass("jvectormap-zoomout").html("&#x2212;").appendTo(this.container), this.container.find(".jvectormap-zoomin").click(function() {
         e.setScale(e.scale * e.params.zoomStep, e.width / 2, e.height / 2)
      }), this.container.find(".jvectormap-zoomout").click(function() {
         e.setScale(e.scale / e.params.zoomStep, e.width / 2, e.height / 2)
      })
   },
   createLabel: function() {
      var e = this;
      this.label = jvm.$("<div/>").addClass("jvectormap-label").appendTo(jvm.$("body")), this.container.mousemove(function(t) {
         var n = t.pageX - 15 - e.labelWidth,
            r = t.pageY - 15 - e.labelHeight;
         n < 5 && (n = t.pageX + 15), r < 5 && (r = t.pageY + 15), e.label.is(":visible") && e.label.css({
            left: n,
            top: r
         })
      })
   },
   setScale: function(e, t, n, r) {
      var i, s = jvm.$.Event("zoom.jvectormap");
      e > this.params.zoomMax * this.baseScale ? e = this.params.zoomMax * this.baseScale : e < this.params.zoomMin * this.baseScale && (e = this.params.zoomMin * this.baseScale), typeof t != "undefined" && typeof n != "undefined" && (i = e / this.scale, r ? (this.transX = t + this.defaultWidth * (this.width / (this.defaultWidth * e)) / 2, this.transY = n + this.defaultHeight * (this.height / (this.defaultHeight * e)) / 2) : (this.transX -= (i - 1) / e * t, this.transY -= (i - 1) / e * n)), this.scale = e, this.applyTransform(), this.container.trigger(s, [e / this.baseScale])
   },
   setFocus: function(e, t, n) {
      var r, i, s, o, u;
      if (jvm.$.isArray(e) || this.regions[e]) {
         jvm.$.isArray(e) ? o = e : o = [e];
         for (u = 0; u < o.length; u++) this.regions[o[u]] && (i = this.regions[o[u]].element.getBBox(), i && (typeof r == "undefined" ? r = i : (s = {
            x: Math.min(r.x, i.x),
            y: Math.min(r.y, i.y),
            width: Math.max(r.x + r.width, i.x + i.width) - Math.min(r.x, i.x),
            height: Math.max(r.y + r.height, i.y + i.height) - Math.min(r.y, i.y)
         }, r = s)));
         this.setScale(Math.min(this.width / r.width, this.height / r.height), -(r.x + r.width / 2), -(r.y + r.height / 2), !0)
      } else e *= this.baseScale, this.setScale(e, -t * this.defaultWidth, -n * this.defaultHeight, !0)
   },
   getSelected: function(e) {
      var t, n = [];
      for (t in this[e]) this[e][t].element.isSelected && n.push(t);
      return n
   },
   getSelectedRegions: function() {
      return this.getSelected("regions")
   },
   getSelectedMarkers: function() {
      return this.getSelected("markers")
   },
   setSelected: function(e, t) {
      var n;
      typeof t != "object" && (t = [t]);
      if (jvm.$.isArray(t))
         for (n = 0; n < t.length; n++) this[e][t[n]].element.setSelected(!0);
      else
         for (n in t) this[e][n].element.setSelected(!!t[n])
   },
   setSelectedRegions: function(e) {
      this.setSelected("regions", e)
   },
   setSelectedMarkers: function(e) {
      this.setSelected("markers", e)
   },
   clearSelected: function(e) {
      var t = {},
         n = this.getSelected(e),
         r;
      for (r = 0; r < n.length; r++) t[n[r]] = !1;
      this.setSelected(e, t)
   },
   clearSelectedRegions: function() {
      this.clearSelected("regions")
   },
   clearSelectedMarkers: function() {
      this.clearSelected("markers")
   },
   getMapObject: function() {
      return this
   },
   getRegionName: function(e) {
      return this.mapData.paths[e].name
   },
   createRegions: function() {
      var e, t, n = this;
      for (e in this.mapData.paths) t = this.canvas.addPath({
         d: this.mapData.paths[e].path,
         "data-code": e
      }, jvm.$.extend(!0, {}, this.params.regionStyle)), jvm.$(t.node).bind("selected", function(e, t) {
         n.container.trigger("regionSelected.jvectormap", [jvm.$(this).attr("data-code"), t, n.getSelectedRegions()])
      }), t.addClass("jvectormap-region jvectormap-element"), this.regions[e] = {
         element: t,
         config: this.mapData.paths[e]
      }
   },
   createMarkers: function(e) {
      var t, n, r, i, s, o = this;
      this.markersGroup = this.markersGroup || this.canvas.addGroup();
      if (jvm.$.isArray(e)) {
         s = e.slice(), e = {};
         for (t = 0; t < s.length; t++) e[t] = s[t]
      }
      for (t in e) i = e[t] instanceof Array ? {
         latLng: e[t]
      } : e[t], r = this.getMarkerPosition(i), r !== !1 && (n = this.canvas.addCircle({
         "data-index": t,
         cx: r.x,
         cy: r.y
      }, jvm.$.extend(!0, {}, this.params.markerStyle, {
         initial: i.style || {}
      }), this.markersGroup), n.addClass("jvectormap-marker jvectormap-element"), jvm.$(n.node).bind("selected", function(e, t) {
         o.container.trigger("markerSelected.jvectormap", [jvm.$(this).attr("data-index"), t, o.getSelectedMarkers()])
      }), this.markers[t] && this.removeMarkers([t]), this.markers[t] = {
         element: n,
         config: i
      })
   },
   repositionMarkers: function() {
      var e, t;
      for (e in this.markers) t = this.getMarkerPosition(this.markers[e].config), t !== !1 && this.markers[e].element.setStyle({
         cx: t.x,
         cy: t.y
      })
   },
   getMarkerPosition: function(e) {
      return jvm.WorldMap.maps[this.params.map].projection ? this.latLngToPoint.apply(this, e.latLng || [0, 0]) : {
         x: e.coords[0] * this.scale + this.transX * this.scale,
         y: e.coords[1] * this.scale + this.transY * this.scale
      }
   },
   addMarker: function(e, t, n) {
      var r = {},
         i = [],
         s, o, n = n || [];
      r[e] = t;
      for (o = 0; o < n.length; o++) s = {}, s[e] = n[o], i.push(s);
      this.addMarkers(r, i)
   },
   addMarkers: function(e, t) {
      var n;
      t = t || [], this.createMarkers(e);
      for (n = 0; n < t.length; n++) this.series.markers[n].setValues(t[n] || {})
   },
   removeMarkers: function(e) {
      var t;
      for (t = 0; t < e.length; t++) this.markers[e[t]].element.remove(), delete this.markers[e[t]]
   },
   removeAllMarkers: function() {
      var e, t = [];
      for (e in this.markers) t.push(e);
      this.removeMarkers(t)
   },
   latLngToPoint: function(e, t) {
      var n, r = jvm.WorldMap.maps[this.params.map].projection,
         i = r.centralMeridian,
         s = this.width - this.baseTransX * 2 * this.baseScale,
         o = this.height - this.baseTransY * 2 * this.baseScale,
         u, a, f = this.scale / this.baseScale;
      return t < -180 + i && (t += 360), n = jvm.Proj[r.type](e, t, i), u = this.getInsetForPoint(n.x, n.y), u ? (a = u.bbox, n.x = (n.x - a[0].x) / (a[1].x - a[0].x) * u.width * this.scale, n.y = (n.y - a[0].y) / (a[1].y - a[0].y) * u.height * this.scale, {
         x: n.x + this.transX * this.scale + u.left * this.scale,
         y: n.y + this.transY * this.scale + u.top * this.scale
      }) : !1
   },
   pointToLatLng: function(e, t) {
      var n = jvm.WorldMap.maps[this.params.map].projection,
         r = n.centralMeridian,
         i = jvm.WorldMap.maps[this.params.map].insets,
         s, o, u, a, f;
      for (s = 0; s < i.length; s++) {
         o = i[s], u = o.bbox, a = e - (this.transX * this.scale + o.left * this.scale), f = t - (this.transY * this.scale + o.top * this.scale), a = a / (o.width * this.scale) * (u[1].x - u[0].x) + u[0].x, f = f / (o.height * this.scale) * (u[1].y - u[0].y) + u[0].y;
         if (a > u[0].x && a < u[1].x && f > u[0].y && f < u[1].y) return jvm.Proj[n.type + "_inv"](a, -f, r)
      }
      return !1
   },
   getInsetForPoint: function(e, t) {
      var n = jvm.WorldMap.maps[this.params.map].insets,
         r, i;
      for (r = 0; r < n.length; r++) {
         i = n[r].bbox;
         if (e > i[0].x && e < i[1].x && t > i[0].y && t < i[1].y) return n[r]
      }
   },
   createSeries: function() {
      var e, t;
      this.series = {
         markers: [],
         regions: []
      };
      for (t in this.params.series)
         for (e = 0; e < this.params.series[t].length; e++) this.series[t][e] = new jvm.DataSeries(this.params.series[t][e], this[t])
   },
   remove: function() {
      this.label.remove(), this.container.remove(), jvm.$(window).unbind("resize", this.onResize)
   }
}, jvm.WorldMap.maps = {}, jvm.WorldMap.defaultParams = {
   map: "world_mill_en",
   backgroundColor: "#505050",
   zoomButtons: !0,
   zoomOnScroll: !0,
   zoomMax: 8,
   zoomMin: 1,
   zoomStep: 1.6,
   regionsSelectable: !1,
   markersSelectable: !1,
   bindTouchEvents: !0,
   regionStyle: {
      initial: {
         fill: "white",
         "fill-opacity": 1,
         stroke: "none",
         "stroke-width": 0,
         "stroke-opacity": 1
      },
      hover: {
         "fill-opacity": .8
      },
      selected: {
         fill: "yellow"
      },
      selectedHover: {}
   },
   markerStyle: {
      initial: {
         fill: "grey",
         stroke: "#505050",
         "fill-opacity": 1,
         "stroke-width": 1,
         "stroke-opacity": 1,
         r: 5
      },
      hover: {
         stroke: "black",
         "stroke-width": 2
      },
      selected: {
         fill: "blue"
      },
      selectedHover: {}
   }
}, jvm.WorldMap.apiEvents = {
   onRegionLabelShow: "regionLabelShow",
   onRegionOver: "regionOver",
   onRegionOut: "regionOut",
   onRegionClick: "regionClick",
   onRegionSelected: "regionSelected",
   onMarkerLabelShow: "markerLabelShow",
   onMarkerOver: "markerOver",
   onMarkerOut: "markerOut",
   onMarkerClick: "markerClick",
   onMarkerSelected: "markerSelected",
   onViewportChange: "viewportChange"
};

/* jVectorMap Map Addon - US LCC EN */
;
$.fn.vectorMap('addMap', 'us_lcc_en', {
   "insets": [{
      "width": 220,
      "top": 440,
      "height": 166.21110208955287,
      "bbox": [{
         "y": -9267552.531674266,
         "x": -5155290.453049839
      }, {
         "y": -6764289.414370112,
         "x": -1841926.430529895
      }],
      "left": 0
   }, {
      "width": 80,
      "top": 460,
      "height": 143.8328614221207,
      "bbox": [{
         "y": -4795881.34814295,
         "x": -6003393.339321571
      }, {
         "y": -4216840.972769757,
         "x": -5681330.42844124
      }],
      "left": 245
   }, {
      "width": 900.0,
      "top": 0,
      "height": 551.902671908889,
      "bbox": [{
         "y": -5998757.840416584,
         "x": -2034551.3272073336
      }, {
         "y": -3186864.9120395393,
         "x": 2550865.2042732784
      }],
      "left": 0
   }],
   "paths": {
      "US-VA": {
         "path": "M684.15,290.12l1.59,-0.92l1.65,-0.49l1.11,-0.95l3.57,-1.7l0.73,-2.31l0.83,-0.2l2.32,-1.54l0.04,-1.79l2.04,-1.86l-0.13,-1.56l0.25,-0.41l5.0,-4.09l4.74,-5.97l0.1,0.61l0.97,0.52l0.34,1.35l1.33,0.71l0.71,0.79l1.47,0.07l2.1,1.08l1.41,-0.11l0.79,-0.41l0.76,-1.22l1.18,-0.57l0.53,-1.36l2.74,1.43l1.42,-1.1l2.25,-1.01l0.77,0.05l1.07,-0.96l0.33,-0.82l-0.49,-0.94l0.23,-0.41l1.91,0.55l3.25,-2.63l0.3,-0.1l0.51,0.71l0.66,-0.08l2.37,-2.33l0.17,-0.85l-0.5,-0.49l0.98,-1.12l0.1,-0.6l-0.29,-0.5l-1.01,-0.43l0.69,-2.99l2.58,-4.76l0.54,-2.12l-0.02,-1.88l1.6,-2.53l-0.22,-0.92l0.24,-0.83l0.5,-0.48l0.38,-1.68l-0.02,-3.13l1.24,0.17l1.19,1.69l3.81,0.37l0.58,-0.28l1.03,-2.5l0.18,-2.33l0.7,-1.04l-0.05,-1.59l0.75,-2.28l1.8,0.72l0.65,-0.18l1.29,-3.27l0.57,0.04l0.59,-0.39l0.51,-1.19l0.81,-0.68l0.43,-1.78l1.36,-2.42l-0.37,-2.53l0.53,-1.74l-0.32,-1.97l9.23,4.37l0.58,-0.3l0.61,-3.95l2.61,-0.11l0.63,0.55l1.06,0.21l-0.5,1.72l0.62,0.87l1.62,0.81l2.53,-0.08l1.04,1.14l1.64,0.09l1.95,1.46l0.58,2.48l-0.94,0.78l-0.45,0.03l-0.3,0.43l0.12,0.7l-0.61,-0.05l-0.48,0.59l-0.35,2.47l0.08,2.25l-0.43,0.25l0.01,0.6l1.04,0.73l-0.35,0.14l-0.17,0.6l0.45,0.3l1.64,-0.1l1.38,-0.62l1.77,-1.62l0.4,0.56l-0.58,0.35l0.03,0.59l1.91,1.03l0.65,1.06l1.7,0.31l1.38,-0.13l0.95,0.47l0.82,-0.66l1.06,-0.1l0.33,0.55l1.26,0.59l-0.09,0.54l0.37,0.54l0.94,-0.24l0.42,0.54l3.97,0.8l0.26,1.1l-0.87,-0.4l-0.56,0.45l0.9,1.7l-0.35,0.57l0.62,0.77l-0.42,0.88l0.23,0.58l-1.36,-0.33l-0.59,-0.7l-0.66,0.19l-0.1,0.43l-2.47,-2.24l-0.55,0.06l-0.38,-0.54l-0.52,0.32l-1.37,-1.46l-1.24,-0.4l-2.88,-2.64l-1.34,-0.1l-1.12,-0.78l-1.17,0.07l-0.39,0.52l0.48,0.71l1.1,-0.03l0.64,0.66l1.33,0.05l0.6,0.41l0.63,1.37l1.47,1.07l1.14,0.32l1.54,1.75l2.56,0.89l1.41,1.84l2.15,-0.05l1.26,0.45l-0.58,0.69l0.31,0.48l2.03,0.31l0.27,0.7l0.56,0.09l0.14,1.64l-1.01,-0.73l-0.39,0.21l-1.14,-0.97l-0.58,0.3l0.11,0.81l-0.3,0.68l0.7,0.69l-0.16,0.59l1.12,0.3l-0.86,0.45l-2.14,-0.68l-1.4,-1.34l-0.84,-0.3l-2.25,-1.81l-0.57,0.12l-0.21,0.53l0.27,0.8l0.64,0.2l3.84,3.04l2.7,1.06l1.28,-0.35l0.46,1.05l1.27,0.23l-0.43,0.66l0.3,0.56l0.93,-0.2l0.01,1.21l-0.92,0.42l-0.57,0.74l-0.72,-0.91l-3.22,-1.51l-0.3,-1.14l-0.6,-0.57l-0.86,-0.1l-1.2,0.68l-1.72,-0.41l-0.37,-1.13l-0.71,-0.04l-0.05,1.3l-0.33,0.41l-1.44,-1.28l-0.51,0.1l-0.49,0.57l-0.66,-0.38l-0.98,0.46l-2.23,-0.07l-0.37,0.94l0.35,0.45l1.91,0.18l1.4,-0.33l0.85,0.23l0.56,-0.69l0.64,0.86l1.35,0.4l1.96,-0.34l1.51,0.68l0.67,-0.64l0.96,2.43l3.18,1.16l0.38,0.88l-0.57,1.02l0.56,0.43l1.72,-1.32l0.89,-0.03l0.84,0.63l0.79,-0.28l-0.62,-0.88l-0.2,-1.14l3.79,0.02l1.13,-0.45l1.91,3.14l-0.45,0.71l0.68,3.04l-1.2,-0.55l-0.01,0.87l-33.61,8.85l-34.62,8.17l-19.56,3.56l-11.81,1.37l-0.82,0.62l-28.25,5.27ZM782.77,223.09l0.13,0.08l-0.05,0.06l-0.01,-0.03l-0.07,-0.12ZM809.86,243.6l0.52,-1.12l-0.27,-0.54l-0.36,-0.07l0.57,-0.97l-0.39,-0.71l-0.03,-0.47l0.43,-0.35l-0.18,-0.72l0.63,-0.31l0.22,-0.6l0.12,-2.29l1.01,-0.4l-0.13,-0.88l0.48,-0.14l-0.27,-1.51l-0.77,-0.39l0.85,-0.56l0.09,-1.02l2.68,-1.14l0.39,2.43l-1.05,4.15l-0.21,2.35l0.34,1.06l-0.33,0.97l-0.61,-0.77l-0.8,0.16l-0.38,0.95l0.26,0.36l-0.64,0.46l-0.3,0.85l0.17,1.04l-0.3,1.44l0.4,2.43l-0.6,0.59l0.07,1.31l-1.39,-1.86l0.22,-0.92l-0.34,-1.54l0.28,-0.97l-0.38,-0.29Z",
         "name": "Virginia"
      },
      "US-PA": {
         "path": "M717.56,161.53l0.63,-0.19l4.28,-3.74l1.16,5.12l0.48,0.3l34.83,-8.31l34.25,-9.05l1.43,0.55l0.73,1.36l0.63,0.12l0.77,-0.34l1.24,0.56l0.16,0.84l0.81,0.39l-0.15,0.58l0.92,2.65l1.92,2.02l2.12,0.71l2.21,-0.24l0.72,0.77l-0.89,0.87l-0.71,1.48l-0.16,2.23l-1.39,3.33l-1.36,1.59l0.04,0.79l1.8,1.66l-0.29,1.63l-0.84,0.44l-0.22,0.65l0.15,1.46l1.06,2.82l0.53,0.24l1.2,-0.2l1.2,2.33l0.96,0.56l0.66,-0.27l0.61,0.88l4.26,2.64l0.12,0.39l-1.28,0.94l-3.69,4.22l-0.22,0.75l0.18,0.88l-1.35,1.14l-0.84,0.16l-1.32,1.09l-0.32,0.65l-1.72,-0.09l-2.03,0.86l-1.14,1.36l-0.4,1.38l-37.24,9.65l-39.13,9.08l-10.34,-47.42l1.91,-1.23l3.06,-3.05Z",
         "name": "Pennsylvania"
      },
      "US-TN": {
         "path": "M573.2,341.46l0.85,-0.82l0.29,-1.35l1.01,0.04l0.65,-0.79l-1.01,-4.82l1.41,-1.91l0.06,-1.31l1.19,-0.47l0.36,-0.48l-0.64,-1.29l0.52,-0.64l0.05,-0.56l-0.9,-1.3l2.56,-1.56l1.09,-1.12l-0.14,-0.84l-0.85,-0.52l0.13,-0.18l0.34,-0.16l0.85,0.36l0.45,-0.33l-0.27,-1.3l-0.85,-0.88l0.05,-0.69l0.5,-1.41l1.01,-1.1l-1.35,-2.02l1.37,-0.22l0.61,-0.55l-0.14,-0.64l-1.18,-0.79l0.82,-0.15l0.58,-0.54l0.13,-0.69l-0.59,-1.35l0.02,-0.36l0.38,0.53l0.47,0.07l1.18,-1.14l23.75,-2.95l0.35,-0.41l-0.1,-1.33l-0.84,-2.34l2.99,-0.1l0.82,0.57l22.86,-3.69l7.67,-0.52l7.52,-0.92l32.92,-4.79l1.11,-0.6l29.37,-5.47l0.73,-0.6l3.56,-0.57l-0.39,1.41l0.44,0.84l-0.39,1.97l0.36,0.8l-1.15,-0.02l-1.71,1.79l-1.19,3.85l-0.55,0.7l-0.57,0.08l-0.64,-0.72l-1.44,-0.0l-2.67,1.74l-1.41,2.71l-0.96,0.89l-0.34,-0.33l-0.14,-1.04l-0.73,-0.52l-0.53,0.15l-2.3,1.81l-0.29,1.31l-0.94,-0.23l-0.89,0.48l-0.16,0.76l0.33,0.71l-0.84,2.15l-1.29,0.07l-1.75,1.14l-1.28,1.24l-0.61,1.05l-0.78,0.28l-2.28,2.45l-4.05,0.81l-2.58,1.7l-0.49,1.08l-0.88,0.55l-0.55,0.8l-0.17,2.85l-0.35,0.6l-1.66,0.53l-0.89,-0.15l-1.06,1.14l0.23,5.18l-20.28,3.48l-21.69,3.21l-25.86,3.15l-0.13,0.28l-7.43,0.94l-28.83,3.33Z",
         "name": "Tennessee"
      },
      "US-ID": {
         "path": "M132.97,123.81l-0.34,-0.44l0.1,-1.98l0.55,-1.73l1.43,-1.2l2.14,-3.56l1.69,-0.91l1.4,-1.51l1.09,-2.13l0.06,-1.21l2.23,-2.39l1.45,-2.68l0.38,-1.36l2.06,-2.24l1.91,-2.8l0.04,-1.01l-0.76,-2.96l-2.11,-1.96l-0.86,-0.37l-0.84,-1.62l-0.39,-3.03l-0.58,-1.2l0.95,-1.18l-0.1,-2.36l-1.01,-2.71l0.47,-0.99l10.25,-55.09l13.33,2.45l-3.77,21.08l1.25,2.93l0.98,1.29l0.25,1.57l1.15,1.79l-0.13,0.84l0.38,1.16l-1.0,0.96l0.82,1.79l-0.84,0.11l-0.28,0.71l1.91,1.71l1.01,2.06l2.23,1.25l0.47,1.49l1.14,1.46l1.46,2.82l0.08,0.69l1.62,1.83l-0.01,1.89l1.78,1.73l-0.08,1.36l0.74,0.19l0.9,-0.58l0.35,0.47l-0.36,0.55l0.06,0.54l1.1,0.97l1.61,0.16l1.82,-0.35l-0.65,2.62l-0.99,0.53l0.25,1.14l-1.86,3.74l0.05,1.72l-0.81,0.07l-0.37,0.54l0.59,1.33l-0.62,0.9l-0.04,1.17l0.96,0.94l-0.37,0.81l0.27,1.02l-1.57,0.42l-1.22,1.41l0.09,1.11l0.45,0.78l-0.14,0.74l-0.83,0.77l-0.21,1.52l1.48,0.64l1.37,1.8l0.78,0.28l1.08,-0.34l0.56,-0.79l1.85,-0.4l1.22,-1.27l0.82,-0.29l0.16,-0.76l0.78,0.82l0.22,0.71l1.05,0.65l-0.43,1.23l0.72,0.95l-0.35,1.37l0.56,1.35l-0.22,1.61l1.53,2.65l0.3,1.73l0.82,0.37l0.65,2.08l-0.19,0.98l-0.77,0.63l0.5,1.9l1.23,1.16l0.3,0.79l0.81,0.09l0.87,-0.36l1.04,0.93l1.04,2.79l-0.51,0.81l0.88,1.83l-0.28,0.59l0.11,0.98l2.28,2.42l0.97,-0.13l-0.0,-1.13l1.08,-0.88l0.93,-0.21l4.53,1.64l0.69,-0.31l0.68,-1.34l1.2,-0.39l2.25,0.94l3.3,-0.08l0.95,0.88l2.29,-0.56l3.23,0.8l0.46,-0.49l-0.67,-0.77l0.26,-1.05l0.74,-0.47l-0.06,-0.96l1.23,-0.5l0.48,0.37l1.06,2.11l0.12,1.11l1.36,1.95l0.73,0.45l-6.5,53.36l-47.53,-6.62l-47.01,-8.09l7.13,-38.73l1.13,-1.16l1.09,-2.65l-0.2,-1.74l0.74,-0.14l0.78,-1.6l-0.89,-1.27l-0.17,-1.2l-1.24,-0.09l-0.63,-0.82l-0.89,0.28Z",
         "name": "Idaho"
      },
      "US-NV": {
         "path": "M138.94,329.03l-12.68,-16.85l-36.47,-50.78l-25.23,-34.32l14.11,-63.12l46.9,9.68l47.03,8.11l-19.28,123.81l-0.91,1.13l-1.0,2.15l-0.44,0.17l-1.35,-0.23l-0.97,-2.22l-0.7,-0.63l-1.42,0.2l-1.95,-1.03l-1.61,0.21l-1.8,0.93l-0.78,2.44l0.87,2.57l-0.61,0.95l-0.25,1.29l0.37,3.09l-0.77,2.5l0.76,3.67l-0.15,3.03l-0.31,1.05l-1.05,0.3l-0.12,0.51l0.32,0.79l-0.53,0.61Z",
         "name": "Nevada"
      },
      "US-TX": {
         "path": "M276.14,412.63l33.26,2.09l32.98,1.42l0.41,-0.38l3.72,-97.69l25.97,0.65l26.4,0.23l0.05,41.52l0.44,0.4l1.03,-0.13l0.79,0.27l3.76,3.78l1.67,0.2l0.88,-0.57l2.5,0.64l0.6,-0.67l0.11,-1.04l0.61,0.75l0.93,0.22l0.38,0.92l0.77,0.77l-0.01,1.62l0.53,0.83l2.86,0.42l1.26,-0.2l1.39,0.88l2.8,0.68l1.83,-0.56l0.63,0.1l1.9,1.78l1.41,-0.11l1.26,-1.42l2.44,0.26l1.68,-0.45l0.32,2.59l2.31,0.73l-0.04,2.07l1.56,0.78l1.82,-0.65l1.58,-1.66l1.03,-0.64l0.41,0.19l0.45,1.62l2.02,0.2l0.25,1.04l0.72,0.47l1.47,-0.21l0.89,-0.93l0.39,0.33l0.59,-0.08l0.61,-0.98l0.26,0.4l-0.45,1.22l0.14,0.76l0.68,1.13l0.78,0.41l0.57,-0.04l0.6,-0.5l0.69,-2.34l0.91,-0.65l0.35,-1.53l0.57,-0.14l0.41,0.14l0.29,0.98l0.58,0.63l1.21,0.01l0.83,0.49l1.26,-0.2l0.69,-1.33l0.49,0.15l-0.13,0.69l0.49,0.69l1.21,0.44l0.49,0.71l1.53,-0.05l1.5,1.72l0.51,0.02l0.63,-0.62l0.08,-0.71l1.5,-0.1l0.93,-1.42l1.89,-0.41l1.67,-1.13l1.53,0.83l1.51,-0.22l0.29,-0.83l2.3,-0.73l0.53,-0.55l0.51,0.32l0.38,0.87l1.83,0.41l1.7,-0.06l1.87,-1.14l0.42,-1.04l1.07,0.3l2.25,1.54l1.16,0.17l1.8,2.05l2.15,0.39l1.05,0.91l0.76,-0.11l2.5,0.84l1.05,0.03l0.37,0.78l1.39,0.96l1.45,-0.12l0.39,-0.71l0.81,0.36l0.88,-0.4l0.93,0.34l0.76,-0.16l0.64,0.36l2.31,33.8l1.53,1.66l1.31,0.82l1.26,1.86l0.58,1.63l-0.09,2.64l1.01,1.2l0.85,0.39l-0.11,0.85l0.75,0.54l0.29,0.87l0.66,0.69l-0.19,1.17l1.01,1.02l0.6,1.63l0.51,0.34l0.55,-0.11l-0.16,1.71l0.82,1.21l-0.64,0.25l-0.35,0.68l0.78,1.26l-0.55,0.89l0.19,1.39l-0.75,2.69l-0.75,0.85l-0.36,1.55l-0.8,1.13l0.65,2.0l-0.83,2.29l0.17,1.08l0.84,1.2l-0.18,1.01l0.5,1.61l-0.24,1.41l-1.13,1.68l-1.03,0.21l-1.76,3.39l-0.04,1.07l1.81,2.38l-3.45,0.09l-7.41,3.83l-0.02,-0.44l-2.2,-0.46l-3.27,1.09l1.09,-3.54l-0.3,-1.22l-0.81,-0.76l-0.62,-0.07l-1.53,0.86l-0.99,2.02l-1.57,-0.96l-1.65,0.13l-0.07,0.63l0.9,0.62l0.01,1.06l0.56,0.39l-0.47,0.7l0.07,1.02l1.65,0.64l-0.63,0.72l0.49,0.98l0.91,0.23l0.28,0.38l-0.41,1.27l-0.46,-0.12l-0.98,0.82l-1.73,2.27l-1.19,-0.41l-0.49,0.13l0.33,1.01l0.08,2.57l-1.86,1.51l-1.92,2.13l-0.97,0.37l-4.13,2.94l-3.32,0.46l-2.56,1.08l-0.2,1.14l-0.76,-0.35l-2.05,0.9l-0.34,-0.35l-1.12,0.18l0.43,-0.88l-0.53,-0.6l-1.44,0.23l-1.22,1.1l-0.61,-0.63l-0.11,-1.21l-1.39,-0.82l-0.5,0.44l0.66,1.45l0.02,1.14l-0.72,0.09l-0.54,-0.44l-0.76,-0.0l-0.56,-1.35l-1.47,-0.38l-0.58,0.39l0.04,0.55l0.95,1.72l0.03,1.25l0.58,0.37l0.37,-0.16l1.15,0.79l-0.76,0.38l-0.27,0.54l0.15,0.37l0.7,0.23l1.09,-0.55l0.97,0.61l-4.3,2.46l-0.58,-0.13l-0.38,-1.46l-0.51,-0.19l-1.14,-1.48l-0.49,-0.03l-0.48,0.51l0.12,0.64l-0.64,0.35l-0.05,0.51l1.2,1.64l-0.31,1.06l0.34,0.86l-1.67,1.82l-0.38,0.2l0.38,-0.66l-0.19,-0.72l0.25,-0.74l-0.46,-0.68l-0.52,0.17l-0.72,1.11l0.26,0.73l-0.4,0.97l-0.07,-1.15l-0.52,-0.55l-1.96,1.31l-0.78,-0.33l-0.7,0.52l0.07,0.76l-0.82,1.01l0.02,0.49l1.26,0.64l0.03,0.58l0.79,0.28l0.7,-1.43l0.87,-0.42l0.01,0.64l-2.84,4.43l-1.24,-1.01l-1.37,0.39l-0.33,-0.35l-2.42,0.4l-0.47,-0.32l-0.65,0.17l-0.18,0.58l0.41,0.62l0.56,0.38l1.55,0.02l-0.01,0.93l0.56,0.65l2.09,1.05l-2.71,7.78l-0.22,0.11l-0.38,-0.56l-0.34,0.1l0.18,-0.78l-0.57,-0.43l-2.37,1.99l-1.74,-2.41l-1.2,-0.93l-0.61,0.4l0.09,0.53l1.46,2.04l-0.1,0.84l-0.95,-0.09l-0.33,0.63l0.51,0.57l1.9,0.07l2.16,0.73l2.11,-0.74l-0.44,1.79l0.24,0.79l-0.98,0.71l0.38,1.63l-1.13,0.15l-0.43,0.41l0.41,2.15l-0.33,1.63l0.45,0.64l0.85,0.24l0.89,2.93l0.72,2.88l-0.92,0.84l0.63,0.49l-0.08,1.31l0.73,0.3l0.18,0.63l0.59,0.29l0.4,1.84l0.7,0.31l0.44,3.31l0.81,0.56l0.7,0.08l-0.32,0.2l-0.23,0.95l0.32,1.11l-0.65,0.8l-0.85,-0.05l-0.54,0.45l0.09,1.35l-0.49,-0.34l-0.5,0.26l-0.39,-0.68l-1.5,-0.47l-2.95,-2.6l-2.23,-0.18l-0.81,-0.52l-4.24,0.1l-0.9,0.44l-0.79,-0.64l-1.07,0.26l-1.26,-0.21l-1.47,-0.72l-0.73,-1.0l-0.62,-0.14l-0.2,-0.74l-1.18,-0.5l-1.0,-0.02l-2.0,-0.89l-1.47,0.4l-0.84,-1.12l-0.61,-0.21l-1.44,-1.42l-1.98,0.01l-1.48,-0.66l-0.86,0.12l-1.64,-0.43l0.29,-1.29l-0.54,-1.03l-0.96,-0.36l-1.67,-6.18l-2.79,-3.08l-0.29,-1.14l-1.09,-0.77l0.35,-0.79l-0.24,-0.77l0.34,-2.23l-0.45,-0.97l-1.06,-1.03l0.66,-2.04l0.05,-1.21l-0.18,-0.71l-0.55,-0.33l-0.15,-1.85l-1.86,-1.46l-0.86,0.22l-0.3,-0.42l-0.81,-0.11l-0.75,-1.33l-2.25,-1.75l0.01,-0.7l-0.51,-0.59l0.12,-0.88l-0.98,-0.93l-0.08,-0.76l-1.13,-0.62l-1.31,-2.92l-2.68,-1.5l-0.38,-0.93l-1.14,-0.6l-0.06,-1.18l-0.83,-1.2l-0.23,-1.46l-0.36,-0.52l0.42,-0.22l-0.04,-0.73l-1.04,-0.5l-0.26,-1.31l-0.82,-0.58l-0.95,-1.76l-0.61,-2.41l-1.86,-2.38l-0.87,-4.28l-1.82,-1.35l0.05,-0.71l-0.76,-1.22l-1.32,-0.76l-0.92,-0.99l-1.75,-0.95l-0.71,-1.87l-1.83,-0.62l-1.45,-1.0l-0.01,-1.64l-0.6,-0.39l-0.89,0.24l-0.12,-0.78l-0.99,-0.33l-0.8,-2.09l-0.56,-0.47l-0.47,0.12l-0.46,-0.44l-0.86,0.27l-0.14,-0.61l-0.44,-0.31l-0.47,0.15l-0.26,0.61l-1.06,0.16l-2.91,-0.47l-0.39,-0.38l-1.49,-0.03l-0.79,0.29l-0.77,-0.44l-2.68,0.27l-3.95,-2.1l-1.36,0.86l-0.65,1.62l-2.0,-0.18l-0.52,0.45l-0.49,-0.17l-1.05,0.49l-1.34,0.14l-3.25,6.44l-0.19,1.78l-0.77,0.67l-0.39,1.81l0.35,0.6l-2.01,1.01l-0.73,1.31l-1.12,0.66l-1.13,2.02l-2.69,-0.47l-1.04,-0.88l-0.55,0.3l-1.71,-1.22l-1.31,-1.64l-2.92,-0.86l-1.16,-0.96l-0.02,-0.67l-0.42,-0.41l-2.77,-0.52l-2.29,-1.05l-1.9,-1.77l-0.91,-1.54l-0.97,-0.92l-1.54,-0.29l-1.78,-1.27l-0.22,-0.56l-1.32,-1.19l-0.65,-2.7l-0.87,-1.02l-0.24,-1.11l-0.76,-1.28l-0.26,-2.35l0.53,-3.06l-3.01,-5.09l-0.05,-1.94l-1.26,-2.52l-0.99,-0.44l-0.43,-1.24l-1.44,-0.81l-2.16,-2.18l-1.03,-0.1l-2.02,-1.26l-3.2,-3.36l-0.59,-1.56l-3.14,-2.56l-1.59,-2.45l-1.2,-0.95l-0.61,-1.05l-4.44,-2.62l-1.19,-2.19l-1.21,-3.23l-1.38,-1.09l-1.13,-0.08l-1.76,-1.68l-0.78,-3.04ZM503.52,468.36l-0.35,0.19l0.19,-0.17l0.16,-0.02ZM500.13,471.02l-0.12,0.17l-0.05,0.03l0.18,-0.2ZM499.19,472.55l0.16,0.05l-0.21,0.2l0.04,-0.13l0.01,-0.12ZM498.43,473.45l-0.15,0.14l0.04,-0.1l0.11,-0.04ZM468.75,489.63l0.04,0.02l-0.03,0.02l-0.0,-0.04ZM455.12,548.8l0.78,-0.53l0.25,-0.72l0.12,1.15l-1.14,0.1ZM462.07,500.4l-0.15,-0.61l1.24,-0.37l-0.3,0.35l-0.8,0.64ZM464.7,498.41l0.11,-0.25l1.31,-0.91l-0.95,0.88l-0.47,0.27ZM466.99,496.67l0.29,-0.26l0.49,-0.04l-0.27,0.14l-0.52,0.16ZM459.12,503.58l0.71,-1.67l0.64,-0.73l-0.01,0.78l-1.34,1.62ZM452.17,516.05l0.07,-0.29l0.1,-0.22l-0.17,0.5ZM452.62,514.77l0.17,-0.39l0.04,-0.06l-0.21,0.45ZM453.57,512.77l-0.01,-0.06l0.06,-0.05l-0.05,0.11Z",
         "name": "Texas"
      },
      "US-NH": {
         "path": "M830.68,105.86l0.18,-1.32l-1.48,-5.32l0.52,-1.45l-0.31,-2.2l0.98,-1.86l-0.16,-2.28l0.61,-2.28l-0.45,-0.61l0.27,-2.29l-0.98,-3.77l0.08,-0.7l0.3,-0.46l1.83,-0.83l0.68,-1.39l1.42,-1.64l0.72,-1.8l-0.26,-1.12l0.51,-0.63l-2.38,-3.45l0.83,-3.26l-0.12,-0.78l-0.82,-1.28l0.26,-0.6l-0.24,-0.7l0.44,-3.2l-0.37,-0.82l0.89,-1.5l2.44,0.3l0.64,-0.89l13.44,34.54l0.88,3.61l2.62,2.16l0.88,0.32l0.38,1.58l1.73,1.27l0.01,0.34l0.78,0.22l-0.05,0.57l-0.43,3.08l-1.57,0.26l-1.31,1.21l-0.5,0.94l-0.96,0.38l-0.49,1.67l-1.08,1.44l-17.58,5.0l-1.71,-1.39l-0.42,-0.87l-0.12,-1.98l0.53,-0.59l0.03,-0.52l-1.08,-5.12Z",
         "name": "New Hampshire"
      },
      "US-NY": {
         "path": "M822.66,166.36l0.68,-2.03l0.63,-0.03l0.54,-0.75l0.77,0.13l0.53,-0.42l-0.04,-0.3l0.57,-0.04l0.27,-0.66l0.66,-0.03l0.19,-0.55l-0.43,-0.81l0.22,-0.53l0.61,-0.38l1.34,0.19l0.53,-0.6l1.46,-0.2l0.21,-0.8l1.86,-0.01l1.08,-0.91l0.11,-0.79l0.62,0.24l0.43,-0.61l4.82,-1.35l2.25,-1.32l1.97,-2.91l-0.19,1.14l-0.97,0.86l-1.21,2.3l0.55,0.46l1.59,-0.37l0.28,0.61l-0.42,0.49l-1.37,0.88l-0.51,-0.06l-2.25,0.95l-0.07,0.92l-0.87,0.01l-2.72,1.74l-1.01,0.16l-0.17,0.79l-1.24,0.11l-2.23,1.92l-4.43,2.22l-0.2,0.71l-0.28,0.08l-0.46,-0.81l-1.41,-0.04l-0.73,0.42l-0.41,0.81l0.22,0.3l-0.91,0.7l-0.76,-0.81l0.32,-1.04ZM829.28,158.96l-0.01,-0.01l0.02,-0.06l-0.01,0.07ZM846.33,148.77l0.14,-0.09l0.08,-0.01l-0.11,0.18l-0.12,-0.07ZM845.51,154.6l0.09,-0.87l0.73,-1.16l1.63,-1.53l1.01,0.29l0.04,-0.81l0.79,0.65l-3.33,3.22l-0.67,0.46l-0.31,-0.24ZM723.17,157.08l3.74,-3.86l1.26,-2.18l1.74,-1.87l1.16,-0.79l1.26,-3.33l1.55,-1.31l0.53,-0.83l-0.22,-1.82l-1.63,-2.37l0.42,-1.12l-0.18,-0.78l-0.84,-0.52l-2.11,0.02l0.04,-0.98l-0.59,-2.19l4.97,-2.98l4.48,-1.84l2.38,-0.22l1.83,-0.76l5.64,-0.31l3.14,1.2l3.15,-1.71l5.49,-1.13l0.58,0.44l0.68,-0.2l0.11,-0.98l1.45,-0.74l1.02,-0.94l0.74,-0.21l0.67,-2.04l1.86,-1.77l0.77,-1.27l1.12,0.02l1.12,-0.54l1.05,-1.63l-0.47,-0.69l0.35,-1.19l-0.26,-0.51l-0.64,0.03l-0.18,-1.16l-0.95,-1.56l-1.01,-0.6l0.12,-0.18l0.6,0.38l0.53,-0.27l0.73,-1.44l-0.02,-0.9l0.8,-0.65l-0.02,-0.97l-0.93,-0.18l-0.59,0.7l-0.27,0.12l0.54,-1.29l-0.81,-0.61l-1.26,0.06l-0.86,0.78l-0.99,-0.68l2.02,-2.52l1.76,-1.49l1.64,-2.65l0.7,-0.57l0.11,-0.59l0.77,-0.96l0.07,-0.56l-0.51,-0.94l0.76,-1.9l4.74,-7.65l4.72,-4.55l2.83,-0.55l19.6,-5.91l0.42,0.87l-0.06,2.0l1.03,1.2l0.48,3.78l2.33,3.2l-0.07,1.88l0.88,2.39l-0.58,1.07l0.04,3.4l0.72,0.88l1.35,2.72l0.2,1.08l0.62,0.83l0.16,3.9l0.56,0.83l0.54,0.07l0.53,-0.61l0.05,-0.86l0.33,-0.08l1.06,1.09l4.12,15.39l0.75,1.17l0.37,15.15l0.61,0.61l3.72,15.98l1.27,1.3l-2.79,3.18l0.03,0.55l1.53,1.27l0.19,0.58l-0.77,0.88l-0.63,1.79l-0.41,0.39l0.15,0.67l-1.24,0.65l0.0,-3.96l-0.58,-2.25l-0.76,-1.59l-1.47,-1.06l-0.18,-1.11l-0.7,-0.09l-0.41,1.33l0.69,1.25l1.06,0.8l0.99,2.79l-13.8,-3.78l-1.29,-1.43l-2.39,0.27l-0.63,-0.41l-1.06,-0.13l-1.76,-1.86l-0.76,-2.29l0.11,-0.72l-0.36,-0.62l-0.55,-0.2l0.08,-0.45l-0.36,-0.42l-1.65,-0.64l-1.08,0.33l-0.76,-1.38l-1.71,-0.71l-34.57,9.14l-34.42,8.22l-1.15,-5.07ZM820.13,168.63l1.08,-0.49l0.15,0.61l-1.16,1.52l-0.07,-1.64ZM731.02,138.24l0.02,-0.68l0.78,-0.08l-0.37,1.08l-0.44,-0.32Z",
         "name": "New York"
      },
      "US-HI": {
         "path": "M295.6,602.68l-0.09,-1.67l-0.5,-1.2l-1.36,-1.92l-0.81,-0.52l0.28,-0.81l-0.26,-0.81l1.55,-2.32l3.47,-3.7l1.36,-3.84l-0.34,-0.67l1.34,-3.38l0.03,-3.33l0.97,-1.19l2.6,-0.55l1.38,0.28l3.13,-1.26l1.83,-0.31l0.55,-0.72l-0.02,-3.0l0.55,-1.89l2.08,-1.33l1.79,2.42l-0.22,1.06l1.84,4.02l1.0,0.39l5.15,8.57l0.71,4.42l-1.86,3.54l0.21,0.61l1.56,1.09l-0.87,2.31l0.29,1.69l1.58,3.4l-1.65,1.04l-2.5,-0.21l-3.62,0.59l-4.92,-1.47l-2.28,-1.5l-7.29,-0.13l-1.75,0.29l-1.79,1.35l-1.85,0.68l-1.27,0.03ZM308.01,538.5l1.75,0.1l0.45,2.33l-0.48,2.26l0.38,0.88l2.49,0.98l1.51,0.11l1.61,1.55l0.21,1.73l0.97,1.09l-0.2,1.18l1.85,2.81l-0.19,0.78l-0.73,0.55l-2.03,0.42l-2.01,-0.21l-1.54,-1.33l-2.4,-0.27l-2.86,-1.65l0.09,-1.41l1.37,-2.06l0.56,-2.29l-0.39,-0.61l-1.46,-0.79l-1.08,-1.95l0.04,-2.96l2.08,-1.24ZM298.76,524.37l0.78,0.38l0.35,1.16l2.76,2.23l0.91,1.23l1.01,0.08l0.77,1.87l1.64,1.17l0.79,0.07l1.14,1.28l-1.54,0.5l-2.97,-0.75l-3.3,-4.38l-3.34,-2.24l-1.49,-0.49l-0.0,-0.85l1.78,-0.49l0.7,-0.77ZM302.19,550.7l-2.27,-1.11l-0.3,-0.63l3.27,0.35l-0.7,1.39ZM299.02,540.44l-1.0,-0.33l-0.74,-1.02l1.13,-2.28l-0.43,-2.01l2.82,1.55l0.54,2.32l0.07,1.24l-2.41,0.51ZM282.01,508.46l0.73,-2.05l-0.37,-0.99l-0.01,-3.16l0.89,-1.06l-0.09,-1.35l2.95,2.09l3.17,-0.67l1.72,0.17l0.36,1.13l-0.49,2.4l0.23,1.66l-0.79,0.68l-0.29,1.71l0.32,1.7l0.94,0.57l0.23,1.2l-0.63,1.26l0.55,1.49l-1.41,-0.01l-0.19,-0.54l-2.19,-0.97l-0.68,-3.14l-1.37,-0.44l0.91,-0.17l0.35,-0.47l-0.05,-0.71l-0.64,-0.76l-0.41,-0.26l-0.38,0.43l-1.05,-0.53l0.12,2.05l-2.44,-1.27ZM260.53,470.55l-0.14,-2.24l-0.95,-0.77l-0.68,-1.38l0.16,-1.33l0.12,-0.42l2.67,-0.89l5.01,0.62l0.67,1.16l2.67,1.22l0.69,1.39l-0.28,2.14l-2.6,1.45l-0.88,1.44l-0.85,0.35l-3.09,0.08l-0.91,-1.7l-1.61,-1.12ZM245.8,462.89l-0.21,-0.88l1.2,-0.84l4.77,-0.76l0.54,0.41l-1.11,0.42l-0.79,1.06l-1.81,-0.57l-1.49,0.36l-1.09,0.8Z",
         "name": "Hawaii"
      },
      "US-VT": {
         "path": "M805.92,73.67l25.93,-8.31l0.92,1.83l-0.71,2.38l-0.01,1.54l2.25,2.7l-0.5,0.59l0.28,1.12l-0.65,1.6l-1.33,1.51l-0.63,1.32l-1.72,0.73l-0.61,0.93l-0.09,0.98l0.97,3.7l-0.26,2.43l0.41,0.53l-0.58,2.1l0.18,2.17l-0.98,1.87l0.29,2.34l-0.52,1.54l1.49,5.38l-0.2,1.22l1.1,5.24l-0.57,0.85l0.14,2.29l0.61,1.24l1.51,1.06l-11.42,3.05l-0.57,-0.83l-4.18,-15.56l-1.73,-1.55l-0.9,0.26l-0.29,1.19l-0.12,-0.25l-0.15,-3.88l-0.69,-0.99l-0.15,-0.97l-1.4,-2.82l-0.63,-0.67l-0.02,-3.13l0.58,-1.15l-0.89,-2.54l0.06,-1.92l-0.4,-0.91l-1.57,-1.6l-0.39,-0.8l-0.45,-3.69l-1.04,-1.25l0.09,-1.87l-0.44,-1.0Z",
         "name": "Vermont"
      },
      "US-NM": {
         "path": "M230.53,422.69l12.24,-122.4l25.76,2.35l26.19,1.96l26.22,1.52l25.84,1.07l-0.32,10.07l-0.75,0.39l-3.71,97.67l-32.57,-1.41l-33.72,-2.12l-0.44,0.75l0.53,2.31l0.44,1.25l0.99,0.76l-30.72,-2.59l-0.44,0.36l-0.85,9.43l-14.71,-1.4Z",
         "name": "New Mexico"
      },
      "US-NC": {
         "path": "M829.09,287.59l0.01,-0.01l-0.0,0.0l-0.01,0.0ZM821.62,270.85l0.21,0.22l-0.05,0.01l-0.16,-0.24ZM823.91,275.04l0.2,0.15l-0.02,0.18l-0.06,-0.08l-0.12,-0.24ZM678.55,321.5l0.92,0.16l1.52,-0.4l0.42,-0.39l0.52,-0.97l0.11,-2.67l1.34,-1.19l0.47,-1.04l2.25,-1.47l2.13,-0.54l0.76,0.17l1.32,-0.53l2.36,-2.52l0.78,-0.25l1.84,-2.28l1.49,-1.0l1.55,-0.2l1.14,-2.63l-0.29,-1.2l1.66,0.04l0.5,-1.63l0.93,-0.77l1.08,-0.77l0.52,1.49l1.07,0.32l1.34,-1.17l1.34,-2.62l2.49,-1.6l0.79,0.07l0.83,0.78l1.05,-0.21l0.84,-1.07l1.46,-4.14l1.08,-1.1l1.48,0.07l0.43,-0.31l-0.7,-1.24l0.39,-1.97l-0.43,-0.89l0.38,-1.24l7.44,-0.94l19.59,-3.57l37.28,-8.83l31.16,-8.25l0.41,1.18l3.57,3.14l1.01,1.48l-1.21,-0.97l-0.17,-0.62l-0.93,-0.38l-0.52,0.06l-0.23,0.65l0.66,0.52l0.6,1.52l-0.54,0.02l-0.92,-0.73l-2.32,-0.75l-0.41,-0.47l-0.55,0.14l-0.31,0.69l0.15,0.64l1.38,0.42l1.69,1.33l-1.1,0.66l-2.49,-1.14l-0.35,0.51l0.15,0.42l1.6,1.13l-1.85,-0.3l-2.24,-0.82l-0.46,0.15l0.02,0.48l0.61,0.68l1.7,0.78l-0.96,0.58l0.0,0.6l-0.43,0.53l-1.48,0.76l-0.9,-0.75l-0.6,0.23l-0.1,0.35l-0.2,-0.13l-1.33,-2.26l0.19,-2.6l-0.43,-0.47l-0.9,-0.2l-0.35,0.65l0.62,0.68l-0.43,0.98l-0.01,1.03l0.5,1.7l1.61,2.14l-0.3,1.26l0.49,0.29l2.97,-0.63l2.09,-1.51l0.27,0.01l0.38,0.78l0.76,-0.34l1.57,0.03l0.15,-0.72l-0.56,-0.3l1.28,-0.77l2.04,-0.49l-0.08,1.17l0.64,0.28l-0.59,0.87l0.9,1.16l-0.84,0.12l-0.18,0.67l1.39,0.43l0.26,0.92l-1.21,0.07l-0.18,0.66l0.67,0.57l1.25,-0.18l0.52,0.25l0.4,-0.38l0.16,-1.93l-0.77,-3.27l0.41,-0.49l0.57,0.42l0.93,0.04l0.28,-0.57l-0.29,-0.43l0.46,-0.58l1.74,1.8l0.01,1.39l0.62,0.87l-0.53,0.19l-0.24,0.47l0.91,1.11l-0.08,0.36l-0.41,0.55l-0.78,0.09l-0.91,-0.83l-0.31,0.34l0.14,1.24l-1.07,1.61l0.2,0.56l-0.32,0.22l-0.15,0.98l-0.73,0.55l0.1,0.9l-0.89,0.97l-1.06,0.23l-0.59,-0.36l-0.52,0.52l-0.95,-0.79l-0.86,0.12l-0.4,-0.81l-0.59,-0.2l-0.51,0.38l0.09,0.93l-0.53,0.23l-1.42,-1.21l1.3,-0.41l0.23,-0.87l-0.57,-0.42l-2.03,0.34l-1.13,1.02l0.3,0.67l0.44,0.15l0.1,0.81l0.35,0.24l-0.03,0.12l-0.57,-0.33l-1.69,0.85l-1.13,-0.41l-1.46,0.09l-3.33,-0.64l0.44,1.07l0.98,0.43l0.36,0.63l0.63,0.1l0.88,-0.33l1.69,0.6l2.36,0.35l3.52,0.06l0.47,0.41l-0.05,0.51l-1.0,0.07l-0.24,0.72l-1.61,1.45l0.32,0.58l1.86,-0.03l-2.54,3.5l-1.68,0.07l-1.61,-0.94l-0.91,-0.18l-1.22,-0.99l-1.12,0.09l0.08,0.47l1.05,1.11l2.35,2.03l2.69,0.22l1.31,0.46l1.7,-2.16l0.52,0.45l1.18,0.31l0.39,-0.58l-0.55,-0.87l0.87,0.14l0.2,0.56l0.66,0.23l1.62,-1.21l-0.17,0.59l0.29,0.57l-0.29,0.38l-0.43,-0.2l-0.4,0.37l0.04,0.89l-0.96,1.71l0.02,0.78l-0.72,-0.06l-0.07,-0.73l-1.13,-0.58l-0.41,0.48l0.29,1.46l-0.35,-0.91l-0.84,-0.35l-1.22,1.08l-0.21,0.52l0.25,0.26l-2.03,0.35l-2.75,1.86l-0.68,-1.01l-0.75,-0.28l-0.36,0.49l0.44,1.24l-0.57,-0.01l-0.09,0.82l-0.93,1.72l-0.92,0.85l-0.59,-0.25l0.48,-0.69l-0.03,-0.77l-1.07,-0.9l-0.09,-0.52l-1.69,-0.38l-0.15,0.47l0.44,1.14l0.2,0.32l0.59,0.07l0.3,0.59l-0.88,0.38l-0.08,0.71l0.66,0.62l0.77,0.16l-0.0,0.36l-2.12,1.68l-1.9,2.65l-1.98,4.29l-0.33,2.11l0.13,1.34l-0.16,-1.04l-1.02,-1.56l-0.55,-0.16l-0.29,0.48l1.21,3.9l-0.62,2.26l-3.92,0.24l-1.43,0.66l-0.36,-0.51l-0.58,-0.17l-0.53,1.07l-1.9,1.16l-0.61,-0.01l-23.45,-14.89l-1.05,-0.01l-18.73,3.7l-0.67,-2.73l-3.28,-2.77l-0.46,0.08l-1.23,1.32l-0.02,-1.27l-0.82,-0.52l-22.89,3.59l-0.64,-0.26l-0.62,0.46l-0.25,0.65l-3.99,1.95l-0.89,1.23l-1.02,0.09l-4.79,2.68l-21.02,4.11l-0.36,-4.48l0.71,-0.95ZM819.02,269.97l0.19,0.35l0.25,0.37l-0.46,-0.4l0.02,-0.32ZM809.66,288.69l0.21,0.33l-0.17,-0.08l-0.04,-0.24ZM817.54,297.34l0.15,-0.36l0.16,0.07l-0.13,0.28l-0.18,0.02ZM814.96,297.34l-0.06,-0.28l-0.04,-0.11l0.31,0.26l-0.21,0.13ZM814.94,262.69l0.37,-0.24l0.15,0.4l-0.42,0.08l-0.1,-0.23ZM794.27,327.63l0.04,-0.07l0.22,0.03l-0.0,0.09l-0.26,-0.04Z",
         "name": "North Carolina"
      },
      "US-ND": {
         "path": "M439.1,45.59l2.07,7.05l-0.73,2.58l0.57,2.4l-0.27,1.19l0.48,2.03l0.02,3.32l1.42,4.01l0.45,0.55l-0.08,0.99l0.39,1.54l0.62,0.75l1.49,3.79l-0.05,3.94l0.42,0.71l0.51,8.43l0.51,1.54l0.51,0.25l-0.47,2.66l0.36,1.64l-0.14,1.76l0.69,1.11l0.2,2.17l0.49,1.14l1.81,2.57l0.16,2.21l0.51,1.08l0.17,1.4l-0.24,1.36l0.29,1.75l-27.89,0.76l-28.38,0.2l-28.37,-0.38l-28.48,-0.97l2.91,-66.22l23.01,0.82l25.49,0.43l25.49,-0.06l24.04,-0.51Z",
         "name": "North Dakota"
      },
      "US-NE": {
         "path": "M423.3,177.34l3.93,2.68l3.94,1.88l1.33,-0.22l0.51,-0.47l0.36,-1.07l0.48,-0.2l2.5,0.33l1.32,-0.47l1.59,0.24l3.45,-0.65l2.38,1.96l1.41,0.14l1.55,0.76l1.45,0.08l0.89,1.09l1.48,0.17l-0.06,0.97l1.69,2.06l3.32,0.59l0.19,0.67l-0.21,1.85l1.14,1.92l0.01,2.27l1.16,1.06l0.34,1.69l1.74,1.44l0.07,1.85l1.51,2.07l-0.49,2.3l0.44,3.05l0.52,0.54l0.93,-0.2l-0.03,1.23l1.21,0.49l-0.4,2.32l0.21,0.45l1.12,0.39l-0.59,0.75l-0.09,1.0l0.13,0.59l0.82,0.49l0.16,1.42l-0.26,0.91l0.26,1.26l0.55,0.6l0.3,1.89l-0.22,1.31l0.23,0.71l-0.57,0.9l0.03,0.78l0.45,0.87l1.23,0.62l0.26,2.47l1.1,0.5l0.03,0.78l1.19,2.7l-0.23,0.95l1.16,0.21l0.8,0.98l1.1,0.23l-0.15,0.95l1.31,1.64l-0.21,1.1l0.49,0.89l-26.2,1.1l-27.91,0.67l-27.92,0.15l-27.97,-0.37l0.47,-21.33l-0.39,-0.41l-32.44,-1.09l1.91,-42.71l43.42,1.28l44.74,-0.05Z",
         "name": "Nebraska"
      },
      "US-LA": {
         "path": "M510.29,413.05l-1.38,-21.63l25.76,-1.93l25.96,-2.35l0.35,0.82l1.49,0.64l-0.92,1.34l-0.25,2.12l0.5,0.72l1.18,0.3l-1.22,0.47l-0.45,0.78l0.46,1.35l1.05,0.83l0.08,2.13l0.47,0.54l1.52,0.73l0.45,1.04l1.43,0.42l-0.87,1.22l-0.85,2.34l-0.76,0.05l-0.52,0.51l-0.02,0.73l0.63,0.72l-0.21,1.16l-1.35,0.96l-1.08,1.89l-1.38,0.68l-0.68,0.83l-0.79,2.41l-0.24,3.51l-1.55,1.75l0.13,1.2l0.63,0.95l-0.35,2.37l-1.62,0.3l-0.59,0.57l0.29,0.97l0.65,0.59l-0.25,1.41l0.99,1.51l-1.18,1.19l-0.08,0.45l0.4,0.23l6.22,-0.58l29.41,-3.07l-0.67,3.48l-0.52,1.02l-0.19,2.25l0.7,0.98l-0.09,0.66l0.61,1.0l1.32,0.7l1.23,1.42l0.15,0.88l0.9,1.38l0.14,1.05l1.13,1.84l-1.86,0.4l-0.39,-0.08l-0.02,-0.56l-0.54,-0.57l-1.29,0.28l-1.19,-0.59l-1.52,0.18l-0.62,-0.98l-1.25,-0.86l-2.86,-0.46l-1.25,0.64l-1.39,2.31l-1.3,1.43l-0.41,0.92l0.07,1.2l0.56,0.89l0.83,0.57l4.28,0.81l3.37,-1.02l1.32,-1.2l0.68,-1.2l0.35,0.59l1.09,0.42l0.59,-0.41l0.81,0.02l0.51,-0.47l-0.76,1.23l-1.13,-0.11l-0.57,0.32l-0.38,0.62l0.0,0.83l0.78,1.22l1.49,-0.03l0.66,0.9l1.11,0.48l0.94,-0.22l0.51,-0.45l0.46,-1.11l-0.02,-1.37l0.93,-0.58l0.42,-1.0l0.24,0.05l0.11,1.17l-0.24,0.25l0.19,0.57l0.43,0.15l-0.07,0.75l1.36,1.08l0.35,-0.17l-0.48,0.6l0.19,0.63l-0.36,0.14l-0.53,-0.57l-0.92,-0.18l-1.0,1.91l-0.85,0.15l-0.46,0.53l0.17,1.2l-1.03,-0.49l-1.01,0.07l0.04,0.46l1.16,1.07l-1.18,-0.14l-0.92,0.61l0.69,0.42l1.28,2.05l1.85,0.44l0.92,0.53l-0.08,1.21l0.34,0.41l2.08,-0.33l0.78,0.17l0.18,0.53l0.74,0.32l1.36,-0.35l0.54,0.78l1.08,-0.47l1.15,0.74l0.14,0.3l-0.41,0.63l1.55,0.86l-0.39,0.66l0.39,0.58l-0.18,0.63l-0.95,1.52l-1.33,-1.57l-0.68,0.34l0.1,0.67l-0.39,0.13l0.4,-1.91l-1.34,-0.76l-0.5,0.5l0.2,1.19l-0.55,0.46l-0.27,-1.03l-0.58,-0.25l-0.91,-1.28l0.03,-0.77l-0.97,-0.13l-0.47,0.51l-1.42,-0.16l-0.42,-0.61l0.14,-0.64l-0.39,-0.46l-0.45,-0.01l-0.81,0.74l-1.2,0.03l0.26,-0.57l-0.13,-0.67l-0.47,-0.88l-0.92,0.05l0.09,-0.97l-0.37,-0.36l-0.92,-0.02l-0.22,0.59l-0.86,-0.38l-0.48,0.27l-2.64,-1.26l-1.25,-0.02l-0.68,-0.64l-0.61,0.19l-0.3,0.56l-0.05,1.26l1.74,0.94l1.69,0.34l-0.15,0.93l0.28,0.4l-0.34,0.35l0.23,0.69l-0.76,0.96l-0.02,0.67l0.82,0.97l-0.96,1.45l-1.34,0.95l-0.78,-1.16l0.21,-1.51l-0.36,-0.93l-0.49,-0.17l-0.4,0.36l-1.17,-1.08l-0.6,0.43l-0.77,-1.06l-0.63,-0.2l-0.64,1.34l-0.86,0.27l-0.89,-0.53l-0.86,0.54l-0.1,0.62l0.49,0.41l-0.68,0.57l-0.13,1.46l-0.46,0.13l-0.39,0.84l-0.93,0.09l-0.12,-0.69l-1.61,-0.4l-0.77,0.99l-1.25,-0.82l-0.69,-0.11l-0.31,-0.54l-1.0,0.01l-0.35,0.61l-1.18,-0.51l0.43,-0.41l-0.0,-1.47l-0.38,-0.58l-1.92,-1.19l-0.08,-0.54l-0.84,-0.72l-0.1,-0.91l0.73,-1.16l-0.35,-1.14l-0.88,-0.19l-0.34,0.57l0.16,0.43l-0.59,0.81l0.04,0.92l-1.82,-0.4l0.07,-0.39l-0.47,-0.54l-1.98,0.77l-0.71,-2.23l-0.47,-0.12l-0.87,0.35l-0.18,-2.14l-1.31,-0.35l-1.9,0.3l-1.09,0.66l-0.22,-0.71l0.85,-0.27l-0.06,-0.8l-0.61,-0.58l-1.04,-0.1l-0.86,0.43l-0.95,-0.14l-0.4,0.81l-2.01,1.12l-0.64,-0.31l-1.29,0.72l0.54,1.37l0.81,0.3l0.99,1.52l-1.41,0.2l-1.83,1.05l-3.71,-0.39l-1.24,0.21l-3.11,-0.44l-2.0,-0.68l-1.82,-1.07l-3.73,-1.09l-3.21,-0.48l-2.55,0.6l-5.66,0.47l-1.0,0.27l-1.83,1.27l-0.6,-0.63l-0.27,-1.09l1.6,-0.48l0.7,-1.78l-0.03,-1.56l-0.39,-0.56l1.12,-1.55l0.23,-1.6l-0.5,-1.84l0.07,-1.46l-0.67,-0.7l-0.22,-1.05l0.83,-2.22l-0.64,-1.95l0.77,-0.85l0.29,-1.5l0.79,-0.94l0.78,-2.84l-0.19,-1.42l0.58,-0.98l-0.76,-1.33l0.84,-0.39l0.19,-0.44l-0.9,-1.35l0.02,-2.13l-1.08,-0.23l-0.58,-1.57l-0.92,-0.84l0.28,-1.27l-0.82,-0.75l-0.33,-0.95l-0.65,-0.34l0.22,-0.98l-1.17,-0.58l-0.81,-0.93l0.15,-2.45l-0.69,-1.93l-1.34,-1.97l-2.65,-2.19ZM550.67,462.74l0.02,-0.01l0.0,0.0l-0.02,0.0ZM609.66,467.22l-0.03,-0.03l-0.09,-0.04l0.15,-0.02l-0.03,0.09ZM609.67,465.6l-0.02,-0.02l0.04,-0.01l-0.02,0.03ZM568.93,468.95l-2.03,-0.42l-0.68,-0.51l0.74,-0.44l0.35,-0.77l0.4,0.49l0.84,0.2l-0.14,0.62l0.51,0.81ZM552.13,462.99l1.74,-1.07l3.38,1.07l-0.7,0.57l-0.17,0.82l-0.69,0.18l-3.56,-1.57Z",
         "name": "Louisiana"
      },
      "US-SD": {
         "path": "M337.03,132.38l0.3,-0.53l0.79,-19.92l28.49,0.97l28.39,0.38l28.39,-0.2l27.77,-0.76l-0.17,1.71l-0.72,1.71l-2.9,2.47l-0.41,1.28l1.59,2.13l1.06,2.06l0.55,0.36l1.74,0.24l1.02,0.84l0.58,1.02l1.51,38.65l-1.84,0.09l-0.42,0.56l0.24,1.42l0.88,1.12l0.01,1.44l-0.65,0.36l0.17,1.47l0.48,0.43l1.09,0.04l0.34,1.66l-0.16,0.9l-0.62,0.82l0.02,1.72l-0.68,2.42l-0.49,0.44l-0.67,1.87l0.5,1.1l1.33,1.06l-0.16,0.61l0.64,0.65l0.36,1.13l-1.66,-0.28l-0.34,-0.92l-0.85,-0.72l0.19,-0.6l-0.29,-0.59l-1.58,-0.22l-1.03,-1.16l-1.57,-0.11l-1.51,-0.74l-1.34,-0.12l-2.39,-1.97l-3.79,0.6l-1.65,-0.24l-1.19,0.46l-2.62,-0.32l-0.98,0.48l-0.76,1.43l-0.72,0.05l-3.67,-1.8l-4.13,-2.77l-44.9,0.05l-43.4,-1.27l1.86,-42.93Z",
         "name": "South Dakota"
      },
      "US-DC": {
         "path": "M782.83,216.82l0.44,-0.76l2.05,1.2l-0.65,1.13l-0.56,-1.03l-1.27,-0.55Z",
         "name": "District of Columbia"
      },
      "US-DE": {
         "path": "M799.98,195.01l0.4,-1.49l0.91,-1.11l1.73,-0.73l1.11,0.04l-0.31,0.54l-0.07,1.36l-1.12,1.92l0.11,1.08l1.11,1.06l-0.06,1.5l2.31,2.41l1.25,0.57l0.94,1.47l1.01,3.29l1.74,1.52l0.58,1.29l3.08,1.91l1.44,-0.12l0.46,1.21l-1.05,0.57l0.17,1.31l0.35,0.18l-0.81,0.57l-0.07,1.2l0.67,0.2l0.85,-0.73l0.71,0.33l0.3,-0.21l0.76,1.5l-10.19,2.94l-8.32,-25.59Z",
         "name": "Delaware"
      },
      "US-FL": {
         "path": "M632.37,423.12l47.45,-7.21l1.55,1.89l0.89,2.71l1.48,0.99l49.06,-5.55l1.04,1.38l0.04,1.09l0.56,1.05l0.87,0.49l1.83,-0.32l0.85,-0.76l-0.18,-4.58l-1.0,-1.48l-0.24,-1.77l0.27,-0.74l0.62,-0.31l0.11,-0.7l5.64,0.91l4.06,-0.2l0.16,1.25l-0.75,-0.12l-0.32,0.44l0.27,1.54l2.14,1.8l0.23,1.01l0.43,0.38l0.31,1.93l1.91,3.28l1.75,4.88l0.74,0.84l0.53,1.5l1.68,2.46l0.66,1.58l2.84,3.71l1.98,3.19l2.33,2.77l0.16,0.6l0.64,0.36l6.96,7.57l-0.5,-0.03l-0.27,0.62l-1.37,-0.01l-0.35,-0.66l0.37,-1.4l-0.16,-0.56l-2.33,-0.91l-0.46,0.53l1.04,2.82l0.79,0.98l2.21,4.81l10.15,13.83l1.42,3.15l3.77,5.42l-1.41,-0.35l-0.42,0.74l0.81,0.66l0.85,0.24l0.56,-0.22l1.49,0.95l2.1,3.1l-0.5,0.37l-0.11,0.53l1.17,0.53l0.92,1.87l-0.07,1.08l0.61,0.97l0.65,2.7l-0.26,0.77l1.06,9.2l-0.3,1.1l0.47,0.69l0.55,3.19l-0.8,1.49l0.1,2.3l-0.84,0.77l-0.19,1.86l-0.47,0.87l0.24,1.51l-0.28,1.8l0.48,0.84l0.09,0.93l0.48,0.24l-1.15,1.89l-0.37,1.32l-0.95,0.25l-0.54,-0.23l-1.38,0.47l-0.34,1.1l-0.9,0.32l-0.16,0.6l-0.86,0.7l-1.45,0.15l-0.28,-0.33l-1.25,-0.09l-0.9,1.09l-3.19,1.18l-1.08,-0.61l-0.73,-1.08l0.04,-1.87l1.02,0.86l1.68,0.48l0.26,0.65l0.52,0.07l1.36,-0.75l0.19,-0.7l-0.27,-0.64l-1.61,-1.13l-2.43,-0.26l-0.92,-0.47l-0.89,-1.72l-0.92,-0.75l0.22,-1.01l-0.49,-0.28l-0.53,0.16l-1.43,-2.59l-0.44,-0.29l-0.65,0.08l-0.46,-0.63l0.28,-0.33l-0.06,-0.58l-0.72,-0.66l-1.23,-0.61l-1.08,-0.08l-0.77,-0.55l-0.58,0.19l-2.84,-0.59l-0.51,0.66l0.25,-0.95l-0.47,-0.42l-0.88,0.13l-0.27,-0.74l-0.9,-0.67l-0.63,-1.45l-0.56,-0.1l-0.77,-3.02l-0.79,-1.02l-0.18,-1.56l-0.45,-0.85l-0.72,-0.91l-0.49,-0.15l-0.1,0.95l-1.33,-0.26l1.07,-1.35l0.29,-0.76l-0.13,-0.64l0.86,-1.51l0.65,-0.35l0.27,-0.85l-0.62,-0.38l-1.42,0.96l-0.88,1.32l-0.4,2.23l-1.38,0.37l-0.23,-1.36l-0.81,-1.35l-0.32,-4.13l-0.88,-0.61l1.64,-1.37l0.21,-0.99l-0.59,-0.41l-0.72,0.68l-1.57,0.56l-0.77,0.74l-0.76,-0.67l-0.4,0.27l-1.3,-0.9l-0.37,0.75l1.15,1.1l0.53,0.1l1.3,2.05l-1.05,0.25l-1.44,-0.38l-0.87,-1.63l-1.14,-0.61l-1.99,-2.59l-1.07,-2.32l-1.3,-0.89l0.09,-0.89l-1.0,-1.82l-1.8,-0.98l0.08,-0.69l0.99,-0.41l-0.36,-0.5l0.44,-0.75l-0.4,-0.35l0.4,-1.23l2.45,-4.56l-1.08,-2.44l-0.69,-0.46l-0.92,0.43l-0.27,0.94l0.31,1.22l-0.25,0.04l-0.76,-2.47l-1.0,-0.27l-1.2,-0.88l-1.53,-0.31l0.32,1.97l-0.48,0.63l0.27,0.59l2.24,0.56l0.26,0.99l-0.35,2.51l-0.32,-0.59l-0.8,-0.21l-2.17,-1.54l-0.42,0.21l-0.3,-0.64l0.58,-2.14l0.04,-3.02l-0.69,-1.99l0.42,-0.52l0.47,-1.94l-0.25,-0.54l0.63,-3.08l-0.4,-5.32l-0.38,-1.38l-0.37,-0.34l0.36,-0.47l-0.49,-2.2l-2.13,-1.32l-0.05,-0.53l-0.56,-0.42l-0.11,-1.03l-0.93,-0.73l-0.56,-1.52l-0.64,-0.24l-1.45,0.33l-1.03,-0.19l-1.58,0.56l-1.17,-1.75l-1.52,-0.47l-0.19,-0.6l-1.37,-1.51l-0.88,-0.58l-0.62,0.08l-1.54,-1.16l-0.81,-0.21l-0.53,-2.76l-3.09,-1.12l-0.66,-0.59l-0.53,-1.23l-2.18,-1.92l-2.21,-1.07l-1.46,-0.11l-3.47,-1.66l-2.86,1.01l-1.01,-0.4l-1.05,0.43l-0.35,0.69l-1.34,0.69l-0.5,0.71l0.03,0.65l-0.75,-0.22l-0.59,0.6l0.68,0.94l1.51,0.06l0.42,0.21l-3.05,0.26l-1.58,1.53l-0.91,0.46l-1.29,1.58l-1.56,1.05l-0.33,0.14l0.2,-0.5l-0.26,-0.53l-0.67,-0.04l-0.96,0.76l-1.11,1.52l-2.21,0.25l-2.12,1.09l-0.79,0.04l-0.29,-2.04l-1.74,-2.23l-2.23,-0.99l-0.18,-0.41l-2.54,-1.49l2.83,1.31l1.21,-0.75l-0.01,-0.74l-1.33,-0.33l-0.36,0.57l-0.22,-1.03l-0.35,-0.1l0.12,-0.52l-0.49,-0.33l-1.4,0.62l-2.33,-0.74l0.65,-1.09l0.83,-0.11l1.03,-1.47l-0.92,-0.95l-0.46,0.13l-0.49,1.03l-0.45,-0.03l-0.81,0.57l-0.73,-0.9l-0.7,0.1l-0.17,0.38l-1.35,0.74l-0.14,0.68l0.3,0.46l-3.99,-1.33l-5.09,-0.68l0.12,-0.24l1.28,0.29l0.61,-0.53l2.12,0.37l0.22,-0.78l-0.95,-1.02l0.08,-0.7l-0.63,-0.28l-0.5,0.32l-0.29,-0.47l-1.91,0.2l-2.27,1.12l0.3,-0.64l-0.41,-0.58l-0.96,0.36l-0.59,-0.25l-0.22,0.44l0.2,0.71l-1.46,0.81l-0.39,0.64l-5.21,1.01l0.31,-0.53l-0.4,-0.52l-1.36,-0.27l-0.73,-0.53l0.69,-0.54l0.0,-0.78l-0.68,-0.12l-0.82,-0.66l-0.46,0.11l0.14,0.76l-0.41,1.78l-1.06,-1.39l-0.7,-0.45l-0.55,0.07l-0.3,0.72l0.83,1.77l-0.25,0.8l-1.39,1.0l-0.05,1.04l-0.6,0.23l-0.17,0.57l-1.5,0.57l0.28,-0.66l-0.22,-0.46l1.14,-1.04l0.07,-0.74l-0.4,-0.58l-1.2,-0.23l-0.42,-0.84l0.3,-1.71l-0.19,-1.61l-2.19,-1.1l-2.42,-2.45l0.31,-1.45l-0.16,-1.04ZM770.96,489.55l0.5,1.09l0.91,0.4l0.78,-0.16l1.45,1.7l0.92,0.58l1.88,0.69l1.63,0.06l0.55,-0.45l-0.09,-0.89l0.55,-0.66l-0.17,-1.24l0.75,-1.4l0.07,-1.84l-0.66,-1.65l-1.49,-2.04l-1.77,-1.33l-1.2,-0.12l-1.12,0.86l-1.81,3.23l-2.12,2.0l-0.12,0.77l0.57,0.41ZM646.6,433.48l-0.95,0.27l0.41,-0.45l0.54,0.18ZM667.51,434.9l0.99,-0.29l0.36,0.31l0.1,0.73l-1.45,-0.75ZM773.86,453.5l0.44,0.57l-0.43,0.77l-0.01,-1.35ZM793.21,525.19l0.02,-0.12l0.03,0.05l-0.05,0.07ZM793.79,522.73l-0.25,-0.25l0.54,-0.38l-0.29,0.63ZM772.1,452.11l0.22,0.77l-0.28,2.36l0.31,1.82l-1.43,-3.27l1.19,-1.69ZM682.35,444.75l0.22,-0.2l0.37,0.02l-0.11,0.43l-0.48,-0.25Z",
         "name": "Florida"
      },
      "US-WA": {
         "path": "M39.75,56.79l0.48,-1.33l0.18,0.46l0.65,0.31l1.05,-0.73l0.42,0.6l0.7,-0.02l0.18,-0.77l-0.9,-1.57l0.8,-0.74l-0.07,-1.37l0.49,-0.38l-0.09,-1.04l0.81,-0.26l0.04,0.51l0.47,0.42l0.96,-0.3l-0.08,-0.68l-1.33,-1.67l-0.91,0.14l-1.87,-0.58l0.2,-2.0l0.65,0.54l0.52,-0.07l0.3,-0.56l-0.16,-0.69l3.32,-0.49l0.27,-0.69l-1.68,-0.98l-0.86,-0.15l-0.35,-1.52l-0.7,-0.43l-0.81,-0.03l0.39,-4.77l-0.47,-1.3l0.11,-0.69l-0.4,-0.35l0.85,-5.8l-0.09,-2.49l-0.44,-0.63l-0.14,-1.38l-0.63,-1.35l-0.72,-0.58l-0.28,-2.49l0.39,-2.3l-0.14,-1.13l1.8,-3.33l-0.51,-1.26l4.52,3.99l1.18,0.4l0.91,0.77l0.78,1.33l1.84,1.11l3.22,0.94l0.82,0.78l1.42,0.12l1.72,1.05l2.32,0.76l1.47,-0.47l0.52,0.3l0.54,0.71l-0.05,1.1l0.54,0.75l0.31,0.12l0.49,-0.35l0.08,-0.77l0.44,0.04l0.61,1.42l-0.41,0.59l0.34,0.5l0.56,-0.03l0.73,-0.84l-0.35,-1.73l1.05,-0.23l-0.46,0.23l-0.22,0.69l1.21,4.49l-0.47,0.1l-1.69,1.73l0.24,-1.3l-0.22,-0.41l-1.32,0.3l-0.39,0.81l0.08,0.96l-1.4,1.71l-2.0,1.38l-1.08,1.42l-0.97,0.69l-1.12,1.67l-0.07,0.71l0.61,0.61l0.95,0.13l2.78,-0.46l1.23,-0.58l-0.02,-0.7l-0.64,-0.24l-2.95,0.77l-0.34,-0.31l3.28,-3.44l3.07,-0.87l0.91,-1.52l1.75,-1.54l0.52,0.57l0.54,-0.18l0.25,-1.83l-0.1,2.29l0.25,0.92l-0.98,-0.22l-0.65,0.77l-0.4,-0.74l-0.52,-0.2l-0.4,0.64l0.29,0.72l0.0,1.65l-0.19,-1.08l-0.67,-0.22l-0.47,0.69l-0.08,0.76l0.46,0.68l-0.64,0.59l-0.0,0.45l0.41,0.17l1.68,-0.56l0.23,1.11l-1.11,1.8l-0.1,1.06l-0.84,0.7l0.12,1.02l-0.84,-0.69l1.14,-1.45l-0.22,-0.97l-1.98,1.07l-0.39,0.64l-0.03,-2.13l-0.52,0.01l-1.05,1.6l-1.27,0.53l-1.16,1.87l-1.52,0.29l-0.47,0.43l-0.22,1.18l1.11,-0.03l-0.26,0.36l0.26,0.38l0.92,0.03l0.05,0.68l0.52,0.48l0.53,-0.27l0.37,-1.77l0.14,0.42l0.83,-0.14l1.09,1.5l1.32,-0.61l1.66,-1.47l1.0,-1.57l0.62,0.8l0.73,0.14l0.45,-0.23l-0.05,-0.87l1.56,-0.54l0.36,-0.94l-0.32,-1.28l0.24,-1.2l-0.16,-1.38l0.83,0.21l0.31,-0.92l-0.18,-0.76l-0.71,-0.65l0.91,-1.14l0.1,-1.77l1.26,-1.25l0.63,-1.38l1.62,-0.49l0.79,-1.16l-0.44,-0.67l-0.51,-0.02l-0.84,-1.32l0.19,-2.12l-0.25,-0.88l0.5,-0.81l0.07,-0.84l-1.13,-1.76l-0.62,-0.41l-0.16,-0.67l0.19,-0.51l0.59,0.24l0.53,-0.33l0.27,-1.83l0.8,-0.24l0.31,-1.01l-0.57,-2.36l0.45,-0.55l-0.02,-0.86l-0.95,-0.9l-0.95,0.3l-1.05,-2.71l0.96,-1.88l41.1,9.79l38.78,7.97l-10.24,55.02l-0.48,1.02l1.01,3.02l0.12,2.01l-1.02,1.3l0.71,1.89l-31.12,-6.19l-1.67,0.78l-7.23,-1.08l-1.69,0.9l-4.19,-0.16l-3.18,0.42l-1.65,0.73l-0.88,-0.27l-1.2,0.29l-1.5,-0.24l-2.42,-0.97l-0.91,0.45l-3.45,0.47l-2.1,-0.73l-1.65,0.28l-0.3,-1.37l-1.08,-0.89l-4.33,-1.51l-2.32,-0.14l-1.14,-0.52l-1.27,0.2l-1.9,0.84l-4.5,0.53l-1.1,-0.72l-1.15,-0.31l-1.6,-1.17l-1.84,-0.53l-0.62,-0.82l0.72,-6.83l-0.45,-0.95l-0.19,-1.91l-0.96,-1.36l-1.94,-1.7l-2.82,-0.14l-1.02,-1.32l-0.14,-1.05l-0.55,-0.64l-2.36,-0.34l-0.56,-0.31l-0.23,-0.79l-0.5,-0.18l-0.97,0.34l-0.83,-0.27l-1.1,0.39l-0.95,-1.49l-0.88,-0.24ZM63.27,41.42l0.15,0.75l-0.42,0.48l0.02,-0.91l0.26,-0.31ZM72.98,21.85l-0.63,0.89l-0.16,0.52l0.12,-1.02l0.67,-0.39ZM72.91,17.04l-0.1,-0.06l0.06,-0.05l0.05,0.11ZM72.14,16.87l-0.78,0.39l0.38,-0.7l-0.07,-0.62l0.23,-0.07l0.23,1.0ZM58.87,44.11l0.14,-0.06l-0.03,0.02l-0.12,0.04ZM69.46,20.67l1.77,-2.13l0.46,-0.02l0.5,1.75l-0.34,-0.56l-0.51,-0.12l-0.55,0.45l-0.35,-0.1l-0.36,0.74l-0.63,-0.01ZM69.54,21.84l0.46,0.01l0.6,0.51l0.08,0.36l-0.79,-0.21l-0.35,-0.68ZM70.49,24.67l-0.1,0.51l-0.0,0.0l-0.02,-0.24l0.12,-0.27ZM70.76,26.94l0.1,0.05l0.14,-0.05l-0.18,0.12l-0.06,-0.12ZM71.13,26.88l0.51,-0.96l1.09,1.49l0.01,0.89l-0.35,0.36l-0.33,-0.1l-0.25,-1.57l-0.68,-0.13ZM68.2,11.24l0.5,-0.34l0.16,1.55l-0.22,-0.05l-0.44,-1.16ZM69.91,10.93l0.82,0.83l-0.66,0.31l-0.16,-1.14ZM68.13,39.7l0.35,-1.09l0.22,-0.25l-0.05,1.08l-0.52,0.25ZM68.31,15.63l-0.41,-0.42l0.61,-0.75l-0.18,0.6l-0.02,0.57ZM68.47,15.97l0.4,0.2l-0.09,0.14l-0.28,-0.12l-0.03,-0.22ZM68.56,14.29l-0.01,-0.1l0.05,-0.13l-0.04,0.23ZM68.5,34.94l0.11,-1.05l0.35,-0.34l-0.25,1.58l-0.21,-0.18ZM66.18,14.44l-1.04,-0.84l0.22,-1.86l1.3,1.97l-0.36,0.18l-0.12,0.55ZM63.56,44.22l0.23,-0.25l0.02,0.01l-0.13,0.32l-0.12,-0.07ZM61.46,41.94l-0.1,-0.21l0.04,-0.08l0.0,0.12l0.06,0.16Z",
         "name": "Washington"
      },
      "US-KS": {
         "path": "M478.81,242.03l0.44,0.62l0.76,0.17l1.05,0.79l2.2,-1.07l-0.0,0.74l1.08,0.77l0.23,1.42l-0.95,-0.15l-0.59,0.31l-0.17,0.95l-1.15,1.36l-0.06,1.12l-0.79,0.5l0.04,0.63l1.57,2.07l2.01,1.46l0.2,1.12l0.42,0.85l0.75,0.55l0.33,1.09l1.9,0.89l1.54,0.25l2.74,46.06l-31.67,1.55l-32.1,0.92l-32.11,0.27l-32.18,-0.39l1.25,-64.43l27.98,0.37l27.94,-0.15l27.93,-0.67l27.75,-1.17l1.65,1.2Z",
         "name": "Kansas"
      },
      "US-WI": {
         "path": "M599.36,110.41l0.82,-0.15l-0.13,0.81l-0.56,0.02l-0.14,-0.67ZM594.93,119.05l0.47,-0.41l0.24,-2.36l0.95,-0.25l0.64,-0.7l0.21,-1.4l0.41,-0.64l0.63,-0.04l0.07,0.38l-0.76,0.07l-0.18,0.52l0.18,1.26l-0.38,0.17l-0.11,0.58l0.57,0.57l-0.24,0.65l-0.5,0.34l-0.68,1.91l0.07,1.23l-1.04,2.28l-0.41,0.15l-0.87,-0.96l-0.19,-0.71l0.3,-1.57l0.61,-1.05ZM510.78,127.49l0.4,-0.27l0.27,-0.9l-0.45,-1.48l0.03,-1.91l0.69,-1.16l0.52,-2.25l-1.63,-2.9l-0.83,-0.35l-1.28,-0.0l-0.22,-2.32l1.66,-2.27l-0.05,-0.78l0.76,-1.55l1.95,-1.09l0.48,-0.75l0.97,-0.25l0.45,-0.76l1.16,-0.14l1.03,-1.57l-1.02,-12.16l1.03,-0.35l0.22,-1.1l0.73,-0.98l0.78,0.69l1.69,0.64l2.61,-0.58l3.27,-1.59l2.64,-0.84l2.2,-2.15l0.31,0.29l1.39,-0.11l1.25,-1.49l0.78,-0.59l1.04,-0.1l0.4,-0.52l1.08,0.99l-0.47,1.7l-0.67,1.02l0.24,1.62l-1.19,2.22l0.64,0.65l2.49,-1.1l0.72,-0.87l2.16,1.22l2.34,0.47l0.44,0.54l0.86,-0.13l1.6,0.69l2.25,3.55l15.49,2.46l4.66,1.94l1.67,-0.17l1.63,0.41l1.33,-0.6l3.17,0.69l2.18,0.08l0.86,0.4l0.56,0.89l-0.41,1.1l0.41,0.77l3.4,0.61l1.41,1.12l-0.15,0.71l0.6,1.11l-0.35,0.81l0.44,1.25l-0.77,1.25l-0.02,1.76l0.91,0.63l1.38,-0.26l1.02,-0.73l0.2,0.25l-0.78,2.45l0.05,1.31l1.32,1.45l0.84,0.34l-0.23,2.01l-2.41,1.21l-0.51,0.79l0.05,1.25l-1.59,3.49l-0.38,3.49l1.11,0.81l0.92,-0.04l0.49,-0.36l0.49,-1.36l1.81,-1.48l0.65,-2.53l1.06,-1.7l0.59,0.17l0.57,-0.71l0.88,-0.4l1.13,1.11l0.59,0.19l-0.27,2.2l-1.16,2.82l-0.54,5.56l0.23,1.11l0.8,0.92l0.07,0.52l-0.5,0.98l-1.29,1.34l-0.85,3.87l0.16,2.56l0.72,1.19l0.07,1.23l-1.05,3.21l0.13,2.1l-0.72,2.1l-0.27,2.45l0.6,2.0l-0.03,1.31l0.49,0.53l-0.2,1.68l0.92,0.77l0.55,2.41l1.21,1.51l0.09,1.67l-0.32,1.44l0.49,2.91l-44.26,4.85l-0.2,-0.78l-1.57,-2.16l-4.95,-0.8l-1.06,-1.33l-0.37,-1.67l-0.91,-1.19l-0.88,-4.84l1.03,-2.6l-0.09,-0.98l-0.72,-0.78l-1.44,-0.47l-0.72,-1.74l-0.49,-5.97l-0.71,-1.39l-0.53,-2.54l-1.16,-0.6l-1.1,-1.55l-0.93,-0.11l-1.17,-0.74l-1.71,0.09l-2.68,-1.77l-2.31,-3.47l-2.65,-2.08l-2.94,-0.52l-0.73,-1.23l-1.13,-0.99l-3.12,-0.43l-3.54,-2.72l0.45,-1.24l-0.12,-1.61l0.25,-0.81l-0.89,-3.1ZM542.09,81.41l0.05,-0.28l0.03,0.16l-0.08,0.12ZM538.44,86.94l0.29,-0.22l0.05,0.09l-0.34,0.13Z",
         "name": "Wisconsin"
      },
      "US-OR": {
         "path": "M11.03,140.91l0.03,-1.74l0.5,-0.82l0.34,-1.92l1.14,-1.87l0.26,-1.88l-0.69,-2.56l-0.33,-0.16l-0.1,-1.79l3.07,-3.74l2.56,-5.89l0.01,0.76l0.52,0.52l0.49,-0.28l0.61,-1.58l0.47,-0.47l0.3,0.98l1.12,0.42l0.33,-0.54l-0.43,-1.75l0.28,-0.86l-0.45,-0.14l-0.8,0.31l1.77,-3.11l1.14,-0.94l0.89,0.31l0.49,-0.28l-0.46,-1.08l-0.8,-0.4l1.81,-4.57l0.48,-0.56l0.03,-0.99l1.11,-2.64l0.65,-2.58l1.06,-1.89l0.33,0.28l0.66,-0.33l-0.03,-0.6l-0.75,-0.63l1.09,-2.58l0.32,0.22l0.6,-0.19l0.13,-0.34l-0.03,-0.51l-0.57,-0.33l0.89,-3.82l1.25,-1.78l0.86,-3.02l1.16,-1.74l0.86,-2.43l0.27,-1.21l-0.17,-0.5l1.2,-1.07l-0.3,-1.64l0.95,0.58l0.79,-0.62l-0.38,-0.76l0.21,-0.65l-0.76,-0.78l0.53,-1.07l1.31,-0.85l0.06,-0.45l-0.92,-0.35l-0.31,-1.26l1.0,-2.13l-0.03,-1.48l0.87,-0.52l0.59,-1.33l0.2,-1.96l-0.19,-1.45l0.81,1.18l0.6,0.18l-0.13,0.9l0.55,0.54l0.84,-0.95l-0.26,-1.0l0.22,-0.07l0.23,0.56l0.69,0.33l1.51,0.06l0.38,-0.35l1.37,-0.17l0.96,2.09l2.41,0.95l1.25,-0.63l0.78,0.05l1.7,1.53l0.76,1.05l0.19,1.9l0.42,0.78l-0.05,2.05l-0.4,1.24l0.18,0.93l-0.45,1.74l0.24,1.45l0.78,0.86l1.94,0.58l1.43,1.07l1.36,0.42l1.03,0.7l4.99,-0.48l2.91,-1.03l1.14,0.52l2.23,0.11l4.23,1.47l0.69,0.55l0.18,1.15l0.57,0.59l1.86,-0.25l2.1,0.73l3.79,-0.51l0.69,-0.42l2.18,0.95l1.64,0.26l1.2,-0.29l0.87,0.27l1.89,-0.76l3.07,-0.4l4.16,0.17l1.62,-0.9l7.15,1.08l0.96,-0.18l0.8,-0.58l31.21,6.2l0.22,1.81l0.91,1.83l1.15,0.64l1.95,1.88l0.55,2.46l-0.16,1.0l-3.72,4.51l-0.41,1.41l-1.41,2.61l-2.23,2.39l-0.67,2.67l-1.5,1.82l-2.24,1.48l-1.94,3.32l-1.5,1.26l-0.63,2.01l-0.13,1.86l0.28,0.92l0.56,0.62l0.54,0.04l0.39,-0.34l0.63,0.76l0.89,-0.04l0.06,0.87l0.8,0.95l-0.46,0.99l-0.65,0.05l-0.34,0.4l0.2,1.79l-1.04,2.53l-1.23,1.4l-7.11,38.72l-26.22,-5.22l-28.9,-6.33l-28.79,-6.92l-28.92,-7.58l-1.46,-2.58l0.22,-2.33l-0.22,-0.89Z",
         "name": "Oregon"
      },
      "US-KY": {
         "path": "M584.42,307.35l0.34,-2.14l1.15,0.94l0.72,0.19l0.75,-0.36l0.46,-0.87l0.87,-3.5l-0.55,-1.72l0.38,-0.85l-0.11,-1.85l-1.28,-2.0l1.78,-3.17l1.25,-0.51l0.74,0.05l7.06,2.47l0.81,-0.2l0.65,-0.71l0.23,-1.91l-1.5,-2.1l-0.24,-1.4l0.19,-0.86l0.4,-0.52l1.1,-0.19l1.24,-0.83l3.01,-0.96l0.64,-0.51l0.14,-1.13l-1.54,-2.01l-0.08,-0.66l1.33,-1.95l0.14,-1.15l1.26,0.41l1.12,-1.32l-0.68,-1.97l1.93,0.87l1.72,-0.84l0.03,1.15l1.01,0.45l0.99,-0.94l0.02,-1.34l0.51,0.16l1.9,-0.97l4.43,1.46l0.64,0.92l0.86,0.17l0.59,-0.59l0.73,-2.49l1.39,-0.55l1.4,-1.34l0.87,1.26l0.77,0.41l1.16,-0.14l0.12,0.74l0.95,0.18l0.66,-0.62l0.02,-0.99l0.84,-0.38l0.27,-0.48l-0.25,-2.06l0.84,-0.4l0.34,-0.56l-0.06,-0.67l1.25,-0.57l0.34,-0.72l0.39,1.45l0.62,0.59l1.47,0.61l1.25,-0.01l1.12,0.79l0.52,-0.11l0.26,-0.54l1.1,-0.46l0.53,-0.69l0.03,-3.42l0.85,-2.15l1.03,0.17l1.55,-1.19l0.74,-3.41l1.04,-0.37l1.65,-2.21l-0.0,-0.81l-1.19,-2.81l2.79,-0.61l1.54,0.78l3.85,-2.82l2.24,-0.47l-0.19,-1.06l0.35,-1.45l-0.32,-0.36l-1.22,-0.02l0.57,-1.38l-1.09,-1.5l1.65,-1.82l1.82,1.15l0.92,-0.12l1.94,-1.02l0.78,0.86l1.76,0.51l0.57,1.26l0.94,0.9l0.8,1.81l2.61,0.63l1.88,-0.58l1.64,0.25l2.2,1.8l0.96,0.41l1.27,-0.19l0.6,-1.3l0.99,-0.54l1.36,0.48l1.35,0.02l1.34,1.06l1.26,-0.69l1.42,-0.16l1.8,-2.53l1.72,-1.04l0.94,2.3l0.7,0.81l2.46,0.77l1.36,0.94l0.75,1.02l0.95,3.28l-0.37,0.45l0.1,0.71l-0.44,0.61l0.02,0.53l2.26,2.56l1.36,0.89l-0.07,0.87l1.35,0.94l0.59,1.33l1.56,1.17l0.99,1.58l2.15,0.8l1.1,1.09l2.13,0.23l-4.83,6.08l-5.06,4.15l-0.42,0.86l0.23,1.22l-2.07,1.93l0.05,1.61l-3.06,1.65l-0.8,2.36l-1.71,0.61l-2.7,1.83l-1.66,0.49l-3.39,2.42l-32.85,4.78l-7.5,0.92l-7.71,0.53l-22.79,3.67l-0.64,-0.55l-3.64,0.12l-0.41,0.6l1.05,3.51l-23.08,2.87ZM582.3,307.55l-0.6,0.08l-0.06,-0.53l0.48,-0.02l0.18,0.47Z",
         "name": "Kentucky"
      },
      "US-CO": {
         "path": "M364.77,242.03l-1.26,64.83l-29.41,-0.94l-29.5,-1.5l-29.46,-2.05l-32.29,-2.88l8.57,-85.75l27.85,2.51l28.29,2.01l29.65,1.53l28.02,0.91l-0.47,21.33Z",
         "name": "Colorado"
      },
      "US-OH": {
         "path": "M666.13,180.72l1.67,0.44l1.04,-0.31l1.75,1.04l2.08,0.23l1.48,1.15l1.61,0.23l-2.08,1.16l-0.11,0.47l0.42,0.24l2.46,0.16l1.39,-1.1l1.77,-0.27l3.41,0.91l0.92,-0.09l1.47,-1.29l1.74,-0.61l1.14,-0.96l1.91,-0.98l2.62,-0.06l1.09,-0.62l1.24,-0.07l1.06,-0.8l4.22,-5.44l4.52,-3.48l6.9,-4.4l6.01,27.6l-0.51,0.54l-1.28,0.43l-0.41,0.94l1.67,2.19l0.03,2.07l0.41,0.26l0.32,0.92l-0.04,0.75l-0.54,0.82l-0.48,4.03l0.19,3.16l-0.57,0.41l0.34,1.09l-0.34,1.72l-0.39,0.54l0.77,1.21l-0.24,1.84l-2.4,2.64l-0.82,1.85l-1.36,1.49l-1.24,0.68l-0.6,0.7l-0.88,-0.89l-1.18,0.15l-1.31,1.73l-0.08,1.3l-1.78,0.86l-0.77,2.22l0.28,1.55l-0.93,0.85l0.31,0.66l0.63,0.4l0.27,1.27l-0.8,0.18l-0.5,1.59l0.05,-0.91l-0.92,-1.23l-1.53,-0.52l-1.13,0.8l-0.75,1.87l-0.33,2.65l-0.53,0.82l1.24,3.51l-1.46,0.64l-0.43,3.33l-2.54,1.14l-1.01,0.06l-0.77,-1.04l-1.52,-1.07l-2.35,-0.69l-1.17,-1.87l-0.32,-1.12l-0.74,-0.34l-2.26,1.33l-1.09,1.28l-0.4,1.04l-1.43,0.17l-0.87,0.61l-1.12,-0.98l-3.15,-0.55l-1.37,0.72l-0.53,1.24l-0.72,0.06l-3.06,-2.19l-1.94,-0.26l-1.78,0.58l-2.15,-0.49l-0.55,-1.51l-0.97,-0.95l-0.64,-1.35l-2.04,-0.73l-1.15,-0.98l-0.97,0.27l-1.31,0.89l-0.46,0.03l-1.8,-1.19l-0.61,0.21l-0.6,0.7l-8.79,-54.8l20.44,-4.42ZM676.8,183.09l0.5,-0.77l0.64,0.41l-0.44,0.34l-0.7,0.03Z",
         "name": "Ohio"
      },
      "US-OK": {
         "path": "M399.74,360.02l-0.05,-41.47l-0.39,-0.4l-26.8,-0.23l-25.23,-0.63l0.32,-10.07l36.84,0.78l36.14,-0.07l36.13,-0.9l35.7,-1.7l0.62,10.51l4.61,23.98l1.48,37.44l-1.21,-0.21l-0.29,-0.36l-2.14,-0.2l-0.83,-0.78l-2.13,-0.38l-1.78,-2.03l-1.24,-0.21l-2.27,-1.54l-1.5,-0.39l-0.8,0.45l-0.23,0.87l-0.83,0.24l-0.46,0.62l-2.49,-0.13l-0.48,-0.19l-0.28,-0.67l-1.05,-0.6l-2.31,1.28l-1.17,0.2l-0.19,0.56l-0.63,0.27l-2.13,-0.76l-1.71,1.17l-2.07,0.51l-0.83,1.36l-1.49,0.07l-0.57,1.24l-1.27,-1.53l-1.71,-0.09l-0.32,-0.57l-1.21,-0.45l-0.2,-0.23l0.18,-0.72l-0.44,-0.5l-1.24,-0.17l-0.74,1.37l-0.67,0.11l-0.84,-0.49l-0.98,0.07l-0.71,-1.5l-1.09,-0.34l-1.17,0.57l-0.45,1.69l-0.71,-0.08l-0.49,0.43l0.29,0.72l-0.5,1.66l-0.44,0.19l-0.56,-0.54l-0.31,-0.89l0.39,-1.64l-0.76,-0.85l-0.8,0.18l-0.49,0.76l-0.85,-0.18l-0.93,0.97l-1.08,0.13l-0.53,-1.35l-2.0,-0.18l-0.3,-1.46l-1.19,-0.53l-0.83,0.33l-2.13,2.14l-1.22,0.51l-0.98,-0.37l0.19,-1.23l-0.29,-1.12l-2.34,-0.66l-0.08,-2.15l-0.44,-0.55l-2.11,0.39l-2.53,-0.25l-0.64,0.26l-0.81,1.2l-0.96,0.06l-1.77,-1.75l-0.97,-0.12l-1.51,0.55l-2.7,-0.63l-1.86,-0.99l-1.05,0.25l-2.48,-0.3l-0.18,-2.1l-0.86,-0.86l-0.44,-1.01l-1.17,-0.41l-0.7,-0.82l-0.82,0.08l-0.44,1.63l-2.23,-0.67l-1.08,0.59l-0.97,-0.09l-3.81,-3.74l-1.13,-0.43l-0.81,0.08Z",
         "name": "Oklahoma"
      },
      "US-WV": {
         "path": "M694.57,249.01l3.95,-1.56l0.35,-0.7l0.11,-2.72l1.15,-0.23l0.4,-0.61l-0.59,-2.46l-0.62,-1.21l0.48,-0.64l0.34,-2.74l0.67,-1.65l0.46,-0.39l1.25,0.52l0.41,0.68l-0.13,1.12l0.71,0.44l0.77,-0.44l0.47,-1.41l0.5,0.21l0.57,-0.2l0.2,-0.45l-0.65,-2.06l-0.75,-0.53l0.8,-0.78l-0.27,-1.69l0.73,-1.98l1.65,-0.53l0.16,-1.58l1.01,-1.41l0.44,-0.09l0.65,0.77l0.67,0.18l2.27,-1.59l1.49,-1.63l0.78,-1.81l2.44,-2.66l0.36,-2.38l-0.74,-0.98l0.7,-2.31l-0.25,-0.75l0.58,-0.58l-0.29,-3.38l0.45,-3.87l0.53,-0.79l0.07,-1.1l-0.39,-1.18l-0.4,-0.32l-0.05,-1.97l-1.58,-1.86l0.44,-0.53l0.85,-0.11l0.3,-0.33l4.15,19.01l0.48,0.31l16.61,-3.72l2.23,10.49l0.51,0.37l2.05,-2.49l0.97,-0.57l0.34,-1.02l1.62,-1.98l0.25,-1.03l0.52,-0.41l1.2,0.42l0.73,-0.32l1.31,-2.58l0.6,-0.46l-0.04,-0.85l0.42,0.58l1.81,0.49l3.2,-0.61l0.77,-0.86l0.07,-1.44l1.99,-0.76l1.02,-1.69l0.67,-0.11l3.17,1.44l1.8,-0.73l-0.44,1.01l0.56,0.9l1.28,0.4l0.09,0.95l1.13,0.4l0.1,1.18l0.34,0.41l-0.56,3.59l-9.05,-4.28l-0.64,0.25l-0.3,1.14l0.39,1.58l-0.51,1.61l0.42,2.24l-1.35,2.39l-0.41,1.74l-0.72,0.53l-0.41,1.09l-0.28,0.22l-0.61,-0.22l-0.37,0.33l-1.23,3.26l-1.86,-0.74l-0.64,0.26l-0.93,2.75l0.09,1.44l-0.73,1.14l-0.18,2.3l-0.88,2.18l-3.26,-0.31l-1.45,-1.71l-1.71,-0.22l-0.5,0.42l-0.25,2.14l0.2,1.28l-0.31,1.43l-0.49,0.45l-0.31,1.03l0.23,0.91l-1.57,2.42l-0.03,2.07l-0.51,1.98l-2.56,4.69l-0.74,3.13l0.15,0.76l1.14,0.52l-1.08,1.37l0.06,0.6l0.44,0.39l-2.15,2.12l-0.55,-0.69l-0.84,0.16l-3.12,2.54l-1.04,-0.54l-1.31,0.27l-0.43,0.9l0.46,1.14l-0.91,0.91l-0.74,-0.04l-2.27,1.02l-1.21,0.97l-2.2,-1.31l-0.73,0.0l-0.81,1.57l-1.1,0.5l-1.22,1.46l-1.09,0.1l-1.99,-1.05l-1.31,0.0l-0.62,-0.73l-1.2,-0.58l-0.31,-1.31l-0.88,-0.53l0.35,-0.66l-0.31,-0.81l-0.85,-0.36l-0.84,0.25l-1.34,-0.15l-1.27,-1.16l-2.07,-0.75l-0.77,-1.4l-1.59,-1.21l-0.71,-1.46l-1.0,-0.57l-0.13,-1.07l-1.39,-0.92l-2.01,-2.21l0.7,-2.0l-0.26,-1.59l-0.67,-1.43Z",
         "name": "West Virginia"
      },
      "US-WY": {
         "path": "M218.82,209.32l10.47,-85.76l25.45,2.87l26.8,2.51l26.84,2.0l27.86,1.53l-3.81,86.31l-27.38,-1.48l-28.27,-2.06l-29.76,-2.75l-28.2,-3.17Z",
         "name": "Wyoming"
      },
      "US-UT": {
         "path": "M178.98,182.72l41.58,5.7l-2.59,21.2l0.35,0.45l32.3,3.59l-8.57,85.75l-42.69,-4.9l-42.54,-6.06l16.56,-106.59l5.59,0.86ZM188.02,193.73l-0.3,0.03l-0.25,0.61l0.72,3.63l-0.81,0.18l-0.5,1.3l1.14,0.59l0.36,-0.83l0.37,-0.17l0.92,1.13l0.82,1.66l-0.26,0.99l0.15,1.43l-0.41,0.76l0.39,0.51l-0.05,0.55l1.57,1.82l0.02,0.59l1.12,1.91l0.71,-0.09l0.85,-1.72l0.07,2.25l0.53,0.94l0.06,1.77l0.99,0.47l1.66,-0.65l2.5,-1.73l0.38,-1.23l3.33,-1.39l0.18,-0.54l-0.52,-1.01l-0.68,-0.84l-1.36,-0.7l-1.85,-4.54l-0.87,-0.47l0.87,-0.89l1.3,0.6l1.33,-0.14l0.92,-0.82l-0.06,-1.11l-1.55,-0.51l-0.81,0.41l-1.18,-0.12l0.28,-0.75l-0.58,-0.78l-1.86,-0.23l-0.57,1.12l0.28,0.78l-0.35,0.67l0.54,2.41l-0.91,0.31l-0.34,-0.41l0.22,-1.78l-0.42,-0.69l-0.06,-1.72l-0.68,-0.6l-1.33,-0.12l-1.07,-1.54l-0.18,-0.67l0.64,-0.54l0.36,-1.28l-0.82,-1.37l-1.22,-0.29l-0.99,0.79l-2.74,0.17l-0.36,0.62l0.61,0.83l-0.28,0.42ZM199.39,206.21l0.03,0.02l0.03,0.09l-0.06,-0.11ZM199.42,207.0l0.31,0.91l-0.18,0.88l-0.39,-0.92l0.26,-0.87Z",
         "name": "Utah"
      },
      "US-IN": {
         "path": "M601.93,192.0l1.44,0.85l2.1,0.13l1.52,-0.39l2.63,-1.39l2.73,-2.1l32.34,-5.07l9.08,56.53l-0.66,1.15l0.31,0.91l0.81,0.76l-0.65,1.12l0.5,0.79l1.12,0.03l-0.36,1.11l0.18,0.5l-1.81,0.3l-3.18,2.54l-0.44,0.18l-1.41,-0.78l-3.46,0.93l-0.09,0.77l1.21,3.04l-1.4,1.87l-1.18,0.5l-0.45,0.88l-0.3,2.56l-1.12,0.88l-0.89,-0.25l-0.63,0.49l-0.85,1.93l0.06,3.09l-0.39,0.98l-1.39,0.85l-0.94,-0.66l-1.24,0.02l-1.48,-0.66l-0.63,-1.81l-1.89,-0.7l-0.44,0.3l-0.03,0.51l0.82,0.66l-0.62,0.3l-0.89,-0.34l-0.35,0.29l-0.04,0.48l0.55,0.9l-1.08,0.68l0.15,2.34l-1.06,0.65l0.0,0.82l-0.16,0.36l0.08,-0.48l-0.34,-0.51l-1.61,0.19l-1.42,-1.65l-0.49,-0.07l-1.67,1.49l-1.57,0.69l-1.07,2.86l-0.82,-1.05l-2.8,-0.74l-1.12,-0.59l-1.08,-0.17l-1.76,0.92l-0.64,-1.0l-0.58,-0.18l-0.53,0.56l0.65,1.83l-0.33,0.82l-0.29,0.09l-0.03,-1.15l-0.43,-0.39l-2.04,0.81l-1.42,-0.81l-0.84,0.01l-0.48,0.95l0.72,1.52l-0.49,0.73l-1.16,-0.38l-0.08,-0.53l-0.52,-0.42l0.54,-0.62l-0.35,-3.04l0.95,-0.78l-0.08,-0.59l-0.43,-0.22l0.68,-0.45l0.25,-0.61l-1.18,-1.43l0.45,-1.15l0.33,0.19l0.59,-0.44l0.8,-0.1l0.33,-1.77l0.55,-0.39l0.44,-0.91l-0.06,-0.82l1.52,-1.06l0.06,-0.69l-0.42,-0.9l0.57,-0.85l0.13,-1.27l0.87,-0.51l0.39,-1.89l-1.1,-2.5l0.22,-0.78l-0.17,-1.1l-0.94,-0.89l-0.62,-1.47l-1.06,-0.76l-0.04,-0.57l0.92,-1.38l-0.64,-2.21l1.27,-1.31l-6.7,-49.9Z",
         "name": "Indiana"
      },
      "US-IL": {
         "path": "M541.12,227.85l0.87,-0.35l0.37,-0.67l-0.24,-2.29l-0.74,-0.92l0.15,-0.4l0.71,-0.69l2.42,-0.98l0.71,-0.64l0.63,-1.67l0.17,-2.08l1.64,-2.45l0.27,-0.94l-0.04,-1.21l-0.59,-1.92l-2.24,-1.84l-0.12,-1.74l0.66,-2.35l0.45,-0.37l4.61,-0.86l0.81,-0.41l0.82,-1.11l2.55,-1.0l1.43,-1.55l-0.01,-1.56l0.4,-1.69l1.42,-1.45l0.29,-0.74l0.32,-4.32l-0.77,-2.12l-4.03,-2.42l-0.28,-1.47l-0.49,-0.81l-3.66,-2.42l44.64,-4.88l0.0,2.62l0.58,2.56l1.39,2.45l1.31,0.93l0.77,2.56l1.27,2.67l1.43,1.81l6.81,50.69l-1.22,1.12l-0.1,0.69l0.68,1.72l-0.83,1.07l-0.03,1.1l1.2,1.07l0.57,1.38l0.9,0.8l-0.09,1.78l1.07,2.26l-0.27,1.46l-0.87,0.56l-0.21,1.45l-0.59,0.92l0.33,1.18l-1.48,1.12l-0.22,0.42l0.29,0.68l-0.93,1.16l-0.3,1.18l-1.65,0.68l-0.62,1.65l0.16,0.8l0.97,0.8l-1.27,1.14l0.4,0.75l-0.47,0.23l-0.12,0.55l0.43,2.88l-1.15,0.2l0.08,0.45l0.9,0.75l-0.47,0.17l-0.02,0.64l0.83,0.28l0.04,0.41l-1.3,1.95l-0.24,1.17l0.6,1.21l0.7,0.63l0.37,1.05l-3.32,1.23l-1.19,0.81l-1.25,0.25l-0.77,1.0l-0.17,2.02l0.31,0.87l1.41,1.89l0.07,0.52l-0.53,1.17l-0.97,0.03l-6.33,-2.35l-1.08,-0.07l-1.58,0.64l-0.68,0.71l-1.43,2.91l0.06,0.66l-1.19,-1.18l-0.79,0.14l-0.35,0.47l0.57,1.11l-1.23,-0.76l-0.02,-0.67l-1.61,-2.16l-0.4,-1.1l-0.76,-0.36l-0.05,-0.47l0.94,-1.33l0.2,-1.02l-0.33,-1.0l-1.45,-1.98l-0.48,-3.13l-2.27,-0.96l-1.56,-2.09l-1.96,-0.79l-1.73,-1.31l-1.57,-0.13l-1.83,-0.93l-2.33,-1.73l-2.36,-2.39l-0.37,-1.91l2.36,-6.76l-0.25,-2.28l0.98,-2.03l-0.39,-0.84l-2.68,-1.41l-2.6,-0.64l-1.28,0.45l-0.86,1.43l-0.46,0.28l-0.45,-0.12l-1.3,-1.86l-0.43,-1.49l0.15,-0.86l-0.54,-0.9l-0.29,-1.62l-0.83,-1.33l-0.94,-0.88l-4.13,-2.46l-1.01,-1.61l-4.55,-3.45l-0.74,-1.87l-1.05,-1.19l-0.04,-1.57l-0.97,-1.45l-0.76,-3.48l0.09,-2.89l0.6,-1.26ZM586.9,296.43l0.05,0.06l0.03,0.03l-0.05,-0.0l-0.04,-0.09Z",
         "name": "Illinois"
      },
      "US-AK": {
         "path": "M87.36,534.18l0.47,0.12l0.39,-0.03l0.07,0.37l-0.38,0.38l-0.69,0.33l-0.12,-0.13l0.29,-0.43l-0.1,-0.33l0.07,-0.29ZM89.85,534.33l0.63,-0.13l0.31,-0.6l1.87,-0.44l2.32,0.02l1.55,0.61l0.8,0.71l-0.15,1.95l0.18,0.42l0.1,-0.0l0.29,0.45l0.44,-0.08l0.29,-0.27l0.0,-0.67l0.34,0.23l-0.11,0.47l0.79,0.97l-0.04,0.07l-0.3,-0.1l-0.32,-0.32l-0.32,-0.11l-0.45,0.39l-0.16,-0.54l-0.38,-0.04l-0.24,0.12l-0.25,-0.16l-0.24,0.07l-0.39,-0.32l-0.3,-0.04l-0.73,0.26l-0.89,-0.2l-0.06,-0.27l-0.23,-0.18l0.36,-0.29l0.69,0.74l0.47,-0.03l0.21,-0.45l-0.25,-0.46l-0.0,-0.32l-0.26,-0.72l-0.96,-0.54l-1.1,0.3l-0.64,0.75l-0.83,0.25l-0.29,0.09l-0.42,-0.31l-0.48,0.11l-0.1,0.17l-0.65,-0.16l-0.28,0.07l-0.24,0.25l0.25,-0.28l-0.05,-0.59l0.21,-0.89ZM99.7,537.94l0.33,-0.34l0.43,-0.24l-0.01,-0.35l-0.47,-1.08l0.15,-0.27l0.65,-0.28l0.32,-0.33l0.72,-0.38l0.65,-0.03l0.43,-0.15l0.83,0.08l1.47,-0.11l0.63,0.14l0.1,0.14l0.38,0.14l0.9,0.09l0.27,0.15l0.28,-0.24l0.27,-0.06l0.37,0.08l0.18,0.21l0.27,-0.04l0.21,0.43l0.39,0.27l0.08,0.22l0.71,-0.02l0.39,-0.85l0.55,-0.71l0.52,-0.25l1.89,-0.56l0.5,0.02l0.35,0.22l1.22,-0.45l0.64,0.02l-0.15,0.41l0.4,0.58l0.61,0.29l0.46,-0.01l0.45,-0.47l0.13,-0.43l-0.35,-0.28l-0.25,-0.06l0.17,-0.42l-0.14,-0.42l1.23,-1.18l0.98,-1.13l0.16,-0.1l0.35,0.16l0.38,-0.03l0.26,0.28l0.17,0.41l0.67,-0.24l-0.05,-0.61l-0.38,-0.61l-0.45,-0.26l0.25,-0.55l0.9,-0.58l0.37,0.02l0.73,-0.26l0.84,-0.13l0.57,0.16l0.44,-0.15l-0.12,-0.56l0.24,-0.11l0.62,-0.65l0.43,0.04l0.24,-0.11l0.52,-0.62l0.38,-0.16l0.2,-0.48l-0.44,-0.28l-0.55,0.11l-0.59,0.59l-0.54,-0.07l-0.54,0.34l-2.21,-0.44l-1.73,-0.17l-0.68,-0.22l-0.09,-0.2l0.22,-0.4l0.08,-0.44l-0.26,-0.66l0.69,-0.45l0.24,-0.34l0.47,0.57l-0.21,0.72l0.03,0.41l0.61,0.14l0.29,-0.14l-0.01,-0.29l0.21,-0.39l0.04,-0.79l-0.74,-1.1l0.09,-0.77l-0.68,-0.24l-0.21,0.25l-0.12,0.58l-0.54,0.27l-0.27,-0.56l-0.34,-0.08l-0.49,0.37l-0.07,0.34l-0.24,0.24l-0.4,-0.01l-0.48,0.27l-0.29,0.57l-0.53,1.69l-0.27,0.06l-0.23,-0.38l0.4,-2.82l0.01,-0.54l-0.15,-0.55l0.18,-0.2l0.14,-0.44l-0.15,-0.33l-0.51,-0.26l-0.94,0.36l0.02,-0.53l-0.5,-0.64l0.24,-0.28l0.16,-0.7l-0.14,-0.41l-0.58,-0.27l-1.94,0.1l-0.58,-0.32l-1.04,-0.07l-0.2,-0.36l-0.24,-0.06l-1.16,0.65l-0.73,-0.13l-0.06,-0.42l-0.15,-0.03l0.18,-0.12l0.34,0.1l0.5,-0.11l0.29,-0.39l-0.16,-0.57l0.5,-0.64l0.9,-0.0l0.43,-0.18l0.13,-0.3l-0.1,-0.46l-1.07,-0.66l0.16,-0.38l0.4,-0.21l0.45,-0.53l1.21,-0.08l0.23,-0.1l0.17,-0.27l0.17,-1.07l0.3,-0.59l0.27,-1.56l0.33,-0.54l-0.01,-0.63l0.14,-0.31l1.0,-0.81l-0.03,-0.14l0.2,-0.15l-0.2,-0.34l-0.24,-0.11l-0.14,0.07l-0.09,-0.34l0.71,-0.3l0.4,-0.32l0.52,-0.13l0.31,-0.33l0.46,-0.04l0.15,0.15l0.45,0.08l0.33,-0.12l0.44,-0.51l-0.32,-0.4l-0.34,-0.04l-0.01,-0.32l-0.27,-0.36l-0.62,0.35l0.01,0.16l-0.56,-0.06l-1.27,0.79l-0.19,-0.04l-0.58,0.22l-0.38,-0.03l-0.25,0.1l-0.05,0.15l-0.48,-0.06l-0.17,0.47l0.35,0.75l-0.37,0.25l-0.22,0.4l-0.2,0.15l-0.15,-0.07l-0.13,-0.26l-2.03,-0.22l-1.8,-0.94l-0.73,-0.6l-0.44,-0.69l0.09,-0.39l0.11,0.06l0.53,-0.13l-0.05,-0.33l0.13,-0.31l-0.38,-1.12l0.22,-0.87l-0.11,-0.58l0.42,-0.68l-0.42,-0.31l-0.21,0.02l-0.35,-0.67l0.0,-0.37l0.37,-0.01l0.39,-0.17l0.32,-0.43l-0.03,-0.35l-0.26,-0.27l-0.54,-0.17l1.35,0.03l0.28,-0.15l0.21,-0.32l0.67,-0.05l0.02,0.53l0.51,0.51l0.27,0.51l-0.09,0.24l-0.29,-0.02l-0.62,0.18l-0.55,0.48l0.0,0.14l0.31,0.38l1.01,-0.16l0.4,0.22l0.27,-0.03l0.46,-0.28l0.28,-0.0l0.09,0.08l-0.64,0.61l-0.16,0.47l0.03,0.25l0.17,0.24l0.48,0.24l1.49,-0.04l0.27,-0.18l0.18,-0.34l0.2,-0.07l-0.14,-0.9l0.27,-0.1l0.2,-0.27l0.02,-0.32l-0.13,-0.24l0.2,-0.53l-0.06,-0.13l-0.55,-0.28l-0.84,0.04l-0.35,0.16l-0.97,-0.93l-0.42,-0.26l0.07,-0.57l-0.33,-0.44l-0.24,-0.13l-0.19,-0.48l0.19,0.03l0.07,-0.09l0.52,0.15l0.51,-0.35l-0.15,-0.47l-0.73,-0.52l0.2,-0.06l0.41,-0.42l-0.11,-0.55l0.12,-0.15l0.41,-0.21l0.27,0.07l0.5,-0.15l0.43,0.25l0.8,-0.11l0.67,-0.43l-0.02,-0.53l-0.18,-0.22l-0.45,-0.06l-0.66,0.28l-0.44,-0.17l-1.09,0.08l-0.76,0.26l-0.36,0.37l-0.7,0.11l-0.18,0.15l-0.15,0.39l-0.12,0.12l-0.06,-0.08l0.08,-0.32l0.35,-0.45l-0.07,-0.08l0.19,0.01l0.12,-0.14l-0.1,-0.06l0.17,-0.46l-0.4,-0.6l0.11,-0.27l0.4,0.09l0.24,-0.06l0.45,-0.5l0.04,-0.34l-0.13,-0.54l-0.39,-0.37l1.09,0.44l0.4,-0.45l-0.38,-0.63l-0.06,-0.33l0.52,0.48l0.98,0.33l0.18,-0.4l0.12,0.03l0.05,-0.61l0.22,-0.48l0.63,-0.43l0.57,-0.07l2.22,-0.76l0.81,-0.13l0.27,0.19l-0.08,0.5l0.2,0.34l-0.41,0.26l0.13,0.45l0.3,0.14l0.85,-0.04l0.29,-0.37l0.05,-0.95l-0.19,-0.11l0.35,0.03l1.35,-0.27l0.27,-0.58l-0.05,-0.09l-0.31,-0.21l-0.9,0.06l0.08,-0.22l0.5,-0.05l0.12,-0.59l0.14,-0.14l0.89,-0.42l0.73,0.88l0.38,0.11l0.32,-0.23l0.16,-0.44l-0.01,-0.27l-0.25,-0.44l0.64,-0.07l0.65,0.27l0.28,0.29l0.41,0.85l-0.04,0.22l-0.15,0.1l0.04,0.18l-0.54,-0.04l-0.54,0.27l-0.1,0.49l0.46,0.2l1.1,-0.05l-0.07,0.5l0.35,0.37l0.69,0.38l0.34,0.09l0.95,-0.04l0.57,-0.28l0.44,0.15l0.53,-0.06l1.67,-0.57l0.1,0.54l1.59,0.9l0.27,0.34l0.54,0.31l1.07,0.28l2.13,-0.53l0.42,-0.22l0.47,-0.45l0.41,-0.77l0.37,-1.17l0.9,-1.39l0.06,-0.37l-0.1,-0.54l0.04,-0.33l0.22,-0.25l-0.06,-0.5l0.46,0.37l0.31,0.02l0.23,-0.16l1.15,-0.23l0.62,-0.63l0.26,-1.05l-0.15,-0.65l0.51,-0.43l-0.22,-0.39l-0.76,-0.38l-0.4,0.19l-0.4,0.02l-0.6,0.33l-0.26,-0.29l-0.05,-0.41l-0.3,-0.35l-0.49,-0.04l-0.07,0.23l-0.62,0.0l-0.43,-0.28l-0.08,0.09l-0.54,-0.03l-0.36,0.17l-0.95,-0.12l-0.9,0.24l0.06,-0.3l-0.16,-0.8l0.04,-0.58l-0.1,-0.59l-0.54,-0.21l-0.87,0.1l-0.29,-0.51l-0.43,-0.43l-0.59,-0.28l-1.06,-1.04l-0.92,-0.12l-0.2,-0.28l-0.43,-0.23l-0.07,-0.22l-0.65,-0.06l-0.17,0.22l-0.7,-1.25l-0.93,-1.21l-0.6,-0.94l-0.15,-0.58l0.22,-0.72l0.16,-0.13l0.26,0.05l0.25,-0.13l0.49,-0.79l-0.01,-0.48l-0.21,-0.69l0.21,-0.4l0.5,0.21l0.56,-0.14l0.47,-0.29l0.4,0.66l0.5,0.23l0.42,-0.32l0.06,-0.37l-0.2,-0.74l-0.43,-0.44l-0.33,-0.84l-0.73,-0.89l-0.16,-0.04l-0.77,-1.14l-0.22,-0.53l0.03,-0.34l-0.38,-1.37l0.77,0.03l0.48,0.42l0.39,0.13l0.39,-0.13l0.19,-0.28l0.19,0.05l0.18,-0.27l0.19,-0.0l0.22,0.55l0.54,0.22l1.01,0.04l0.19,-0.16l0.17,0.07l0.66,-0.29l1.57,0.23l0.08,0.66l0.76,0.9l1.11,0.4l0.5,-0.28l0.03,-0.12l-0.01,-0.26l-0.38,-0.97l0.25,-0.04l1.04,0.11l0.61,0.18l0.24,0.17l0.02,0.44l0.76,0.16l0.33,-0.12l1.02,-0.04l0.42,0.17l1.32,0.83l0.03,0.42l0.15,0.18l-0.14,0.16l-0.52,0.11l-0.41,0.31l-0.48,0.71l-0.5,-0.17l-0.63,-0.09l-0.12,0.06l-0.08,0.66l0.52,0.44l-0.12,0.64l0.09,0.45l0.28,0.39l0.8,0.5l0.15,0.33l0.4,0.4l0.72,0.27l0.32,0.25l-0.29,0.37l-0.04,0.29l0.48,0.32l0.22,-0.09l0.18,0.07l0.07,0.23l0.35,0.3l0.54,0.08l0.24,0.37l-0.17,0.51l0.21,0.38l0.49,0.2l0.35,-0.15l0.07,-0.28l0.31,-0.03l0.3,-0.25l1.17,-0.57l0.04,0.5l0.32,0.37l-0.13,0.11l-0.33,0.02l-0.08,0.49l0.34,0.34l0.57,-0.02l0.77,-0.55l0.23,-0.37l0.13,-0.95l-0.53,-1.05l0.53,0.03l0.16,0.37l-0.04,0.42l0.21,0.94l0.5,0.48l1.23,0.64l0.3,0.05l0.27,-0.1l0.29,-0.29l0.49,-0.7l0.1,-0.53l0.43,-0.51l-0.16,-0.31l-0.71,-0.34l-0.49,-0.01l-0.06,-0.56l-0.18,-0.38l-0.88,-0.51l-0.51,-0.09l-0.69,0.4l-0.2,-0.22l0.09,-0.54l-0.1,-0.15l-0.06,-0.94l0.33,-0.37l0.4,-0.14l0.27,-0.3l0.38,-0.08l0.3,0.24l0.3,0.04l0.39,-0.33l0.04,-0.19l-0.5,-1.34l-0.57,-0.43l-0.49,-0.19l-0.05,-0.43l0.37,-0.35l0.03,-0.29l-0.11,-0.24l-0.51,-0.23l-0.39,0.26l0.03,0.11l-0.6,0.24l-0.2,-0.44l-0.8,-0.5l-0.12,-0.35l-1.08,-1.4l1.04,-1.59l0.48,-1.31l0.21,-1.26l-0.22,-1.28l0.02,-1.32l-0.25,-0.51l-0.08,-1.73l-0.15,-0.88l-0.74,-1.55l0.16,-0.91l-0.24,-1.2l0.25,-0.0l1.0,-0.81l0.49,-0.22l1.3,-1.27l0.3,-0.44l0.16,0.26l0.43,0.32l0.33,0.49l1.57,1.15l0.85,0.35l1.25,0.85l0.65,0.21l0.78,0.09l1.5,-0.09l1.75,-0.56l0.32,0.05l0.52,-0.2l1.22,-0.98l0.43,-0.54l0.4,-0.31l0.55,-0.18l0.17,-0.45l2.11,-0.42l0.63,-0.43l0.54,-0.09l0.2,-0.19l0.25,-0.04l0.1,0.18l0.69,0.39l0.89,0.14l0.09,-0.15l0.19,-0.05l0.66,0.47l0.8,0.14l0.38,0.39l0.41,-0.26l2.49,-0.32l-0.46,0.31l0.23,0.44l-0.72,0.37l-0.11,0.57l0.36,0.2l-0.26,1.06l0.21,0.46l0.49,-0.11l0.8,-1.61l0.24,-0.23l0.25,0.17l0.55,0.07l0.28,0.23l0.49,0.02l0.31,-0.11l-0.07,-0.72l-0.28,-0.1l-0.33,-0.32l-0.36,-0.04l-0.0,-0.14l0.16,-0.3l0.05,-0.61l0.41,0.07l0.82,-0.35l-0.0,1.13l0.16,0.42l0.45,0.0l0.24,-0.34l0.43,0.18l0.24,-0.1l0.46,0.48l1.04,0.48l0.2,-0.05l0.71,0.47l0.58,0.1l1.34,-0.08l1.42,-0.31l1.29,-0.65l1.13,-0.41l0.06,0.74l0.64,0.58l-0.31,0.27l0.14,0.59l0.58,0.09l0.25,0.14l0.16,0.27l-0.16,0.38l-0.53,0.08l-0.22,0.14l-0.83,-0.31l-0.6,0.19l-0.28,0.66l0.17,0.37l-0.54,0.69l0.23,0.62l0.39,0.04l0.35,-0.31l0.64,0.31l0.32,-0.03l0.36,-0.22l0.3,-0.41l0.4,-0.13l0.35,0.33l0.27,-0.05l0.33,0.15l0.24,-0.07l0.35,-0.34l0.08,0.63l-0.43,0.35l-0.58,0.09l0.1,0.73l-0.05,0.46l0.2,0.27l0.55,0.25l-0.11,0.23l0.12,0.4l0.22,0.16l0.4,0.05l1.03,-0.36l0.71,0.57l0.62,0.22l0.32,-0.04l0.14,0.36l0.2,0.09l0.02,0.43l0.24,0.25l0.17,0.54l0.45,0.04l0.29,-0.21l0.23,0.34l-1.14,0.49l-0.31,0.63l-0.62,0.16l-0.15,0.49l0.34,0.45l1.51,0.71l-0.37,0.08l-0.25,0.18l-0.03,0.62l0.55,0.49l0.67,0.4l0.14,0.2l0.13,0.59l0.36,0.22l0.46,-0.17l0.1,-0.24l1.06,0.38l0.2,-0.18l0.27,0.35l-0.2,0.22l0.18,0.58l1.13,0.28l0.65,-0.12l0.18,0.18l0.66,0.24l0.02,0.15l0.23,0.24l0.36,0.11l0.34,0.46l0.11,0.53l0.19,0.07l0.56,0.71l-0.11,0.23l0.06,0.57l0.51,0.33l0.5,-0.08l0.1,0.41l0.41,0.37l-0.19,0.45l0.29,0.52l0.7,0.54l0.72,0.78l0.67,0.31l0.22,-0.06l1.43,0.88l0.33,0.49l0.45,0.21l0.37,0.84l0.07,-0.04l0.02,0.34l0.12,0.03l0.31,0.59l-0.03,0.31l0.51,0.28l0.38,0.42l0.36,0.11l0.29,0.27l0.49,0.2l0.84,-0.17l0.4,0.22l0.04,0.55l0.49,0.04l0.4,-0.4l0.51,0.02l0.21,0.18l0.6,0.22l-0.03,0.31l0.54,0.37l0.22,-0.21l0.16,0.11l0.21,0.36l0.27,0.08l0.28,0.52l-0.06,0.4l0.39,0.53l-0.08,0.29l0.11,0.51l0.48,0.47l0.03,0.45l0.13,0.18l0.35,0.13l0.38,0.48l0.3,1.3l0.27,0.3l0.68,0.03l-33.88,69.97l0.07,0.44l1.39,1.52l0.56,0.03l0.2,-0.18l1.0,1.36l0.47,0.14l1.42,-0.55l1.71,0.67l-1.05,1.27l-0.09,0.32l0.25,1.15l0.83,1.01l-0.14,0.64l0.04,0.6l1.99,5.34l-0.34,1.76l-0.34,0.47l0.19,0.61l0.33,0.11l0.27,-0.0l0.86,-0.33l0.55,-0.04l0.04,0.26l-0.76,0.37l-0.33,0.35l0.29,0.55l0.37,-0.02l0.38,-0.21l0.2,0.1l0.0,0.24l0.53,0.24l0.14,1.31l0.1,0.14l-0.31,0.03l-0.1,0.46l0.22,0.36l0.92,0.24l0.05,0.19l-0.31,0.19l-0.0,0.13l0.19,0.34l0.19,0.11l-0.13,0.52l-0.19,-0.01l-0.06,-0.5l-0.34,-0.34l-0.12,0.06l-0.23,-0.49l-0.51,-0.04l-0.29,0.41l-0.27,-0.02l-0.23,0.12l-0.19,-0.6l-0.14,0.01l-0.33,-0.45l-0.45,-0.12l-0.86,-1.68l0.26,-0.0l0.3,-0.44l-0.05,-0.28l-0.36,-0.33l-0.47,0.03l-0.39,-1.0l-0.06,-0.2l0.18,-0.61l-0.05,-0.42l-0.43,-1.17l-0.42,-0.8l-0.15,-0.06l-0.03,-0.2l0.19,-0.5l-0.3,-0.32l-0.68,-0.12l-0.76,-1.2l-0.34,-0.36l-0.22,-0.51l0.0,-0.25l-0.29,-0.25l-0.22,-0.37l-0.28,-0.12l-0.53,-0.85l0.33,0.03l0.26,-0.14l0.12,-0.23l0.61,-0.3l-0.02,0.19l-0.22,0.1l-0.15,0.49l0.27,0.46l0.43,0.08l0.44,-0.35l0.31,-1.17l0.22,-0.31l0.35,0.19l0.12,0.32l0.22,0.2l0.41,0.04l0.32,-0.36l-0.39,-0.84l-0.65,-0.42l-0.17,-1.03l-0.29,-0.7l-0.44,-0.21l-0.49,0.29l-0.22,0.26l-0.42,0.09l-0.83,0.47l-1.88,0.06l-0.94,-0.51l-0.42,-0.36l-1.39,-1.72l0.31,-0.13l0.2,-0.25l0.32,-0.95l-0.37,-1.07l-0.54,-0.07l-0.36,0.29l-0.08,0.55l-0.66,0.01l-0.74,-0.96l-2.63,-2.07l-1.67,-0.45l-1.59,-0.64l-1.09,-0.13l-0.02,-0.58l-0.25,-0.63l0.18,-0.21l0.03,-0.3l-0.23,-0.29l-0.25,-0.01l-0.99,-0.65l-0.07,-0.58l-0.17,-0.38l-0.2,-0.13l0.07,-0.18l0.3,-0.08l0.43,-0.41l0.11,-0.29l-0.11,-0.09l0.31,-0.43l0.29,-0.14l0.38,0.06l0.37,-0.2l0.18,-0.32l-0.0,-0.32l-0.35,-0.26l-0.61,-0.04l-0.84,0.36l-0.28,0.27l-0.59,0.06l-0.62,0.45l-0.63,0.21l-0.13,-0.1l-0.12,-0.65l-0.6,-0.75l0.99,-0.56l0.18,-0.35l-0.33,-0.49l-0.45,0.03l-0.19,-0.61l-0.13,-0.1l0.18,-0.56l-0.13,-0.28l0.08,-0.24l-0.24,-0.61l-0.47,-0.26l-0.52,0.22l-0.09,-0.21l-0.21,-0.01l-0.07,-0.12l0.32,-0.71l-0.08,-0.14l0.37,0.06l0.11,-0.13l0.59,0.36l0.42,0.06l0.4,-0.44l-0.08,-0.47l-0.28,-0.31l-1.03,-0.53l-1.57,0.42l-0.08,-0.19l-0.39,-0.32l-0.41,0.01l-0.1,-0.25l-0.41,0.05l-0.2,-0.13l0.26,-0.39l0.18,-0.83l-0.15,-0.23l-0.36,-0.13l0.14,-0.17l0.2,-0.7l-0.37,-0.34l-0.3,0.04l-1.38,0.7l-0.36,-0.43l-1.21,-0.12l-0.18,0.31l-0.52,0.28l0.05,0.48l0.19,0.14l-0.11,0.28l-0.81,-0.24l-0.66,0.02l-0.27,0.57l-0.52,0.43l0.1,0.52l0.33,0.17l0.42,-0.05l-0.12,0.24l-1.26,0.35l-0.28,0.24l-0.07,0.41l0.41,0.33l0.83,-0.19l0.01,0.38l0.35,0.34l-0.41,0.17l-0.14,0.35l-0.59,-0.04l-0.24,0.4l-0.35,0.16l0.06,0.54l-0.29,0.33l-0.13,0.11l-0.09,-0.11l-0.67,0.18l-0.02,0.15l-0.31,-0.3l-0.43,-0.14l-0.12,-0.28l-0.17,-0.11l0.18,-0.58l-0.07,-0.12l-0.48,-0.24l-0.46,0.09l0.2,-0.46l-0.01,-0.33l-0.23,-0.3l-0.3,-0.08l-0.43,0.22l-0.36,0.71l-0.2,0.15l-0.2,-0.02l-0.18,-0.5l-0.51,-0.08l-0.42,0.5l-0.43,-0.05l-0.19,0.37l-0.23,-0.3l-0.45,-0.03l-0.25,0.25l-0.04,0.31l-0.3,-0.08l-0.14,-0.37l-0.12,-0.02l-0.39,0.09l-0.72,0.47l-0.01,-0.27l-0.12,-0.09l-0.86,-0.01l-0.38,0.23l0.01,0.46l-1.69,0.41l-0.81,-0.77l-0.25,-0.04l-0.32,0.3l-0.39,-0.25l-0.96,-0.01l-0.3,-0.5l-0.07,-0.37l0.11,0.09l0.66,-0.33l-0.01,-0.1l0.26,0.09l0.34,-0.07l0.37,0.28l0.07,0.27l0.21,0.23l0.51,-0.04l0.19,-0.29l0.01,-0.28l0.31,0.14l0.44,-0.07l0.47,-0.16l0.09,-0.22l0.53,-0.29l0.5,-0.13l0.3,-0.47l-0.19,-0.43l-0.51,-0.19l-1.87,0.16l-0.47,-0.71l-0.04,-0.34l1.51,-1.29l1.74,-0.62l0.37,-0.29l0.42,-0.58l0.21,0.02l0.26,-0.13l0.8,-1.1l0.24,-1.21l0.46,-0.04l0.73,0.28l1.61,-0.32l1.36,-0.08l-0.05,0.52l0.19,0.48l0.52,0.51l1.2,0.2l0.23,0.45l1.45,1.39l0.16,0.38l0.29,0.16l0.48,-0.33l0.06,-0.48l-0.08,-0.44l-0.39,-0.52l-0.41,-0.12l-0.25,-0.55l-0.39,-0.37l-0.6,-1.46l0.49,-0.09l0.64,-0.47l0.37,-0.01l0.36,-0.23l1.56,0.25l0.38,-0.1l0.15,-0.57l-0.75,-0.62l-0.83,-0.27l-0.64,0.0l-0.98,0.33l-0.55,0.58l-0.65,-0.49l-0.11,-0.29l-0.55,-0.08l0.23,-0.38l-0.2,-0.67l-0.3,-0.01l-0.45,0.3l-0.18,-0.09l-0.33,0.19l-0.85,-0.15l-0.51,0.05l-0.93,0.54l-0.63,-0.12l-0.41,-0.23l-0.48,-0.05l-0.65,0.18l-0.29,-0.03l-0.61,0.32l-0.26,0.3l-0.09,0.42l-0.43,-0.13l-0.68,0.1l-0.55,0.31l-0.65,0.08l-0.57,0.21l-0.42,0.37l-0.15,0.46l-0.6,0.29l-0.6,0.01l-0.33,-0.24l-0.19,-0.75l-0.42,-0.34l-0.33,-0.12l-0.44,0.05l-0.26,0.26l0.14,0.52l0.28,0.07l0.02,0.63l0.32,0.65l0.02,0.67l-0.46,0.14l-0.39,0.32l-0.32,-0.05l-0.53,-0.39l-0.76,-0.31l-0.3,-0.03l-0.52,0.26l0.04,0.67l-0.07,-0.54l-0.29,-0.38l-0.45,0.17l-0.3,0.49l-0.19,-0.37l-0.85,0.2l-0.09,0.06l-0.03,0.5l-0.4,-0.36l-0.35,-0.02l-0.21,0.71l0.08,0.2l-0.35,-0.21l-0.38,0.06l-0.47,-0.19l-0.65,0.34l0.01,0.17l-0.32,0.17l-0.34,0.45l-0.5,0.02l-0.04,0.18l-0.21,0.08l0.0,0.48l-0.21,0.29l-0.05,0.39l0.34,0.39l0.59,-0.1l0.36,0.39l0.52,0.29l-0.03,0.37l0.15,0.4l0.38,0.33l0.0,0.52l-0.33,0.14l-0.48,0.42l-0.52,-0.03l-0.47,0.23l-0.85,-0.45l-0.39,0.03l-0.33,0.34l-0.15,-0.02l-0.08,0.15l-0.17,-0.11l-0.49,0.0l-0.37,0.68l-0.8,-0.11l-0.42,0.08l-0.37,0.3l-0.02,0.34l-0.05,-0.14l-0.37,-0.26l-0.38,0.26l-0.05,0.14l-0.21,-0.12l-0.38,0.21l-0.29,-0.09l-0.37,0.09l-0.5,-0.44l-0.48,-0.15l-1.0,0.59l-0.12,-0.1l-0.35,0.16l-0.42,-0.16l-0.48,0.3l-0.09,-0.34l-0.3,-0.29l-0.39,-0.0l-0.43,0.31l-0.22,0.36l-0.4,-0.17l-0.35,0.36l-0.42,-0.07l-0.41,-0.46l-0.41,0.09l-0.34,0.26l-0.55,-0.13l-0.15,0.1l-0.32,-0.07l-0.78,0.14l-0.41,-0.05l-0.31,0.14l-0.22,0.28l0.03,0.47l0.12,0.1l0.0,0.5l-0.36,-0.03l-0.17,0.19l-0.67,-0.23l-0.41,-0.28l-0.36,0.12l-0.17,0.24l-0.19,-0.25l-0.66,0.27l-0.57,0.09l-0.31,-0.22l-0.27,0.18l-0.14,-0.63l-0.41,-0.25l-0.44,0.09l-0.29,0.36l-0.49,0.09l-0.19,-0.09l-0.2,0.35l-0.03,-0.25l-0.28,-0.29l-0.53,-0.13l-1.34,-0.02l-0.66,0.34l-0.42,-0.34l-0.53,-0.02l-0.88,0.31l-0.74,0.12l-0.17,0.14l-0.15,0.37l0.04,0.2l-0.34,-0.03l-0.42,0.3l-0.09,0.27l-0.29,0.16l-0.22,-0.25l-0.39,-0.03l-0.39,0.2l-0.58,-0.33l-0.87,-0.21l-0.37,-0.18l-0.09,-0.39l-0.39,-0.15l-0.28,0.02l-0.17,0.13l-0.67,-0.68l-0.42,0.02l-0.8,-0.23l-0.32,0.23l-0.41,0.02ZM106.4,539.35l-0.02,0.01l-0.0,0.03l0.02,-0.04ZM106.43,539.32l0.01,-0.01l-0.01,0.0l-0.0,0.01ZM111.57,518.06l-0.28,0.1l-0.37,0.21l0.38,-0.38l0.27,0.08ZM135.54,477.36l-0.14,0.2l-0.03,0.01l0.06,-0.2l0.11,-0.01ZM165.25,532.53l-0.7,0.04l-0.06,-0.16l0.39,-0.18l0.33,-0.39l0.85,-0.3l-0.33,0.55l-0.37,0.09l-0.1,0.36ZM161.82,535.36l0.25,0.0l0.0,0.01l-0.28,0.13l0.03,-0.14ZM158.22,525.53l0.0,-0.0l-0.0,0.0l-0.0,-0.0ZM157.41,525.32l-0.03,-0.01l0.01,-0.01l0.02,0.02ZM141.51,529.3l0.28,0.11l0.27,0.23l-0.18,0.15l-0.38,0.01l-0.06,-0.1l0.11,-0.12l-0.03,-0.28ZM130.96,537.03l0.02,0.01l-0.03,0.02l0.0,-0.03ZM107.99,539.38l0.13,-0.03l0.06,0.1l-0.11,0.04l-0.07,-0.1ZM105.8,540.76l0.01,0.03l-0.02,0.0l0.0,-0.03l0.01,-0.0ZM98.05,537.96l0.0,0.06l-0.04,0.0l0.04,-0.07ZM189.71,556.2l0.09,-0.87l0.26,-0.09l0.03,0.48l-0.38,0.49ZM196.77,565.5l0.54,-0.11l0.83,0.29l0.38,-0.07l0.81,-0.66l0.46,-1.03l0.4,0.03l0.29,-0.09l0.5,-0.42l0.14,-0.26l0.0,-0.34l1.03,0.18l1.86,-0.26l0.42,0.76l-0.02,0.36l0.38,0.82l-0.16,0.4l-0.33,0.23l-0.1,0.5l0.11,0.21l-0.15,0.37l0.08,0.6l0.16,0.27l0.65,0.49l-0.02,0.41l0.25,0.63l0.33,0.27l0.06,0.43l-0.19,0.35l0.18,1.36l1.21,1.64l0.21,1.03l-0.69,-0.21l-0.4,0.06l-0.33,0.42l-0.51,0.26l-0.04,0.35l-0.41,0.21l-0.2,0.31l-0.42,-1.04l-0.8,-0.71l0.15,-0.53l-0.14,-0.43l-0.05,-0.8l0.15,-0.11l0.35,-1.25l-0.24,-0.23l0.05,-0.09l-0.14,-0.02l0.05,-0.08l-0.1,0.06l-0.13,-0.13l-0.11,0.1l-0.03,-0.1l0.14,-0.2l0.38,-2.06l-0.06,-1.21l0.61,-1.16l0.04,-0.36l-0.68,-0.27l-0.56,0.83l-0.22,-0.13l-0.44,0.09l-0.08,0.44l0.07,0.14l-0.37,0.38l0.23,1.2l-0.43,0.98l0.02,1.52l-0.15,0.39l0.01,0.5l-0.3,0.34l-0.12,2.12l-0.33,0.4l-0.18,-0.2l-0.05,-0.31l0.12,-1.48l-0.25,-0.33l-0.54,0.11l-0.1,0.15l-0.79,-0.08l-0.02,-0.13l0.29,-0.11l0.15,-0.25l0.25,-0.95l-0.11,-0.11l-0.07,-1.31l0.94,0.09l0.44,-0.41l-0.08,-0.36l-0.7,-0.48l-0.22,0.08l0.04,-0.97l-0.25,-0.3l-0.34,-0.05l-0.39,0.67l-0.26,0.08l-0.24,0.42l0.35,0.35l-0.2,0.26l-0.04,-0.39l-0.49,-0.25l0.3,-0.64l-0.28,-0.55l-0.26,-0.02l-0.13,-0.53l-0.45,-0.19l-0.25,0.33l-0.21,-0.55ZM207.28,574.49l0.35,0.91l-0.28,0.4l0.04,0.74l0.38,1.41l-0.0,1.31l0.27,1.06l0.37,3.3l0.33,1.42l0.09,1.05l-0.6,0.55l0.03,0.61l0.79,0.61l-0.55,0.81l0.04,0.5l0.56,0.6l-0.11,0.33l0.03,0.54l-0.18,0.59l0.14,0.3l0.2,0.15l0.87,0.27l1.35,1.98l1.13,0.85l0.3,0.83l0.53,0.45l0.04,0.84l0.76,0.62l0.47,0.11l0.02,0.18l-0.21,0.82l-0.71,0.53l-0.36,0.55l-0.03,0.7l-0.35,0.74l0.06,1.04l-0.18,0.6l0.03,0.38l-0.44,0.21l-1.4,1.54l-0.43,0.34l-0.48,0.17l-0.19,-0.14l-0.26,0.0l0.14,-0.54l-0.14,-0.44l-0.65,0.05l-0.07,0.14l-0.09,-0.51l0.26,-0.08l0.11,0.14l0.51,0.15l1.31,-0.89l0.77,-0.71l-0.23,-0.63l-0.45,0.06l0.0,-0.13l-0.38,-0.38l-0.52,0.14l0.69,-1.91l0.27,-1.72l-0.35,-0.25l-0.04,-0.39l-0.25,-0.6l0.53,-0.19l0.37,-0.39l0.16,-0.48l-0.44,-0.25l-0.44,0.1l-0.63,0.36l-0.42,0.05l-0.56,-0.3l-0.16,0.11l-0.21,-0.09l-1.07,0.31l-0.64,-0.05l0.28,-0.15l0.18,-0.31l0.3,-1.03l0.32,0.01l0.78,0.43l0.33,0.02l0.69,-0.35l-0.04,-0.49l-0.35,-0.21l-0.38,0.04l-0.84,-0.44l0.07,-0.93l-0.22,-0.31l-0.44,-0.27l0.05,-0.48l-0.4,-0.66l0.33,-0.41l-0.17,-0.67l-0.35,-0.02l0.13,-0.08l-0.03,-0.23l0.53,-0.28l0.22,-0.59l-0.39,-0.29l-0.68,0.21l-0.41,-0.64l-0.06,-0.43l0.37,-0.24l0.24,-1.12l-0.41,-0.33l-0.48,0.19l-0.14,-0.07l-0.27,-0.39l0.15,-0.23l-0.22,-0.49l-0.49,-0.26l-0.25,0.04l-0.19,0.17l-0.21,-0.25l0.13,-0.23l0.53,0.23l1.01,-0.02l0.4,-0.16l0.16,-0.2l0.05,-0.15l-0.28,-0.52l-0.5,0.1l-0.44,-0.15l0.25,-0.38l-0.01,-0.29l-0.5,-0.27l0.09,-0.26l0.62,-0.0l0.34,0.77l0.29,0.26l0.33,0.01l0.28,-0.17l0.05,-0.48l-0.23,-0.25l-0.4,-1.14l-0.72,-1.0l0.18,-0.54l0.96,0.79l0.3,0.11l0.45,-0.45l-0.05,-0.21l-0.35,-0.47l-1.25,-0.77l-0.25,-0.05l0.21,-0.28l-0.18,-0.43l0.22,-0.16l0.32,-0.62l-0.5,-0.34l-0.27,0.02l-0.35,0.25l-0.02,0.14l-0.39,0.35l-0.1,-0.38l0.12,-0.22l0.01,-0.49l0.28,-0.4l0.39,-0.23l0.18,-0.64l0.25,-0.15l0.25,-0.35l0.34,0.08l0.45,-0.24ZM208.9,604.79l-0.14,0.6l-0.04,-0.01l0.1,-0.48l0.08,-0.11ZM210.37,602.77l-0.57,0.31l-0.25,-0.22l-0.61,0.16l0.07,-0.21l0.55,-0.32l0.81,0.28ZM206.97,596.06l-0.04,0.0l0.0,-0.01l0.04,0.01ZM206.76,596.37l-0.08,0.41l0.26,0.3l-0.54,0.46l-0.46,-0.21l-0.29,0.43l0.05,0.44l-0.14,-0.23l0.12,-0.78l0.24,-0.06l0.03,-0.15l0.5,-0.05l0.3,-0.58ZM205.35,581.23l-0.08,-0.02l-0.02,-0.09l0.1,0.11ZM174.62,442.02l0.16,-0.03l0.01,0.02l-0.12,0.04l-0.05,-0.03ZM149.15,463.88l-0.48,-0.68l0.17,-0.34l0.08,-0.53l0.46,0.23l-0.22,1.31ZM139.58,480.85l-0.2,-0.16l-0.1,-0.17l0.02,-0.02l0.29,0.35ZM110.4,493.59l-0.04,0.0l-0.0,-0.01l0.04,-0.0l0.0,0.0ZM207.1,600.51l-0.19,-0.22l-0.19,-0.6l0.65,-0.29l-0.24,0.42l-0.04,0.69ZM206.1,600.7l-0.0,0.01l0.0,-0.01l0.0,0.0ZM207.6,599.25l0.23,-0.53l-0.13,-0.23l0.59,-0.1l0.3,-0.26l-0.01,-0.13l0.38,-0.35l0.16,-0.57l0.54,-0.04l0.23,1.16l0.07,1.2l-0.18,0.24l0.03,0.13l-0.16,0.03l-0.32,0.84l-0.28,0.19l-0.18,-0.34l0.21,-1.61l-0.4,-0.43l-0.4,0.19l-0.2,0.53l-0.47,0.08ZM206.69,592.9l0.19,-0.29l0.19,0.3l0.37,0.14l-0.02,0.58l-0.25,0.02l-0.48,-0.74ZM204.84,593.41l0.21,-0.32l0.24,-0.03l-0.06,0.39l0.08,0.1l0.28,0.16l0.34,0.0l0.38,0.28l0.05,0.19l-0.37,0.12l0.06,0.4l-0.09,0.26l-0.26,0.09l0.16,-0.53l-0.3,-0.42l-0.07,-0.28l-0.66,-0.41ZM205.68,592.74l0.12,-0.12l0.05,0.06l-0.04,0.06l-0.14,0.0ZM205.02,590.02l0.06,-0.2l0.28,-0.11l0.2,-0.33l-0.02,-0.41l0.06,-0.13l0.29,1.13l-0.65,-0.16l-0.2,0.2ZM202.23,585.03l0.13,-0.03l0.27,0.18l0.93,0.73l0.44,0.47l0.07,0.52l0.45,0.21l0.13,-0.03l0.22,-0.36l0.14,0.05l0.18,0.49l-0.02,0.28l-0.32,0.23l-0.18,0.94l-0.13,-1.28l-0.2,-0.03l-0.21,-0.45l-0.58,0.05l-0.22,0.89l0.07,0.36l0.17,0.15l-0.24,0.37l0.23,0.32l0.16,0.47l-0.2,0.16l-0.8,-0.56l-0.44,0.1l-0.03,0.21l-0.22,-0.05l0.18,-0.54l0.13,-0.1l-0.06,-0.28l0.1,0.01l0.05,-0.14l-0.04,-0.41l0.48,-0.79l0.11,-0.48l-0.25,-0.42l0.07,-0.26l-0.3,-0.33l-0.26,-0.63ZM204.11,591.3l0.32,-0.24l0.41,0.24l0.3,-0.01l-0.25,0.23l-0.09,0.42l-0.18,0.06l-0.19,-0.01l-0.32,-0.68ZM201.15,595.61l0.39,-0.04l0.71,-0.6l0.17,-0.41l-0.02,-0.35l-0.29,-0.08l0.28,-0.75l0.11,0.2l0.52,0.24l0.23,0.34l0.37,0.27l0.43,1.44l-0.06,0.78l-0.11,0.23l-0.18,-0.04l-0.49,0.47l0.07,0.29l-0.79,0.31l-0.07,0.49l0.07,0.41l0.53,0.0l-0.02,0.12l0.39,0.47l0.21,-0.01l0.23,0.24l0.23,-0.06l0.16,0.27l0.04,0.2l-0.39,-0.09l-0.34,0.45l-0.07,0.31l0.2,0.39l0.69,0.17l-0.31,0.02l-0.39,0.51l-0.49,0.15l0.01,-0.38l-0.25,-0.1l-0.13,-0.29l0.03,-0.93l-0.19,-0.86l-0.55,0.06l-0.09,-0.43l0.17,-0.51l-0.46,-0.42l0.16,-0.04l-0.02,-0.49l-0.3,-0.24l0.21,-0.25l0.29,-0.11l0.37,0.02l0.22,-0.65l-0.53,-0.28l-1.08,0.01l-0.17,-0.19l0.34,-0.25ZM203.12,602.04l0.1,0.62l0.38,0.29l-0.14,0.15l-0.01,0.33l0.19,0.34l-0.25,0.06l-0.09,0.28l-0.22,-0.12l0.22,-0.36l-0.34,-1.17l0.11,-0.07l-0.04,-0.22l0.1,-0.14ZM203.35,597.92l0.0,0.0l-0.0,-0.0l0.0,-0.0ZM202.64,592.33l-0.02,-0.23l-0.18,-0.27l-0.57,-0.24l-0.38,-0.33l0.04,-0.12l0.23,-0.13l0.24,0.13l0.03,0.3l0.41,0.29l0.13,-0.01l0.16,-0.25l0.01,0.41l0.15,0.18l-0.07,0.32l-0.19,-0.05ZM199.97,583.58l0.25,-0.55l0.45,-0.17l-0.03,-0.41l0.33,-0.19l0.26,0.24l0.53,-0.27l-0.12,0.49l-0.21,0.32l-0.34,-0.04l-0.38,0.34l-0.32,-0.04l-0.11,0.23l-0.31,0.06ZM202.63,581.99l-0.01,-0.02l0.01,0.0l0.0,0.02ZM202.51,581.14l-0.13,0.03l-0.03,0.48l-0.5,0.27l-0.01,-0.56l-0.44,-0.14l-0.03,-0.19l0.6,-0.09l0.24,-0.62l-0.38,-0.27l-0.47,-0.02l-0.09,-0.31l0.16,-1.0l0.22,-0.37l0.21,-0.81l0.17,-0.88l-0.05,-0.32l0.42,-0.42l0.65,0.16l0.25,0.34l-0.08,0.37l-0.18,0.13l0.02,0.26l-0.13,0.04l-0.1,0.73l-0.26,0.61l0.01,0.1l0.33,0.12l0.15,1.13l-0.17,0.29l0.4,0.49l-0.13,0.37l-0.51,-0.18l-0.16,0.25ZM203.26,574.86l0.1,0.02l0.05,0.13l-0.14,-0.13l-0.0,-0.02ZM200.56,588.29l-0.08,-0.33l-0.15,-0.02l0.1,-0.05l0.11,0.08l0.09,0.31l-0.07,0.02ZM200.12,587.92l-0.07,-0.01l-0.0,-0.01l0.01,-0.0l0.07,0.02ZM200.37,586.97l-0.16,-0.4l-0.43,-0.09l0.1,-0.17l0.4,0.09l0.16,-0.21l0.28,0.17l0.27,-0.12l0.0,0.58l-0.09,0.12l-0.26,0.22l-0.28,-0.19ZM201.49,592.7l-0.1,-0.02l0.02,-0.11l0.12,-0.03l-0.04,0.17ZM200.65,592.73l-0.02,0.02l-0.16,0.03l0.09,-0.08l0.09,0.04ZM195.39,575.1l0.13,-0.1l0.32,0.81l0.27,0.26l0.58,-0.41l-0.42,-1.39l0.16,0.12l0.49,-0.01l0.11,-0.88l0.2,0.31l0.55,0.02l0.21,-0.32l0.27,-0.08l0.58,0.85l-0.37,0.18l-0.69,-0.15l-0.15,0.28l-0.14,-0.08l-0.56,0.2l0.03,0.46l0.24,0.6l0.52,0.51l0.21,0.54l0.4,0.42l-0.17,0.22l0.09,0.51l0.4,0.15l0.12,0.22l0.3,0.1l0.81,-0.05l-0.16,0.99l-0.21,0.51l-0.26,-0.12l-1.86,-3.21l-0.28,-0.23l-0.62,0.31l0.06,0.43l-0.27,0.19l0.22,0.69l0.2,0.1l-0.12,0.12l-0.06,0.45l0.16,0.09l0.06,0.25l-0.29,0.13l-0.08,-0.6l-0.36,-0.69l0.31,-0.17l-0.14,-0.48l-0.2,-0.19l0.01,-0.36l-0.25,-0.56l0.02,-0.34l-0.25,-0.15l-0.11,-0.46ZM198.57,575.78l0.52,-0.38l0.44,-0.12l0.69,0.39l0.05,0.19l0.37,0.31l0.02,0.18l-0.14,0.22l-0.34,-0.45l-0.61,-0.13l-0.19,0.37l0.01,0.19l0.26,0.64l-0.2,-0.12l-0.87,-1.29ZM197.4,579.96l0.2,0.09l0.33,-0.11l-0.02,0.3l0.46,0.2l0.23,0.33l-0.16,0.05l-0.02,0.25l0.08,0.33l-0.06,0.32l0.21,0.36l-0.12,0.88l0.11,0.42l-0.12,0.06l-0.17,0.59l-0.23,1.9l-0.31,0.87l-0.21,-0.03l-0.2,0.38l-0.03,0.54l-0.52,1.19l-0.15,-0.9l-0.02,-1.09l0.35,-0.03l0.67,-0.56l-0.07,-0.72l-0.19,-0.05l0.01,-0.57l-0.14,-0.2l-0.2,-0.01l-0.2,-0.65l-0.51,-0.01l0.33,-0.22l0.02,-0.34l0.7,-0.09l0.2,-0.29l-0.1,-0.53l-0.52,-0.27l-0.0,-0.1l0.61,-0.26l-0.29,-1.24l-0.54,-0.23l0.25,0.04l0.27,-0.16l0.1,-0.43ZM195.81,580.52l-0.11,0.19l0.0,-0.37l0.11,0.18ZM195.45,581.71l-0.18,0.24l-0.21,-0.02l0.06,-0.09l0.33,-0.12ZM166.9,538.83l0.06,-0.04l0.0,0.06l-0.06,-0.02ZM167.11,538.95l0.14,0.08l0.02,0.11l-0.16,-0.18ZM161.05,540.17l0.02,-0.05l0.3,0.02l0.37,-0.3l0.19,-0.01l-0.35,0.19l-0.13,0.29l-0.39,-0.13ZM135.33,540.66l0.22,0.31l0.6,-0.08l0.07,-0.42l-0.07,-0.17l0.71,0.45l0.28,-0.22l0.24,-0.69l0.19,-0.18l0.34,0.1l-0.17,0.51l0.11,0.35l-0.07,0.25l0.28,0.22l-0.63,0.48l0.06,-0.1l-0.16,-0.67l-0.37,-0.01l-0.74,0.65l-0.1,-0.23l-0.47,0.05l-0.18,0.2l-0.16,-0.35l0.03,-0.21l-0.1,-0.04l0.11,-0.21ZM138.62,541.16l-0.18,-0.04l0.14,-0.08l0.05,0.11ZM125.8,544.87l0.6,-0.15l0.09,0.05l-0.61,0.5l-0.08,-0.39ZM126.2,543.5l0.18,-0.98l-0.32,-0.49l0.3,-0.05l0.26,-0.39l0.25,-0.03l0.28,-0.29l0.43,0.23l0.18,-0.14l0.44,0.12l0.16,-0.28l0.18,-0.04l0.36,0.08l0.39,0.35l-0.66,0.08l-0.0,0.49l0.42,0.33l-0.32,0.72l0.07,0.46l-0.06,0.52l0.34,0.82l0.44,0.2l0.31,-0.36l-0.14,-0.65l0.13,-0.61l0.23,-0.4l0.3,0.14l0.35,-0.29l0.43,0.11l0.52,-0.04l0.21,-0.24l0.14,-0.02l0.24,0.16l0.21,-0.03l0.17,0.33l0.67,-0.25l0.26,-0.42l0.27,0.22l-0.19,0.28l-0.04,0.41l0.26,0.39l0.48,-0.04l0.32,-0.45l0.28,0.19l0.45,-0.19l0.37,0.14l-0.13,0.29l-0.77,0.26l-0.2,0.37l0.19,0.45l-0.09,0.59l0.3,0.21l0.31,0.07l-0.64,0.25l-0.16,-0.22l-0.29,-0.1l-0.07,-0.2l-0.24,-0.18l-0.12,-0.34l-0.95,-0.71l-0.26,0.2l-0.66,0.22l-0.18,0.25l0.16,0.4l-0.16,-0.05l-0.3,-0.39l-0.43,0.12l-0.28,0.54l-0.86,-0.26l-0.1,0.11l-0.26,-0.21l-0.24,-0.04l-0.25,0.09l-0.22,0.45l-0.12,-0.06l0.11,-0.41l-0.2,-0.39l-0.49,-0.11l-0.3,0.07l0.05,-0.16l-0.49,-0.6l-0.82,-0.56l-0.36,-0.07ZM134.27,542.42l-0.01,-0.05l0.17,-0.06l0.0,0.05l-0.16,0.07ZM132.2,545.58l0.25,-0.03l0.37,0.14l0.22,0.62l-0.1,0.08l-0.21,-0.1l0.05,-0.11l-0.29,-0.51l-0.28,-0.08ZM126.26,546.94l-0.15,0.05l-0.01,-0.01l0.06,-0.03l0.11,-0.0ZM131.32,541.84l-0.53,-0.58l0.32,-0.33l0.47,-0.02l0.05,0.41l-0.32,0.53ZM105.81,462.39l-0.11,-0.32l0.35,-0.73l0.36,-0.32l0.68,-0.25l-0.18,0.17l0.11,0.32l-0.14,-0.01l0.06,0.34l0.69,0.55l0.17,0.58l0.33,0.45l0.3,0.27l1.18,0.11l0.29,0.2l0.33,0.06l0.24,0.31l-0.01,0.58l0.1,0.26l-0.21,0.31l-0.27,0.11l-0.22,0.43l0.38,0.42l0.17,0.76l0.36,0.34l-0.18,0.36l-0.0,0.32l0.2,0.38l0.45,0.25l-0.07,0.47l0.15,0.3l-0.4,-0.26l-0.47,-0.12l-1.23,0.14l0.06,-0.93l-0.25,-0.52l-0.02,-0.5l-0.15,-0.17l0.25,-0.53l-0.13,-0.43l-0.01,-0.64l-0.26,-0.89l-0.24,-0.37l-0.03,-0.47l-0.8,-0.64l-0.94,-0.23l-0.15,-0.01l-0.0,0.09l-0.53,-0.08l-0.18,-0.48ZM111.34,469.47l0.34,0.23l0.34,-0.0l0.32,0.49l-0.46,0.25l-0.33,-0.58l-0.24,-0.19l0.02,-0.19ZM99.58,492.96l0.13,-0.45l0.36,0.29l0.67,0.85l0.32,0.21l0.39,-0.01l0.4,-0.28l0.18,0.05l0.18,0.25l0.48,0.04l0.28,-0.1l-0.04,0.35l0.68,0.15l0.17,0.26l-0.1,0.36l0.08,0.18l0.27,0.32l0.48,0.17l0.05,0.26l-0.71,0.6l-0.06,0.37l-0.25,0.08l-0.34,0.96l-0.72,-0.21l-0.37,-0.45l-0.21,0.14l-0.22,-0.05l-0.29,-0.37l-0.41,-0.11l-0.21,-0.4l-0.47,-0.4l-0.43,-1.65l0.1,-0.21l-0.16,-0.32l-0.27,-0.19l0.1,-0.37l-0.07,-0.3ZM95.47,539.48l0.12,-0.24l0.1,0.3l0.17,0.12l-0.0,0.16l-0.2,-0.34l-0.19,-0.01ZM88.44,537.17l0.0,-0.02l0.03,0.0l-0.03,0.01ZM77.94,532.86l0.31,-0.91l0.71,0.25l0.4,-0.03l1.64,-0.75l0.19,0.0l0.11,0.36l0.43,0.42l0.29,0.09l0.42,-0.18l0.53,0.24l0.62,-0.02l0.51,0.26l0.41,0.41l0.02,0.57l-0.53,1.12l-0.34,0.06l-0.25,0.24l-0.3,0.0l-0.28,-0.08l-0.42,-0.6l-1.35,-0.96l-0.46,-0.11l-0.79,0.04l-0.43,0.31l-0.25,0.05l-0.89,-0.43l-0.29,-0.34ZM72.06,531.33l0.05,-0.29l0.35,0.02l0.04,0.43l-0.33,-0.2l-0.06,0.1l-0.05,-0.06ZM62.39,530.55l0.16,-0.01l0.12,0.09l-0.08,0.09l-0.2,-0.16ZM62.89,530.86l0.03,0.06l0.02,0.04l-0.11,-0.1l0.06,0.01ZM67.63,532.06l-0.22,-0.27l-0.39,0.07l0.31,-0.15l0.34,0.02l0.42,-0.6l-0.29,-0.36l-0.27,-0.66l-0.29,-0.25l0.08,-0.32l0.43,-0.1l0.43,0.15l0.4,0.29l0.15,0.23l-0.34,0.42l0.08,0.55l-0.1,0.18l-0.36,0.12l-0.04,0.3l-0.13,-0.03l-0.21,0.41ZM66.48,531.55l-0.31,0.29l-0.03,0.08l-0.08,-0.11l0.27,-0.3l-0.12,-0.26l0.07,-0.05l0.18,-0.01l0.03,0.37ZM68.16,529.58l-0.03,-0.02l-0.0,-0.01l0.04,0.03ZM57.55,529.02l0.25,-0.15l0.2,-0.38l0.16,-0.08l0.64,0.01l0.12,0.21l0.37,0.15l0.09,0.15l-0.15,0.14l-0.22,-0.04l-0.65,0.2l-0.42,-0.23l-0.38,0.0ZM60.36,528.86l0.09,-0.37l0.33,-0.35l0.69,-0.04l0.67,0.28l0.23,0.6l-0.17,0.06l-0.19,0.26l-1.26,-0.24l-0.38,-0.2ZM34.78,515.5l0.04,0.03l-0.03,0.13l-0.02,-0.17l0.01,0.0ZM35.78,515.3l0.08,-0.23l-0.1,-0.29l0.37,0.05l0.06,0.52l-0.34,0.04l-0.08,-0.09ZM28.34,509.91l0.02,-0.07l0.04,-0.02l-0.01,0.1l-0.05,-0.01ZM24.83,509.43l0.48,-0.33l0.11,0.34l-0.02,0.11l-0.3,0.01l-0.27,-0.13ZM23.14,507.45l0.08,0.02l-0.03,0.03l-0.05,-0.05ZM21.49,504.95l-0.1,0.01l0.06,-0.23l0.04,0.13l0.0,0.1ZM21.53,504.44l-0.09,0.14l-0.13,-0.33l0.02,-0.27l0.21,0.2l-0.01,0.26ZM14.7,495.17l0.26,0.08l-0.03,0.22l-0.17,-0.02l-0.07,-0.27ZM1.42,466.35l0.24,-0.09l0.22,-0.4l-0.29,-0.43l0.05,-0.12l0.24,0.2l0.16,0.67l0.46,0.46l-0.28,0.18l0.12,0.42l-0.13,-0.01l-0.15,-0.38l-0.53,-0.19l-0.1,-0.31Z",
         "name": "Alaska"
      },
      "US-NJ": {
         "path": "M802.92,165.5l1.3,-1.54l0.47,-1.56l0.49,-0.62l0.53,-1.44l0.1,-2.03l0.67,-1.34l0.92,-0.72l14.17,3.88l-0.26,5.58l-0.5,0.83l-0.13,-0.29l-0.65,-0.06l-0.34,0.44l-0.55,1.45l-0.44,2.7l0.27,1.53l0.64,0.6l1.06,0.13l1.23,-0.45l2.47,0.24l0.67,1.83l-0.16,4.48l0.29,0.46l-0.54,0.44l0.27,0.8l-0.72,0.75l0.46,0.57l-0.2,0.58l0.48,0.6l-0.14,3.74l0.59,0.51l-0.35,1.34l-1.13,1.82l-0.1,0.93l-1.37,0.1l0.11,1.19l0.64,0.8l-0.82,0.56l-0.17,1.14l1.05,0.74l-0.31,0.29l-0.18,-0.44l-0.54,-0.17l-0.49,0.23l-0.43,1.49l-1.27,0.62l-0.2,0.44l0.46,0.55l0.8,0.05l-0.64,1.25l-0.25,1.48l-0.67,0.65l0.19,0.48l0.4,0.04l-0.88,1.56l0.08,0.93l-1.55,1.66l-0.19,-1.61l0.32,-2.04l-0.12,-0.85l-0.59,-0.8l-0.9,-0.26l-1.11,0.36l-0.82,-0.33l-1.51,0.9l-0.31,-0.69l-1.63,-0.92l-1.0,0.06l-0.66,-0.68l-0.7,0.08l-3.26,-1.95l-0.07,-1.7l-1.02,-0.91l0.47,-0.67l-0.0,-0.87l0.42,-0.83l-0.13,-0.72l0.5,-1.17l1.19,-1.16l2.59,-1.51l0.54,-0.86l-0.38,-0.83l0.49,-0.38l0.46,-1.43l1.23,-1.7l2.51,-2.23l0.18,-0.66l-0.48,-0.81l-4.29,-2.67l-0.76,-1.02l-0.9,0.25l-0.48,-0.32l-1.26,-2.41l-1.62,0.01l-1.03,-3.38l1.01,-1.02l0.35,-2.21l-1.88,-1.86Z",
         "name": "New Jersey"
      },
      "US-ME": {
         "path": "M837.19,56.84l0.85,-1.16l1.45,1.68l0.84,0.03l0.36,-2.12l-0.49,-2.18l1.71,0.33l0.72,-0.43l0.21,-0.53l-0.33,-0.69l-1.18,-0.45l-0.45,-0.61l0.17,-1.43l0.83,-2.04l2.05,-2.28l-0.01,-0.99l-0.53,-0.93l1.0,-1.66l0.36,-1.52l-0.23,-0.91l-1.02,-0.34l-0.09,-1.42l-0.41,-0.43l0.54,-0.97l-0.05,-0.63l-1.02,-1.25l0.1,-1.74l0.36,-0.64l-0.17,-0.98l1.19,-1.95l-1.06,-6.19l5.24,-19.09l2.24,-0.25l1.2,3.2l0.56,0.42l2.56,0.53l1.8,-1.76l1.66,-0.85l1.21,-1.74l1.25,-0.13l0.64,-0.48l0.22,-1.45l0.42,-0.3l1.36,0.03l3.71,1.38l1.16,0.96l2.39,1.03l8.78,22.69l0.65,0.64l-0.24,0.96l0.73,1.01l-0.08,1.41l0.56,1.29l0.68,0.46l1.05,-0.13l1.13,0.56l0.98,0.09l2.46,-0.57l0.41,0.94l-0.57,1.43l1.72,1.84l0.32,2.68l2.75,1.63l0.98,-0.12l0.46,-0.75l-0.07,-0.5l1.22,0.23l3.0,2.75l0.04,0.47l-0.52,-0.13l-0.38,0.41l0.19,0.77l-0.77,-0.14l-0.34,0.4l0.16,0.63l1.87,1.58l0.15,-0.88l0.38,-0.17l0.81,0.31l0.26,-0.83l0.33,0.4l-0.3,0.85l-0.52,0.19l-1.16,3.25l-0.63,-0.03l-0.31,0.44l-0.57,-1.04l-0.72,0.04l-0.3,0.51l-0.56,0.07l-0.02,0.49l0.59,0.84l-0.91,-0.44l-0.31,0.63l0.27,0.51l-1.2,-0.26l-0.36,0.3l-0.36,0.78l0.08,0.45l0.44,0.08l0.09,1.2l-0.38,-0.57l-0.54,-0.05l-0.39,0.46l-0.19,1.09l-0.5,-1.52l-1.13,0.03l-0.67,0.76l-0.34,1.48l0.6,0.61l-0.82,0.64l-0.7,-0.45l-0.71,1.05l0.11,0.64l0.99,0.6l-0.35,0.22l-0.09,0.82l-0.46,-0.2l-0.87,-1.8l-1.04,-0.44l-0.38,0.22l-0.45,-0.41l-0.56,0.64l-1.25,-0.17l-0.25,0.86l0.78,0.38l0.01,0.36l-0.52,-0.05l-0.55,0.41l-0.08,0.69l-0.51,-1.01l-1.17,-0.0l-0.15,0.64l0.53,0.86l-1.42,0.98l0.85,1.09l0.1,1.05l0.54,0.64l-0.97,-0.39l-0.96,0.23l-1.2,-0.4l-0.19,-0.9l0.74,-0.29l-0.09,-0.55l-0.43,-0.49l-0.67,-0.11l-0.3,0.33l-0.27,-2.35l-0.38,-0.21l-1.1,0.28l0.07,1.95l-1.82,1.94l0.03,0.5l1.27,1.44l-0.63,0.96l-0.14,3.85l0.79,1.39l-0.56,0.54l0.01,0.63l-0.5,0.56l-0.8,-0.18l-0.44,0.93l-0.62,-0.05l-0.42,-1.14l-0.73,-0.2l-0.5,1.03l0.12,0.68l-0.44,0.6l0.15,2.4l-0.97,-0.99l0.12,-1.27l-0.25,-0.59l-0.81,0.3l-0.06,2.0l-0.44,-0.24l0.13,-1.54l-0.48,-0.39l-0.67,0.49l-0.73,3.04l-0.77,-1.81l0.05,-1.5l-0.76,0.06l-1.03,2.77l0.52,0.54l0.72,-0.27l0.94,2.01l-0.29,-0.58l-0.52,-0.22l-0.65,0.31l-0.06,0.64l-1.38,-0.08l-2.12,3.19l-0.51,1.87l0.3,0.59l-0.67,0.66l0.51,0.42l0.91,-0.23l0.37,0.91l-0.76,0.31l-0.2,0.4l-0.41,-0.04l-0.5,0.57l-0.13,1.03l0.68,1.35l-0.07,0.67l-0.77,1.3l-0.93,0.62l-0.39,1.07l-0.09,1.28l0.44,0.88l-0.37,2.8l-0.8,-0.32l-0.4,0.6l-1.03,-0.74l-0.59,-1.83l-0.94,-0.36l-2.38,-1.94l-0.8,-3.42l-13.69,-35.19ZM864.39,80.9l0.09,0.26l-0.08,0.23l0.03,-0.28l-0.04,-0.2ZM865.81,81.1l0.47,0.69l-0.04,0.47l-0.32,-0.24l-0.11,-0.92ZM868.11,77.94l0.43,0.81l-0.16,0.14l-0.42,-0.18l0.15,-0.77ZM877.3,64.42l-0.14,0.2l-0.03,-0.23l0.17,0.03ZM873.48,74.78l0.01,0.02l-0.02,0.03l0.01,-0.05ZM882.98,63.24l0.02,-1.16l0.4,-0.66l-0.18,-0.44l0.4,-0.5l0.62,-0.12l1.56,1.32l-0.48,0.65l-1.08,0.06l-0.26,0.44l0.59,1.29l-0.99,-0.16l-0.15,-0.56l-0.44,-0.16ZM879.6,65.86l0.62,0.39l-0.35,0.3l0.16,0.95l-0.4,-0.62l0.18,-0.53l-0.21,-0.49ZM878.42,70.38l0.09,-0.01l0.47,-0.09l-0.24,0.45l-0.32,-0.36Z",
         "name": "Maine"
      },
      "US-MD": {
         "path": "M742.19,220.07l-2.1,-9.88l19.86,-4.71l-0.65,1.27l-0.95,0.09l-1.54,0.82l0.16,0.69l-0.41,0.49l0.23,0.76l-1.76,0.52l-1.48,0.05l-1.12,-0.36l0.2,-0.35l-0.3,-0.49l-1.11,-0.29l-0.46,1.78l-1.61,2.82l-1.38,-0.37l-1.03,0.63l-0.4,1.24l-1.59,1.92l-0.36,1.03l-0.88,0.46l-1.3,1.86ZM762.24,204.93l37.01,-9.59l8.42,25.88l0.48,0.25l8.46,-2.33l0.26,0.69l0.6,0.02l0.39,0.93l0.52,-0.06l-0.37,1.93l-0.13,-0.26l-0.47,0.07l-0.72,0.86l-0.15,2.66l-0.6,0.19l-0.35,0.7l-0.01,1.45l-3.64,1.55l-0.36,0.75l-2.25,0.46l-0.56,0.65l-0.31,-1.05l0.5,-0.31l0.86,-1.83l-0.41,-0.5l-0.43,0.12l0.06,-0.48l-0.44,-0.41l-2.29,0.66l0.3,-0.59l1.15,-0.84l-0.18,-0.69l-1.36,-0.15l0.37,-2.2l-0.19,-1.01l-0.91,0.17l-0.52,1.75l-0.35,-0.67l-0.61,-0.06l-0.44,0.47l-0.49,1.38l0.54,1.0l-2.89,-2.07l-0.43,-0.18l-0.6,0.37l-0.74,-0.74l0.36,-0.82l-0.04,-0.83l0.76,-0.6l-0.08,-1.33l2.08,0.06l0.88,-0.46l0.36,-0.9l-0.33,-1.4l-0.43,-0.04l-0.52,1.3l-0.39,0.1l-1.05,-0.69l0.05,-0.39l-0.52,-0.27l-0.55,0.23l-0.23,-0.66l-0.73,0.1l-0.12,0.29l0.07,-0.72l1.14,-0.39l0.21,-1.04l-0.54,-0.54l-0.57,0.71l-0.2,-0.51l0.87,-0.87l-0.26,-0.65l-0.54,-0.07l-0.09,-0.47l-0.42,-0.26l-0.35,0.16l-0.65,-0.51l0.87,-0.8l-0.24,-1.01l0.92,-2.36l-0.18,-0.43l-0.46,0.02l-0.66,0.67l-0.56,-0.16l-0.6,0.96l-0.75,-0.59l0.46,-3.53l0.59,-0.52l0.06,-0.6l4.22,-1.26l0.11,-0.71l-0.51,-0.28l-2.37,0.46l0.75,-1.25l1.43,-0.07l0.35,-0.5l-0.99,-0.65l0.42,-1.88l-0.63,-0.32l-1.18,1.81l0.04,-1.46l-0.6,-0.34l-0.67,1.1l-1.62,0.68l-0.3,1.63l0.39,0.53l0.64,0.11l-1.44,1.91l-0.21,-1.61l-0.64,-0.41l-0.61,0.72l0.08,1.44l-0.85,-0.28l-1.15,0.65l0.03,0.71l1.01,0.24l-0.36,0.53l-0.83,0.23l-0.05,0.34l-0.45,-0.03l-0.34,0.65l1.15,1.16l-1.88,-0.63l-1.21,0.6l0.17,0.69l1.57,0.55l0.92,0.9l0.72,-0.13l0.56,0.72l-0.98,-0.05l-1.14,1.36l0.33,0.77l1.57,0.87l-0.67,0.13l-0.21,0.42l0.79,1.06l-0.3,0.56l0.33,0.94l0.57,0.45l-0.5,1.07l1.0,1.22l0.99,3.47l0.62,0.82l2.08,1.57l0.42,0.78l-0.58,0.18l-0.65,-0.73l-1.46,-0.28l-1.65,-1.22l-1.35,-3.09l-0.74,-0.66l-0.3,0.37l0.12,0.7l1.3,3.47l1.16,1.27l2.06,0.69l1.04,1.08l0.63,0.13l0.91,-0.36l-0.02,1.09l1.67,1.5l0.11,1.08l-0.9,-0.33l-0.52,-1.26l-0.64,-0.44l-0.45,0.05l-0.12,0.44l0.27,0.77l-0.68,0.1l-0.66,-0.8l-1.41,-0.64l-2.39,0.66l-0.7,-0.65l-0.72,-1.46l-1.27,-0.68l-0.46,0.15l0.01,0.48l1.15,1.78l-0.23,-0.07l-1.63,-1.15l-1.68,-2.23l-0.45,-0.01l-0.37,1.42l-0.33,-0.78l-0.74,0.2l-0.21,0.27l0.33,0.72l-0.1,0.54l-0.76,0.54l-0.95,-1.45l0.06,-1.65l0.76,-0.6l-0.13,-0.81l0.71,-0.39l0.2,-1.59l1.07,-1.03l-0.01,-1.02l-0.47,-0.84l1.25,-2.17l-0.14,-0.54l-2.73,-1.61l-0.55,0.14l-0.63,1.08l-1.87,-0.23l-0.53,-0.81l-1.12,-0.49l-2.42,0.1l-1.25,-0.87l0.6,-1.34l-0.41,-0.96l-1.19,-0.28l-0.89,-0.63l-2.7,0.11l-0.36,-0.22l-0.12,-1.24l-1.04,-0.58l0.09,-1.18l-0.51,-0.28l-0.48,0.2l-0.24,-0.62l-0.5,-0.13l0.24,-0.81l-0.46,-0.57l-0.69,-0.11l-1.81,0.69l-2.23,-1.21ZM791.61,211.89l1.15,0.15l0.29,0.15l-0.51,0.29l-0.92,-0.6ZM804.73,225.05l-0.02,0.32l-0.21,-0.13l0.23,-0.19ZM808.72,228.4l-0.14,0.28l-0.13,0.07l0.01,-0.23l0.25,-0.12ZM799.19,220.15l-0.05,0.01l-0.02,0.01l0.05,-0.03l0.02,0.01ZM798.85,220.3l-0.23,0.54l-0.17,0.12l0.14,-0.59l0.27,-0.07ZM797.54,216.38l-0.28,0.3l-0.72,-0.26l0.02,-0.31l0.26,-0.36l0.72,0.64ZM796.15,212.56l-0.33,0.77l-0.6,0.24l0.01,-1.45l0.92,0.45ZM803.88,228.23l0.1,-0.1l0.11,0.06l-0.21,0.03Z",
         "name": "Maryland"
      },
      "US-AR": {
         "path": "M499.92,377.33l-1.49,-37.58l-4.53,-23.63l37.83,-2.71l39.17,-3.76l0.8,1.57l1.02,0.69l0.11,1.73l-0.77,0.56l-0.22,0.92l-1.42,0.93l-0.29,1.03l-0.83,0.54l-1.19,2.56l0.02,0.7l0.53,0.25l10.98,-1.52l0.87,0.91l-1.18,0.36l-0.52,0.95l0.25,0.49l0.84,0.39l-3.61,2.69l0.02,0.84l0.83,1.01l-0.59,1.14l0.62,0.95l-1.42,0.74l-0.11,1.43l-1.45,2.07l0.12,1.62l0.92,3.05l-0.14,0.27l-1.09,-0.01l-0.32,0.26l-0.5,1.71l-1.52,0.95l-0.04,0.51l0.8,0.89l0.05,0.63l-1.11,1.2l-2.03,1.13l-0.21,0.62l0.43,0.98l-0.19,0.26l-1.24,0.04l-0.42,0.67l-0.32,1.87l0.47,1.55l0.03,3.04l-1.28,1.09l-1.55,0.14l0.23,1.47l-0.21,0.48l-0.93,0.25l-0.59,1.75l-1.49,1.19l-0.02,0.93l1.4,0.75l-0.02,0.68l-1.24,0.3l-2.24,1.23l0.04,0.67l0.99,0.8l-0.45,1.13l0.54,1.36l-1.09,0.61l-1.9,2.56l0.52,0.7l1.01,0.48l0.01,0.56l-0.99,0.29l-0.42,0.64l0.51,0.83l1.64,0.99l0.07,1.75l-0.59,0.98l-0.09,0.84l0.29,0.4l1.06,0.38l0.51,2.15l-1.09,1.01l0.07,2.1l-25.98,2.35l-25.74,1.93l-0.86,-11.44l-1.19,-0.85l-0.9,0.17l-0.83,-0.35l-0.93,0.39l-1.23,-0.33l-0.56,0.72l-0.47,0.01l-0.49,-0.48l-0.83,-0.14l-0.63,-0.99Z",
         "name": "Arkansas"
      },
      "US-MA": {
         "path": "M878.75,135.13l1.03,-0.2l0.84,-1.14l0.45,0.55l-1.05,0.65l-1.28,0.13ZM832.87,132.8l-0.47,-0.28l-10.39,2.68l-0.25,-0.17l-0.41,-14.64l29.93,-8.29l1.51,-1.81l0.33,-1.48l0.94,-0.36l0.6,-1.04l1.29,-1.09l1.23,-0.1l-0.43,1.05l1.36,0.52l-0.16,0.61l0.45,0.81l1.0,0.34l-0.06,0.32l0.4,0.27l1.31,0.16l-0.15,0.55l-2.5,1.89l-0.03,1.07l0.45,0.15l-1.09,1.41l0.24,1.07l-1.0,0.97l0.6,1.39l1.4,0.42l0.51,0.61l1.36,-0.59l0.32,-0.6l1.2,0.07l0.8,0.45l0.24,0.67l1.8,1.32l-0.06,1.23l-0.36,0.3l0.12,0.61l1.59,0.78l1.19,-0.16l0.69,1.17l0.23,1.13l0.9,0.66l1.33,0.38l1.48,-0.15l0.43,0.36l1.05,-0.25l3.32,-2.79l0.38,-0.7l0.54,0.01l0.58,1.82l-3.31,1.56l-0.93,0.83l-1.89,0.89l-0.51,-0.11l-0.44,0.45l-0.37,1.42l-1.93,1.29l-0.84,-2.48l0.1,-1.34l-0.55,-0.29l-0.49,0.4l-0.93,-0.09l-0.3,0.51l0.25,0.9l-0.25,0.79l-0.4,0.07l-0.62,1.1l-0.61,-0.19l-0.49,0.49l0.23,1.83l-0.89,0.88l-0.64,-0.78l-0.47,0.02l-0.1,0.55l-0.26,0.04l-0.72,-1.98l-1.02,-0.34l0.42,-2.47l-0.21,-0.39l-0.77,0.41l-0.28,1.46l-0.7,0.21l-1.41,-0.61l-0.8,-2.08l-0.8,-0.21l-0.8,-2.11l-0.49,-0.23l-6.12,2.09l-0.3,-0.14l-14.81,4.4l-0.27,0.51ZM861.69,109.95l-0.02,-0.36l-0.15,-0.47l0.51,0.21l-0.35,0.62ZM877.31,122.26l-0.42,-0.64l0.06,-0.05l0.45,0.65l-0.09,0.05ZM876.38,120.74l-0.87,-0.1l-0.95,-1.38l1.45,0.96l0.36,0.52ZM872.43,119.06l-0.05,0.24l-0.32,-0.18l0.1,0.01l0.28,-0.07ZM872.93,134.59l0.01,-0.02l0.01,0.03l-0.02,-0.01ZM868.26,137.09l0.76,-0.56l0.27,-1.16l0.84,-1.19l0.17,0.25l0.46,-0.12l0.35,0.51l0.71,-0.02l0.18,0.36l-2.1,0.76l-1.33,1.32l-0.32,-0.15Z",
         "name": "Massachusetts"
      },
      "US-AL": {
         "path": "M610.27,337.63l25.27,-3.08l19.48,-2.89l14.31,42.76l0.8,1.38l0.22,1.04l1.18,1.57l0.61,1.86l2.26,2.46l0.94,1.78l-0.1,2.12l1.81,1.11l-0.17,0.73l-0.64,0.11l-0.15,0.7l-0.98,0.85l-0.21,2.28l0.26,1.47l-0.76,2.29l-0.13,1.83l1.13,2.92l1.22,1.5l0.54,1.59l-0.05,5.02l-0.25,0.81l0.5,2.03l1.36,1.15l1.16,2.06l-47.9,7.28l-0.41,0.61l-0.06,3.0l2.67,2.74l2.02,0.95l-0.33,2.71l0.57,1.6l0.44,0.39l-0.94,1.7l-1.24,1.01l-1.14,-0.75l-0.33,0.49l0.67,1.46l-2.84,1.07l0.29,-0.64l-0.45,-0.86l-1.0,-0.76l-0.1,-1.11l-0.57,-0.22l-0.53,0.61l-0.32,-0.1l-0.9,-1.53l0.4,-1.68l-0.99,-2.21l-0.47,-0.44l-0.86,-0.2l-0.31,-0.89l-0.56,-0.17l-0.36,0.61l0.15,0.35l-0.76,3.11l0.01,5.1l-0.6,0.0l-0.25,-0.71l-2.24,-0.43l-1.66,0.33l-5.65,-31.94l-1.25,-65.96l-0.02,-0.37l-1.08,-0.62l-0.69,-1.0Z",
         "name": "Alabama"
      },
      "US-MO": {
         "path": "M469.55,228.14l24.77,-0.8l18.99,-1.48l22.16,-2.65l0.42,0.34l0.4,0.89l2.44,1.61l0.29,0.73l1.21,0.85l-0.5,1.34l-0.09,3.17l0.79,3.59l0.96,1.41l0.03,1.56l1.11,1.35l0.47,1.53l4.99,4.01l1.07,1.66l4.95,3.23l0.7,1.12l0.28,1.59l0.51,0.8l-0.17,0.68l0.48,1.78l0.98,1.6l0.77,0.72l1.03,0.15l0.83,-0.56l0.83,-1.39l0.58,-0.19l2.42,0.59l1.69,0.74l0.84,0.75l-0.96,1.92l0.27,2.24l-2.36,6.77l0.02,1.01l0.71,1.89l4.7,3.96l2.0,1.02l1.46,0.08l1.67,1.27l1.92,0.77l1.52,2.07l2.05,0.8l0.43,2.91l1.74,2.84l-1.09,1.92l0.19,1.37l0.75,0.32l2.34,4.17l1.94,0.89l0.54,-0.32l0.0,-0.64l0.89,1.08l1.08,-0.08l0.15,1.81l-0.37,1.06l0.54,1.56l-1.06,3.81l-0.52,0.08l-1.38,-1.11l-0.65,0.13l-0.78,3.3l-0.52,0.73l0.13,-1.04l-0.56,-1.07l-0.96,-0.19l-0.74,0.63l0.02,1.04l0.53,0.64l-0.04,0.69l0.59,1.31l-0.2,0.39l-1.2,0.39l-0.17,0.42l0.16,0.55l0.84,0.81l-1.69,0.37l-0.13,0.62l1.54,1.93l-0.89,0.74l-0.63,2.1l-10.65,1.47l1.05,-2.24l0.87,-0.61l0.18,-0.86l1.44,-0.95l0.25,-0.95l0.63,-0.36l0.29,-0.59l-0.23,-2.25l-1.06,-0.74l-0.2,-0.75l-1.09,-1.16l-39.39,3.79l-37.87,2.71l-3.31,-57.27l-1.04,-0.62l-1.2,-0.02l-1.52,-0.71l-0.2,-0.92l-0.77,-0.58l-0.34,-0.69l-0.37,-1.52l-0.56,-0.09l-0.3,-0.55l-1.13,-0.65l-1.41,-1.8l0.73,-0.5l0.09,-1.22l1.12,-1.25l0.09,-0.78l1.02,0.16l0.56,-0.42l-0.21,-2.21l-1.02,-0.72l-0.33,-1.09l-1.17,-0.0l-1.31,0.95l-0.82,-0.69l-0.73,-0.16l-2.69,-2.31l-1.05,-0.27l0.13,-1.58l-1.32,-1.69l0.09,-1.0l-0.37,-0.36l-1.02,-0.17l-0.59,-0.84l-0.83,-0.26l0.07,-0.52l-1.24,-2.84l-0.0,-0.72l-0.4,-0.49l-0.85,-0.28l-0.05,-0.52ZM585.14,295.52l-0.11,-0.1l-0.07,-0.14l0.11,-0.01l0.06,0.25Z",
         "name": "Missouri"
      },
      "US-MN": {
         "path": "M439.91,45.57l26.73,-1.1l0.34,1.49l1.28,0.86l1.79,-0.51l1.04,-1.46l0.77,-0.32l2.13,2.24l1.71,0.28l0.31,1.23l1.83,1.42l1.79,0.49l2.63,-0.42l0.39,0.87l0.67,0.4l5.1,0.01l0.38,0.24l0.55,1.61l0.72,0.62l4.26,-0.8l0.77,-0.66l0.07,-0.71l2.42,-0.81l3.96,-0.03l1.42,0.71l3.38,0.67l-1.0,0.81l0.0,0.83l0.51,0.45l0.67,0.09l2.23,-0.16l0.53,2.12l1.59,2.33l0.72,0.05l1.02,-0.8l-0.05,-1.76l2.65,-0.48l1.44,2.2l2.01,0.8l1.53,0.18l0.55,0.58l-0.03,0.84l0.59,0.36l1.32,0.06l-0.05,0.37l0.43,0.47l1.43,-0.2l1.12,0.22l2.21,-0.86l2.76,-2.6l2.47,-1.57l1.26,2.56l0.96,0.52l2.22,-0.68l0.87,0.36l5.96,-1.34l0.56,0.18l1.33,1.66l1.24,0.6l0.62,-0.01l1.6,-0.84l1.38,0.06l-0.96,1.07l-4.66,3.12l-6.32,2.87l-3.66,2.52l-2.13,2.52l-0.95,0.59l-6.57,8.77l-0.94,0.62l-1.07,1.58l-1.95,1.99l-4.15,3.59l-0.85,1.8l-0.55,0.44l-0.14,0.96l-0.77,-0.01l-0.46,0.51l1.03,12.27l-0.79,1.21l-1.04,0.08l-0.52,0.82l-0.83,0.16l-0.61,0.83l-2.06,1.2l-0.93,1.87l0.07,0.72l-1.69,2.4l-0.0,2.07l0.38,0.91l2.15,0.38l1.43,2.48l-0.51,1.92l-0.71,1.26l-0.04,2.12l0.46,1.32l-0.71,1.23l0.92,3.13l-0.49,4.07l3.96,3.01l3.02,0.38l1.9,2.23l2.88,0.48l2.46,1.91l2.4,3.56l2.64,1.78l2.09,0.08l1.07,0.7l0.88,0.09l0.82,1.35l1.27,0.83l0.28,2.01l0.68,1.29l0.41,4.78l-40.67,3.35l-40.68,2.18l-1.52,-38.8l-0.7,-1.27l-0.83,-0.78l-2.57,-0.78l-0.95,-1.91l-1.46,-1.79l0.21,-0.68l2.82,-2.35l0.96,-2.13l0.39,-2.45l-0.36,-1.59l0.23,-1.59l-0.19,-1.8l-0.51,-1.03l-0.19,-2.34l-1.82,-2.6l-0.47,-1.14l-0.22,-2.18l-0.66,-0.98l0.15,-1.67l-0.36,-1.54l0.52,-2.71l-1.08,-1.86l-0.51,-8.4l-0.42,-0.8l0.05,-3.96l-1.58,-4.0l-0.53,-0.66l-0.41,-1.38l0.05,-1.2l-0.48,-0.54l-1.37,-3.82l-0.01,-3.27l-0.47,-2.0l0.27,-1.14l-0.57,-2.36l0.73,-2.61l-2.07,-7.05ZM469.41,36.19l1.21,0.47l0.98,-0.2l0.34,0.47l-0.04,1.77l-1.77,1.15l-0.15,-0.48l-0.41,-0.14l-0.17,-3.04Z",
         "name": "Minnesota"
      },
      "US-CA": {
         "path": "M3.0,175.65l0.8,-1.21l0.46,0.47l0.59,-0.07l0.53,-1.15l0.8,-0.83l1.3,-0.23l0.57,-0.51l-0.15,-0.72l-0.92,-0.33l1.55,-2.72l-0.29,-1.56l0.15,-0.86l2.07,-3.22l1.34,-2.97l0.37,-2.09l-0.27,-1.0l0.19,-3.07l-1.34,-2.15l1.19,-1.34l0.7,-2.48l32.71,8.51l32.57,7.68l-14.08,63.61l25.33,34.47l36.48,50.79l13.27,17.63l-0.21,2.7l0.73,0.93l0.21,1.7l0.86,0.63l0.8,2.54l-0.08,0.9l0.63,1.44l-0.17,1.35l3.8,3.82l0.01,0.49l-1.96,1.49l-3.13,1.22l-1.21,1.96l-1.73,1.11l-0.34,0.81l0.37,1.02l-0.52,0.51l-0.1,0.89l0.07,2.27l-0.61,0.7l-0.66,2.41l-2.04,2.43l-1.61,0.12l-0.43,0.51l0.33,0.88l-0.6,1.33l0.53,1.11l-0.02,1.18l-0.79,2.66l0.57,1.01l2.75,1.15l0.33,0.83l-0.2,2.38l-1.19,0.76l-0.43,1.36l-2.29,-0.63l-1.26,0.59l-43.59,-3.74l0.18,-1.14l0.67,-0.5l-0.17,-1.06l-1.16,-1.39l-1.04,-0.16l0.24,-1.19l-0.27,-1.07l0.79,-1.32l-0.28,-4.22l-0.59,-2.29l-1.91,-4.06l-3.55,-4.08l-1.29,-1.97l-2.41,-2.12l-2.03,-3.0l-2.22,-0.91l-0.94,0.29l-0.4,0.95l-0.62,-0.74l-0.88,-0.23l-0.14,-0.3l0.62,-0.74l0.18,-1.56l-0.43,-2.04l-1.0,-1.95l-0.99,-0.74l-4.45,-0.24l-3.33,-1.83l-1.36,-1.26l-0.7,-0.13l-1.02,-1.19l-0.43,-2.58l-0.97,-0.48l-1.67,-2.31l-2.19,-1.74l-1.24,-0.42l-1.67,0.34l-1.14,-1.02l-1.25,0.01l-2.48,-1.85l-1.06,-0.0l-1.49,-0.7l-4.93,-0.58l-1.11,-2.34l-1.35,-0.65l1.28,-2.52l-0.24,-1.36l0.76,-1.95l-0.63,-1.34l1.29,-2.4l0.34,-2.41l-0.99,-1.24l-1.26,-0.24l-1.4,-1.29l0.42,-1.58l0.8,-0.07l0.26,-0.45l-0.46,-2.18l-0.65,-0.77l-1.47,-0.85l-1.76,-3.95l-1.82,-1.26l-0.34,-2.72l-1.6,-2.57l0.07,-1.37l-0.33,-1.25l-1.15,-0.95l-0.73,-2.92l-2.4,-2.69l-0.54,-1.25l0.01,-4.55l0.6,-0.57l-0.58,-1.13l0.51,-0.57l0.53,0.61l0.77,-0.01l0.85,-0.79l0.57,-1.3l0.8,0.05l0.21,-0.88l-0.42,-0.27l0.48,-1.17l-1.2,-3.64l-0.62,-0.48l-1.06,0.07l-1.93,-0.53l-1.04,-1.06l-1.87,-3.2l-0.78,-2.26l0.87,-2.34l0.1,-1.1l-0.26,-2.36l-0.31,-0.64l-0.54,-0.25l0.25,-1.16l0.7,-1.05l0.26,-2.66l0.47,-0.62l0.88,0.14l0.18,0.92l-0.72,2.09l0.05,1.14l1.18,1.32l0.55,0.11l0.58,1.27l1.16,0.79l0.4,1.0l0.89,0.41l0.83,-0.19l-0.2,-1.44l-0.64,-0.43l-0.17,-0.58l-0.22,-3.52l-0.54,-0.7l0.24,-0.68l-1.48,-1.06l0.51,-1.05l0.1,-1.05l-1.19,-1.57l0.78,-0.71l0.79,0.07l1.25,-0.7l1.25,1.02l1.87,-0.29l5.55,2.45l0.61,-0.08l0.65,-1.35l0.69,-0.03l1.91,2.53l0.25,0.18l0.63,-0.23l0.03,-0.38l-0.39,-0.93l-1.56,-1.88l-1.65,-0.34l0.27,-0.6l-0.28,-0.54l-0.48,0.08l-1.06,0.97l-1.84,-0.25l-0.44,0.27l-0.14,-0.5l-1.04,-0.41l0.24,-1.03l-0.84,-0.47l-1.0,0.26l-0.61,0.82l-1.1,0.37l-1.35,-0.9l-0.39,-0.87l-1.51,-1.44l-0.58,0.03l-0.64,0.59l-0.92,-0.14l-0.49,0.36l-0.35,1.85l0.2,0.76l-0.77,1.34l0.35,0.63l-0.46,0.58l-0.04,0.67l-2.15,-2.88l-0.44,-0.15l-0.25,0.32l-0.73,-1.0l-0.21,-1.02l-1.19,-1.17l-0.39,-1.04l-0.61,-0.19l0.66,-1.45l0.11,0.95l0.76,1.48l0.44,0.25l0.34,-0.38l-1.43,-5.16l-1.08,-1.41l-0.3,-2.65l-2.49,-2.87l-1.77,-4.45l-3.02,-5.5l1.11,-1.65l0.27,-1.94l-0.45,-2.09l-0.12,-3.56l1.36,-2.85l0.7,-0.72l-0.06,-1.52l0.43,-1.51l-0.4,-1.62l0.13,-1.93l-1.39,-4.03l-0.97,-1.15l0.06,-0.78l-0.41,-1.18l-2.88,-4.02l0.52,-1.32l-0.19,-2.65l2.25,-3.36ZM31.19,240.19l-0.05,0.09l-0.27,0.04l-0.01,-0.0l0.33,-0.12ZM63.48,350.44l0.26,0.12l0.17,0.16l-0.29,-0.17l-0.13,-0.11ZM65.06,351.68l1.33,0.85l0.74,1.72l-0.89,-0.66l-1.14,0.01l-0.04,-1.92ZM61.77,361.76l1.36,2.09l0.57,0.53l-0.46,0.06l-0.83,-0.8l-0.64,-1.88ZM42.7,332.51l0.87,0.73l1.38,0.37l1.33,1.0l-2.81,-0.22l-0.71,-0.58l0.24,-0.65l-0.31,-0.66ZM47.07,334.62l0.93,-0.47l0.32,0.35l-0.37,0.13l-0.87,-0.01ZM45.1,350.98l0.29,-0.06l0.95,0.92l-0.61,-0.17l-0.63,-0.69ZM36.71,332.66l2.58,0.19l0.2,0.74l0.59,0.45l-1.22,0.61l-1.17,-0.11l-0.5,-0.44l-0.48,-1.42ZM34.08,330.97l0.05,-0.02l0.05,0.06l-0.01,-0.0l-0.09,-0.04Z",
         "name": "California"
      },
      "US-IA": {
         "path": "M453.66,165.63l42.88,-2.29l40.6,-3.34l0.97,2.5l2.0,0.98l0.08,0.59l-0.89,1.79l-0.15,1.04l0.92,5.04l0.93,1.24l0.39,1.73l1.47,1.7l4.96,0.81l1.27,2.0l-0.3,1.02l0.29,0.66l3.63,2.32l0.86,2.38l3.86,2.26l0.62,1.65l-0.3,4.16l-1.64,1.97l-0.49,1.92l0.14,1.27l-1.25,1.35l-2.52,0.97l-0.89,1.17l-0.55,0.25l-4.57,0.84l-0.89,0.72l-0.6,1.69l-0.15,2.53l0.4,1.06l2.02,1.44l0.55,2.61l-1.86,3.22l-0.21,2.21l-0.52,1.4l-2.89,1.39l-1.02,1.02l-0.2,0.99l0.72,0.85l0.21,2.11l-0.58,0.24l-1.35,-0.81l-0.31,-0.75l-1.29,-0.8l-0.29,-0.5l-0.89,-0.35l-0.3,-0.8l-0.95,-0.67l-22.35,2.69l-15.16,1.21l-7.61,0.53l-20.83,0.54l-0.22,-1.04l-1.3,-0.72l-0.33,-0.66l0.57,-1.13l-0.21,-0.95l0.21,-1.37l-0.36,-2.16l-0.6,-0.71l0.06,-3.6l-1.05,-0.49l0.05,-0.88l0.71,-1.01l-0.05,-0.44l-1.31,-0.55l0.33,-2.51l-0.41,-0.45l-0.89,-0.16l0.23,-0.78l-0.3,-0.58l-0.51,-0.25l-0.74,0.23l-0.42,-2.77l0.5,-2.33l-0.2,-0.67l-1.37,-1.69l-0.08,-1.89l-1.79,-1.52l-0.36,-1.72l-1.09,-0.93l0.03,-2.15l-1.11,-1.85l0.21,-1.67l-0.27,-1.08l-1.38,-0.66l-0.88,-2.14l0.04,-0.63l-1.81,-1.79l0.56,-1.58l0.54,-0.47l0.72,-2.66l0.0,-1.67l0.54,-0.68l0.21,-1.18l-0.51,-2.22l-1.33,-0.28l-0.05,-0.72l0.45,-0.56l-0.0,-1.7l-0.96,-1.41l-0.05,-0.86Z",
         "name": "Iowa"
      },
      "US-MI": {
         "path": "M613.3,123.04l1.01,-0.11l0.46,-0.67l-0.39,-3.2l1.08,-0.12l0.66,-1.43l1.19,0.47l0.65,-0.34l0.74,-2.59l0.82,-1.21l0.55,-1.68l0.55,-0.18l-0.57,0.88l0.61,1.64l-0.7,1.8l0.71,0.42l-0.46,2.61l0.89,1.41l0.73,-0.06l0.52,0.55l0.65,-0.25l0.87,-2.26l0.64,-3.51l-0.09,-2.06l-0.78,-3.41l0.58,-1.02l2.12,-1.66l2.74,-0.56l0.98,-0.64l0.28,-0.64l-0.26,-0.54l-1.76,-0.09l-0.97,-0.85l-0.53,-1.98l1.83,-2.99l-0.11,-0.73l1.72,-0.24l0.74,-0.95l4.18,1.97l0.83,0.12l1.98,-0.42l1.38,0.38l0.99,0.79l1.19,1.76l2.74,-0.21l1.71,1.0l1.92,0.07l0.81,0.63l1.16,0.23l1.44,-0.07l1.77,1.03l0.0,1.12l1.05,1.3l0.64,0.2l0.39,0.92l-0.15,0.54l-0.67,-0.25l-0.94,0.58l-0.22,1.83l0.82,1.28l1.61,0.97l0.7,1.36l0.67,2.25l-0.1,1.73l0.8,5.79l-0.77,0.64l-0.4,0.87l-0.75,0.08l-0.78,0.82l-0.14,4.45l-1.12,0.49l-0.17,0.81l-1.86,0.44l-0.72,0.6l-0.56,2.6l0.26,0.45l-0.2,0.52l0.27,2.56l1.39,1.29l2.9,0.8l0.91,-0.08l1.07,-1.23l0.59,-1.44l0.63,0.18l0.38,-0.24l0.99,-3.57l0.59,-1.06l-0.08,-0.51l0.92,-1.41l1.43,-0.44l1.06,-0.69l0.82,-1.1l0.87,-0.44l2.07,0.57l2.14,1.75l1.23,2.13l2.05,5.84l0.83,1.58l1.05,3.67l1.52,3.58l1.41,2.21l-0.43,3.38l0.46,2.46l-0.46,2.76l-0.34,0.44l-0.24,-0.32l-0.32,-1.69l-1.46,-0.5l-0.47,0.09l-1.47,1.36l-0.05,0.83l0.55,0.66l-0.82,0.57l-0.29,0.78l0.3,2.91l-0.48,0.75l-1.61,0.93l-1.05,1.85l-0.41,3.7l0.28,1.53l-0.32,0.92l-0.43,0.19l0.03,0.9l-0.63,0.3l-0.37,1.07l-0.52,0.52l-0.49,1.28l-0.02,1.04l-0.51,0.78l-20.38,4.41l-0.15,-0.84l-0.46,-0.33l-31.63,4.97l1.86,-2.22l1.82,-5.87l1.42,-3.02l0.98,-4.96l0.08,-5.29l-1.11,-6.42l-2.21,-4.24l0.6,-0.51l0.3,-0.78l-0.57,-0.42l-1.08,0.56l-4.01,-7.31l0.08,-1.35l0.97,-2.05l-0.02,-0.96l-0.76,-3.11l-1.29,-1.63l-0.05,-0.61l1.71,-2.72l1.2,-4.13l-0.25,-5.32l-0.78,-1.58l1.09,-1.15ZM622.19,118.68l0.0,-0.07l0.11,-0.12l-0.01,0.03l-0.11,0.16ZM622.44,117.76l-0.07,-0.16l0.07,-0.14l0.0,0.3ZM544.04,91.26l4.86,-2.42l3.53,-3.65l5.76,-1.4l1.38,-0.85l2.34,-2.74l0.97,0.04l1.52,-0.74l0.99,-2.27l2.79,-2.88l0.24,1.73l1.85,0.59l0.06,1.46l0.67,0.14l0.51,0.6l-0.14,3.17l0.44,0.95l-0.33,0.48l0.2,0.47l0.74,-0.02l1.07,-2.23l1.07,-0.91l-0.41,1.17l0.59,0.44l0.82,-0.68l0.52,-1.23l1.0,-0.44l3.09,-0.27l1.5,0.2l1.19,0.93l1.54,0.44l0.48,1.05l2.32,2.59l1.17,0.54l0.54,1.56l0.73,0.34l1.87,0.06l0.72,-0.41l1.07,-0.06l0.51,-0.66l0.88,-0.44l1.0,1.11l1.11,0.64l1.02,-0.26l0.67,-0.83l1.88,1.05l0.64,-0.35l1.63,-2.61l2.79,-1.92l1.69,-1.67l0.92,0.1l3.26,-1.23l5.17,-0.28l4.46,-2.76l2.56,-0.39l0.01,3.27l0.3,0.72l-0.35,1.11l0.68,0.85l0.66,0.11l0.71,-0.4l2.2,0.69l1.14,-0.44l1.02,-0.88l0.66,0.48l0.21,0.71l0.85,0.21l1.26,-0.82l0.94,-1.56l0.65,-0.02l0.85,0.75l2.01,3.79l-0.86,1.05l0.49,0.88l0.47,0.36l1.36,-0.43l0.58,0.46l0.64,0.04l0.18,1.2l0.99,0.87l1.53,0.51l-1.17,0.69l-4.96,-0.11l-0.53,0.3l-1.36,-0.16l-0.88,0.41l-0.67,-0.75l-1.63,-0.06l-0.58,0.47l-0.06,1.22l-0.49,0.76l0.4,2.05l-0.92,-0.22l-0.9,-0.92l-0.77,-0.13l-1.97,-1.64l-2.41,-0.58l-1.6,0.05l-1.04,-0.5l-2.88,0.49l-0.61,0.45l-1.16,2.53l-3.47,0.76l-0.57,0.78l-2.06,-0.32l-2.81,0.95l-0.68,0.84l-0.54,2.52l-0.78,0.29l-0.81,0.88l-0.65,0.29l0.15,-1.96l-0.75,-0.91l-1.02,0.35l-0.76,0.93l-0.97,-0.39l-0.68,0.17l-0.37,0.4l0.11,0.83l-0.72,2.02l-1.2,0.6l-0.12,-1.38l-0.47,-1.06l0.33,-1.69l-0.17,-0.37l-0.66,-0.16l-0.45,0.58l-0.59,2.13l-0.2,2.57l-1.11,0.92l-1.25,3.03l-0.6,2.66l-2.53,5.34l-0.69,0.74l0.13,0.91l-1.41,-1.27l0.17,-1.74l0.62,-1.69l-0.42,-0.81l-0.62,-0.3l-1.35,0.86l-1.16,0.1l0.03,-1.29l0.8,-1.45l-0.42,-1.34l0.29,-1.09l-0.58,-0.98l0.14,-0.83l-1.91,-1.54l-1.1,-0.05l-0.59,-0.43l-0.86,0.2l-0.62,-0.19l0.29,-1.37l-0.95,-1.45l-1.13,-0.51l-2.23,-0.09l-3.2,-0.69l-1.55,0.6l-1.43,-0.42l-1.62,0.17l-4.57,-1.93l-15.38,-2.44l-2.01,-3.4l-1.89,-0.96l-0.76,0.26l-0.1,-0.3ZM603.98,101.59l-0.0,0.52l-0.46,0.32l-0.69,1.39l0.08,0.57l-0.65,-0.58l0.9,-2.17l0.83,-0.07ZM644.38,90.12l1.97,-1.54l0.16,-0.57l-0.28,-0.64l1.05,0.15l0.81,1.23l0.82,0.19l-0.26,1.09l-0.36,0.19l-1.51,-0.33l-0.77,0.46l-1.63,-0.23ZM636.04,80.32l0.55,-0.84l0.52,0.05l-0.36,1.33l0.11,0.71l-0.35,-0.9l-0.47,-0.35ZM636.97,81.84l0.09,0.14l0.01,0.02l-0.02,-0.01l-0.08,-0.14ZM637.86,83.93l0.4,0.45l0.23,0.61l-0.63,-0.71l0.0,-0.34ZM634.29,95.87l1.41,0.24l0.35,-0.19l0.4,0.21l-0.17,0.52l-0.75,0.11l-1.24,-0.89ZM619.44,99.61l0.64,2.25l-0.79,0.78l-0.39,-0.26l0.54,-2.77ZM613.94,113.71l0.48,0.3l-0.08,0.57l-0.45,-0.69l0.06,-0.17ZM612.93,116.45l0.0,-0.03l0.02,-0.04l-0.03,0.07ZM599.9,85.56l-0.23,-0.37l0.02,-0.4l0.37,0.33l-0.16,0.45ZM570.96,75.75l-0.51,-0.27l-1.15,0.07l-0.06,-1.58l0.99,-1.04l1.16,-2.12l1.82,-1.52l0.63,-0.0l0.52,-0.59l2.07,-0.9l3.33,-0.44l1.11,0.67l-0.54,0.38l-1.31,-0.12l-2.26,0.79l-0.15,0.29l0.31,0.58l0.72,0.13l-1.19,1.0l-1.39,1.91l-0.69,0.29l-0.34,1.46l-1.14,1.38l-0.64,2.06l-0.67,-0.88l0.74,-0.98l0.12,-1.97l-0.63,-0.37l-0.2,0.15l-0.59,0.93l-0.04,0.68ZM558.64,61.09l0.75,-1.0l-0.4,-0.34l0.56,-0.55l4.59,-3.04l1.96,-1.75l0.62,-0.18l-0.45,0.67l0.11,0.8l-0.43,0.5l-4.22,2.61l-0.85,1.0l0.24,0.37l-1.86,1.19l-0.61,-0.29Z",
         "name": "Michigan"
      },
      "US-GA": {
         "path": "M655.83,331.54l22.1,-3.74l20.71,-4.04l-1.47,1.41l-0.51,1.67l-0.66,0.82l-0.4,1.72l0.12,1.22l0.83,0.77l1.85,0.77l1.04,0.1l2.72,1.98l0.84,0.22l1.91,-0.39l0.6,0.24l0.81,1.62l1.52,1.57l1.06,2.46l1.34,0.8l0.85,1.14l0.56,0.26l1.01,1.74l1.08,0.28l1.19,0.97l3.84,1.79l2.44,3.1l2.27,0.55l2.56,1.63l0.51,2.31l1.26,0.99l0.48,-0.17l0.31,0.48l-0.09,0.62l0.79,0.71l0.79,0.08l0.57,1.19l5.03,1.81l0.41,1.76l1.56,1.7l1.04,1.98l-0.07,0.8l0.49,0.68l0.12,1.23l1.05,0.78l1.17,0.16l1.26,0.6l0.28,0.53l0.58,0.23l1.14,2.53l0.77,0.56l0.1,2.67l0.78,1.47l1.39,0.88l1.53,-0.28l1.46,0.74l1.46,0.09l-0.59,0.78l-0.56,-0.35l-0.47,0.28l-0.4,0.99l0.63,0.9l-0.37,0.48l-1.39,-0.14l-0.78,-0.54l-0.64,0.45l0.26,0.71l-0.48,0.53l0.36,0.6l0.95,-0.05l0.5,0.28l-0.57,1.35l-1.44,0.29l-1.34,-0.43l-0.44,0.39l0.35,0.84l1.24,0.33l-0.5,0.87l0.23,0.35l-0.2,0.64l0.84,0.63l-0.33,0.44l-0.72,-0.13l-0.96,0.52l-0.09,0.63l1.09,0.44l0.06,0.94l0.48,-0.08l1.2,-1.18l-0.91,2.33l-0.32,-0.58l-0.59,-0.07l-0.44,0.73l0.3,0.7l0.99,0.82l-2.34,0.07l-0.92,-0.27l-0.63,0.3l0.07,0.63l0.55,0.33l2.78,0.21l1.08,0.65l-0.01,0.34l-0.56,0.22l-0.87,1.96l-0.52,-1.41l-0.45,-0.12l-0.6,0.34l-0.14,0.84l0.35,0.96l-0.6,0.12l-0.02,0.84l-0.3,0.16l0.07,0.46l1.35,1.13l-1.09,1.04l0.33,0.47l0.78,0.07l-0.38,0.92l0.06,0.88l-0.46,0.52l1.12,1.65l0.04,0.76l-0.8,0.34l-2.66,-0.14l-4.1,-0.92l-1.31,0.36l-0.17,0.74l-0.68,0.26l-0.34,1.25l0.29,2.08l0.96,1.35l0.17,4.26l-1.99,0.42l-0.55,-0.92l-0.13,-1.31l-1.35,-1.81l-49.49,5.58l-0.73,-0.55l-0.89,-2.7l-0.96,-1.5l-0.57,-0.37l0.15,-0.68l-0.74,-1.5l-1.84,-1.8l-0.44,-1.74l0.25,-0.8l0.03,-5.18l-0.62,-1.8l-1.2,-1.45l-1.05,-2.63l0.11,-1.65l0.77,-2.36l-0.26,-1.52l0.18,-2.1l1.62,-1.34l0.45,-1.47l-0.56,-0.6l-1.43,-0.67l0.08,-2.14l-0.99,-1.85l-2.2,-2.38l-1.05,-2.78l-0.76,-0.67l-0.17,-0.95l-0.78,-1.35l-14.26,-42.58ZM747.77,388.29l0.7,-0.27l-0.07,0.83l-0.3,-0.33l-0.34,-0.23ZM746.43,405.18l0.06,0.87l-0.01,0.47l-0.35,-0.57l0.3,-0.77Z",
         "name": "Georgia"
      },
      "US-AZ": {
         "path": "M127.66,383.44l0.45,-1.79l1.3,-1.26l0.55,-1.1l0.48,-0.25l1.67,0.63l0.97,-0.03l0.52,-0.45l0.29,-1.16l1.32,-0.98l0.26,-2.71l-0.45,-1.24l-0.84,-0.66l-2.08,-0.68l-0.3,-0.61l0.81,-2.37l0.01,-1.38l-0.51,-1.19l0.57,-0.84l-0.2,-0.86l1.58,-0.25l2.32,-2.77l0.66,-2.41l0.66,-0.79l0.04,-3.14l0.56,-0.61l-0.28,-1.41l1.73,-1.11l1.05,-1.82l3.18,-1.25l2.05,-1.54l0.27,-0.53l-0.12,-1.03l-3.25,-3.48l-0.51,-0.22l0.23,-1.24l-0.65,-1.44l0.08,-0.9l-0.87,-2.74l-0.84,-0.56l-0.18,-1.63l-0.68,-0.79l0.21,-3.49l0.59,-0.85l-0.29,-0.84l1.03,-0.39l0.41,-1.4l0.15,-3.16l-0.75,-3.61l0.47,-0.86l0.3,-1.65l-0.38,-2.96l0.86,-2.52l-0.8,-1.85l-0.03,-0.9l0.44,-0.51l0.35,-1.33l2.55,-0.6l1.75,1.0l1.43,-0.18l0.96,2.22l0.78,0.71l1.54,0.15l1.02,-0.48l1.04,-2.23l0.95,-1.17l2.64,-16.67l42.56,6.06l42.71,4.9l-12.24,122.4l-37.11,-4.26l-36.46,-19.18l-28.51,-15.73Z",
         "name": "Arizona"
      },
      "US-MT": {
         "path": "M167.4,59.85l0.72,-0.1l0.33,-0.38l-0.88,-2.02l0.85,-0.96l-0.38,-1.32l0.1,-0.97l-1.22,-1.96l-0.22,-1.51l-1.02,-1.36l-1.16,-2.48l3.76,-21.01l43.48,7.0l42.9,5.45l42.6,4.01l43.01,2.64l-3.73,86.82l-28.12,-1.54l-26.83,-2.0l-26.78,-2.51l-25.84,-2.91l-0.45,0.35l-1.28,10.37l-1.51,-2.01l-0.02,-0.91l-1.17,-2.35l-1.24,-0.75l-1.81,0.9l0.02,1.05l-0.72,0.42l-0.35,1.55l-2.42,-0.42l-1.92,0.55l-0.92,-0.85l-3.36,0.07l-2.38,-0.98l-1.68,0.56l-0.85,1.47l-4.66,-1.63l-1.3,0.36l-1.13,0.89l-0.31,0.66l-1.65,-1.41l0.22,-1.42l-0.89,-1.71l0.4,-0.36l0.07,-0.62l-1.16,-3.08l-1.44,-1.26l-1.45,0.34l-0.21,-0.64l-1.07,-0.9l-0.4,-1.37l0.68,-0.6l0.21,-1.41l-0.75,-2.38l-0.77,-0.36l-0.3,-1.58l-1.49,-2.55l0.24,-1.51l-0.55,-1.27l0.35,-1.4l-0.72,-0.86l0.49,-0.97l-0.21,-0.75l-1.14,-0.76l-0.13,-0.59l-0.84,-0.92l-0.8,-0.4l-0.51,0.37l-0.08,0.75l-0.7,0.26l-1.14,1.21l-1.75,0.35l-1.22,1.06l-1.08,-0.86l-0.63,-1.01l-1.05,-0.45l0.02,-0.86l0.74,-0.63l0.25,-1.06l-0.6,-1.61l0.91,-1.09l1.07,-0.08l0.83,-0.8l-0.25,-1.14l0.39,-1.07l-0.94,-0.81l-0.04,-0.81l0.67,-1.28l-0.58,-1.08l0.74,-0.06l0.39,-0.42l-0.03,-1.78l1.85,-3.73l-0.13,-1.06l0.89,-0.62l0.63,-3.18l-0.78,-0.51l-1.8,0.36l-1.33,-0.12l-0.64,-0.56l0.37,-0.84l-0.61,-0.98l-0.66,-0.23l-0.73,0.35l-0.06,-0.95l-1.73,-1.65l0.06,-1.86l-1.66,-1.85l-0.08,-0.69l-1.52,-2.92l-1.06,-1.31l-0.55,-1.65l-2.34,-1.37l-0.93,-1.98l-1.44,-1.22Z",
         "name": "Montana"
      },
      "US-MS": {
         "path": "M557.14,430.96l0.67,-0.97l-1.06,-1.76l0.18,-1.63l-0.82,-0.87l1.7,-0.26l0.47,-0.54l0.39,-2.74l-0.79,-1.82l1.57,-1.8l0.24,-3.58l0.74,-2.26l1.89,-1.25l1.15,-1.97l1.4,-1.04l0.34,-0.78l-0.04,-0.99l-0.64,-0.95l1.15,-0.28l0.96,-2.58l0.91,-1.31l-0.16,-0.86l-1.55,-0.42l-0.35,-0.95l-1.84,-1.03l-0.08,-2.13l-0.94,-0.73l-0.45,-0.83l-0.02,-0.37l1.14,-0.29l0.46,-0.68l-0.26,-0.89l-1.41,-0.48l0.23,-1.76l0.98,-1.53l-0.78,-1.06l-1.08,-0.3l-0.16,-2.8l0.9,-0.54l0.22,-0.8l-0.63,-2.5l-1.26,-0.65l0.7,-1.32l-0.08,-2.2l-2.03,-1.49l1.13,-0.47l0.12,-1.4l-1.35,-0.87l1.57,-2.02l0.93,-0.31l0.36,-0.68l-0.52,-1.55l0.42,-1.35l-0.89,-0.87l1.59,-0.83l1.25,-0.27l0.59,-0.76l-0.09,-1.06l-1.42,-0.93l1.39,-1.07l0.62,-1.76l0.95,-0.17l0.34,-0.97l-0.2,-0.76l1.48,-0.44l1.22,-1.21l0.06,-3.49l-0.47,-1.51l0.36,-1.76l0.74,0.08l0.68,-0.33l0.42,-0.87l-0.41,-1.04l2.73,-1.71l0.58,-1.05l-0.29,-1.26l36.59,-4.31l0.87,1.23l0.85,0.44l1.25,65.96l5.71,32.91l-0.73,0.7l-1.55,-0.29l-0.91,-0.94l-1.32,1.07l-1.24,0.18l-2.05,-1.2l-2.01,-0.23l-0.84,0.37l-0.34,0.44l0.32,0.41l-0.56,0.37l-3.98,1.69l-0.05,-0.5l-0.97,-0.51l-1.0,0.05l-0.58,1.0l0.76,0.61l-1.6,1.22l-0.32,1.29l-0.69,0.31l-1.35,-0.05l-1.18,-1.87l-0.09,-0.9l-0.93,-1.47l-0.21,-1.01l-1.42,-1.63l-1.17,-0.53l-0.47,-0.77l0.1,-0.63l-0.7,-0.92l0.2,-1.99l0.5,-0.94l0.65,-2.99l-0.07,-1.23l-0.43,-0.28l-34.87,3.59Z",
         "name": "Mississippi"
      },
      "US-SC": {
         "path": "M699.48,323.59l4.87,-2.71l1.03,-0.06l1.11,-1.38l3.94,-1.92l0.45,-0.88l0.63,0.21l22.62,-3.59l0.31,0.13l-0.1,0.97l0.46,0.66l0.71,0.0l1.21,-1.3l2.85,2.48l0.48,2.44l0.56,0.51l19.55,-3.73l23.18,14.64l0.02,0.54l-2.47,2.19l-2.42,3.67l-2.38,5.71l-0.07,2.72l-1.09,-0.21l0.84,-2.71l-0.64,-0.22l-0.76,0.87l-0.55,1.38l-0.1,1.55l0.85,0.94l1.06,0.22l0.45,0.89l-0.75,0.09l-0.4,0.56l-0.88,0.03l-0.23,0.69l0.95,0.43l-1.1,1.13l-0.07,1.01l-1.35,0.65l-0.5,-0.6l-0.5,-0.07l-1.06,0.87l-0.55,1.76l0.43,0.86l-1.19,1.23l-0.6,1.44l-1.2,1.02l-0.91,-0.38l0.27,-0.59l-0.54,-0.73l-1.38,0.33l-0.11,0.43l0.37,0.76l-0.52,0.03l0.06,0.75l0.73,0.57l1.31,0.41l-0.12,0.38l-0.88,0.95l-1.22,0.24l-0.25,0.51l0.33,0.44l-2.29,1.36l-1.44,-0.83l-0.56,0.11l-0.1,0.68l1.2,0.76l-1.54,1.58l-0.73,-0.74l-0.49,0.53l-0.0,0.73l-0.7,-0.36l-0.85,0.01l-1.35,-0.82l-0.44,0.5l0.17,0.52l-1.74,0.19l-0.44,0.37l-0.06,0.77l0.65,0.22l1.43,-0.18l-0.25,0.55l0.43,0.25l1.92,-0.17l0.11,0.21l-0.97,0.87l-0.32,0.78l0.57,0.49l0.94,-0.54l0.03,0.21l-1.12,1.1l-1.0,0.45l-0.22,-2.03l-0.7,-0.26l-0.24,-1.54l-0.89,-0.14l-0.3,0.58l0.89,2.68l-1.14,-0.65l-0.64,-0.99l-0.41,-1.75l-0.66,-0.2l-0.53,-0.62l-0.69,0.01l-0.26,0.6l0.86,1.01l0.01,0.67l1.13,1.81l-0.01,0.85l1.24,1.16l-0.62,0.34l0.04,0.98l-1.18,3.56l-1.53,-0.76l-1.53,0.27l-0.98,-0.66l-0.55,-1.02l-0.19,-2.92l-0.87,-0.74l-1.08,-2.45l-1.05,-0.93l-3.25,-1.29l-0.51,-2.63l-1.14,-2.15l-1.45,-1.55l-0.07,-1.06l-0.78,-1.2l-4.85,-1.62l-0.6,-1.26l-1.21,-0.35l0.01,-0.7l-0.54,-0.86l-0.87,0.01l-0.74,-0.59l0.02,-1.21l-0.67,-1.25l-2.72,-1.73l-2.17,-0.49l-2.39,-3.07l-3.96,-1.86l-1.23,-1.01l-0.83,-0.11l-1.06,-1.78l-0.51,-0.21l-0.92,-1.19l-1.19,-0.66l-1.01,-2.38l-1.55,-1.62l-1.04,-1.84l-1.06,-0.36l-1.94,0.39l-0.46,-0.16l-2.77,-2.14l-1.07,0.03l-1.71,-0.71l-0.53,-0.51l0.35,-2.19l0.64,-0.78l0.34,-1.37l1.36,-1.23l0.4,-0.98ZM752.86,373.71l0.73,-0.09l0.52,0.44l-1.22,1.91l0.28,-1.22l-0.3,-1.05Z",
         "name": "South Carolina"
      },
      "US-RI": {
         "path": "M860.17,132.77l0.34,0.0l1.04,2.6l-0.31,0.56l-1.07,-3.15ZM859.46,136.41l-0.28,-0.32l0.23,-1.5l0.42,1.5l-0.37,0.32ZM852.23,141.2l0.22,-0.46l-0.55,-2.18l-3.23,-9.82l5.59,-1.92l0.78,2.02l0.81,0.24l0.19,0.72l0.09,0.41l-0.76,0.26l0.03,0.29l0.53,1.43l0.59,0.48l-0.6,0.16l-0.45,0.73l0.88,0.95l-0.13,1.21l0.96,2.14l-0.3,2.06l-1.33,0.25l-3.14,2.22l-0.17,-1.18ZM856.95,131.31l0.26,0.09l0.01,0.09l-0.17,-0.08l-0.09,-0.1ZM858.34,131.95l0.24,0.47l-0.2,0.31l-0.04,-0.37l0.0,-0.4ZM857.06,144.61l0.1,0.1l-0.18,0.1l-0.03,-0.13l0.11,-0.07Z",
         "name": "Rhode Island"
      },
      "US-CT": {
         "path": "M824.64,156.55l2.8,-3.23l-0.07,-0.55l-1.32,-1.21l-3.64,-15.64l9.8,-2.55l0.6,0.44l0.65,-0.27l0.22,-0.58l14.14,-4.2l3.29,10.01l0.48,1.92l-0.03,1.67l-1.65,0.34l-0.91,0.82l-0.7,-0.35l-0.49,0.11l-0.17,0.9l-1.15,0.09l-1.26,1.27l-0.62,-0.12l-0.57,-0.99l-0.89,-0.07l-0.2,0.68l0.76,0.62l0.09,0.53l-0.89,-0.0l-1.01,0.88l-1.65,0.1l-1.14,0.95l-0.86,-0.08l-2.05,0.85l-0.4,-0.66l-0.6,0.12l-0.87,2.11l-0.59,0.3l-0.82,1.29l-0.79,-0.04l-0.94,0.74l-0.19,0.63l-0.53,0.06l-0.88,0.75l-2.75,3.08l-0.96,0.28l-1.25,-1.01Z",
         "name": "Connecticut"
      }
   },
   "height": 606.2111020895529,
   "projection": {
      "type": "lcc",
      "centralMeridian": -100.0
   },
   "width": 900.0
});

/*
 * fgnass.github.com/spin.js#v2.0.1
 */
;
! function(a, b) {
   "object" == typeof exports ? module.exports = b() : "function" == typeof define && define.amd ? define(b) : a.Spinner = b()
}(this, function() {
   "use strict";

   function a(a, b) {
      var c, d = document.createElement(a || "div");
      for (c in b) d[c] = b[c];
      return d
   }

   function b(a) {
      for (var b = 1, c = arguments.length; c > b; b++) a.appendChild(arguments[b]);
      return a
   }

   function c(a, b, c, d) {
      var e = ["opacity", b, ~~(100 * a), c, d].join("-"),
         f = .01 + c / d * 100,
         g = Math.max(1 - (1 - a) / b * (100 - f), a),
         h = j.substring(0, j.indexOf("Animation")).toLowerCase(),
         i = h && "-" + h + "-" || "";
      return l[e] || (m.insertRule("@" + i + "keyframes " + e + "{0%{opacity:" + g + "}" + f + "%{opacity:" + a + "}" + (f + .01) + "%{opacity:1}" + (f + b) % 100 + "%{opacity:" + a + "}100%{opacity:" + g + "}}", m.cssRules.length), l[e] = 1), e
   }

   function d(a, b) {
      var c, d, e = a.style;
      for (b = b.charAt(0).toUpperCase() + b.slice(1), d = 0; d < k.length; d++)
         if (c = k[d] + b, void 0 !== e[c]) return c;
      return void 0 !== e[b] ? b : void 0
   }

   function e(a, b) {
      for (var c in b) a.style[d(a, c) || c] = b[c];
      return a
   }

   function f(a) {
      for (var b = 1; b < arguments.length; b++) {
         var c = arguments[b];
         for (var d in c) void 0 === a[d] && (a[d] = c[d])
      }
      return a
   }

   function g(a, b) {
      return "string" == typeof a ? a : a[b % a.length]
   }

   function h(a) {
      this.opts = f(a || {}, h.defaults, n)
   }

   function i() {
      function c(b, c) {
         return a("<" + b + ' xmlns="urn:schemas-microsoft.com:vml" class="spin-vml">', c)
      }
      m.addRule(".spin-vml", "behavior:url(#default#VML)"), h.prototype.lines = function(a, d) {
         function f() {
            return e(c("group", {
               coordsize: k + " " + k,
               coordorigin: -j + " " + -j
            }), {
               width: k,
               height: k
            })
         }

         function h(a, h, i) {
            b(m, b(e(f(), {
               rotation: 360 / d.lines * a + "deg",
               left: ~~h
            }), b(e(c("roundrect", {
               arcsize: d.corners
            }), {
               width: j,
               height: d.width,
               left: d.radius,
               top: -d.width >> 1,
               filter: i
            }), c("fill", {
               color: g(d.color, a),
               opacity: d.opacity
            }), c("stroke", {
               opacity: 0
            }))))
         }
         var i, j = d.length + d.width,
            k = 2 * j,
            l = 2 * -(d.width + d.length) + "px",
            m = e(f(), {
               position: "absolute",
               top: l,
               left: l
            });
         if (d.shadow)
            for (i = 1; i <= d.lines; i++) h(i, -2, "progid:DXImageTransform.Microsoft.Blur(pixelradius=2,makeshadow=1,shadowopacity=.3)");
         for (i = 1; i <= d.lines; i++) h(i);
         return b(a, m)
      }, h.prototype.opacity = function(a, b, c, d) {
         var e = a.firstChild;
         d = d.shadow && d.lines || 0, e && b + d < e.childNodes.length && (e = e.childNodes[b + d], e = e && e.firstChild, e = e && e.firstChild, e && (e.opacity = c))
      }
   }
   var j, k = ["webkit", "Moz", "ms", "O"],
      l = {},
      m = function() {
         var c = a("style", {
            type: "text/css"
         });
         return b(document.getElementsByTagName("head")[0], c), c.sheet || c.styleSheet
      }(),
      n = {
         lines: 12,
         length: 7,
         width: 5,
         radius: 10,
         rotate: 0,
         corners: 1,
         color: "#000",
         direction: 1,
         speed: 1,
         trail: 100,
         opacity: .25,
         fps: 20,
         zIndex: 2e9,
         className: "spinner",
         top: "50%",
         left: "50%",
         position: "absolute"
      };
   h.defaults = {}, f(h.prototype, {
      spin: function(b) {
         this.stop(); {
            var c = this,
               d = c.opts,
               f = c.el = e(a(0, {
                  className: d.className
               }), {
                  position: d.position,
                  width: 0,
                  zIndex: d.zIndex
               });
            d.radius + d.length + d.width
         }
         if (e(f, {
               left: d.left,
               top: d.top
            }), b && b.insertBefore(f, b.firstChild || null), f.setAttribute("role", "progressbar"), c.lines(f, c.opts), !j) {
            var g, h = 0,
               i = (d.lines - 1) * (1 - d.direction) / 2,
               k = d.fps,
               l = k / d.speed,
               m = (1 - d.opacity) / (l * d.trail / 100),
               n = l / d.lines;
            ! function o() {
               h++;
               for (var a = 0; a < d.lines; a++) g = Math.max(1 - (h + (d.lines - a) * n) % l * m, d.opacity), c.opacity(f, a * d.direction + i, g, d);
               c.timeout = c.el && setTimeout(o, ~~(1e3 / k))
            }()
         }
         return c
      },
      stop: function() {
         var a = this.el;
         return a && (clearTimeout(this.timeout), a.parentNode && a.parentNode.removeChild(a), this.el = void 0), this
      },
      lines: function(d, f) {
         function h(b, c) {
            return e(a(), {
               position: "absolute",
               width: f.length + f.width + "px",
               height: f.width + "px",
               background: b,
               boxShadow: c,
               transformOrigin: "left",
               transform: "rotate(" + ~~(360 / f.lines * k + f.rotate) + "deg) translate(" + f.radius + "px,0)",
               borderRadius: (f.corners * f.width >> 1) + "px"
            })
         }
         for (var i, k = 0, l = (f.lines - 1) * (1 - f.direction) / 2; k < f.lines; k++) i = e(a(), {
            position: "absolute",
            top: 1 + ~(f.width / 2) + "px",
            transform: f.hwaccel ? "translate3d(0,0,0)" : "",
            opacity: f.opacity,
            animation: j && c(f.opacity, f.trail, l + k * f.direction, f.lines) + " " + 1 / f.speed + "s linear infinite"
         }), f.shadow && b(i, e(h("#000", "0 0 4px #000"), {
            top: "2px"
         })), b(d, b(i, h(g(f.color, k), "0 0 1px rgba(0,0,0,.1)")));
         return d
      },
      opacity: function(a, b, c) {
         b < a.childNodes.length && (a.childNodes[b].style.opacity = c)
      }
   });
   var o = e(a("group"), {
      behavior: "url(#default#VML)"
   });
   return !d(o, "transform") && o.adj ? i() : j = d(o, "animation"), h
});

/*
 * nanoScrollerJS - v0.8.4 - (c) 2014 James Florentino; Licensed MIT
 */
;
! function(a) {
   return "function" == typeof define && define.amd ? define(["jquery"], function(b) {
      return a(b, window, document)
   }) : a(jQuery, window, document)
}(function(a, b, c) {
   "use strict";
   var d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G, H;
   z = {
      paneClass: "nano-pane",
      sliderClass: "nano-slider",
      contentClass: "nano-content",
      iOSNativeScrolling: !1,
      preventPageScrolling: !1,
      disableResize: !1,
      alwaysVisible: !1,
      flashDelay: 1500,
      sliderMinHeight: 20,
      sliderMaxHeight: null,
      documentContext: null,
      windowContext: null
   }, u = "scrollbar", t = "scroll", l = "mousedown", m = "mouseenter", n = "mousemove", p = "mousewheel", o = "mouseup", s = "resize", h = "drag", i = "enter", w = "up", r = "panedown", f = "DOMMouseScroll", g = "down", x = "wheel", j = "keydown", k = "keyup", v = "touchmove", d = "Microsoft Internet Explorer" === b.navigator.appName && /msie 7./i.test(b.navigator.appVersion) && b.ActiveXObject, e = null, D = b.requestAnimationFrame, y = b.cancelAnimationFrame, F = c.createElement("div").style, H = function() {
      var a, b, c, d, e, f;
      for (d = ["t", "webkitT", "MozT", "msT", "OT"], a = e = 0, f = d.length; f > e; a = ++e)
         if (c = d[a], b = d[a] + "ransform", b in F) return d[a].substr(0, d[a].length - 1);
      return !1
   }(), G = function(a) {
      return H === !1 ? !1 : "" === H ? a : H + a.charAt(0).toUpperCase() + a.substr(1)
   }, E = G("transform"), B = E !== !1, A = function() {
      var a, b, d;
      return a = c.createElement("div"), b = a.style, b.position = "absolute", b.width = "100px", b.height = "100px", b.overflow = t, b.top = "-9999px", c.body.appendChild(a), d = a.offsetWidth - a.clientWidth, c.body.removeChild(a), d
   }, C = function() {
      var a, c, d;
      return c = b.navigator.userAgent, (a = /(?=.+Mac OS X)(?=.+Firefox)/.test(c)) ? (d = /Firefox\/\d{2}\./.exec(c), d && (d = d[0].replace(/\D+/g, "")), a && +d > 23) : !1
   }, q = function() {
      function j(d, f) {
         this.el = d, this.options = f, e || (e = A()), this.$el = a(this.el), this.doc = a(this.options.documentContext || c), this.win = a(this.options.windowContext || b), this.body = this.doc.find("body"), this.$content = this.$el.children("." + f.contentClass), this.$content.attr("tabindex", this.options.tabIndex || 0), this.content = this.$content[0], this.previousPosition = 0, this.options.iOSNativeScrolling && null != this.el.style.WebkitOverflowScrolling ? this.nativeScrolling() : this.generate(), this.createEvents(), this.addEvents(), this.reset()
      }
      return j.prototype.preventScrolling = function(a, b) {
         if (this.isActive)
            if (a.type === f)(b === g && a.originalEvent.detail > 0 || b === w && a.originalEvent.detail < 0) && a.preventDefault();
            else if (a.type === p) {
            if (!a.originalEvent || !a.originalEvent.wheelDelta) return;
            (b === g && a.originalEvent.wheelDelta < 0 || b === w && a.originalEvent.wheelDelta > 0) && a.preventDefault()
         }
      }, j.prototype.nativeScrolling = function() {
         this.$content.css({
            WebkitOverflowScrolling: "touch"
         }), this.iOSNativeScrolling = !0, this.isActive = !0
      }, j.prototype.updateScrollValues = function() {
         var a, b;
         a = this.content, this.maxScrollTop = a.scrollHeight - a.clientHeight, this.prevScrollTop = this.contentScrollTop || 0, this.contentScrollTop = a.scrollTop, b = this.contentScrollTop > this.previousPosition ? "down" : this.contentScrollTop < this.previousPosition ? "up" : "same", this.previousPosition = this.contentScrollTop, "same" !== b && this.$el.trigger("update", {
            position: this.contentScrollTop,
            maximum: this.maxScrollTop,
            direction: b
         }), this.iOSNativeScrolling || (this.maxSliderTop = this.paneHeight - this.sliderHeight, this.sliderTop = 0 === this.maxScrollTop ? 0 : this.contentScrollTop * this.maxSliderTop / this.maxScrollTop)
      }, j.prototype.setOnScrollStyles = function() {
         var a;
         B ? (a = {}, a[E] = "translate(0, " + this.sliderTop + "px)") : a = {
            top: this.sliderTop
         }, D ? (y && this.scrollRAF && y(this.scrollRAF), this.scrollRAF = D(function(b) {
            return function() {
               return b.scrollRAF = null, b.slider.css(a)
            }
         }(this))) : this.slider.css(a)
      }, j.prototype.createEvents = function() {
         this.events = {
            down: function(a) {
               return function(b) {
                  return a.isBeingDragged = !0, a.offsetY = b.pageY - a.slider.offset().top, a.slider.is(b.target) || (a.offsetY = 0), a.pane.addClass("active"), a.doc.bind(n, a.events[h]).bind(o, a.events[w]), a.body.bind(m, a.events[i]), !1
               }
            }(this),
            drag: function(a) {
               return function(b) {
                  return a.sliderY = b.pageY - a.$el.offset().top - a.paneTop - (a.offsetY || .5 * a.sliderHeight), a.scroll(), a.contentScrollTop >= a.maxScrollTop && a.prevScrollTop !== a.maxScrollTop ? a.$el.trigger("scrollend") : 0 === a.contentScrollTop && 0 !== a.prevScrollTop && a.$el.trigger("scrolltop"), !1
               }
            }(this),
            up: function(a) {
               return function() {
                  return a.isBeingDragged = !1, a.pane.removeClass("active"), a.doc.unbind(n, a.events[h]).unbind(o, a.events[w]), a.body.unbind(m, a.events[i]), !1
               }
            }(this),
            resize: function(a) {
               return function() {
                  a.reset()
               }
            }(this),
            panedown: function(a) {
               return function(b) {
                  return a.sliderY = (b.offsetY || b.originalEvent.layerY) - .5 * a.sliderHeight, a.scroll(), a.events.down(b), !1
               }
            }(this),
            scroll: function(a) {
               return function(b) {
                  a.updateScrollValues(), a.isBeingDragged || (a.iOSNativeScrolling || (a.sliderY = a.sliderTop, a.setOnScrollStyles()), null != b && (a.contentScrollTop >= a.maxScrollTop ? (a.options.preventPageScrolling && a.preventScrolling(b, g), a.prevScrollTop !== a.maxScrollTop && a.$el.trigger("scrollend")) : 0 === a.contentScrollTop && (a.options.preventPageScrolling && a.preventScrolling(b, w), 0 !== a.prevScrollTop && a.$el.trigger("scrolltop"))))
               }
            }(this),
            wheel: function(a) {
               return function(b) {
                  var c;
                  if (null != b) return c = b.delta || b.wheelDelta || b.originalEvent && b.originalEvent.wheelDelta || -b.detail || b.originalEvent && -b.originalEvent.detail, c && (a.sliderY += -c / 3), a.scroll(), !1
               }
            }(this),
            enter: function(a) {
               return function(b) {
                  var c;
                  if (a.isBeingDragged) return 1 !== (b.buttons || b.which) ? (c = a.events)[w].apply(c, arguments) : void 0
               }
            }(this)
         }
      }, j.prototype.addEvents = function() {
         var a;
         this.removeEvents(), a = this.events, this.options.disableResize || this.win.bind(s, a[s]), this.iOSNativeScrolling || (this.slider.bind(l, a[g]), this.pane.bind(l, a[r]).bind("" + p + " " + f, a[x])), this.$content.bind("" + t + " " + p + " " + f + " " + v, a[t])
      }, j.prototype.removeEvents = function() {
         var a;
         a = this.events, this.win.unbind(s, a[s]), this.iOSNativeScrolling || (this.slider.unbind(), this.pane.unbind()), this.$content.unbind("" + t + " " + p + " " + f + " " + v, a[t])
      }, j.prototype.generate = function() {
         var a, c, d, f, g, h, i;
         return f = this.options, h = f.paneClass, i = f.sliderClass, a = f.contentClass, (g = this.$el.children("." + h)).length || g.children("." + i).length || this.$el.append('<div class="' + h + '"><div class="' + i + '" /></div>'), this.pane = this.$el.children("." + h), this.slider = this.pane.find("." + i), 0 === e && C() ? (d = b.getComputedStyle(this.content, null).getPropertyValue("padding-right").replace(/[^0-9.]+/g, ""), c = {
            right: -14,
            paddingRight: +d + 14
         }) : e && (c = {
            right: -e
         }, this.$el.addClass("has-scrollbar")), null != c && this.$content.css(c), this
      }, j.prototype.restore = function() {
         this.stopped = !1, this.iOSNativeScrolling || this.pane.show(), this.addEvents()
      }, j.prototype.reset = function() {
         var a, b, c, f, g, h, i, j, k, l, m, n;
         return this.iOSNativeScrolling ? void(this.contentHeight = this.content.scrollHeight) : (this.$el.find("." + this.options.paneClass).length || this.generate().stop(), this.stopped && this.restore(), a = this.content, f = a.style, g = f.overflowY, d && this.$content.css({
            height: this.$content.height()
         }), b = a.scrollHeight + e, l = parseInt(this.$el.css("max-height"), 10), l > 0 && (this.$el.height(""), this.$el.height(a.scrollHeight > l ? l : a.scrollHeight)), i = this.pane.outerHeight(!1), k = parseInt(this.pane.css("top"), 10), h = parseInt(this.pane.css("bottom"), 10), j = i + k + h, n = Math.round(j / b * j), n < this.options.sliderMinHeight ? n = this.options.sliderMinHeight : null != this.options.sliderMaxHeight && n > this.options.sliderMaxHeight && (n = this.options.sliderMaxHeight), g === t && f.overflowX !== t && (n += e), this.maxSliderTop = j - n, this.contentHeight = b, this.paneHeight = i, this.paneOuterHeight = j, this.sliderHeight = n, this.paneTop = k, this.slider.height(n), this.events.scroll(), this.pane.show(), this.isActive = !0, a.scrollHeight === a.clientHeight || this.pane.outerHeight(!0) >= a.scrollHeight && g !== t ? (this.pane.hide(), this.isActive = !1) : this.el.clientHeight === a.scrollHeight && g === t ? this.slider.hide() : this.slider.show(), this.pane.css({
            opacity: this.options.alwaysVisible ? 1 : "",
            visibility: this.options.alwaysVisible ? "visible" : ""
         }), c = this.$content.css("position"), ("static" === c || "relative" === c) && (m = parseInt(this.$content.css("right"), 10), m && this.$content.css({
            right: "",
            marginRight: m
         })), this)
      }, j.prototype.scroll = function() {
         return this.isActive ? (this.sliderY = Math.max(0, this.sliderY), this.sliderY = Math.min(this.maxSliderTop, this.sliderY), this.$content.scrollTop(this.maxScrollTop * this.sliderY / this.maxSliderTop), this.iOSNativeScrolling || (this.updateScrollValues(), this.setOnScrollStyles()), this) : void 0
      }, j.prototype.scrollBottom = function(a) {
         return this.isActive ? (this.$content.scrollTop(this.contentHeight - this.$content.height() - a).trigger(p), this.stop().restore(), this) : void 0
      }, j.prototype.scrollTop = function(a) {
         return this.isActive ? (this.$content.scrollTop(+a).trigger(p), this.stop().restore(), this) : void 0
      }, j.prototype.scrollTo = function(a) {
         return this.isActive ? (this.scrollTop(this.$el.find(a).get(0).offsetTop), this) : void 0
      }, j.prototype.stop = function() {
         return y && this.scrollRAF && (y(this.scrollRAF), this.scrollRAF = null), this.stopped = !0, this.removeEvents(), this.iOSNativeScrolling || this.pane.hide(), this
      }, j.prototype.destroy = function() {
         return this.stopped || this.stop(), !this.iOSNativeScrolling && this.pane.length && this.pane.remove(), d && this.$content.height(""), this.$content.removeAttr("tabindex"), this.$el.hasClass("has-scrollbar") && (this.$el.removeClass("has-scrollbar"), this.$content.css({
            right: ""
         })), this
      }, j.prototype.flash = function() {
         return !this.iOSNativeScrolling && this.isActive ? (this.reset(), this.pane.addClass("flashed"), setTimeout(function(a) {
            return function() {
               a.pane.removeClass("flashed")
            }
         }(this), this.options.flashDelay), this) : void 0
      }, j
   }(), a.fn.nanoScroller = function(b) {
      return this.each(function() {
         var c, d;
         if ((d = this.nanoscroller) || (c = a.extend({}, z, b), this.nanoscroller = d = new q(this, c)), b && "object" == typeof b) {
            if (a.extend(d.options, b), null != b.scrollBottom) return d.scrollBottom(b.scrollBottom);
            if (null != b.scrollTop) return d.scrollTop(b.scrollTop);
            if (b.scrollTo) return d.scrollTo(b.scrollTo);
            if ("bottom" === b.scroll) return d.scrollBottom(0);
            if ("top" === b.scroll) return d.scrollTop(0);
            if (b.scroll && b.scroll instanceof a) return d.scrollTo(b.scroll);
            if (b.stop) return d.stop();
            if (b.destroy) return d.destroy();
            if (b.flash) return d.flash()
         }
         return d.reset()
      })
   }, a.fn.nanoScroller.Constructor = q
});

/*
PNotify 2.0.1 sciactive.com/pnotify/
(C) 2014 Hunter Perrin
license GPL/LGPL/MPL
*/
;
(function(e) {
   if (typeof define === "function" && define.amd) {
      define("pnotify", ["jquery"], e)
   } else {
      e(jQuery)
   }
})(function(e) {
   var t = {
      dir1: "down",
      dir2: "left",
      push: "top",
      spacing1: 15,
      spacing2: 15,
      context: e("body")
   };
   var n, r, i = e(window);
   var s = function() {
      r = e("body");
      PNotify.prototype.options.stack.context = r;
      i = e(window);
      i.bind("resize", function() {
         if (n) clearTimeout(n);
         n = setTimeout(function() {
            PNotify.positionAll(true)
         }, 10)
      })
   };
   PNotify = function(e) {
      this.parseOptions(e);
      this.init()
   };
   e.extend(PNotify.prototype, {
      version: "2.0.1",
      options: {
         title: false,
         title_escape: false,
         text: false,
         text_escape: false,
         styling: "bootstrap3",
         addclass: "",
         cornerclass: "",
         auto_display: true,
         width: "290px",
         min_height: "16px",
         type: "notice",
         icon: true,
         opacity: 1,
         animation: "fade",
         animate_speed: "slow",
         position_animate_speed: 500,
         shadow: false,
         hide: true,
         delay: 8e3,
         mouse_reset: true,
         remove: true,
         insert_brs: true,
         destroy: true,
         stack: t
      },
      modules: {},
      runModules: function(e, t) {
         var n;
         for (var r in this.modules) {
            n = typeof t === "object" && r in t ? t[r] : t;
            if (typeof this.modules[r][e] === "function") this.modules[r][e](this, typeof this.options[r] === "object" ? this.options[r] : {}, n)
         }
      },
      state: "initializing",
      timer: null,
      styles: null,
      elem: null,
      container: null,
      title_container: null,
      text_container: null,
      animating: false,
      timerHide: false,
      init: function() {
         var t = this;
         this.modules = {};
         e.extend(true, this.modules, PNotify.prototype.modules);
         if (typeof this.options.styling === "object") {
            this.styles = this.options.styling
         } else {
            this.styles = PNotify.styling[this.options.styling]
         }
         this.elem = e("<div />", {
            "class": "ui-pnotify " + this.options.addclass,
            css: {
               display: "none"
            },
            mouseenter: function(e) {
               if (t.options.mouse_reset && t.animating === "out") {
                  if (!t.timerHide) return;
                  t.cancelRemove()
               }
               if (t.options.hide && t.options.mouse_reset) t.cancelRemove()
            },
            mouseleave: function(e) {
               if (t.options.hide && t.options.mouse_reset) t.queueRemove();
               PNotify.positionAll()
            }
         });
         this.container = e("<div />", {
            "class": this.styles.container + " ui-pnotify-container " + (this.options.type === "error" ? this.styles.error : this.options.type === "primary" ? this.styles.primary : this.options.type === "info" ? this.styles.info : this.options.type === "success" ? this.styles.success : this.options.type === "warning" ? this.styles.warning : this.options.type === "danger" ? this.styles.danger : this.options.type === "alert" ? this.styles.alert : this.options.type === "system" ? this.styles.system : this.options.type === "dark" ? this.styles.dark : this.options.type === "success" ? this.styles.success : this.styles.notice)
         }).appendTo(this.elem);
         if (this.options.cornerclass !== "") this.container.removeClass("ui-corner-all").addClass(this.options.cornerclass);
         if (this.options.shadow) this.container.addClass("ui-pnotify-shadow");
         if (this.options.icon !== false) {
            e("<div />", {
               "class": "ui-pnotify-icon"
            }).append(e("<span />", {
               "class": this.options.icon === true ? this.options.type === "error" ? this.styles.error_icon : this.options.type === "primary" ? this.styles.primary_icon : this.options.type === "info" ? this.styles.info_icon : this.options.type === "success" ? this.styles.success_icon : this.options.type === "warning" ? this.styles.warning_icon : this.options.type === "danger" ? this.styles.danger_icon : this.options.type === "alert" ? this.styles.alert_icon : this.options.type === "system" ? this.styles.system_icon : this.options.type === "dark" ? this.styles.dark_icon : this.styles.notice_icon : this.options.icon
            })).prependTo(this.container)
         }
         this.title_container = e("<h4 />", {
            "class": "ui-pnotify-title"
         }).appendTo(this.container);
         if (this.options.title === false) this.title_container.hide();
         else if (this.options.title_escape) this.title_container.text(this.options.title);
         else this.title_container.html(this.options.title);
         this.text_container = e("<div />", {
            "class": "ui-pnotify-text"
         }).appendTo(this.container);
         if (this.options.text === false) this.text_container.hide();
         else if (this.options.text_escape) this.text_container.text(this.options.text);
         else this.text_container.html(this.options.insert_brs ? String(this.options.text).replace(/\n/g, "<br />") : this.options.text);
         if (typeof this.options.width === "string") this.elem.css("width", this.options.width);
         if (typeof this.options.min_height === "string") this.container.css("min-height", this.options.min_height);
         if (this.options.stack.push === "top") PNotify.notices = e.merge([this], PNotify.notices);
         else PNotify.notices = e.merge(PNotify.notices, [this]);
         if (this.options.stack.push === "top") this.queuePosition(false, 1);
         this.options.stack.animation = false;
         this.runModules("init");
         if (this.options.auto_display) this.open();
         return this
      },
      update: function(t) {
         var n = this.options;
         this.parseOptions(n, t);
         if (this.options.cornerclass !== n.cornerclass) this.container.removeClass("ui-corner-all " + n.cornerclass).addClass(this.options.cornerclass);
         if (this.options.shadow !== n.shadow) {
            if (this.options.shadow) this.container.addClass("ui-pnotify-shadow");
            else this.container.removeClass("ui-pnotify-shadow")
         }
         if (this.options.addclass === false) this.elem.removeClass(n.addclass);
         else if (this.options.addclass !== n.addclass) this.elem.removeClass(n.addclass).addClass(this.options.addclass);
         if (this.options.title === false) this.title_container.slideUp("fast");
         else if (this.options.title !== n.title) {
            if (this.options.title_escape) this.title_container.text(this.options.title);
            else this.title_container.html(this.options.title);
            if (n.title === false) this.title_container.slideDown(200)
         }
         if (this.options.text === false) {
            this.text_container.slideUp("fast")
         } else if (this.options.text !== n.text) {
            if (this.options.text_escape) this.text_container.text(this.options.text);
            else this.text_container.html(this.options.insert_brs ? String(this.options.text).replace(/\n/g, "<br />") : this.options.text);
            if (n.text === false) this.text_container.slideDown(200)
         }
         if (this.options.type !== n.type) this.container.removeClass(this.styles.error + " " + this.styles.notice + " " + this.styles.primary + " " + this.styles.info + " " + this.styles.success + " " + this.styles.warning + " " + this.styles.danger + " " + this.styles.alert + " " + this.styles.system + " " + this.styles.dark).addClass(this.options.type === "error" ? this.styles.error : this.options.type === "primary" ? this.styles.primary : this.options.type === "info" ? this.styles.info : this.options.type === "success" ? this.styles.success : this.options.type === "warning" ? this.styles.warning : this.options.type === "danger" ? this.styles.danger : this.options.type === "alert" ? this.styles.alert : this.options.type === "system" ? this.styles.system : this.options.type === "dark" ? this.styles.dark : this.styles.notice);
         if (this.options.icon !== n.icon || this.options.icon === true && this.options.type !== n.type) {
            this.container.find("div.ui-pnotify-icon").remove();
            if (this.options.icon !== false) {
               e("<div />", {
                  "class": "ui-pnotify-icon"
               }).append(e("<span />", {
                  "class": this.options.icon === true ? this.options.type === "error" ? this.styles.error_icon : this.options.type === "primary" ? this.styles.primary_icon : this.options.type === "info" ? this.styles.info_icon : this.options.type === "success" ? this.styles.success_icon : this.options.type === "warning" ? this.styles.warning_icon : this.options.type === "danger" ? this.styles.danger_icon : this.options.type === "alert" ? this.styles.alert_icon : this.options.type === "system" ? this.styles.system_icon : this.options.type === "dark" ? this.styles.dark_icon : this.styles.notice_icon : this.options.icon
               })).prependTo(this.container)
            }
         }
         if (this.options.width !== n.width) this.elem.animate({
            width: this.options.width
         });
         if (this.options.min_height !== n.min_height) this.container.animate({
            minHeight: this.options.min_height
         });
         if (this.options.opacity !== n.opacity) this.elem.fadeTo(this.options.animate_speed, this.options.opacity);
         if (!this.options.hide) this.cancelRemove();
         else if (!n.hide) this.queueRemove();
         this.queuePosition(true);
         this.runModules("update", n);
         return this
      },
      open: function() {
         this.state = "opening";
         this.runModules("beforeOpen");
         var e = this;
         if (!this.elem.parent().length) this.elem.appendTo(this.options.stack.context ? this.options.stack.context : r);
         if (this.options.stack.push !== "top") this.position(true);
         if (this.options.animation === "fade" || this.options.animation.effect_in === "fade") {
            this.elem.show().fadeTo(0, 0).hide()
         } else {
            if (this.options.opacity !== 1) this.elem.show().fadeTo(0, this.options.opacity).hide()
         }
         this.animateIn(function() {
            e.queuePosition(true);
            if (e.options.hide) e.queueRemove();
            e.state = "open";
            e.runModules("afterOpen")
         });
         return this
      },
      remove: function(t) {
         this.state = "closing";
         this.timerHide = !!t;
         this.runModules("beforeClose");
         var n = this;
         if (this.timer) {
            window.clearTimeout(this.timer);
            this.timer = null
         }
         this.animateOut(function() {
            n.state = "closed";
            n.runModules("afterClose");
            n.queuePosition(true);
            if (n.options.remove) n.elem.detach();
            n.runModules("beforeDestroy");
            if (n.options.destroy) {
               if (PNotify.notices !== null) {
                  var t = e.inArray(n, PNotify.notices);
                  if (t !== -1) {
                     PNotify.notices.splice(t, 1)
                  }
               }
            }
            n.runModules("afterDestroy")
         });
         return this
      },
      get: function() {
         return this.elem
      },
      parseOptions: function(t, n) {
         this.options = e.extend(true, {}, PNotify.prototype.options);
         this.options.stack = PNotify.prototype.options.stack;
         var r = [t, n],
            i;
         for (var s in r) {
            i = r[s];
            if (typeof i == "undefined") break;
            if (typeof i !== "object") {
               this.options.text = i
            } else {
               for (var o in i) {
                  if (this.modules[o]) {
                     e.extend(true, this.options[o], i[o])
                  } else {
                     this.options[o] = i[o]
                  }
               }
            }
         }
      },
      animateIn: function(e) {
         this.animating = "in";
         var t;
         if (typeof this.options.animation.effect_in !== "undefined") t = this.options.animation.effect_in;
         else t = this.options.animation;
         if (t === "none") {
            this.elem.show();
            e()
         } else if (t === "show") this.elem.show(this.options.animate_speed, e);
         else if (t === "fade") this.elem.show().fadeTo(this.options.animate_speed, this.options.opacity, e);
         else if (t === "slide") this.elem.slideDown(this.options.animate_speed, e);
         else if (typeof t === "function") t("in", e, this.elem);
         else this.elem.show(t, typeof this.options.animation.options_in === "object" ? this.options.animation.options_in : {}, this.options.animate_speed, e);
         if (this.elem.parent().hasClass("ui-effects-wrapper")) this.elem.parent().css({
            position: "fixed",
            overflow: "visible"
         });
         if (t !== "slide") this.elem.css("overflow", "visible");
         this.container.css("overflow", "hidden")
      },
      animateOut: function(e) {
         this.animating = "out";
         var t;
         if (typeof this.options.animation.effect_out !== "undefined") t = this.options.animation.effect_out;
         else t = this.options.animation;
         if (t === "none") {
            this.elem.hide();
            e()
         } else if (t === "show") this.elem.hide(this.options.animate_speed, e);
         else if (t === "fade") this.elem.fadeOut(this.options.animate_speed, e);
         else if (t === "slide") this.elem.slideUp(this.options.animate_speed, e);
         else if (typeof t === "function") t("out", e, this.elem);
         else this.elem.hide(t, typeof this.options.animation.options_out === "object" ? this.options.animation.options_out : {}, this.options.animate_speed, e);
         if (this.elem.parent().hasClass("ui-effects-wrapper")) this.elem.parent().css({
            position: "fixed",
            overflow: "visible"
         });
         if (t !== "slide") this.elem.css("overflow", "visible");
         this.container.css("overflow", "hidden")
      },
      position: function(e) {
         var t = this.options.stack,
            n = this.elem;
         if (n.parent().hasClass("ui-effects-wrapper")) n = this.elem.css({
            left: "0",
            top: "0",
            right: "0",
            bottom: "0"
         }).parent();
         if (typeof t.context === "undefined") t.context = r;
         if (!t) return;
         if (typeof t.nextpos1 !== "number") t.nextpos1 = t.firstpos1;
         if (typeof t.nextpos2 !== "number") t.nextpos2 = t.firstpos2;
         if (typeof t.addpos2 !== "number") t.addpos2 = 0;
         var s = n.css("display") === "none";
         if (!s || e) {
            var o, u;
            var a = {};
            var f;
            switch (t.dir1) {
               case "down":
                  f = "top";
                  break;
               case "up":
                  f = "bottom";
                  break;
               case "left":
                  f = "right";
                  break;
               case "right":
                  f = "left";
                  break
            }
            o = parseInt(n.css(f).replace(/(?:\..*|[^0-9.])/g, ""));
            if (isNaN(o)) o = 0;
            if (typeof t.firstpos1 === "undefined" && !s) {
               t.firstpos1 = o;
               t.nextpos1 = t.firstpos1
            }
            var l;
            switch (t.dir2) {
               case "down":
                  l = "top";
                  break;
               case "up":
                  l = "bottom";
                  break;
               case "left":
                  l = "right";
                  break;
               case "right":
                  l = "left";
                  break
            }
            u = parseInt(n.css(l).replace(/(?:\..*|[^0-9.])/g, ""));
            if (isNaN(u)) u = 0;
            if (typeof t.firstpos2 === "undefined" && !s) {
               t.firstpos2 = u;
               t.nextpos2 = t.firstpos2
            }
            if (t.dir1 === "down" && t.nextpos1 + n.height() > (t.context.is(r) ? i.height() : t.context.prop("scrollHeight")) || t.dir1 === "up" && t.nextpos1 + n.height() > (t.context.is(r) ? i.height() : t.context.prop("scrollHeight")) || t.dir1 === "left" && t.nextpos1 + n.width() > (t.context.is(r) ? i.width() : t.context.prop("scrollWidth")) || t.dir1 === "right" && t.nextpos1 + n.width() > (t.context.is(r) ? i.width() : t.context.prop("scrollWidth"))) {
               t.nextpos1 = t.firstpos1;
               t.nextpos2 += t.addpos2 + (typeof t.spacing2 === "undefined" ? 25 : t.spacing2);
               t.addpos2 = 0
            }
            if (t.animation && t.nextpos2 < u) {
               switch (t.dir2) {
                  case "down":
                     a.top = t.nextpos2 + "px";
                     break;
                  case "up":
                     a.bottom = t.nextpos2 + "px";
                     break;
                  case "left":
                     a.right = t.nextpos2 + "px";
                     break;
                  case "right":
                     a.left = t.nextpos2 + "px";
                     break
               }
            } else {
               if (typeof t.nextpos2 === "number") n.css(l, t.nextpos2 + "px")
            }
            switch (t.dir2) {
               case "down":
               case "up":
                  if (n.outerHeight(true) > t.addpos2) t.addpos2 = n.height();
                  break;
               case "left":
               case "right":
                  if (n.outerWidth(true) > t.addpos2) t.addpos2 = n.width();
                  break
            }
            if (typeof t.nextpos1 === "number") {
               if (t.animation && (o > t.nextpos1 || a.top || a.bottom || a.right || a.left)) {
                  switch (t.dir1) {
                     case "down":
                        a.top = t.nextpos1 + "px";
                        break;
                     case "up":
                        a.bottom = t.nextpos1 + "px";
                        break;
                     case "left":
                        a.right = t.nextpos1 + "px";
                        break;
                     case "right":
                        a.left = t.nextpos1 + "px";
                        break
                  }
               } else n.css(f, t.nextpos1 + "px")
            }
            if (a.top || a.bottom || a.right || a.left) n.animate(a, {
               duration: this.options.position_animate_speed,
               queue: false
            });
            switch (t.dir1) {
               case "down":
               case "up":
                  t.nextpos1 += n.height() + (typeof t.spacing1 === "undefined" ? 25 : t.spacing1);
                  break;
               case "left":
               case "right":
                  t.nextpos1 += n.width() + (typeof t.spacing1 === "undefined" ? 25 : t.spacing1);
                  break
            }
         }
         return this
      },
      queuePosition: function(e, t) {
         if (n) clearTimeout(n);
         if (!t) t = 10;
         n = setTimeout(function() {
            PNotify.positionAll(e)
         }, t);
         return this
      },
      cancelRemove: function() {
         if (this.timer) window.clearTimeout(this.timer);
         if (this.state === "closing") {
            this.elem.stop(true);
            this.state = "open";
            this.animating = "in";
            this.elem.css("height", "auto").animate({
               width: this.options.width,
               opacity: this.options.opacity
            }, "fast")
         }
         return this
      },
      queueRemove: function() {
         var e = this;
         this.cancelRemove();
         this.timer = window.setTimeout(function() {
            e.remove(true)
         }, isNaN(this.options.delay) ? 0 : this.options.delay);
         return this
      }
   });
   e.extend(PNotify, {
      notices: [],
      removeAll: function() {
         e.each(PNotify.notices, function() {
            if (this.remove) this.remove()
         })
      },
      positionAll: function(t) {
         if (n) clearTimeout(n);
         n = null;
         e.each(PNotify.notices, function() {
            var e = this.options.stack;
            if (!e) return;
            e.nextpos1 = e.firstpos1;
            e.nextpos2 = e.firstpos2;
            e.addpos2 = 0;
            e.animation = t
         });
         e.each(PNotify.notices, function() {
            this.position()
         })
      },
      styling: {
         jqueryui: {
            container: "ui-widget ui-widget-content ui-corner-all",
            notice: "ui-state-highlight",
            notice_icon: "ui-icon ui-icon-info",
            info: "",
            info_icon: "ui-icon ui-icon-info",
            success: "ui-state-default",
            success_icon: "ui-icon ui-icon-circle-check",
            error: "ui-state-error",
            error_icon: "ui-icon ui-icon-alert"
         },
         bootstrap2: {
            container: "alert",
            notice: "",
            notice_icon: "icon-exclamation-sign",
            info: "alert-info",
            info_icon: "icon-info-sign",
            success: "alert-success",
            success_icon: "icon-ok-sign",
            error: "alert-error",
            error_icon: "icon-warning-sign"
         },
         bootstrap3: {
            container: "alert",
            notice: "alert-default",
            notice_icon: "glyphicon glyphicon-exclamation-sign",
            error: "alert-danger",
            error_icon: "glyphicon glyphicon-warning-sign",
            primary: "alert-primary",
            primary_icon: "glyphicon glyphicon-exclamation-sign",
            info: "alert-info",
            info_icon: "glyphicon glyphicon-info-sign",
            success: "alert-success",
            success_icon: "glyphicon glyphicon-ok-sign",
            warning: "alert-warning",
            warning_icon: "glyphicon glyphicon-ok-sign",
            danger: "alert-danger",
            danger_icon: "glyphicon glyphicon-warning-sign",
            alert: "alert-alert",
            alert_icon: "glyphicon glyphicon-warning-sign",
            system: "alert-system",
            system_icon: "glyphicon glyphicon-warning-sign",
            dark: "alert-dark",
            dark_icon: "glyphicon glyphicon-warning-sign"
         }
      }
   });
   PNotify.styling.fontawesome = e.extend({}, PNotify.styling.bootstrap3);
   e.extend(PNotify.styling.fontawesome, {
      notice_icon: "fa fa-exclamation-circle",
      error_icon: "fa fa-warning",
      primary_icon: "fa fa-info",
      info_icon: "fa fa-info",
      success_icon: "fa fa-check",
      warning_icon: "fa fa-check",
      danger_icon: "fa fa-info",
      alert_icon: "fa fa-check",
      system_icon: "fa fa-warning",
      dark_icon: "fa fa-warning"
   });
   if (document.body) s();
   else e(s);
   return PNotify
});
(function(e) {
   if (typeof define === "function" && define.amd) {
      define("pnotify.buttons", ["jquery", "pnotify"], e)
   } else {
      e(jQuery, PNotify)
   }
})(function(e, t) {
   t.prototype.options.buttons = {
      closer: true,
      closer_hover: true,
      sticker: true,
      sticker_hover: true,
      labels: {
         close: "Close",
         stick: "Stick"
      }
   };
   t.prototype.modules.buttons = {
      myOptions: null,
      closer: null,
      sticker: null,
      init: function(t, n) {
         var r = this;
         this.myOptions = n;
         t.elem.on({
            mouseenter: function(e) {
               if (r.myOptions.sticker && !(t.options.nonblock && t.options.nonblock.nonblock)) r.sticker.trigger("pnotify_icon").css("visibility", "visible");
               if (r.myOptions.closer && !(t.options.nonblock && t.options.nonblock.nonblock)) r.closer.css("visibility", "visible")
            },
            mouseleave: function(e) {
               if (r.myOptions.sticker_hover) r.sticker.css("visibility", "hidden");
               if (r.myOptions.closer_hover) r.closer.css("visibility", "hidden")
            }
         });
         this.sticker = e("<div />", {
            "class": "ui-pnotify-sticker",
            css: {
               cursor: "pointer",
               visibility: n.sticker_hover ? "hidden" : "visible"
            },
            click: function() {
               t.options.hide = !t.options.hide;
               if (t.options.hide) t.queueRemove();
               else t.cancelRemove();
               e(this).trigger("pnotify_icon")
            }
         }).bind("pnotify_icon", function() {
            e(this).children().removeClass(t.styles.pin_up + " " + t.styles.pin_down).addClass(t.options.hide ? t.styles.pin_up : t.styles.pin_down)
         }).append(e("<span />", {
            "class": t.styles.pin_up,
            title: n.labels.stick
         })).prependTo(t.container);
         if (!n.sticker || t.options.nonblock && t.options.nonblock.nonblock) this.sticker.css("display", "none");
         this.closer = e("<div />", {
            "class": "ui-pnotify-closer",
            css: {
               cursor: "pointer",
               visibility: n.closer_hover ? "hidden" : "visible"
            },
            click: function() {
               t.remove(false);
               r.sticker.css("visibility", "hidden");
               r.closer.css("visibility", "hidden")
            }
         }).append(e("<span />", {
            "class": t.styles.closer,
            title: n.labels.close
         })).prependTo(t.container);
         if (!n.closer || t.options.nonblock && t.options.nonblock.nonblock) this.closer.css("display", "none")
      },
      update: function(e, t) {
         this.myOptions = t;
         if (!t.closer || e.options.nonblock && e.options.nonblock.nonblock) this.closer.css("display", "none");
         else if (t.closer) this.closer.css("display", "block");
         if (!t.sticker || e.options.nonblock && e.options.nonblock.nonblock) this.sticker.css("display", "none");
         else if (t.sticker) this.sticker.css("display", "block");
         this.sticker.trigger("pnotify_icon");
         if (t.sticker_hover) this.sticker.css("visibility", "hidden");
         else if (!(e.options.nonblock && e.options.nonblock.nonblock)) this.sticker.css("visibility", "visible");
         if (t.closer_hover) this.closer.css("visibility", "hidden");
         else if (!(e.options.nonblock && e.options.nonblock.nonblock)) this.closer.css("visibility", "visible")
      }
   };
   e.extend(t.styling.jqueryui, {
      closer: "ui-icon ui-icon-close",
      pin_up: "ui-icon ui-icon-pin-w",
      pin_down: "ui-icon ui-icon-pin-s"
   });
   e.extend(t.styling.bootstrap2, {
      closer: "icon-remove",
      pin_up: "icon-pause",
      pin_down: "icon-play"
   });
   e.extend(t.styling.bootstrap3, {
      closer: "glyphicon glyphicon-remove",
      pin_up: "glyphicon glyphicon-pause",
      pin_down: "glyphicon glyphicon-play"
   });
   e.extend(t.styling.fontawesome, {
      closer: "fa fa-times",
      pin_up: "fa fa-pause",
      pin_down: "fa fa-play"
   })
});
(function(e) {
   if (typeof define === "function" && define.amd) {
      define("pnotify.confirm", ["jquery", "pnotify"], e)
   } else {
      e(jQuery, PNotify)
   }
})(function(e, t) {
   t.prototype.options.confirm = {
      confirm: false,
      prompt: false,
      prompt_class: "",
      prompt_default: "",
      prompt_multi_line: false,
      align: "right",
      buttons: [{
         text: "Ok",
         addClass: "",
         promptTrigger: true,
         click: function(e, t) {
            e.remove();
            e.get().trigger("pnotify.confirm", [e, t])
         }
      }, {
         text: "Cancel",
         addClass: "",
         click: function(e) {
            e.remove();
            e.get().trigger("pnotify.cancel", e)
         }
      }]
   };
   t.prototype.modules.confirm = {
      container: null,
      prompt: null,
      init: function(t, n) {
         this.container = e('<div style="margin-top:5px;clear:both;" />').css("text-align", n.align).appendTo(t.container);
         if (n.confirm || n.prompt) this.makeDialog(t, n);
         else this.container.hide()
      },
      update: function(e, t) {
         if (t.confirm) {
            this.makeDialog(e, t);
            this.container.show()
         } else {
            this.container.hide().empty()
         }
      },
      afterOpen: function(e, t) {
         if (t.prompt) this.prompt.focus()
      },
      makeDialog: function(t, n) {
         var r = false,
            i = this,
            s, o;
         this.container.empty();
         if (n.prompt) {
            this.prompt = e("<" + (n.prompt_multi_line ? 'textarea rows="5"' : 'input type="text"') + ' style="margin-bottom:5px;clear:both;" />').addClass(t.styles.input + " " + n.prompt_class).val(n.prompt_default).appendTo(this.container)
         }
         for (var u in n.buttons) {
            s = n.buttons[u];
            if (r) this.container.append(" ");
            else r = true;
            o = e('<button type="button" />').addClass(t.styles.btn + " " + s.addClass).text(s.text).appendTo(this.container).on("click", function(e) {
               return function() {
                  if (typeof e.click == "function") {
                     e.click(t, n.prompt ? i.prompt.val() : null)
                  }
               }
            }(s));
            if (n.prompt && !n.prompt_multi_line && s.promptTrigger) this.prompt.keypress(function(e) {
               return function(t) {
                  if (t.keyCode == 13) e.click()
               }
            }(o));
            if (t.styles.text) {
               o.wrapInner('<span class="' + t.styles.text + '"></span>')
            }
            if (t.styles.btnhover) {
               o.hover(function(e) {
                  return function() {
                     e.addClass(t.styles.btnhover)
                  }
               }(o), function(e) {
                  return function() {
                     e.removeClass(t.styles.btnhover)
                  }
               }(o))
            }
            if (t.styles.btnactive) {
               o.on("mousedown", function(e) {
                  return function() {
                     e.addClass(t.styles.btnactive)
                  }
               }(o)).on("mouseup", function(e) {
                  return function() {
                     e.removeClass(t.styles.btnactive)
                  }
               }(o))
            }
            if (t.styles.btnfocus) {
               o.on("focus", function(e) {
                  return function() {
                     e.addClass(t.styles.btnfocus)
                  }
               }(o)).on("blur", function(e) {
                  return function() {
                     e.removeClass(t.styles.btnfocus)
                  }
               }(o))
            }
         }
      }
   };
   e.extend(t.styling.jqueryui, {
      btn: "ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only",
      btnhover: "ui-state-hover",
      btnactive: "ui-state-active",
      btnfocus: "ui-state-focus",
      input: "",
      text: "ui-button-text"
   });
   e.extend(t.styling.bootstrap2, {
      btn: "btn",
      input: ""
   });
   e.extend(t.styling.bootstrap3, {
      btn: "btn btn-default",
      input: "form-control"
   });
   e.extend(t.styling.fontawesome, {
      btn: "btn btn-default",
      input: "form-control"
   })
});
(function(e) {
   if (typeof define === "function" && define.amd) {
      define("pnotify.desktop", ["jquery", "pnotify"], e)
   } else {
      e(jQuery, PNotify)
   }
})(function(e, t) {
   var n;
   var r = function(e, t) {
      if ("Notification" in window) {
         r = function(e, t) {
            return new Notification(e, t)
         }
      } else if ("mozNotification" in navigator) {
         r = function(e, t) {
            return navigator.mozNotification.createNotification(e, t.body, t.icon).show()
         }
      } else if ("webkitNotifications" in window) {
         r = function(e, t) {
            return window.webkitNotifications.createNotification(t.icon, e, t.body)
         }
      } else {
         r = function(e, t) {
            return null
         }
      }
      return r(e, t)
   };
   t.prototype.options.desktop = {
      desktop: false,
      icon: null,
      tag: null
   };
   t.prototype.modules.desktop = {
      tag: null,
      icon: null,
      genNotice: function(e, t) {
         if (t.icon === null) {
            this.icon = "http://sciactive.com/pnotify/includes/desktop/" + e.options.type + ".png"
         } else if (t.icon === false) {
            this.icon = null
         } else {
            this.icon = t.icon
         }
         if (this.tag === null || t.tag !== null) {
            this.tag = t.tag === null ? "PNotify-" + Math.round(Math.random() * 1e6) : t.tag
         }
         e.desktop = r(e.options.title, {
            icon: this.icon,
            body: e.options.text,
            tag: this.tag
         });
         if (!("close" in e.desktop)) {
            e.desktop.close = function() {
               e.desktop.cancel()
            }
         }
         e.desktop.onclick = function() {
            e.elem.trigger("click")
         };
         e.desktop.onclose = function() {
            if (e.state !== "closing" && e.state !== "closed") {
               e.remove()
            }
         }
      },
      init: function(e, r) {
         if (!r.desktop) return;
         n = t.desktop.checkPermission();
         if (n != 0) return;
         this.genNotice(e, r)
      },
      update: function(e, t, r) {
         if (n != 0 || !t.desktop) return;
         this.genNotice(e, t)
      },
      beforeOpen: function(e, t) {
         if (n != 0 || !t.desktop) return;
         e.elem.css({
            left: "-10000px",
            display: "none"
         })
      },
      afterOpen: function(e, t) {
         if (n != 0 || !t.desktop) return;
         e.elem.css({
            left: "-10000px",
            display: "none"
         });
         if ("show" in e.desktop) {
            e.desktop.show()
         }
      },
      beforeClose: function(e, t) {
         if (n != 0 || !t.desktop) return;
         e.elem.css({
            left: "-10000px",
            display: "none"
         })
      },
      afterClose: function(e, t) {
         if (n != 0 || !t.desktop) return;
         e.elem.css({
            left: "-10000px",
            display: "none"
         });
         e.desktop.close()
      }
   };
   t.desktop = {
      permission: function() {
         if (typeof Notification !== "undefined" && "requestPermission" in Notification) {
            Notification.requestPermission()
         } else if ("webkitNotifications" in window) {
            window.webkitNotifications.requestPermission()
         }
      },
      checkPermission: function() {
         if (typeof Notification !== "undefined" && "permission" in Notification) {
            return Notification.permission == "granted" ? 0 : 1
         } else if ("webkitNotifications" in window) {
            return window.webkitNotifications.checkPermission()
         } else {
            return 1
         }
      }
   };
   n = t.desktop.checkPermission()
})

/*!
 * jQuery Smooth Scroll - v1.5.4 - 2014-11-17
 * https://github.com/kswedberg/jquery-smooth-scroll
 * Copyright (c) 2014 Karl Swedberg
 * Licensed MIT (https://github.com/kswedberg/jquery-smooth-scroll/blob/master/LICENSE-MIT)
 */
;
(function(t) {
   "function" == typeof define && define.amd ? define(["jquery"], t) : t(jQuery)
})(function(t) {
   function e(t) {
      return t.replace(/(:|\.|\/)/g, "\\$1")
   }
   var l = "1.5.4",
      o = {},
      n = {
         exclude: [],
         excludeWithin: [],
         offset: 0,
         direction: "top",
         scrollElement: null,
         scrollTarget: null,
         beforeScroll: function() {},
         afterScroll: function() {},
         easing: "swing",
         speed: 400,
         autoCoefficient: 2,
         preventDefault: !0
      },
      s = function(e) {
         var l = [],
            o = !1,
            n = e.dir && "left" === e.dir ? "scrollLeft" : "scrollTop";
         return this.each(function() {
            if (this !== document && this !== window) {
               var e = t(this);
               e[n]() > 0 ? l.push(this) : (e[n](1), o = e[n]() > 0, o && l.push(this), e[n](0))
            }
         }), l.length || this.each(function() {
            "BODY" === this.nodeName && (l = [this])
         }), "first" === e.el && l.length > 1 && (l = [l[0]]), l
      };
   t.fn.extend({
      scrollable: function(t) {
         var e = s.call(this, {
            dir: t
         });
         return this.pushStack(e)
      },
      firstScrollable: function(t) {
         var e = s.call(this, {
            el: "first",
            dir: t
         });
         return this.pushStack(e)
      },
      smoothScroll: function(l, o) {
         if (l = l || {}, "options" === l) return o ? this.each(function() {
            var e = t(this),
               l = t.extend(e.data("ssOpts") || {}, o);
            t(this).data("ssOpts", l)
         }) : this.first().data("ssOpts");
         var n = t.extend({}, t.fn.smoothScroll.defaults, l),
            s = t.smoothScroll.filterPath(location.pathname);
         return this.unbind("click.smoothscroll").bind("click.smoothscroll", function(l) {
            var o = this,
               r = t(this),
               i = t.extend({}, n, r.data("ssOpts") || {}),
               c = n.exclude,
               a = i.excludeWithin,
               f = 0,
               h = 0,
               u = !0,
               d = {},
               p = location.hostname === o.hostname || !o.hostname,
               m = i.scrollTarget || t.smoothScroll.filterPath(o.pathname) === s,
               S = e(o.hash);
            if (i.scrollTarget || p && m && S) {
               for (; u && c.length > f;) r.is(e(c[f++])) && (u = !1);
               for (; u && a.length > h;) r.closest(a[h++]).length && (u = !1)
            } else u = !1;
            u && (i.preventDefault && l.preventDefault(), t.extend(d, i, {
               scrollTarget: i.scrollTarget || S,
               link: o
            }), t.smoothScroll(d))
         }), this
      }
   }), t.smoothScroll = function(e, l) {
      if ("options" === e && "object" == typeof l) return t.extend(o, l);
      var n, s, r, i, c, a = 0,
         f = "offset",
         h = "scrollTop",
         u = {},
         d = {};
      "number" == typeof e ? (n = t.extend({
         link: null
      }, t.fn.smoothScroll.defaults, o), r = e) : (n = t.extend({
         link: null
      }, t.fn.smoothScroll.defaults, e || {}, o), n.scrollElement && (f = "position", "static" === n.scrollElement.css("position") && n.scrollElement.css("position", "relative"))), h = "left" === n.direction ? "scrollLeft" : h, n.scrollElement ? (s = n.scrollElement, /^(?:HTML|BODY)$/.test(s[0].nodeName) || (a = s[h]())) : s = t("html, body").firstScrollable(n.direction), n.beforeScroll.call(s, n), r = "number" == typeof e ? e : l || t(n.scrollTarget)[f]() && t(n.scrollTarget)[f]()[n.direction] || 0, u[h] = r + a + n.offset, i = n.speed, "auto" === i && (c = u[h] - s.scrollTop(), 0 > c && (c *= -1), i = c / n.autoCoefficient), d = {
         duration: i,
         easing: n.easing,
         complete: function() {
            n.afterScroll.call(n.link, n)
         }
      }, n.step && (d.step = n.step), s.length ? s.stop().animate(u, d) : n.afterScroll.call(n.link, n)
   }, t.smoothScroll.version = l, t.smoothScroll.filterPath = function(t) {
      return t = t || "", t.replace(/^\//, "").replace(/(?:index|default).[a-zA-Z]{3,4}$/, "").replace(/\/$/, "")
   }, t.fn.smoothScroll.defaults = n
});

/*!
Underscore.js 1.7.0
http://underscorejs.org
(c) 2009-2014 Jeremy Ashkenas, DocumentCloud and Investigative Reporters & Editors
Underscore may be freely distributed under the MIT license.
*/
;
(function(){var n=this,t=n._,r=Array.prototype,e=Object.prototype,u=Function.prototype,i=r.push,a=r.slice,o=r.concat,l=e.toString,c=e.hasOwnProperty,f=Array.isArray,s=Object.keys,p=u.bind,h=function(n){return n instanceof h?n:this instanceof h?void(this._wrapped=n):new h(n)};"undefined"!=typeof exports?("undefined"!=typeof module&&module.exports&&(exports=module.exports=h),exports._=h):n._=h,h.VERSION="1.7.0";var g=function(n,t,r){if(t===void 0)return n;switch(null==r?3:r){case 1:return function(r){return n.call(t,r)};case 2:return function(r,e){return n.call(t,r,e)};case 3:return function(r,e,u){return n.call(t,r,e,u)};case 4:return function(r,e,u,i){return n.call(t,r,e,u,i)}}return function(){return n.apply(t,arguments)}};h.iteratee=function(n,t,r){return null==n?h.identity:h.isFunction(n)?g(n,t,r):h.isObject(n)?h.matches(n):h.property(n)},h.each=h.forEach=function(n,t,r){if(null==n)return n;t=g(t,r);var e,u=n.length;if(u===+u)for(e=0;u>e;e++)t(n[e],e,n);else{var i=h.keys(n);for(e=0,u=i.length;u>e;e++)t(n[i[e]],i[e],n)}return n},h.map=h.collect=function(n,t,r){if(null==n)return[];t=h.iteratee(t,r);for(var e,u=n.length!==+n.length&&h.keys(n),i=(u||n).length,a=Array(i),o=0;i>o;o++)e=u?u[o]:o,a[o]=t(n[e],e,n);return a};var v="Reduce of empty array with no initial value";h.reduce=h.foldl=h.inject=function(n,t,r,e){null==n&&(n=[]),t=g(t,e,4);var u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length,o=0;if(arguments.length<3){if(!a)throw new TypeError(v);r=n[i?i[o++]:o++]}for(;a>o;o++)u=i?i[o]:o,r=t(r,n[u],u,n);return r},h.reduceRight=h.foldr=function(n,t,r,e){null==n&&(n=[]),t=g(t,e,4);var u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length;if(arguments.length<3){if(!a)throw new TypeError(v);r=n[i?i[--a]:--a]}for(;a--;)u=i?i[a]:a,r=t(r,n[u],u,n);return r},h.find=h.detect=function(n,t,r){var e;return t=h.iteratee(t,r),h.some(n,function(n,r,u){return t(n,r,u)?(e=n,!0):void 0}),e},h.filter=h.select=function(n,t,r){var e=[];return null==n?e:(t=h.iteratee(t,r),h.each(n,function(n,r,u){t(n,r,u)&&e.push(n)}),e)},h.reject=function(n,t,r){return h.filter(n,h.negate(h.iteratee(t)),r)},h.every=h.all=function(n,t,r){if(null==n)return!0;t=h.iteratee(t,r);var e,u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length;for(e=0;a>e;e++)if(u=i?i[e]:e,!t(n[u],u,n))return!1;return!0},h.some=h.any=function(n,t,r){if(null==n)return!1;t=h.iteratee(t,r);var e,u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length;for(e=0;a>e;e++)if(u=i?i[e]:e,t(n[u],u,n))return!0;return!1},h.contains=h.include=function(n,t){return null==n?!1:(n.length!==+n.length&&(n=h.values(n)),h.indexOf(n,t)>=0)},h.invoke=function(n,t){var r=a.call(arguments,2),e=h.isFunction(t);return h.map(n,function(n){return(e?t:n[t]).apply(n,r)})},h.pluck=function(n,t){return h.map(n,h.property(t))},h.where=function(n,t){return h.filter(n,h.matches(t))},h.findWhere=function(n,t){return h.find(n,h.matches(t))},h.max=function(n,t,r){var e,u,i=-1/0,a=-1/0;if(null==t&&null!=n){n=n.length===+n.length?n:h.values(n);for(var o=0,l=n.length;l>o;o++)e=n[o],e>i&&(i=e)}else t=h.iteratee(t,r),h.each(n,function(n,r,e){u=t(n,r,e),(u>a||u===-1/0&&i===-1/0)&&(i=n,a=u)});return i},h.min=function(n,t,r){var e,u,i=1/0,a=1/0;if(null==t&&null!=n){n=n.length===+n.length?n:h.values(n);for(var o=0,l=n.length;l>o;o++)e=n[o],i>e&&(i=e)}else t=h.iteratee(t,r),h.each(n,function(n,r,e){u=t(n,r,e),(a>u||1/0===u&&1/0===i)&&(i=n,a=u)});return i},h.shuffle=function(n){for(var t,r=n&&n.length===+n.length?n:h.values(n),e=r.length,u=Array(e),i=0;e>i;i++)t=h.random(0,i),t!==i&&(u[i]=u[t]),u[t]=r[i];return u},h.sample=function(n,t,r){return null==t||r?(n.length!==+n.length&&(n=h.values(n)),n[h.random(n.length-1)]):h.shuffle(n).slice(0,Math.max(0,t))},h.sortBy=function(n,t,r){return t=h.iteratee(t,r),h.pluck(h.map(n,function(n,r,e){return{value:n,index:r,criteria:t(n,r,e)}}).sort(function(n,t){var r=n.criteria,e=t.criteria;if(r!==e){if(r>e||r===void 0)return 1;if(e>r||e===void 0)return-1}return n.index-t.index}),"value")};var m=function(n){return function(t,r,e){var u={};return r=h.iteratee(r,e),h.each(t,function(e,i){var a=r(e,i,t);n(u,e,a)}),u}};h.groupBy=m(function(n,t,r){h.has(n,r)?n[r].push(t):n[r]=[t]}),h.indexBy=m(function(n,t,r){n[r]=t}),h.countBy=m(function(n,t,r){h.has(n,r)?n[r]++:n[r]=1}),h.sortedIndex=function(n,t,r,e){r=h.iteratee(r,e,1);for(var u=r(t),i=0,a=n.length;a>i;){var o=i+a>>>1;r(n[o])<u?i=o+1:a=o}return i},h.toArray=function(n){return n?h.isArray(n)?a.call(n):n.length===+n.length?h.map(n,h.identity):h.values(n):[]},h.size=function(n){return null==n?0:n.length===+n.length?n.length:h.keys(n).length},h.partition=function(n,t,r){t=h.iteratee(t,r);var e=[],u=[];return h.each(n,function(n,r,i){(t(n,r,i)?e:u).push(n)}),[e,u]},h.first=h.head=h.take=function(n,t,r){return null==n?void 0:null==t||r?n[0]:0>t?[]:a.call(n,0,t)},h.initial=function(n,t,r){return a.call(n,0,Math.max(0,n.length-(null==t||r?1:t)))},h.last=function(n,t,r){return null==n?void 0:null==t||r?n[n.length-1]:a.call(n,Math.max(n.length-t,0))},h.rest=h.tail=h.drop=function(n,t,r){return a.call(n,null==t||r?1:t)},h.compact=function(n){return h.filter(n,h.identity)};var y=function(n,t,r,e){if(t&&h.every(n,h.isArray))return o.apply(e,n);for(var u=0,a=n.length;a>u;u++){var l=n[u];h.isArray(l)||h.isArguments(l)?t?i.apply(e,l):y(l,t,r,e):r||e.push(l)}return e};h.flatten=function(n,t){return y(n,t,!1,[])},h.without=function(n){return h.difference(n,a.call(arguments,1))},h.uniq=h.unique=function(n,t,r,e){if(null==n)return[];h.isBoolean(t)||(e=r,r=t,t=!1),null!=r&&(r=h.iteratee(r,e));for(var u=[],i=[],a=0,o=n.length;o>a;a++){var l=n[a];if(t)a&&i===l||u.push(l),i=l;else if(r){var c=r(l,a,n);h.indexOf(i,c)<0&&(i.push(c),u.push(l))}else h.indexOf(u,l)<0&&u.push(l)}return u},h.union=function(){return h.uniq(y(arguments,!0,!0,[]))},h.intersection=function(n){if(null==n)return[];for(var t=[],r=arguments.length,e=0,u=n.length;u>e;e++){var i=n[e];if(!h.contains(t,i)){for(var a=1;r>a&&h.contains(arguments[a],i);a++);a===r&&t.push(i)}}return t},h.difference=function(n){var t=y(a.call(arguments,1),!0,!0,[]);return h.filter(n,function(n){return!h.contains(t,n)})},h.zip=function(n){if(null==n)return[];for(var t=h.max(arguments,"length").length,r=Array(t),e=0;t>e;e++)r[e]=h.pluck(arguments,e);return r},h.object=function(n,t){if(null==n)return{};for(var r={},e=0,u=n.length;u>e;e++)t?r[n[e]]=t[e]:r[n[e][0]]=n[e][1];return r},h.indexOf=function(n,t,r){if(null==n)return-1;var e=0,u=n.length;if(r){if("number"!=typeof r)return e=h.sortedIndex(n,t),n[e]===t?e:-1;e=0>r?Math.max(0,u+r):r}for(;u>e;e++)if(n[e]===t)return e;return-1},h.lastIndexOf=function(n,t,r){if(null==n)return-1;var e=n.length;for("number"==typeof r&&(e=0>r?e+r+1:Math.min(e,r+1));--e>=0;)if(n[e]===t)return e;return-1},h.range=function(n,t,r){arguments.length<=1&&(t=n||0,n=0),r=r||1;for(var e=Math.max(Math.ceil((t-n)/r),0),u=Array(e),i=0;e>i;i++,n+=r)u[i]=n;return u};var d=function(){};h.bind=function(n,t){var r,e;if(p&&n.bind===p)return p.apply(n,a.call(arguments,1));if(!h.isFunction(n))throw new TypeError("Bind must be called on a function");return r=a.call(arguments,2),e=function(){if(!(this instanceof e))return n.apply(t,r.concat(a.call(arguments)));d.prototype=n.prototype;var u=new d;d.prototype=null;var i=n.apply(u,r.concat(a.call(arguments)));return h.isObject(i)?i:u}},h.partial=function(n){var t=a.call(arguments,1);return function(){for(var r=0,e=t.slice(),u=0,i=e.length;i>u;u++)e[u]===h&&(e[u]=arguments[r++]);for(;r<arguments.length;)e.push(arguments[r++]);return n.apply(this,e)}},h.bindAll=function(n){var t,r,e=arguments.length;if(1>=e)throw new Error("bindAll must be passed function names");for(t=1;e>t;t++)r=arguments[t],n[r]=h.bind(n[r],n);return n},h.memoize=function(n,t){var r=function(e){var u=r.cache,i=t?t.apply(this,arguments):e;return h.has(u,i)||(u[i]=n.apply(this,arguments)),u[i]};return r.cache={},r},h.delay=function(n,t){var r=a.call(arguments,2);return setTimeout(function(){return n.apply(null,r)},t)},h.defer=function(n){return h.delay.apply(h,[n,1].concat(a.call(arguments,1)))},h.throttle=function(n,t,r){var e,u,i,a=null,o=0;r||(r={});var l=function(){o=r.leading===!1?0:h.now(),a=null,i=n.apply(e,u),a||(e=u=null)};return function(){var c=h.now();o||r.leading!==!1||(o=c);var f=t-(c-o);return e=this,u=arguments,0>=f||f>t?(clearTimeout(a),a=null,o=c,i=n.apply(e,u),a||(e=u=null)):a||r.trailing===!1||(a=setTimeout(l,f)),i}},h.debounce=function(n,t,r){var e,u,i,a,o,l=function(){var c=h.now()-a;t>c&&c>0?e=setTimeout(l,t-c):(e=null,r||(o=n.apply(i,u),e||(i=u=null)))};return function(){i=this,u=arguments,a=h.now();var c=r&&!e;return e||(e=setTimeout(l,t)),c&&(o=n.apply(i,u),i=u=null),o}},h.wrap=function(n,t){return h.partial(t,n)},h.negate=function(n){return function(){return!n.apply(this,arguments)}},h.compose=function(){var n=arguments,t=n.length-1;return function(){for(var r=t,e=n[t].apply(this,arguments);r--;)e=n[r].call(this,e);return e}},h.after=function(n,t){return function(){return--n<1?t.apply(this,arguments):void 0}},h.before=function(n,t){var r;return function(){return--n>0?r=t.apply(this,arguments):t=null,r}},h.once=h.partial(h.before,2),h.keys=function(n){if(!h.isObject(n))return[];if(s)return s(n);var t=[];for(var r in n)h.has(n,r)&&t.push(r);return t},h.values=function(n){for(var t=h.keys(n),r=t.length,e=Array(r),u=0;r>u;u++)e[u]=n[t[u]];return e},h.pairs=function(n){for(var t=h.keys(n),r=t.length,e=Array(r),u=0;r>u;u++)e[u]=[t[u],n[t[u]]];return e},h.invert=function(n){for(var t={},r=h.keys(n),e=0,u=r.length;u>e;e++)t[n[r[e]]]=r[e];return t},h.functions=h.methods=function(n){var t=[];for(var r in n)h.isFunction(n[r])&&t.push(r);return t.sort()},h.extend=function(n){if(!h.isObject(n))return n;for(var t,r,e=1,u=arguments.length;u>e;e++){t=arguments[e];for(r in t)c.call(t,r)&&(n[r]=t[r])}return n},h.pick=function(n,t,r){var e,u={};if(null==n)return u;if(h.isFunction(t)){t=g(t,r);for(e in n){var i=n[e];t(i,e,n)&&(u[e]=i)}}else{var l=o.apply([],a.call(arguments,1));n=new Object(n);for(var c=0,f=l.length;f>c;c++)e=l[c],e in n&&(u[e]=n[e])}return u},h.omit=function(n,t,r){if(h.isFunction(t))t=h.negate(t);else{var e=h.map(o.apply([],a.call(arguments,1)),String);t=function(n,t){return!h.contains(e,t)}}return h.pick(n,t,r)},h.defaults=function(n){if(!h.isObject(n))return n;for(var t=1,r=arguments.length;r>t;t++){var e=arguments[t];for(var u in e)n[u]===void 0&&(n[u]=e[u])}return n},h.clone=function(n){return h.isObject(n)?h.isArray(n)?n.slice():h.extend({},n):n},h.tap=function(n,t){return t(n),n};var b=function(n,t,r,e){if(n===t)return 0!==n||1/n===1/t;if(null==n||null==t)return n===t;n instanceof h&&(n=n._wrapped),t instanceof h&&(t=t._wrapped);var u=l.call(n);if(u!==l.call(t))return!1;switch(u){case"[object RegExp]":case"[object String]":return""+n==""+t;case"[object Number]":return+n!==+n?+t!==+t:0===+n?1/+n===1/t:+n===+t;case"[object Date]":case"[object Boolean]":return+n===+t}if("object"!=typeof n||"object"!=typeof t)return!1;for(var i=r.length;i--;)if(r[i]===n)return e[i]===t;var a=n.constructor,o=t.constructor;if(a!==o&&"constructor"in n&&"constructor"in t&&!(h.isFunction(a)&&a instanceof a&&h.isFunction(o)&&o instanceof o))return!1;r.push(n),e.push(t);var c,f;if("[object Array]"===u){if(c=n.length,f=c===t.length)for(;c--&&(f=b(n[c],t[c],r,e)););}else{var s,p=h.keys(n);if(c=p.length,f=h.keys(t).length===c)for(;c--&&(s=p[c],f=h.has(t,s)&&b(n[s],t[s],r,e)););}return r.pop(),e.pop(),f};h.isEqual=function(n,t){return b(n,t,[],[])},h.isEmpty=function(n){if(null==n)return!0;if(h.isArray(n)||h.isString(n)||h.isArguments(n))return 0===n.length;for(var t in n)if(h.has(n,t))return!1;return!0},h.isElement=function(n){return!(!n||1!==n.nodeType)},h.isArray=f||function(n){return"[object Array]"===l.call(n)},h.isObject=function(n){var t=typeof n;return"function"===t||"object"===t&&!!n},h.each(["Arguments","Function","String","Number","Date","RegExp"],function(n){h["is"+n]=function(t){return l.call(t)==="[object "+n+"]"}}),h.isArguments(arguments)||(h.isArguments=function(n){return h.has(n,"callee")}),"function"!=typeof/./&&(h.isFunction=function(n){return"function"==typeof n||!1}),h.isFinite=function(n){return isFinite(n)&&!isNaN(parseFloat(n))},h.isNaN=function(n){return h.isNumber(n)&&n!==+n},h.isBoolean=function(n){return n===!0||n===!1||"[object Boolean]"===l.call(n)},h.isNull=function(n){return null===n},h.isUndefined=function(n){return n===void 0},h.has=function(n,t){return null!=n&&c.call(n,t)},h.noConflict=function(){return n._=t,this},h.identity=function(n){return n},h.constant=function(n){return function(){return n}},h.noop=function(){},h.property=function(n){return function(t){return t[n]}},h.matches=function(n){var t=h.pairs(n),r=t.length;return function(n){if(null==n)return!r;n=new Object(n);for(var e=0;r>e;e++){var u=t[e],i=u[0];if(u[1]!==n[i]||!(i in n))return!1}return!0}},h.times=function(n,t,r){var e=Array(Math.max(0,n));t=g(t,r,1);for(var u=0;n>u;u++)e[u]=t(u);return e},h.random=function(n,t){return null==t&&(t=n,n=0),n+Math.floor(Math.random()*(t-n+1))},h.now=Date.now||function(){return(new Date).getTime()};var _={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;","`":"&#x60;"},w=h.invert(_),j=function(n){var t=function(t){return n[t]},r="(?:"+h.keys(n).join("|")+")",e=RegExp(r),u=RegExp(r,"g");return function(n){return n=null==n?"":""+n,e.test(n)?n.replace(u,t):n}};h.escape=j(_),h.unescape=j(w),h.result=function(n,t){if(null==n)return void 0;var r=n[t];return h.isFunction(r)?n[t]():r};var x=0;h.uniqueId=function(n){var t=++x+"";return n?n+t:t},h.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var A=/(.)^/,k={"'":"'","\\":"\\","\r":"r","\n":"n","\u2028":"u2028","\u2029":"u2029"},O=/\\|'|\r|\n|\u2028|\u2029/g,F=function(n){return"\\"+k[n]};h.template=function(n,t,r){!t&&r&&(t=r),t=h.defaults({},t,h.templateSettings);var e=RegExp([(t.escape||A).source,(t.interpolate||A).source,(t.evaluate||A).source].join("|")+"|$","g"),u=0,i="__p+='";n.replace(e,function(t,r,e,a,o){return i+=n.slice(u,o).replace(O,F),u=o+t.length,r?i+="'+\n((__t=("+r+"))==null?'':_.escape(__t))+\n'":e?i+="'+\n((__t=("+e+"))==null?'':__t)+\n'":a&&(i+="';\n"+a+"\n__p+='"),t}),i+="';\n",t.variable||(i="with(obj||{}){\n"+i+"}\n"),i="var __t,__p='',__j=Array.prototype.join,"+"print=function(){__p+=__j.call(arguments,'');};\n"+i+"return __p;\n";try{var a=new Function(t.variable||"obj","_",i)}catch(o){throw o.source=i,o}var l=function(n){return a.call(this,n,h)},c=t.variable||"obj";return l.source="function("+c+"){\n"+i+"}",l},h.chain=function(n){var t=h(n);return t._chain=!0,t};var E=function(n){return this._chain?h(n).chain():n};h.mixin=function(n){h.each(h.functions(n),function(t){var r=h[t]=n[t];h.prototype[t]=function(){var n=[this._wrapped];return i.apply(n,arguments),E.call(this,r.apply(h,n))}})},h.mixin(h),h.each(["pop","push","reverse","shift","sort","splice","unshift"],function(n){var t=r[n];h.prototype[n]=function(){var r=this._wrapped;return t.apply(r,arguments),"shift"!==n&&"splice"!==n||0!==r.length||delete r[0],E.call(this,r)}}),h.each(["concat","join","slice"],function(n){var t=r[n];h.prototype[n]=function(){return E.call(this,t.apply(this._wrapped,arguments))}}),h.prototype.value=function(){return this._wrapped},"function"==typeof define&&define.amd&&define("underscore",[],function(){return h})}).call(this);
//# sourceMappingURL=underscore/underscore-min.map

/*!
Waypoints - 3.0.0
Copyright © 2011-2014 Caleb Troughton
Licensed under the MIT license.
https://github.com/imakewebthings/waypoints/blog/master/licenses.txt
*/
;
! function() {
   "use strict";

   function t(o) {
      if (!o) throw new Error("No options passed to Waypoint constructor");
      if (!o.element) throw new Error("No element option passed to Waypoint constructor");
      if (!o.handler) throw new Error("No handler option passed to Waypoint constructor");
      this.key = "waypoint-" + e, this.options = t.Adapter.extend({}, t.defaults, o), this.element = this.options.element, this.adapter = new t.Adapter(this.element), this.callback = o.handler, this.axis = this.options.horizontal ? "horizontal" : "vertical", this.enabled = this.options.enabled, this.triggerPoint = null, this.group = t.Group.findOrCreate({
         name: this.options.group,
         axis: this.axis
      }), this.context = t.Context.findOrCreateByElement(this.options.context), t.offsetAliases[this.options.offset] && (this.options.offset = t.offsetAliases[this.options.offset]), this.group.add(this), this.context.add(this), i[this.key] = this, e += 1
   }
   var e = 0,
      i = {};
   t.prototype.queueTrigger = function(t) {
      this.group.queueTrigger(this, t)
   }, t.prototype.trigger = function(t) {
      this.enabled && this.callback && this.callback.apply(this, t)
   }, t.prototype.destroy = function() {
      this.context.remove(this), this.group.remove(this), delete i[this.key]
   }, t.prototype.disable = function() {
      return this.enabled = !1, this
   }, t.prototype.enable = function() {
      return this.context.refresh(), this.enabled = !0, this
   }, t.prototype.next = function() {
      return this.group.next(this)
   }, t.prototype.previous = function() {
      return this.group.previous(this)
   }, t.destroyAll = function() {
      var t = [];
      for (var e in i) t.push(i[e]);
      for (var o = 0, r = t.length; r > o; o++) t[o].destroy()
   }, t.refreshAll = function() {
      t.Context.refreshAll()
   }, t.viewportHeight = function() {
      return window.innerHeight || document.documentElement.clientHeight
   }, t.viewportWidth = function() {
      return document.documentElement.clientWidth
   }, t.adapters = [], t.defaults = {
      context: window,
      continuous: !0,
      enabled: !0,
      group: "default",
      horizontal: !1,
      offset: 0
   }, t.offsetAliases = {
      "bottom-in-view": function() {
         return this.context.innerHeight() - this.adapter.outerHeight()
      },
      "right-in-view": function() {
         return this.context.innerWidth() - this.adapter.outerWidth()
      }
   }, window.Waypoint = t
}(),
function() {
   "use strict";

   function t(t) {
      window.setTimeout(t, 1e3 / 60)
   }

   function e(t) {
      this.element = t, this.Adapter = r.Adapter, this.adapter = new this.Adapter(t), this.key = "waypoint-context-" + i, this.didScroll = !1, this.didResize = !1, this.oldScroll = {
         x: this.adapter.scrollLeft(),
         y: this.adapter.scrollTop()
      }, this.waypoints = {
         vertical: {},
         horizontal: {}
      }, t.waypointContextKey = this.key, o[t.waypointContextKey] = this, i += 1, this.createThrottledScrollHandler(), this.createThrottledResizeHandler()
   }
   var i = 0,
      o = {},
      r = window.Waypoint,
      n = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || t,
      s = window.onload;
   e.prototype.add = function(t) {
      var e = t.options.horizontal ? "horizontal" : "vertical";
      this.waypoints[e][t.key] = t, this.refresh()
   }, e.prototype.checkEmpty = function() {
      var t = this.Adapter.isEmptyObject(this.waypoints.horizontal),
         e = this.Adapter.isEmptyObject(this.waypoints.vertical);
      t && e && (this.adapter.off(".waypoints"), delete o[this.key])
   }, e.prototype.createThrottledResizeHandler = function() {
      function t() {
         e.handleResize(), e.didResize = !1
      }
      var e = this;
      this.adapter.on("resize.waypoints", function() {
         e.didResize || (e.didResize = !0, n(t))
      })
   }, e.prototype.createThrottledScrollHandler = function() {
      function t() {
         e.handleScroll(), e.didScroll = !1
      }
      var e = this;
      this.adapter.on("scroll.waypoints", function() {
         (!e.didScroll || r.isTouch) && (e.didScroll = !0, n(t))
      })
   }, e.prototype.handleResize = function() {
      r.Context.refreshAll()
   }, e.prototype.handleScroll = function() {
      var t = {},
         e = {
            horizontal: {
               newScroll: this.adapter.scrollLeft(),
               oldScroll: this.oldScroll.x,
               forward: "right",
               backward: "left"
            },
            vertical: {
               newScroll: this.adapter.scrollTop(),
               oldScroll: this.oldScroll.y,
               forward: "down",
               backward: "up"
            }
         };
      for (var i in e) {
         var o = e[i],
            r = o.newScroll > o.oldScroll,
            n = r ? o.forward : o.backward;
         for (var s in this.waypoints[i]) {
            var a = this.waypoints[i][s],
               l = o.oldScroll < a.triggerPoint,
               h = o.newScroll >= a.triggerPoint,
               p = l && h,
               u = !l && !h;
            (p || u) && (a.queueTrigger(n), t[a.group.id] = a.group)
         }
      }
      for (var c in t) t[c].flushTriggers();
      this.oldScroll = {
         x: e.horizontal.newScroll,
         y: e.vertical.newScroll
      }
   }, e.prototype.innerHeight = function() {
      return this.element === this.element.window ? r.viewportHeight() : this.adapter.innerHeight()
   }, e.prototype.remove = function(t) {
      delete this.waypoints[t.axis][t.key], this.checkEmpty()
   }, e.prototype.innerWidth = function() {
      return this.element === this.element.window ? r.viewportWidth() : this.adapter.innerWidth()
   }, e.prototype.destroy = function() {
      var t = [];
      for (var e in this.waypoints)
         for (var i in this.waypoints[e]) t.push(this.waypoints[e][i]);
      for (var o = 0, r = t.length; r > o; o++) t[o].destroy()
   }, e.prototype.refresh = function() {
      var t, e = this.element === this.element.window,
         i = this.adapter.offset(),
         o = {};
      this.handleScroll(), t = {
         horizontal: {
            contextOffset: e ? 0 : i.left,
            contextScroll: e ? 0 : this.oldScroll.x,
            contextDimension: this.innerWidth(),
            oldScroll: this.oldScroll.x,
            forward: "right",
            backward: "left",
            offsetProp: "left"
         },
         vertical: {
            contextOffset: e ? 0 : i.top,
            contextScroll: e ? 0 : this.oldScroll.y,
            contextDimension: this.innerHeight(),
            oldScroll: this.oldScroll.y,
            forward: "down",
            backward: "up",
            offsetProp: "top"
         }
      };
      for (var r in t) {
         var n = t[r];
         for (var s in this.waypoints[r]) {
            var a, l, h, p, u, c = this.waypoints[r][s],
               d = c.options.offset,
               f = c.triggerPoint,
               w = 0,
               y = null == f;
            c.element !== c.element.window && (w = c.adapter.offset()[n.offsetProp]), "function" == typeof d ? d = d.apply(c) : "string" == typeof d && (d = parseFloat(d), c.options.offset.indexOf("%") > -1 && (d = Math.ceil(n.contextDimension * d / 100))), a = n.contextScroll - n.contextOffset, c.triggerPoint = w + a - d, l = f < n.oldScroll, h = c.triggerPoint >= n.oldScroll, p = l && h, u = !l && !h, !y && p ? (c.queueTrigger(n.backward), o[c.group.id] = c.group) : !y && u ? (c.queueTrigger(n.forward), o[c.group.id] = c.group) : y && n.oldScroll >= c.triggerPoint && (c.queueTrigger(n.forward), o[c.group.id] = c.group)
         }
      }
      for (var g in o) o[g].flushTriggers();
      return this
   }, e.findOrCreateByElement = function(t) {
      return e.findByElement(t) || new e(t)
   }, e.refreshAll = function() {
      for (var t in o) o[t].refresh()
   }, e.findByElement = function(t) {
      return o[t.waypointContextKey]
   }, window.onload = function() {
      s && s(), e.refreshAll()
   }, r.Context = e
}(),
function() {
   "use strict";

   function t(t, e) {
      return t.triggerPoint - e.triggerPoint
   }

   function e(t, e) {
      return e.triggerPoint - t.triggerPoint
   }

   function i(t) {
      this.name = t.name, this.axis = t.axis, this.id = this.name + "-" + this.axis, this.waypoints = [], this.clearTriggerQueues(), o[this.axis][this.name] = this
   }
   var o = {
         vertical: {},
         horizontal: {}
      },
      r = window.Waypoint;
   i.prototype.add = function(t) {
      this.waypoints.push(t)
   }, i.prototype.clearTriggerQueues = function() {
      this.triggerQueues = {
         up: [],
         down: [],
         left: [],
         right: []
      }
   }, i.prototype.flushTriggers = function() {
      for (var i in this.triggerQueues) {
         var o = this.triggerQueues[i],
            r = "up" === i || "left" === i;
         o.sort(r ? e : t);
         for (var n = 0, s = o.length; s > n; n += 1) {
            var a = o[n];
            (a.options.continuous || n === o.length - 1) && a.trigger([i])
         }
      }
      this.clearTriggerQueues()
   }, i.prototype.next = function(e) {
      this.waypoints.sort(t);
      var i = r.Adapter.inArray(e, this.waypoints),
         o = i === this.waypoints.length - 1;
      return o ? null : this.waypoints[i + 1]
   }, i.prototype.previous = function(e) {
      this.waypoints.sort(t);
      var i = r.Adapter.inArray(e, this.waypoints);
      return i ? this.waypoints[i - 1] : null
   }, i.prototype.queueTrigger = function(t, e) {
      this.triggerQueues[e].push(t)
   }, i.prototype.remove = function(t) {
      var e = r.Adapter.inArray(t, this.waypoints);
      e > -1 && this.waypoints.splice(e, 1)
   }, i.prototype.first = function() {
      return this.waypoints[0]
   }, i.prototype.last = function() {
      return this.waypoints[this.waypoints.length - 1]
   }, i.findOrCreate = function(t) {
      return o[t.axis][t.name] || new i(t)
   }, r.Group = i
}(),
function() {
   "use strict";

   function t(t) {
      this.$element = e(t)
   }
   var e = window.jQuery,
      i = window.Waypoint;
   e.each(["innerHeight", "innerWidth", "off", "offset", "on", "outerHeight", "outerWidth", "scrollLeft", "scrollTop"], function(e, i) {
      t.prototype[i] = function() {
         var t = Array.prototype.slice.call(arguments);
         return this.$element[i].apply(this.$element, t)
      }
   }), e.each(["extend", "inArray", "isEmptyObject"], function(i, o) {
      t[o] = e[o]
   }), i.adapters.push({
      name: "jquery",
      Adapter: t
   }), i.Adapter = t
}(),
function() {
   "use strict";

   function t(t) {
      return function() {
         var i = [],
            o = arguments[0];
         return t.isFunction(arguments[0]) && (o = t.extend({}, arguments[1]), o.handler = arguments[0]), this.each(function() {
            var r = t.extend({}, o, {
               element: this
            });
            "string" == typeof r.context && (r.context = t(this).closest(r.context)[0]), i.push(new e(r))
         }), i
      }
   }
   var e = window.Waypoint;
   window.jQuery && (window.jQuery.fn.waypoint = t(window.jQuery)), window.Zepto && (window.Zepto.fn.waypoint = t(window.Zepto))
}();

