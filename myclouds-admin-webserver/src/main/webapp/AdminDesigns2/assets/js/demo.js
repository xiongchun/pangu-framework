'use strict';
/*! main.js - v0.1.1
 * http://admindesigns.com/
 * Copyright (c) 2013 Admin Designs;*/

/* Demo theme functions. Required for
 * Settings Pane and misc functions */
var Demo = function() {

   // Demo AdminForm Functions
   var runDemoForms = function() {

      // Prevents directory response when submitting a demo form
      $('.admin-form').on('submit', function(e) {

         if($('body.timeline-page').length || $('body.admin-validation-page').length) {
            return;
         }

         e.preventDefault;
         alert('Your form has submitted!');
         return false;

      });

   }

   // Demo Header Functions
   var runDemoTopbar = function() {

      // Init jQuery Multi-Select
      if ($("#topbar-multiple").length) {
         $('#topbar-multiple').multiselect({
            buttonClass: 'btn btn-default btn-sm ph15',
            dropRight: true
         });
      }

   }

   // DEMO FUNCTIONS - primarily trash
   var runDemoSettings = function() {

      if ($('#skin-toolbox').length) {


         // Toggles Theme Settings Tray
         $('#skin-toolbox .panel-heading').on('click', function() {
            $('#skin-toolbox').toggleClass('toolbox-open');
         });
         // Disable text selection
         $('#skin-toolbox .panel-heading').disableSelection();

         // Cache component elements
         var Breadcrumbs = $('#topbar');
         var Sidebar = $('#sidebar_left');
         var Header = $('.navbar');
         var Branding = Header.children('.navbar-branding');

         // Possible Component Skins
         var headerSkins = "bg-primary bg-success bg-info bg-warning bg-danger bg-alert bg-system bg-dark bg-light";
         var sidebarSkins = "sidebar-light light dark";

         // Theme Settings
         var settingsObj = {
                  'headerSkin': 'bg-light',
                 'sidebarSkin': 'sidebar-default',
                 'headerState': 'navbar-fixed-top',
             'breadcrumbState': 'relative',
            'breadcrumbHidden': 'visible',
         };


         // Local Storage Theme Key
         var themeKey = 'admin-settings';

         // Local Storage Theme Get
         var themeGet = localStorage.getItem(themeKey);

         // Set new key if one doesn't exist
         if (themeGet === null) {
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
            themeGet = localStorage.getItem(themeKey);
         }

         // Restore Theme Settings from Local Storage Key
         (function() {

            var settingsParse = JSON.parse(themeGet);
            settingsObj = settingsParse;

            $.each(settingsParse, function(i, e) {
               switch (i) {
                  case 'headerSkin':
                     Header.removeClass(headerSkins).addClass(e);

                     if (e === "bg-light") {
                        Branding.removeClass(headerSkins);
                     }
                     else {
                        Branding.removeClass(headerSkins).addClass(e);
                     }

                     $('#toolbox-header-skin input[value="bg-light"]').prop('checked', false);
                     $('#toolbox-header-skin input[value="' + e + '"]').prop('checked', true);
                     break;
                  case 'sidebarSkin':
                     Sidebar.removeClass(sidebarSkins).addClass(e);
                     $('#toolbox-sidebar-skin input[value="bg-light"]').prop('checked', false);
                     $('#toolbox-sidebar-skin input[value="' + e + '"]').prop('checked', true);
                     break;
                  case 'headerState':
                     if (e === "navbar-fixed-top") {
                        Header.addClass('navbar-fixed-top');
                        $('#header-option').prop('checked', true);
                     } else {
                        Header.removeClass('navbar-fixed-top');
                        $('#header-option').prop('checked', false);
                     }
                     break;
                  case 'sidebarState':
                     if (e === "affix") {
                        Sidebar.addClass('affix');
                        $('#sidebar-option').prop('checked', true);
                     } else {
                        Sidebar.removeClass('affix');
                        $('#sidebar-option').prop('checked', false);
                     }                       
                     break;
                  case 'breadcrumbState':
                     if (e === "affix") {
                        Breadcrumbs.addClass('affix');
                        $('#breadcrumb-option').prop('checked', true);
                     } else {
                        Breadcrumbs.removeClass('affix');
                        $('#breadcrumb-option').prop('checked', false);
                     }
                     break;
                  case 'breadcrumbHidden':
                     if (e === "hidden") {
                        Breadcrumbs.addClass('hidden');
                        $('#breadcrumb-hidden').prop('checked', true);
                     } else {
                        Breadcrumbs.removeClass('hidden');
                        $('#breadcrumb-hidden').prop('checked', false);
                     }
                     break;
               }
            });

         })();

         // Header Skin Switcher
         $('#toolbox-header-skin input').on('click', function() {
            var Val = $(this).val();

            // Swap Header Skin
            Header.removeClass(headerSkins).addClass(Val);
            Branding.removeClass(headerSkins).addClass(Val + ' dark');

            // Save new Skin to Settings Key
            settingsObj['headerSkin'] = Val + ' dark';
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
         });

         // Sidebar Skin Switcher
         $('#toolbox-sidebar-skin input').on('click', function() {
            var Val = $(this).val();

            // Swap Sidebar Skin
            Sidebar.removeClass(sidebarSkins).addClass(Val);

            // Save new Skin to Settings Key
            settingsObj['sidebarSkin'] = Val;
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
         });

         // Fixed Header Switcher
         $('#header-option').on('click', function() {
            var headerState = "navbar-fixed-top";

            if (Header.hasClass('navbar-fixed-top')) {
               Header.removeClass('navbar-fixed-top');
               headerState = "relative";

               // Remove Fixed Sidebar option if navbar isnt fixed
               Sidebar.removeClass('affix');
               $('#sidebar-option').parent('.checkbox-custom').addClass('checkbox-disabled').end().prop('checked', false).attr('disabled', true);
               settingsObj['sidebarState'] = "";
               localStorage.setItem(themeKey, JSON.stringify(settingsObj));

               // Remove Fixed Breadcrumb option if navbar isnt fixed
               Breadcrumbs.removeClass('affix');
               $('#breadcrumb-option').parent('.checkbox-custom').addClass('checkbox-disabled').end().prop('checked', false).attr('disabled', true);
               settingsObj['breadcrumbState'] = "";
               localStorage.setItem(themeKey, JSON.stringify(settingsObj));

            } else {
               Header.addClass('navbar-fixed-top');
               headerState = "navbar-fixed-top";
               // Enable fixed sidebar and breadcrumb options
               $('#sidebar-option').parent('.checkbox-custom').removeClass('checkbox-disabled').end().attr('disabled', false);
               $('#breadcrumb-option').parent('.checkbox-custom').removeClass('checkbox-disabled').end().attr('disabled', false);
            }

            // Save new setting to Settings Key
            settingsObj['headerState'] = headerState;
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
         });

         // Fixed Sidebar Switcher
         $('#sidebar-option').on('click', function() {
            var sidebarState = "";

            if (Sidebar.hasClass('affix')) {
               Sidebar.removeClass('affix');
               sidebarState = "";
            } else {
               Sidebar.addClass('affix');
               sidebarState = "affix";
            }

            // Recaculate nano scroller dimensions after affix change
            if ($('.nano').length) {
                $(".nano").nanoScroller({
                   preventPageScrolling: true
                });
            }
            $(window).trigger('resize');

            // Save new setting to Settings Key
            settingsObj['sidebarState'] = sidebarState;
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
         });

         // Fixed Breadcrumb Switcher
         $('#breadcrumb-option').on('click', function() {
            var breadcrumbState = "";

            if (Breadcrumbs.hasClass('affix')) {
               Breadcrumbs.removeClass('affix');
               breadcrumbState = "";
            } else {
               Breadcrumbs.addClass('affix');
               breadcrumbState = "affix";
            }

            // Save new setting to Settings Key
            settingsObj['breadcrumbState'] = breadcrumbState;
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
         });

         // Hidden Breadcrumb Switcher
         $('#breadcrumb-hidden').on('click', function() {
            var breadcrumbState = "";

            if (Breadcrumbs.hasClass('hidden')) {
               Breadcrumbs.removeClass('hidden');
               breadcrumbState = "";
            } else {
               Breadcrumbs.addClass('hidden');
               breadcrumbState = "hidden";
            }

            // Save new setting to Settings Key
            settingsObj['breadcrumbHidden'] = breadcrumbState;
            localStorage.setItem(themeKey, JSON.stringify(settingsObj));
         });

         // Clear local storage button and confirm dialog
         $("#clearLocalStorage").on('click', function() {
            (new PNotify({
               title: 'Are you sure?',
               hide: false,
               type: 'dark',
               addclass: "mt50",
               buttons: {
                  closer: false,
                  sticker: false
               },
               confirm: {
                  confirm: true,
                  buttons: [{
                     text: "Yup, Do it.",
                     addClass: "btn-sm btn-info",
                  }, {
                     text: "Cancel",
                     addClass: "btn-sm btn-danger",
                  }],
               },
               history: {
                  history: false
               }
            })).get().on('pnotify.confirm', function() {
               localStorage.clear();
               location.reload();
            }).on('pnotify.cancel', function() {
               return;
            });

         });
      }

   }

   var runDemoCache = function() {

      $(window).load(function() {

         // List of all available JS files. We're going to attempt to
         // cache them all after the first page has finished loading.
         // This is for DEMO purposes ONLY
         var scripts = {

            // HIGH PRIORITY - Images
            image1: 'img/stock/splash/1.jpg',
            image2: 'img/stock/splash/2.jpg',
            image3: 'img/stock/splash/3.jpg',
            image4: 'img/stock/splash/4.jpg',

            // HIGH PRIORITY
            gmap: 'vendor/plugins/map/gmaps.min.js',
            jquerymap: 'vendor/plugins/gmap/jquery.ui.map.js',
            mixitup: 'vendor/plugins/mixitup/jquery.mixitup.min.js',
            mpopup: 'vendor/plugins/mfpopup/jquery.magnific-popup.min.js',
            chosen: 'vendor/plugins/chosen/chosen.jquery.js',
            moment: 'vendor/plugins/daterange/moment.min.js',
            globalize: 'vendor/plugins/globalize/globalize.js',

            // FORM PICKERS
            cpicker: 'vendor/plugins/colorpicker/bootstrap-colorpicker.js',
            timepicker: 'vendor/plugins/timepicker/bootstrap-timepicker.min.js',
            datepicker: 'vendor/plugins/datepicker/bootstrap-datepicker.js',
            daterange: 'vendor/plugins/daterange/daterangepicker.js',

            // FORMS
            validate: 'vendor/plugins/validate/jquery.validate.js',
            masked: 'vendor/plugins/jquerymask/jquery.maskedinput.min.js',

            // FORMS TOOLS
            holder: 'vendor/bootstrap/plugins/holder/holder.js',
            tagmanager: 'vendor/plugins/tags/tagmanager.js',
            gritter: 'vendor/plugins/gritter/jquery.gritter.min.js',
            ladda: 'vendor/plugins/ladda/ladda.min.js',
            paginator: 'vendor/bootstrap/plugins/paginator/bootstrap-paginator.js',
            knob: 'vendor/plugins/jquerydial/jquery.knob.js',
            rangeslider: 'vendor/plugins/rangeslider/jQAllRangeSliders.min.js',

            // MED PRIORITY - Large File sizes
            charts: 'js/pages/charts.js',
            ckeditorCDN: 'http://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.0.1/ckeditor.js',
            xedit: 'vendor/editors/xeditable/js/bootstrap-editable.js',
            summernote: 'vendor/editors/summernote/summernote.js',
            countdown: 'vendor/plugins/countdown/jquery.countdown.js',
            jcrop: 'vendor/plugins/imagecrop/jquery.Jcrop.min.js',
            imagezoom: 'vendor/plugins/imagezoom/jquery.elevatezoom.min.js',
            sketchpad: 'vendor/plugins/notepad/wPaint.min.js',
            fileupload: 'vendor/bootstrap/plugins/fileupload/fileupload.js',
         };

         var cacheCheck = function(o) {
               $.each(o, function(i, p) {

                  if (localStorage.getItem(i) !== 'cached') {
                     $.ajax({
                        url: p,
                        cache: true,
                        success: function(data) {
                           localStorage.setItem(i, 'cached');
                           console.log(localStorage.getItem(i));
                        }
                     });

                  } else {}
               });
            }
            // DISABLED BY DEFAULT
            // cacheCheck(scripts);
      });
   }

   var runSidebarVector = function() {

      // Data set
      var mapData = [900, 700, 350, 500];

      var sidebarMap = $('#sidebar-right-map');

      // Init Jvector Map
      sidebarMap.vectorMap({
         map: 'us_lcc_en',
         //regionsSelectable: true,
         backgroundColor: 'transparent',
         series: {
            markers: [{
               attribute: 'r',
               scale: [3, 7],
               values: mapData
            }]
         },
         regionStyle: {
            initial: {
               fill: '#E5E5E5'
            },
            hover: {
               "fill-opacity": 0.3
            }
         },
         markers: [{
            latLng: [37.78, -122.41],
            name: 'San Francisco,CA'
         }, {
            latLng: [36.73, -103.98],
            name: 'Texas,TX'
         }, {
            latLng: [38.62, -90.19],
            name: 'St. Louis,MO'
         }, {
            latLng: [40.67, -73.94],
            name: 'New York City,NY'
         }],
         markerStyle: {
            initial: {
               fill: '#a288d5',
               stroke: '#b49ae0',
               "fill-opacity": 1,
               "stroke-width": 10,
               "stroke-opacity": 0.3,
               r: 3
            },
            hover: {
               stroke: 'black',
               "stroke-width": 2
            },
            selected: {
               fill: 'blue'
            },
            selectedHover: {}
         },
      });

      // Manual code to alter the Vector map plugin to 
      // allow for individual coloring of countries
      var states = ['US-CA', 'US-TX', 'US-MO', 'US-NY'];
      var colors = [bgPrimaryLr, bgInfoLr, bgWarningLr, bgAlertLr];
      var colors2 = [bgPrimary, bgInfo, bgWarning, bgAlert];

      $.each(states, function(i, e) {
         $("path[data-code=" + e + "]", sidebarMap).css({
            fill: colors[i]
         });
      });
      sidebarMap.find('.jvectormap-marker').each(function(i, e) {
         $(e).css({
            fill: colors2[i],
            stroke: colors2[i]
         });
      });

   }

   var runFullscreenDemo = function() {

      // Fullscreen Functionality
      var screenCheck = $.fullscreen.isNativelySupported();

      // Attach handler to navbar fullscreen button
      $('.request-fullscreen').click(function() {

         // Check for fullscreen browser support
         if (screenCheck) {
            if ($.fullscreen.isFullScreen()) {
               $.fullscreen.exit();
            } else {
               $('html').fullscreen({
                  overflow: 'visible'
               });
            }
         } else {
            alert('Your browser does not support fullscreen mode.')
         }
      });

   }

   return {
      init: function() {
         runDemoForms();
         runDemoTopbar();
         runDemoSettings();
         runDemoCache();
         runSidebarVector();
         runFullscreenDemo();
      }
   }
}();

