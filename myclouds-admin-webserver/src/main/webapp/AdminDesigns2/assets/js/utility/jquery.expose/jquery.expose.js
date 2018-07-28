/*
 * jQuery Expose plugin 1.0
 * Copyright (c) 2013 Jeff Ching
 *
 * http://github.com/chingor13/jquery-expose
 *
 * Depends:
 *   - jQuery 1.4.2+
 * *
 * Licensed under the MIT license
 *   http://www.opensource.org/licenses/mit-license.php
 *
 */
 (function($){
  function removeOverlays() {
    $('.expose-overlay').remove();
    $("body").trigger("expose:overlay:removed");
  }

  function showOverlay(x0, y0, x1, y1, options) {
    var overlay = $('<div class="expose-overlay"></div>').css({
      position: 'absolute',
      top: y0 + 'px',
      left: x0 + 'px',
      width: (x1 - x0) + 'px',
      height: (y1 - y0) + 'px'
    }).appendTo($("body"));
    if(!options.static) {
      overlay.bind('click', removeOverlays);
    }

    $("body").append(overlay).trigger("expose:overlay:shown", [x0, y0, x1, y1, overlay]);
  }

  $.fn.expose = function(options) {
    //removeOverlays();

    // default options
    options = options || {};
    $("body").trigger("expose:init", [this, options]);

    var padding = options.padding || 0,
      bounds = [],
      xValues = [0],
      sortedX = [];
    this.each(function(i, el) {
      var $el = $(el)
        offset = $el.offset(),
        x0 = offset.left - padding,
        y0 = offset.top - padding,
        x1 = offset.left + $el.outerWidth() + padding,
        y1 = offset.top + $el.outerHeight() + padding;
      bounds.push({topLeft: {x: x0, y: y0}, bottomRight: {x: x1, y: y1}});
      xValues.push(x0);
      xValues.push(x1);
    });
    xValues.push($(document).width());
    xValues.sort(function(a,b){
      return a - b;
    });

    // ugh, unique values in the sorted array
    var last;
    for(var i = 0; i < xValues.length; i++) {
      if(last != xValues[i]) {
        last = xValues[i];
        sortedX.push(xValues[i]);
      }
    }

    // sorted by top y-values
    bounds.sort(function(a,b) {
      return a.topLeft.y - b.topLeft.y;
    });

    // each vertical slice
    for(var i = 0; i < sortedX.length - 1; i++) {
      var x0 = sortedX[i],
        x1 = sortedX[i+1],
        intersecting = [];

      for(var j = 0; j < bounds.length; j++) {
        var bound = bounds[j];
        if(bound.topLeft.x <= x0 && bound.bottomRight.x >= x1) {
          // bound spans x-range
          intersecting.push([bound.topLeft.y, bound.bottomRight.y]);
        }
      }

      var yValues = [0];
      for(var j = 0; j < intersecting.length; j++) {
        var bound = intersecting[j];
        if(bound[0] > yValues[yValues.length - 1]) {
          yValues.push(bound[0]);
          yValues.push(bound[1]);
        } else {
          yValues.pop();
          yValues.push(bound[1]);
        }
      }
      yValues.push($(document).height());

      for(var j = 0; j < yValues.length - 1; j = j + 2) {
        showOverlay(x0, yValues[j], x1, yValues[j+1], options);
      }
    }

    $("body").trigger("expose:shown", this);
    return this;
  };

  $(document).bind("expose:hide", removeOverlays);
})(jQuery);
