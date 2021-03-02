<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>SteVe</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8" />
  
  <script>
  /*!
  * Bootstrap.js by @fat & @mdo
  * Copyright 2013 Twitter, Inc.
  * http://www.apache.org/licenses/LICENSE-2.0.txt
  */
  !function(e){"use strict";e(function(){e.support.transition=function(){var e=function(){var e=document.createElement("bootstrap"),t={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"},n;for(n in t)if(e.style[n]!==undefined)return t[n]}();return e&&{end:e}}()})}(window.jQuery),!function(e){"use strict";var t='[data-dismiss="alert"]',n=function(n){e(n).on("click",t,this.close)};n.prototype.close=function(t){function s(){i.trigger("closed").remove()}var n=e(this),r=n.attr("data-target"),i;r||(r=n.attr("href"),r=r&&r.replace(/.*(?=#[^\s]*$)/,"")),i=e(r),t&&t.preventDefault(),i.length||(i=n.hasClass("alert")?n:n.parent()),i.trigger(t=e.Event("close"));if(t.isDefaultPrevented())return;i.removeClass("in"),e.support.transition&&i.hasClass("fade")?i.on(e.support.transition.end,s):s()};var r=e.fn.alert;e.fn.alert=function(t){return this.each(function(){var r=e(this),i=r.data("alert");i||r.data("alert",i=new n(this)),typeof t=="string"&&i[t].call(r)})},e.fn.alert.Constructor=n,e.fn.alert.noConflict=function(){return e.fn.alert=r,this},e(document).on("click.alert.data-api",t,n.prototype.close)}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.options=e.extend({},e.fn.button.defaults,n)};t.prototype.setState=function(e){var t="disabled",n=this.$element,r=n.data(),i=n.is("input")?"val":"html";e+="Text",r.resetText||n.data("resetText",n[i]()),n[i](r[e]||this.options[e]),setTimeout(function(){e=="loadingText"?n.addClass(t).attr(t,t):n.removeClass(t).removeAttr(t)},0)},t.prototype.toggle=function(){var e=this.$element.closest('[data-toggle="buttons-radio"]');e&&e.find(".active").removeClass("active"),this.$element.toggleClass("active")};var n=e.fn.button;e.fn.button=function(n){return this.each(function(){var r=e(this),i=r.data("button"),s=typeof n=="object"&&n;i||r.data("button",i=new t(this,s)),n=="toggle"?i.toggle():n&&i.setState(n)})},e.fn.button.defaults={loadingText:"loading..."},e.fn.button.Constructor=t,e.fn.button.noConflict=function(){return e.fn.button=n,this},e(document).on("click.button.data-api","[data-toggle^=button]",function(t){var n=e(t.target);n.hasClass("btn")||(n=n.closest(".btn")),n.button("toggle")})}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.$indicators=this.$element.find(".carousel-indicators"),this.options=n,this.options.pause=="hover"&&this.$element.on("mouseenter",e.proxy(this.pause,this)).on("mouseleave",e.proxy(this.cycle,this))};t.prototype={cycle:function(t){return t||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(e.proxy(this.next,this),this.options.interval)),this},getActiveIndex:function(){return this.$active=this.$element.find(".item.active"),this.$items=this.$active.parent().children(),this.$items.index(this.$active)},to:function(t){var n=this.getActiveIndex(),r=this;if(t>this.$items.length-1||t<0)return;return this.sliding?this.$element.one("slid",function(){r.to(t)}):n==t?this.pause().cycle():this.slide(t>n?"next":"prev",e(this.$items[t]))},pause:function(t){return t||(this.paused=!0),this.$element.find(".next, .prev").length&&e.support.transition.end&&(this.$element.trigger(e.support.transition.end),this.cycle(!0)),clearInterval(this.interval),this.interval=null,this},next:function(){if(this.sliding)return;return this.slide("next")},prev:function(){if(this.sliding)return;return this.slide("prev")},slide:function(t,n){var r=this.$element.find(".item.active"),i=n||r[t](),s=this.interval,o=t=="next"?"left":"right",u=t=="next"?"first":"last",a=this,f;this.sliding=!0,s&&this.pause(),i=i.length?i:this.$element.find(".item")[u](),f=e.Event("slide",{relatedTarget:i[0],direction:o});if(i.hasClass("active"))return;this.$indicators.length&&(this.$indicators.find(".active").removeClass("active"),this.$element.one("slid",function(){var t=e(a.$indicators.children()[a.getActiveIndex()]);t&&t.addClass("active")}));if(e.support.transition&&this.$element.hasClass("slide")){this.$element.trigger(f);if(f.isDefaultPrevented())return;i.addClass(t),i[0].offsetWidth,r.addClass(o),i.addClass(o),this.$element.one(e.support.transition.end,function(){i.removeClass([t,o].join(" ")).addClass("active"),r.removeClass(["active",o].join(" ")),a.sliding=!1,setTimeout(function(){a.$element.trigger("slid")},0)})}else{this.$element.trigger(f);if(f.isDefaultPrevented())return;r.removeClass("active"),i.addClass("active"),this.sliding=!1,this.$element.trigger("slid")}return s&&this.cycle(),this}};var n=e.fn.carousel;e.fn.carousel=function(n){return this.each(function(){var r=e(this),i=r.data("carousel"),s=e.extend({},e.fn.carousel.defaults,typeof n=="object"&&n),o=typeof n=="string"?n:s.slide;i||r.data("carousel",i=new t(this,s)),typeof n=="number"?i.to(n):o?i[o]():s.interval&&i.pause().cycle()})},e.fn.carousel.defaults={interval:5e3,pause:"hover"},e.fn.carousel.Constructor=t,e.fn.carousel.noConflict=function(){return e.fn.carousel=n,this},e(document).on("click.carousel.data-api","[data-slide], [data-slide-to]",function(t){var n=e(this),r,i=e(n.attr("data-target")||(r=n.attr("href"))&&r.replace(/.*(?=#[^\s]+$)/,"")),s=e.extend({},i.data(),n.data()),o;i.carousel(s),(o=n.attr("data-slide-to"))&&i.data("carousel").pause().to(o).cycle(),t.preventDefault()})}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.options=e.extend({},e.fn.collapse.defaults,n),this.options.parent&&(this.$parent=e(this.options.parent)),this.options.toggle&&this.toggle()};t.prototype={constructor:t,dimension:function(){var e=this.$element.hasClass("width");return e?"width":"height"},show:function(){var t,n,r,i;if(this.transitioning||this.$element.hasClass("in"))return;t=this.dimension(),n=e.camelCase(["scroll",t].join("-")),r=this.$parent&&this.$parent.find("> .accordion-group > .in");if(r&&r.length){i=r.data("collapse");if(i&&i.transitioning)return;r.collapse("hide"),i||r.data("collapse",null)}this.$element[t](0),this.transition("addClass",e.Event("show"),"shown"),e.support.transition&&this.$element[t](this.$element[0][n])},hide:function(){var t;if(this.transitioning||!this.$element.hasClass("in"))return;t=this.dimension(),this.reset(this.$element[t]()),this.transition("removeClass",e.Event("hide"),"hidden"),this.$element[t](0)},reset:function(e){var t=this.dimension();return this.$element.removeClass("collapse")[t](e||"auto")[0].offsetWidth,this.$element[e!==null?"addClass":"removeClass"]("collapse"),this},transition:function(t,n,r){var i=this,s=function(){n.type=="show"&&i.reset(),i.transitioning=0,i.$element.trigger(r)};this.$element.trigger(n);if(n.isDefaultPrevented())return;this.transitioning=1,this.$element[t]("in"),e.support.transition&&this.$element.hasClass("collapse")?this.$element.one(e.support.transition.end,s):s()},toggle:function(){this[this.$element.hasClass("in")?"hide":"show"]()}};var n=e.fn.collapse;e.fn.collapse=function(n){return this.each(function(){var r=e(this),i=r.data("collapse"),s=e.extend({},e.fn.collapse.defaults,r.data(),typeof n=="object"&&n);i||r.data("collapse",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.collapse.defaults={toggle:!0},e.fn.collapse.Constructor=t,e.fn.collapse.noConflict=function(){return e.fn.collapse=n,this},e(document).on("click.collapse.data-api","[data-toggle=collapse]",function(t){var n=e(this),r,i=n.attr("data-target")||t.preventDefault()||(r=n.attr("href"))&&r.replace(/.*(?=#[^\s]+$)/,""),s=e(i).data("collapse")?"toggle":n.data();n[e(i).hasClass("in")?"addClass":"removeClass"]("collapsed"),e(i).collapse(s)})}(window.jQuery),!function(e){"use strict";function r(){e(".dropdown-backdrop").remove(),e(t).each(function(){i(e(this)).removeClass("open")})}function i(t){var n=t.attr("data-target"),r;n||(n=t.attr("href"),n=n&&/#/.test(n)&&n.replace(/.*(?=#[^\s]*$)/,"")),r=n&&e(n);if(!r||!r.length)r=t.parent();return r}var t="[data-toggle=dropdown]",n=function(t){var n=e(t).on("click.dropdown.data-api",this.toggle);e("html").on("click.dropdown.data-api",function(){n.parent().removeClass("open")})};n.prototype={constructor:n,toggle:function(t){var n=e(this),s,o;if(n.is(".disabled, :disabled"))return;return s=i(n),o=s.hasClass("open"),r(),o||("ontouchstart"in document.documentElement&&e('<div class="dropdown-backdrop"/>').insertBefore(e(this)).on("click",r),s.toggleClass("open")),n.focus(),!1},keydown:function(n){var r,s,o,u,a,f;if(!/(38|40|27)/.test(n.keyCode))return;r=e(this),n.preventDefault(),n.stopPropagation();if(r.is(".disabled, :disabled"))return;u=i(r),a=u.hasClass("open");if(!a||a&&n.keyCode==27)return n.which==27&&u.find(t).focus(),r.click();s=e("[role=menu] li:not(.divider):visible a",u);if(!s.length)return;f=s.index(s.filter(":focus")),n.keyCode==38&&f>0&&f--,n.keyCode==40&&f<s.length-1&&f++,~f||(f=0),s.eq(f).focus()}};var s=e.fn.dropdown;e.fn.dropdown=function(t){return this.each(function(){var r=e(this),i=r.data("dropdown");i||r.data("dropdown",i=new n(this)),typeof t=="string"&&i[t].call(r)})},e.fn.dropdown.Constructor=n,e.fn.dropdown.noConflict=function(){return e.fn.dropdown=s,this},e(document).on("click.dropdown.data-api",r).on("click.dropdown.data-api",".dropdown form",function(e){e.stopPropagation()}).on("click.dropdown.data-api",t,n.prototype.toggle).on("keydown.dropdown.data-api",t+", [role=menu]",n.prototype.keydown)}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.options=n,this.$element=e(t).delegate('[data-dismiss="modal"]',"click.dismiss.modal",e.proxy(this.hide,this)),this.options.remote&&this.$element.find(".modal-body").load(this.options.remote)};t.prototype={constructor:t,toggle:function(){return this[this.isShown?"hide":"show"]()},show:function(){var t=this,n=e.Event("show");this.$element.trigger(n);if(this.isShown||n.isDefaultPrevented())return;this.isShown=!0,this.escape(),this.backdrop(function(){var n=e.support.transition&&t.$element.hasClass("fade");t.$element.parent().length||t.$element.appendTo(document.body),t.$element.show(),n&&t.$element[0].offsetWidth,t.$element.addClass("in").attr("aria-hidden",!1),t.enforceFocus(),n?t.$element.one(e.support.transition.end,function(){t.$element.focus().trigger("shown")}):t.$element.focus().trigger("shown")})},hide:function(t){t&&t.preventDefault();var n=this;t=e.Event("hide"),this.$element.trigger(t);if(!this.isShown||t.isDefaultPrevented())return;this.isShown=!1,this.escape(),e(document).off("focusin.modal"),this.$element.removeClass("in").attr("aria-hidden",!0),e.support.transition&&this.$element.hasClass("fade")?this.hideWithTransition():this.hideModal()},enforceFocus:function(){var t=this;e(document).on("focusin.modal",function(e){t.$element[0]!==e.target&&!t.$element.has(e.target).length&&t.$element.focus()})},escape:function(){var e=this;this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.modal",function(t){t.which==27&&e.hide()}):this.isShown||this.$element.off("keyup.dismiss.modal")},hideWithTransition:function(){var t=this,n=setTimeout(function(){t.$element.off(e.support.transition.end),t.hideModal()},500);this.$element.one(e.support.transition.end,function(){clearTimeout(n),t.hideModal()})},hideModal:function(){var e=this;this.$element.hide(),this.backdrop(function(){e.removeBackdrop(),e.$element.trigger("hidden")})},removeBackdrop:function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},backdrop:function(t){var n=this,r=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var i=e.support.transition&&r;this.$backdrop=e('<div class="modal-backdrop '+r+'" />').appendTo(document.body),this.$backdrop.click(this.options.backdrop=="static"?e.proxy(this.$element[0].focus,this.$element[0]):e.proxy(this.hide,this)),i&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in");if(!t)return;i?this.$backdrop.one(e.support.transition.end,t):t()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),e.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one(e.support.transition.end,t):t()):t&&t()}};var n=e.fn.modal;e.fn.modal=function(n){return this.each(function(){var r=e(this),i=r.data("modal"),s=e.extend({},e.fn.modal.defaults,r.data(),typeof n=="object"&&n);i||r.data("modal",i=new t(this,s)),typeof n=="string"?i[n]():s.show&&i.show()})},e.fn.modal.defaults={backdrop:!0,keyboard:!0,show:!0},e.fn.modal.Constructor=t,e.fn.modal.noConflict=function(){return e.fn.modal=n,this},e(document).on("click.modal.data-api",'[data-toggle="modal"]',function(t){var n=e(this),r=n.attr("href"),i=e(n.attr("data-target")||r&&r.replace(/.*(?=#[^\s]+$)/,"")),s=i.data("modal")?"toggle":e.extend({remote:!/#/.test(r)&&r},i.data(),n.data());t.preventDefault(),i.modal(s).one("hide",function(){n.focus()})})}(window.jQuery),!function(e){"use strict";var t=function(e,t){this.init("tooltip",e,t)};t.prototype={constructor:t,init:function(t,n,r){var i,s,o,u,a;this.type=t,this.$element=e(n),this.options=this.getOptions(r),this.enabled=!0,o=this.options.trigger.split(" ");for(a=o.length;a--;)u=o[a],u=="click"?this.$element.on("click."+this.type,this.options.selector,e.proxy(this.toggle,this)):u!="manual"&&(i=u=="hover"?"mouseenter":"focus",s=u=="hover"?"mouseleave":"blur",this.$element.on(i+"."+this.type,this.options.selector,e.proxy(this.enter,this)),this.$element.on(s+"."+this.type,this.options.selector,e.proxy(this.leave,this)));this.options.selector?this._options=e.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},getOptions:function(t){return t=e.extend({},e.fn[this.type].defaults,this.$element.data(),t),t.delay&&typeof t.delay=="number"&&(t.delay={show:t.delay,hide:t.delay}),t},enter:function(t){var n=e.fn[this.type].defaults,r={},i;this._options&&e.each(this._options,function(e,t){n[e]!=t&&(r[e]=t)},this),i=e(t.currentTarget)[this.type](r).data(this.type);if(!i.options.delay||!i.options.delay.show)return i.show();clearTimeout(this.timeout),i.hoverState="in",this.timeout=setTimeout(function(){i.hoverState=="in"&&i.show()},i.options.delay.show)},leave:function(t){var n=e(t.currentTarget)[this.type](this._options).data(this.type);this.timeout&&clearTimeout(this.timeout);if(!n.options.delay||!n.options.delay.hide)return n.hide();n.hoverState="out",this.timeout=setTimeout(function(){n.hoverState=="out"&&n.hide()},n.options.delay.hide)},show:function(){var t,n,r,i,s,o,u=e.Event("show");if(this.hasContent()&&this.enabled){this.$element.trigger(u);if(u.isDefaultPrevented())return;t=this.tip(),this.setContent(),this.options.animation&&t.addClass("fade"),s=typeof this.options.placement=="function"?this.options.placement.call(this,t[0],this.$element[0]):this.options.placement,t.detach().css({top:0,left:0,display:"block"}),this.options.container?t.appendTo(this.options.container):t.insertAfter(this.$element),n=this.getPosition(),r=t[0].offsetWidth,i=t[0].offsetHeight;switch(s){case"bottom":o={top:n.top+n.height,left:n.left+n.width/2-r/2};break;case"top":o={top:n.top-i,left:n.left+n.width/2-r/2};break;case"left":o={top:n.top+n.height/2-i/2,left:n.left-r};break;case"right":o={top:n.top+n.height/2-i/2,left:n.left+n.width}}this.applyPlacement(o,s),this.$element.trigger("shown")}},applyPlacement:function(e,t){var n=this.tip(),r=n[0].offsetWidth,i=n[0].offsetHeight,s,o,u,a;n.offset(e).addClass(t).addClass("in"),s=n[0].offsetWidth,o=n[0].offsetHeight,t=="top"&&o!=i&&(e.top=e.top+i-o,a=!0),t=="bottom"||t=="top"?(u=0,e.left<0&&(u=e.left*-2,e.left=0,n.offset(e),s=n[0].offsetWidth,o=n[0].offsetHeight),this.replaceArrow(u-r+s,s,"left")):this.replaceArrow(o-i,o,"top"),a&&n.offset(e)},replaceArrow:function(e,t,n){this.arrow().css(n,e?50*(1-e/t)+"%":"")},setContent:function(){var e=this.tip(),t=this.getTitle();e.find(".tooltip-inner")[this.options.html?"html":"text"](t),e.removeClass("fade in top bottom left right")},hide:function(){function i(){var t=setTimeout(function(){n.off(e.support.transition.end).detach()},500);n.one(e.support.transition.end,function(){clearTimeout(t),n.detach()})}var t=this,n=this.tip(),r=e.Event("hide");this.$element.trigger(r);if(r.isDefaultPrevented())return;return n.removeClass("in"),e.support.transition&&this.$tip.hasClass("fade")?i():n.detach(),this.$element.trigger("hidden"),this},fixTitle:function(){var e=this.$element;(e.attr("title")||typeof e.attr("data-original-title")!="string")&&e.attr("data-original-title",e.attr("title")||"").attr("title","")},hasContent:function(){return this.getTitle()},getPosition:function(){var t=this.$element[0];return e.extend({},typeof t.getBoundingClientRect=="function"?t.getBoundingClientRect():{width:t.offsetWidth,height:t.offsetHeight},this.$element.offset())},getTitle:function(){var e,t=this.$element,n=this.options;return e=t.attr("data-original-title")||(typeof n.title=="function"?n.title.call(t[0]):n.title),e},tip:function(){return this.$tip=this.$tip||e(this.options.template)},arrow:function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled},toggle:function(t){var n=t?e(t.currentTarget)[this.type](this._options).data(this.type):this;n.tip().hasClass("in")?n.hide():n.show()},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}};var n=e.fn.tooltip;e.fn.tooltip=function(n){return this.each(function(){var r=e(this),i=r.data("tooltip"),s=typeof n=="object"&&n;i||r.data("tooltip",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.tooltip.Constructor=t,e.fn.tooltip.defaults={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1},e.fn.tooltip.noConflict=function(){return e.fn.tooltip=n,this}}(window.jQuery),!function(e){"use strict";var t=function(e,t){this.init("popover",e,t)};t.prototype=e.extend({},e.fn.tooltip.Constructor.prototype,{constructor:t,setContent:function(){var e=this.tip(),t=this.getTitle(),n=this.getContent();e.find(".popover-title")[this.options.html?"html":"text"](t),e.find(".popover-content")[this.options.html?"html":"text"](n),e.removeClass("fade top bottom left right in")},hasContent:function(){return this.getTitle()||this.getContent()},getContent:function(){var e,t=this.$element,n=this.options;return e=(typeof n.content=="function"?n.content.call(t[0]):n.content)||t.attr("data-content"),e},tip:function(){return this.$tip||(this.$tip=e(this.options.template)),this.$tip},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}});var n=e.fn.popover;e.fn.popover=function(n){return this.each(function(){var r=e(this),i=r.data("popover"),s=typeof n=="object"&&n;i||r.data("popover",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.popover.Constructor=t,e.fn.popover.defaults=e.extend({},e.fn.tooltip.defaults,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),e.fn.popover.noConflict=function(){return e.fn.popover=n,this}}(window.jQuery),!function(e){"use strict";function t(t,n){var r=e.proxy(this.process,this),i=e(t).is("body")?e(window):e(t),s;this.options=e.extend({},e.fn.scrollspy.defaults,n),this.$scrollElement=i.on("scroll.scroll-spy.data-api",r),this.selector=(this.options.target||(s=e(t).attr("href"))&&s.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.$body=e("body"),this.refresh(),this.process()}t.prototype={constructor:t,refresh:function(){var t=this,n;this.offsets=e([]),this.targets=e([]),n=this.$body.find(this.selector).map(function(){var n=e(this),r=n.data("target")||n.attr("href"),i=/^#\w/.test(r)&&e(r);return i&&i.length&&[[i.position().top+(!e.isWindow(t.$scrollElement.get(0))&&t.$scrollElement.scrollTop()),r]]||null}).sort(function(e,t){return e[0]-t[0]}).each(function(){t.offsets.push(this[0]),t.targets.push(this[1])})},process:function(){var e=this.$scrollElement.scrollTop()+this.options.offset,t=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,n=t-this.$scrollElement.height(),r=this.offsets,i=this.targets,s=this.activeTarget,o;if(e>=n)return s!=(o=i.last()[0])&&this.activate(o);for(o=r.length;o--;)s!=i[o]&&e>=r[o]&&(!r[o+1]||e<=r[o+1])&&this.activate(i[o])},activate:function(t){var n,r;this.activeTarget=t,e(this.selector).parent(".active").removeClass("active"),r=this.selector+'[data-target="'+t+'"],'+this.selector+'[href="'+t+'"]',n=e(r).parent("li").addClass("active"),n.parent(".dropdown-menu").length&&(n=n.closest("li.dropdown").addClass("active")),n.trigger("activate")}};var n=e.fn.scrollspy;e.fn.scrollspy=function(n){return this.each(function(){var r=e(this),i=r.data("scrollspy"),s=typeof n=="object"&&n;i||r.data("scrollspy",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.scrollspy.Constructor=t,e.fn.scrollspy.defaults={offset:10},e.fn.scrollspy.noConflict=function(){return e.fn.scrollspy=n,this},e(window).on("load",function(){e('[data-spy="scroll"]').each(function(){var t=e(this);t.scrollspy(t.data())})})}(window.jQuery),!function(e){"use strict";var t=function(t){this.element=e(t)};t.prototype={constructor:t,show:function(){var t=this.element,n=t.closest("ul:not(.dropdown-menu)"),r=t.attr("data-target"),i,s,o;r||(r=t.attr("href"),r=r&&r.replace(/.*(?=#[^\s]*$)/,""));if(t.parent("li").hasClass("active"))return;i=n.find(".active:last a")[0],o=e.Event("show",{relatedTarget:i}),t.trigger(o);if(o.isDefaultPrevented())return;s=e(r),this.activate(t.parent("li"),n),this.activate(s,s.parent(),function(){t.trigger({type:"shown",relatedTarget:i})})},activate:function(t,n,r){function o(){i.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),t.addClass("active"),s?(t[0].offsetWidth,t.addClass("in")):t.removeClass("fade"),t.parent(".dropdown-menu")&&t.closest("li.dropdown").addClass("active"),r&&r()}var i=n.find("> .active"),s=r&&e.support.transition&&i.hasClass("fade");s?i.one(e.support.transition.end,o):o(),i.removeClass("in")}};var n=e.fn.tab;e.fn.tab=function(n){return this.each(function(){var r=e(this),i=r.data("tab");i||r.data("tab",i=new t(this)),typeof n=="string"&&i[n]()})},e.fn.tab.Constructor=t,e.fn.tab.noConflict=function(){return e.fn.tab=n,this},e(document).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(t){t.preventDefault(),e(this).tab("show")})}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.options=e.extend({},e.fn.typeahead.defaults,n),this.matcher=this.options.matcher||this.matcher,this.sorter=this.options.sorter||this.sorter,this.highlighter=this.options.highlighter||this.highlighter,this.updater=this.options.updater||this.updater,this.source=this.options.source,this.$menu=e(this.options.menu),this.shown=!1,this.listen()};t.prototype={constructor:t,select:function(){var e=this.$menu.find(".active").attr("data-value");return this.$element.val(this.updater(e)).change(),this.hide()},updater:function(e){return e},show:function(){var t=e.extend({},this.$element.position(),{height:this.$element[0].offsetHeight});return this.$menu.insertAfter(this.$element).css({top:t.top+t.height,left:t.left}).show(),this.shown=!0,this},hide:function(){return this.$menu.hide(),this.shown=!1,this},lookup:function(t){var n;return this.query=this.$element.val(),!this.query||this.query.length<this.options.minLength?this.shown?this.hide():this:(n=e.isFunction(this.source)?this.source(this.query,e.proxy(this.process,this)):this.source,n?this.process(n):this)},process:function(t){var n=this;return t=e.grep(t,function(e){return n.matcher(e)}),t=this.sorter(t),t.length?this.render(t.slice(0,this.options.items)).show():this.shown?this.hide():this},matcher:function(e){return~e.toLowerCase().indexOf(this.query.toLowerCase())},sorter:function(e){var t=[],n=[],r=[],i;while(i=e.shift())i.toLowerCase().indexOf(this.query.toLowerCase())?~i.indexOf(this.query)?n.push(i):r.push(i):t.push(i);return t.concat(n,r)},highlighter:function(e){var t=this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&");return e.replace(new RegExp("("+t+")","ig"),function(e,t){return"<strong>"+t+"</strong>"})},render:function(t){var n=this;return t=e(t).map(function(t,r){return t=e(n.options.item).attr("data-value",r),t.find("a").html(n.highlighter(r)),t[0]}),t.first().addClass("active"),this.$menu.html(t),this},next:function(t){var n=this.$menu.find(".active").removeClass("active"),r=n.next();r.length||(r=e(this.$menu.find("li")[0])),r.addClass("active")},prev:function(e){var t=this.$menu.find(".active").removeClass("active"),n=t.prev();n.length||(n=this.$menu.find("li").last()),n.addClass("active")},listen:function(){this.$element.on("focus",e.proxy(this.focus,this)).on("blur",e.proxy(this.blur,this)).on("keypress",e.proxy(this.keypress,this)).on("keyup",e.proxy(this.keyup,this)),this.eventSupported("keydown")&&this.$element.on("keydown",e.proxy(this.keydown,this)),this.$menu.on("click",e.proxy(this.click,this)).on("mouseenter","li",e.proxy(this.mouseenter,this)).on("mouseleave","li",e.proxy(this.mouseleave,this))},eventSupported:function(e){var t=e in this.$element;return t||(this.$element.setAttribute(e,"return;"),t=typeof this.$element[e]=="function"),t},move:function(e){if(!this.shown)return;switch(e.keyCode){case 9:case 13:case 27:e.preventDefault();break;case 38:e.preventDefault(),this.prev();break;case 40:e.preventDefault(),this.next()}e.stopPropagation()},keydown:function(t){this.suppressKeyPressRepeat=~e.inArray(t.keyCode,[40,38,9,13,27]),this.move(t)},keypress:function(e){if(this.suppressKeyPressRepeat)return;this.move(e)},keyup:function(e){switch(e.keyCode){case 40:case 38:case 16:case 17:case 18:break;case 9:case 13:if(!this.shown)return;this.select();break;case 27:if(!this.shown)return;this.hide();break;default:this.lookup()}e.stopPropagation(),e.preventDefault()},focus:function(e){this.focused=!0},blur:function(e){this.focused=!1,!this.mousedover&&this.shown&&this.hide()},click:function(e){e.stopPropagation(),e.preventDefault(),this.select(),this.$element.focus()},mouseenter:function(t){this.mousedover=!0,this.$menu.find(".active").removeClass("active"),e(t.currentTarget).addClass("active")},mouseleave:function(e){this.mousedover=!1,!this.focused&&this.shown&&this.hide()}};var n=e.fn.typeahead;e.fn.typeahead=function(n){return this.each(function(){var r=e(this),i=r.data("typeahead"),s=typeof n=="object"&&n;i||r.data("typeahead",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.typeahead.defaults={source:[],items:8,menu:'<ul class="typeahead dropdown-menu"></ul>',item:'<li><a href="#"></a></li>',minLength:1},e.fn.typeahead.Constructor=t,e.fn.typeahead.noConflict=function(){return e.fn.typeahead=n,this},e(document).on("focus.typeahead.data-api",'[data-provide="typeahead"]',function(t){var n=e(this);if(n.data("typeahead"))return;n.typeahead(n.data())})}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.options=e.extend({},e.fn.affix.defaults,n),this.$window=e(window).on("scroll.affix.data-api",e.proxy(this.checkPosition,this)).on("click.affix.data-api",e.proxy(function(){setTimeout(e.proxy(this.checkPosition,this),1)},this)),this.$element=e(t),this.checkPosition()};t.prototype.checkPosition=function(){if(!this.$element.is(":visible"))return;var t=e(document).height(),n=this.$window.scrollTop(),r=this.$element.offset(),i=this.options.offset,s=i.bottom,o=i.top,u="affix affix-top affix-bottom",a;typeof i!="object"&&(s=o=i),typeof o=="function"&&(o=i.top()),typeof s=="function"&&(s=i.bottom()),a=this.unpin!=null&&n+this.unpin<=r.top?!1:s!=null&&r.top+this.$element.height()>=t-s?"bottom":o!=null&&n<=o?"top":!1;if(this.affixed===a)return;this.affixed=a,this.unpin=a=="bottom"?r.top-n:null,this.$element.removeClass(u).addClass("affix"+(a?"-"+a:""))};var n=e.fn.affix;e.fn.affix=function(n){return this.each(function(){var r=e(this),i=r.data("affix"),s=typeof n=="object"&&n;i||r.data("affix",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.affix.Constructor=t,e.fn.affix.defaults={offset:0},e.fn.affix.noConflict=function(){return e.fn.affix=n,this},e(window).on("load",function(){e('[data-spy="affix"]').each(function(){var t=e(this),n=t.data();n.offset=n.offset||{},n.offsetBottom&&(n.offset.bottom=n.offsetBottom),n.offsetTop&&(n.offset.top=n.offsetTop),t.affix(n)})})}(window.jQuery);
  </script>
  <script>
    $( document ).ready(function() {
      marked.setOptions({
        renderer: new marked.Renderer(),
        gfm: true,
        tables: true,
        breaks: false,
        pedantic: false,
        sanitize: false,
        smartLists: true,
        smartypants: false
      });

      var textFile = null;

      /// Function to be used to download a text json schema
      function makeTextFile(text) {

        var data = new Blob([text], {type: 'text/plain'});

        // If we are replacing a previously generated file we need to
        // manually revoke the object URL to avoid memory leaks.
        if (textFile !== null) {
          window.URL.revokeObjectURL(textFile);
        }

        textFile = window.URL.createObjectURL(data);

        var a = document.createElement("a");
        document.body.appendChild(a);
        a.style = "display: none";
        a.href = textFile;
        a.download = 'schema.txt';
        a.click();

        return textFile;
      };

      /// TODO: Implement resizing for expanding within iframe
      function callResize() {
        window.parent.postMessage('resize', "*");
      }

      function processMarked() {
        $(".marked").each(function() {
          $(this).html(marked($(this).html()));
        });
      }

      // Bootstrap Scrollspy
      $(this).scrollspy({ target: '#scrollingNav', offset: 18 });

      // Content-Scroll on Navigation click.
      $('.sidenav').find('a').on('click', function(e) {
          e.preventDefault();
          var id = $(this).attr('href');
          if ($(id).length > 0)
              $('html,body').animate({ scrollTop: parseInt($(id).offset().top) }, 400);
          window.location.hash = $(this).attr('href');
      });

      // Quickjump on Pageload to hash position.
      if(window.location.hash) {
          var id = window.location.hash;
          if ($(id).length > 0)
              $('html,body').animate({ scrollTop: parseInt($(id).offset().top) }, 0);
      }


      function initDynamic() {
        // tabs
        $('.nav-tabs-examples a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });


        $('.nav-tabs-examples').find('a:first').tab('show');

        // call scrollspy refresh method
        $(window).scrollspy('refresh');
      }

      initDynamic();

      // Pre- / Code-Format
      prettyPrint();

      //Convert elements with "marked" class to markdown
      processMarked();
    });
  </script>
  <style type="text/css">
  
  /*!
   * Bootstrap v2.3.2
   *
   * Copyright 2013 Twitter, Inc
   * Licensed under the Apache License v2.0
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Designed and built with all the love in the world by @mdo and @fat.
   */.clearfix{*zoom:1}.clearfix:before,.clearfix:after{display:table;line-height:0;content:""}.clearfix:after{clear:both}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}audio,canvas,video{display:inline-block;*display:inline;*zoom:1}audio:not([controls]){display:none}html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}a:hover,a:active{outline:0}sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline}sup{top:-0.5em}sub{bottom:-0.25em}img{width:auto\9;height:auto;max-width:100%;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic}#map_canvas img,.google-maps img{max-width:none}button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle}button,input{*overflow:visible;line-height:normal}button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}button,html input[type="button"],input[type="reset"],input[type="submit"]{cursor:pointer;-webkit-appearance:button}label,select,button,input[type="button"],input[type="reset"],input[type="submit"],input[type="radio"],input[type="checkbox"]{cursor:pointer}input[type="search"]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}input[type="search"]::-webkit-search-decoration,input[type="search"]::-webkit-search-cancel-button{-webkit-appearance:none}textarea{overflow:auto;vertical-align:top}@media print{*{color:#000!important;text-shadow:none!important;background:transparent!important;box-shadow:none!important}a,a:visited{text-decoration:underline}a[href]:after{content:" (" attr(href) ")"}abbr[title]:after{content:" (" attr(title) ")"}.ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after{content:""}pre,blockquote{border:1px solid #999;page-break-inside:avoid}thead{display:table-header-group}tr,img{page-break-inside:avoid}img{max-width:100%!important}@page{margin:.5cm}p,h2,h3{orphans:3;widows:3}h2,h3{page-break-after:avoid}}body{margin:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#333;background-color:#fff}a{color:#08c;text-decoration:none}a:hover,a:focus{color:#005580;text-decoration:underline}.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px}.row{margin-left:-20px;*zoom:1}.row:before,.row:after{display:table;line-height:0;content:""}.row:after{clear:both}[class*="span"]{float:left;min-height:1px;margin-left:20px}.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px}.span12{width:940px}.span11{width:860px}.span10{width:780px}.span9{width:700px}.span8{width:620px}.span7{width:540px}.span6{width:460px}.span5{width:380px}.span4{width:300px}.span3{width:220px}.span2{width:140px}.span1{width:60px}.offset12{margin-left:980px}.offset11{margin-left:900px}.offset10{margin-left:820px}.offset9{margin-left:740px}.offset8{margin-left:660px}.offset7{margin-left:580px}.offset6{margin-left:500px}.offset5{margin-left:420px}.offset4{margin-left:340px}.offset3{margin-left:260px}.offset2{margin-left:180px}.offset1{margin-left:100px}.row-fluid{width:100%;*zoom:1}.row-fluid:before,.row-fluid:after{display:table;line-height:0;content:""}.row-fluid:after{clear:both}.row-fluid [class*="span"]{display:block;float:left;width:100%;min-height:30px;margin-left:2.127659574468085%;*margin-left:2.074468085106383%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="span"]:first-child{margin-left:0}.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.127659574468085%}.row-fluid .span12{width:100%;*width:99.94680851063829%}.row-fluid .span11{width:91.48936170212765%;*width:91.43617021276594%}.row-fluid .span10{width:82.97872340425532%;*width:82.92553191489361%}.row-fluid .span9{width:74.46808510638297%;*width:74.41489361702126%}.row-fluid .span8{width:65.95744680851064%;*width:65.90425531914893%}.row-fluid .span7{width:57.44680851063829%;*width:57.39361702127659%}.row-fluid .span6{width:48.93617021276595%;*width:48.88297872340425%}.row-fluid .span5{width:40.42553191489362%;*width:40.37234042553192%}.row-fluid .span4{width:31.914893617021278%;*width:31.861702127659576%}.row-fluid .span3{width:23.404255319148934%;*width:23.351063829787233%}.row-fluid .span2{width:14.893617021276595%;*width:14.840425531914894%}.row-fluid .span1{width:6.382978723404255%;*width:6.329787234042553%}.row-fluid .offset12{margin-left:104.25531914893617%;*margin-left:104.14893617021275%}.row-fluid .offset12:first-child{margin-left:102.12765957446808%;*margin-left:102.02127659574467%}.row-fluid .offset11{margin-left:95.74468085106382%;*margin-left:95.6382978723404%}.row-fluid .offset11:first-child{margin-left:93.61702127659574%;*margin-left:93.51063829787232%}.row-fluid .offset10{margin-left:87.23404255319149%;*margin-left:87.12765957446807%}.row-fluid .offset10:first-child{margin-left:85.1063829787234%;*margin-left:84.99999999999999%}.row-fluid .offset9{margin-left:78.72340425531914%;*margin-left:78.61702127659572%}.row-fluid .offset9:first-child{margin-left:76.59574468085106%;*margin-left:76.48936170212764%}.row-fluid .offset8{margin-left:70.2127659574468%;*margin-left:70.10638297872339%}.row-fluid .offset8:first-child{margin-left:68.08510638297872%;*margin-left:67.9787234042553%}.row-fluid .offset7{margin-left:61.70212765957446%;*margin-left:61.59574468085106%}.row-fluid .offset7:first-child{margin-left:59.574468085106375%;*margin-left:59.46808510638297%}.row-fluid .offset6{margin-left:53.191489361702125%;*margin-left:53.085106382978715%}.row-fluid .offset6:first-child{margin-left:51.063829787234035%;*margin-left:50.95744680851063%}.row-fluid .offset5{margin-left:44.68085106382979%;*margin-left:44.57446808510638%}.row-fluid .offset5:first-child{margin-left:42.5531914893617%;*margin-left:42.4468085106383%}.row-fluid .offset4{margin-left:36.170212765957444%;*margin-left:36.06382978723405%}.row-fluid .offset4:first-child{margin-left:34.04255319148936%;*margin-left:33.93617021276596%}.row-fluid .offset3{margin-left:27.659574468085104%;*margin-left:27.5531914893617%}.row-fluid .offset3:first-child{margin-left:25.53191489361702%;*margin-left:25.425531914893618%}.row-fluid .offset2{margin-left:19.148936170212764%;*margin-left:19.04255319148936%}.row-fluid .offset2:first-child{margin-left:17.02127659574468%;*margin-left:16.914893617021278%}.row-fluid .offset1{margin-left:10.638297872340425%;*margin-left:10.53191489361702%}.row-fluid .offset1:first-child{margin-left:8.51063829787234%;*margin-left:8.404255319148938%}[class*="span"].hide,.row-fluid [class*="span"].hide{display:none}[class*="span"].pull-right,.row-fluid [class*="span"].pull-right{float:right}.container{margin-right:auto;margin-left:auto;*zoom:1}.container:before,.container:after{display:table;line-height:0;content:""}.container:after{clear:both}.container-fluid{padding-right:20px;padding-left:20px;*zoom:1}.container-fluid:before,.container-fluid:after{display:table;line-height:0;content:""}.container-fluid:after{clear:both}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px}small{font-size:85%}strong{font-weight:bold}em{font-style:italic}cite{font-style:normal}.muted{color:#999}a.muted:hover,a.muted:focus{color:#808080}.text-warning{color:#c09853}a.text-warning:hover,a.text-warning:focus{color:#a47e3c}.text-error{color:#b94a48}a.text-error:hover,a.text-error:focus{color:#953b39}.text-info{color:#3a87ad}a.text-info:hover,a.text-info:focus{color:#2d6987}.text-success{color:#468847}a.text-success:hover,a.text-success:focus{color:#356635}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}h1,h2,h3,h4,h5,h6{margin:10px 0;font-family:inherit;font-weight:bold;line-height:20px;color:inherit;text-rendering:optimizelegibility}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{font-weight:normal;line-height:1;color:#999}h1,h2,h3{line-height:40px}h1{font-size:38.5px}h2{font-size:31.5px}h3{font-size:24.5px}h4{font-size:17.5px}h5{font-size:14px}h6{font-size:11.9px}h1 small{font-size:24.5px}h2 small{font-size:17.5px}h3 small{font-size:14px}h4 small{font-size:14px}.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #eee}ul,ol{padding:0;margin:0 0 10px 25px}ul ul,ul ol,ol ol,ol ul{margin-bottom:0}li{line-height:20px}ul.unstyled,ol.unstyled{margin-left:0;list-style:none}ul.inline,ol.inline{margin-left:0;list-style:none}ul.inline>li,ol.inline>li{display:inline-block;*display:inline;padding-right:5px;padding-left:5px;*zoom:1}dl{margin-bottom:20px}dt,dd{line-height:20px}dt{font-weight:bold}dd{margin-left:10px}.dl-horizontal{*zoom:1}.dl-horizontal:before,.dl-horizontal:after{display:table;line-height:0;content:""}.dl-horizontal:after{clear:both}.dl-horizontal dt{float:left;width:160px;overflow:hidden;clear:left;text-align:right;text-overflow:ellipsis;white-space:nowrap}.dl-horizontal dd{margin-left:180px}hr{margin:20px 0;border:0;border-top:1px solid #eee;border-bottom:1px solid #fff}abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999}abbr.initialism{font-size:90%;text-transform:uppercase}blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #eee}blockquote p{margin-bottom:0;font-size:17.5px;font-weight:300;line-height:1.25}blockquote small{display:block;line-height:20px;color:#999}blockquote small:before{content:'\2014 \00A0'}blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #eee;border-left:0}blockquote.pull-right p,blockquote.pull-right small{text-align:right}blockquote.pull-right small:before{content:''}blockquote.pull-right small:after{content:'\00A0 \2014'}q:before,q:after,blockquote:before,blockquote:after{content:""}address{display:block;margin-bottom:20px;font-style:normal;line-height:20px}code,pre{padding:0 3px 2px;font-family:Monaco,Menlo,Consolas,"Courier New",monospace;font-size:12px;color:#333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}code{padding:2px 4px;color:#d14;white-space:nowrap;background-color:#f7f7f9;border:1px solid #e1e1e8}pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}pre.prettyprint{margin-bottom:20px}pre code{padding:0;color:inherit;white-space:pre;white-space:pre-wrap;background-color:transparent;border:0}.pre-scrollable{max-height:340px;overflow-y:scroll}form{margin:0 0 20px}fieldset{padding:0;margin:0;border:0}legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:40px;color:#333;border:0;border-bottom:1px solid #e5e5e5}legend small{font-size:15px;color:#999}label,input,button,select,textarea{font-size:14px;font-weight:normal;line-height:20px}input,button,select,textarea{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif}label{display:block;margin-bottom:5px}select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{display:inline-block;height:20px;padding:4px 6px;margin-bottom:10px;font-size:14px;line-height:20px;color:#555;vertical-align:middle;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}input,textarea,.uneditable-input{width:206px}textarea{height:auto}textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{background-color:#fff;border:1px solid #ccc;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-webkit-transition:border linear .2s,box-shadow linear .2s;-moz-transition:border linear .2s,box-shadow linear .2s;-o-transition:border linear .2s,box-shadow linear .2s;transition:border linear .2s,box-shadow linear .2s}textarea:focus,input[type="text"]:focus,input[type="password"]:focus,input[type="datetime"]:focus,input[type="datetime-local"]:focus,input[type="date"]:focus,input[type="month"]:focus,input[type="time"]:focus,input[type="week"]:focus,input[type="number"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="color"]:focus,.uneditable-input:focus{border-color:rgba(82,168,236,0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(82,168,236,0.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(82,168,236,0.6);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(82,168,236,0.6)}input[type="radio"],input[type="checkbox"]{margin:4px 0 0;margin-top:1px \9;*margin-top:0;line-height:normal}input[type="file"],input[type="image"],input[type="submit"],input[type="reset"],input[type="button"],input[type="radio"],input[type="checkbox"]{width:auto}select,input[type="file"]{height:30px;*margin-top:4px;line-height:30px}select{width:220px;background-color:#fff;border:1px solid #ccc}select[multiple],select[size]{height:auto}select:focus,input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.uneditable-input,.uneditable-textarea{color:#999;cursor:not-allowed;background-color:#fcfcfc;border-color:#ccc;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);box-shadow:inset 0 1px 2px rgba(0,0,0,0.025)}.uneditable-input{overflow:hidden;white-space:nowrap}.uneditable-textarea{width:auto;height:auto}input:-moz-placeholder,textarea:-moz-placeholder{color:#999}input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999}input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999}.radio,.checkbox{min-height:20px;padding-left:20px}.radio input[type="radio"],.checkbox input[type="checkbox"]{float:left;margin-left:-20px}.controls>.radio:first-child,.controls>.checkbox:first-child{padding-top:5px}.radio.inline,.checkbox.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle}.radio.inline+.radio.inline,.checkbox.inline+.checkbox.inline{margin-left:10px}.input-mini{width:60px}.input-small{width:90px}.input-medium{width:150px}.input-large{width:210px}.input-xlarge{width:270px}.input-xxlarge{width:530px}input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"]{float:none;margin-left:0}.input-append input[class*="span"],.input-append .uneditable-input[class*="span"],.input-prepend input[class*="span"],.input-prepend .uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"],.row-fluid .input-prepend [class*="span"],.row-fluid .input-append [class*="span"]{display:inline-block}input,textarea,.uneditable-input{margin-left:0}.controls-row [class*="span"]+[class*="span"]{margin-left:20px}input.span12,textarea.span12,.uneditable-input.span12{width:926px}input.span11,textarea.span11,.uneditable-input.span11{width:846px}input.span10,textarea.span10,.uneditable-input.span10{width:766px}input.span9,textarea.span9,.uneditable-input.span9{width:686px}input.span8,textarea.span8,.uneditable-input.span8{width:606px}input.span7,textarea.span7,.uneditable-input.span7{width:526px}input.span6,textarea.span6,.uneditable-input.span6{width:446px}input.span5,textarea.span5,.uneditable-input.span5{width:366px}input.span4,textarea.span4,.uneditable-input.span4{width:286px}input.span3,textarea.span3,.uneditable-input.span3{width:206px}input.span2,textarea.span2,.uneditable-input.span2{width:126px}input.span1,textarea.span1,.uneditable-input.span1{width:46px}.controls-row{*zoom:1}.controls-row:before,.controls-row:after{display:table;line-height:0;content:""}.controls-row:after{clear:both}.controls-row [class*="span"],.row-fluid .controls-row [class*="span"]{float:left}.controls-row .checkbox[class*="span"],.controls-row .radio[class*="span"]{padding-top:5px}input[disabled],select[disabled],textarea[disabled],input[readonly],select[readonly],textarea[readonly]{cursor:not-allowed;background-color:#eee}input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"][readonly],input[type="checkbox"][readonly]{background-color:transparent}.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline{color:#c09853}.control-group.warning .checkbox,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#c09853}.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#c09853;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#a47e3c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e}.control-group.warning .input-prepend .add-on,.control-group.warning .input-append .add-on{color:#c09853;background-color:#fcf8e3;border-color:#c09853}.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline{color:#b94a48}.control-group.error .checkbox,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#b94a48}.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#b94a48;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#953b39;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392}.control-group.error .input-prepend .add-on,.control-group.error .input-append .add-on{color:#b94a48;background-color:#f2dede;border-color:#b94a48}.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline{color:#468847}.control-group.success .checkbox,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#468847}.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#468847;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#356635;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b}.control-group.success .input-prepend .add-on,.control-group.success .input-append .add-on{color:#468847;background-color:#dff0d8;border-color:#468847}.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline{color:#3a87ad}.control-group.info .checkbox,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#3a87ad}.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#3a87ad;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#2d6987;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3}.control-group.info .input-prepend .add-on,.control-group.info .input-append .add-on{color:#3a87ad;background-color:#d9edf7;border-color:#3a87ad}input:focus:invalid,textarea:focus:invalid,select:focus:invalid{color:#b94a48;border-color:#ee5f5b}input:focus:invalid:focus,textarea:focus:invalid:focus,select:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7}.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5;*zoom:1}.form-actions:before,.form-actions:after{display:table;line-height:0;content:""}.form-actions:after{clear:both}.help-block,.help-inline{color:#595959}.help-block{display:block;margin-bottom:10px}.help-inline{display:inline-block;*display:inline;padding-left:5px;vertical-align:middle;*zoom:1}.input-append,.input-prepend{display:inline-block;margin-bottom:10px;font-size:0;white-space:nowrap;vertical-align:middle}.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input,.input-append .dropdown-menu,.input-prepend .dropdown-menu,.input-append .popover,.input-prepend .popover{font-size:14px}.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input{position:relative;margin-bottom:0;*margin-left:0;vertical-align:top;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-append input:focus,.input-prepend input:focus,.input-append select:focus,.input-prepend select:focus,.input-append .uneditable-input:focus,.input-prepend .uneditable-input:focus{z-index:2}.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #fff;background-color:#eee;border:1px solid #ccc}.input-append .add-on,.input-prepend .add-on,.input-append .btn,.input-prepend .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.input-append .active,.input-prepend .active{background-color:#a9dba9;border-color:#46a546}.input-prepend .add-on,.input-prepend .btn{margin-right:-1px}.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.input-append input,.input-append select,.input-append .uneditable-input{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child,.input-append .uneditable-input+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px}.input-append .add-on:last-child,.input-append .btn:last-child,.input-append .btn-group:last-child>.dropdown-toggle{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-prepend.input-append input,.input-prepend.input-append select,.input-prepend.input-append .uneditable-input{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn,.input-prepend.input-append .uneditable-input+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-prepend.input-append .btn-group:first-child{margin-left:0}input.search-query{padding-right:14px;padding-right:4px \9;padding-left:14px;padding-left:4px \9;margin-bottom:0;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}.form-search .input-append .search-query,.form-search .input-prepend .search-query{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.form-search .input-append .search-query{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px}.form-search .input-append .btn{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0}.form-search .input-prepend .search-query{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0}.form-search .input-prepend .btn{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px}.form-search input,.form-inline input,.form-horizontal input,.form-search textarea,.form-inline textarea,.form-horizontal textarea,.form-search select,.form-inline select,.form-horizontal select,.form-search .help-inline,.form-inline .help-inline,.form-horizontal .help-inline,.form-search .uneditable-input,.form-inline .uneditable-input,.form-horizontal .uneditable-input,.form-search .input-prepend,.form-inline .input-prepend,.form-horizontal .input-prepend,.form-search .input-append,.form-inline .input-append,.form-horizontal .input-append{display:inline-block;*display:inline;margin-bottom:0;vertical-align:middle;*zoom:1}.form-search .hide,.form-inline .hide,.form-horizontal .hide{display:none}.form-search label,.form-inline label,.form-search .btn-group,.form-inline .btn-group{display:inline-block}.form-search .input-append,.form-inline .input-append,.form-search .input-prepend,.form-inline .input-prepend{margin-bottom:0}.form-search .radio,.form-search .checkbox,.form-inline .radio,.form-inline .checkbox{padding-left:0;margin-bottom:0;vertical-align:middle}.form-search .radio input[type="radio"],.form-search .checkbox input[type="checkbox"],.form-inline .radio input[type="radio"],.form-inline .checkbox input[type="checkbox"]{float:left;margin-right:3px;margin-left:0}.control-group{margin-bottom:10px}legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate}.form-horizontal .control-group{margin-bottom:20px;*zoom:1}.form-horizontal .control-group:before,.form-horizontal .control-group:after{display:table;line-height:0;content:""}.form-horizontal .control-group:after{clear:both}.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right}.form-horizontal .controls{*display:inline-block;*padding-left:20px;margin-left:180px;*margin-left:0}.form-horizontal .controls:first-child{*padding-left:180px}.form-horizontal .help-block{margin-bottom:0}.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .input-append+.help-block{margin-top:10px}.form-horizontal .form-actions{padding-left:180px}table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0}.table{width:100%;margin-bottom:20px}.table th,.table td{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #ddd}.table th{font-weight:bold}.table thead th{vertical-align:bottom}.table caption+thead tr:first-child th,.table caption+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table thead:first-child tr:first-child th,.table thead:first-child tr:first-child td{border-top:0}.table tbody+tbody{border-top:2px solid #ddd}.table .table{background-color:#fff}.table-condensed th,.table-condensed td{padding:4px 5px}.table-bordered{border:1px solid #ddd;border-collapse:separate;*border-collapse:collapse;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.table-bordered th,.table-bordered td{border-left:1px solid #ddd}.table-bordered caption+thead tr:first-child th,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+tbody tr:first-child td,.table-bordered colgroup+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered thead:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child td{border-top:0}.table-bordered thead:first-child tr:first-child>th:first-child,.table-bordered tbody:first-child tr:first-child>td:first-child,.table-bordered tbody:first-child tr:first-child>th:first-child{-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-topleft:4px}.table-bordered thead:first-child tr:first-child>th:last-child,.table-bordered tbody:first-child tr:first-child>td:last-child,.table-bordered tbody:first-child tr:first-child>th:last-child{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-moz-border-radius-topright:4px}.table-bordered thead:last-child tr:last-child>th:first-child,.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tbody:last-child tr:last-child>th:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>th:first-child{-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px}.table-bordered thead:last-child tr:last-child>th:last-child,.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tbody:last-child tr:last-child>th:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>th:last-child{-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px}.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;border-bottom-left-radius:0;-moz-border-radius-bottomleft:0}.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;border-bottom-right-radius:0;-moz-border-radius-bottomright:0}.table-bordered caption+thead tr:first-child th:first-child,.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child{-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-topleft:4px}.table-bordered caption+thead tr:first-child th:last-child,.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-moz-border-radius-topright:4px}.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9}.table-hover tbody tr:hover>td,.table-hover tbody tr:hover>th{background-color:#f5f5f5}table td[class*="span"],table th[class*="span"],.row-fluid table td[class*="span"],.row-fluid table th[class*="span"]{display:table-cell;float:none;margin-left:0}.table td.span1,.table th.span1{float:none;width:44px;margin-left:0}.table td.span2,.table th.span2{float:none;width:124px;margin-left:0}.table td.span3,.table th.span3{float:none;width:204px;margin-left:0}.table td.span4,.table th.span4{float:none;width:284px;margin-left:0}.table td.span5,.table th.span5{float:none;width:364px;margin-left:0}.table td.span6,.table th.span6{float:none;width:444px;margin-left:0}.table td.span7,.table th.span7{float:none;width:524px;margin-left:0}.table td.span8,.table th.span8{float:none;width:604px;margin-left:0}.table td.span9,.table th.span9{float:none;width:684px;margin-left:0}.table td.span10,.table th.span10{float:none;width:764px;margin-left:0}.table td.span11,.table th.span11{float:none;width:844px;margin-left:0}.table td.span12,.table th.span12{float:none;width:924px;margin-left:0}.table tbody tr.success>td{background-color:#dff0d8}.table tbody tr.error>td{background-color:#f2dede}.table tbody tr.warning>td{background-color:#fcf8e3}.table tbody tr.info>td{background-color:#d9edf7}.table-hover tbody tr.success:hover>td{background-color:#d0e9c6}.table-hover tbody tr.error:hover>td{background-color:#ebcccc}.table-hover tbody tr.warning:hover>td{background-color:#faf2cc}.table-hover tbody tr.info:hover>td{background-color:#c4e3f3}[class^="icon-"],[class*=" icon-"]{display:inline-block;width:14px;height:14px;margin-top:1px;*margin-right:.3em;line-height:14px;vertical-align:text-top;background-image:url("../img/glyphicons-halflings.png");background-position:14px 14px;background-repeat:no-repeat}.icon-white,.nav-pills>.active>a>[class^="icon-"],.nav-pills>.active>a>[class*=" icon-"],.nav-list>.active>a>[class^="icon-"],.nav-list>.active>a>[class*=" icon-"],.navbar-inverse .nav>.active>a>[class^="icon-"],.navbar-inverse .nav>.active>a>[class*=" icon-"],.dropdown-menu>li>a:hover>[class^="icon-"],.dropdown-menu>li>a:focus>[class^="icon-"],.dropdown-menu>li>a:hover>[class*=" icon-"],.dropdown-menu>li>a:focus>[class*=" icon-"],.dropdown-menu>.active>a>[class^="icon-"],.dropdown-menu>.active>a>[class*=" icon-"],.dropdown-submenu:hover>a>[class^="icon-"],.dropdown-submenu:focus>a>[class^="icon-"],.dropdown-submenu:hover>a>[class*=" icon-"],.dropdown-submenu:focus>a>[class*=" icon-"]{background-image:url("../img/glyphicons-halflings-white.png")}.icon-glass{background-position:0 0}.icon-music{background-position:-24px 0}.icon-search{background-position:-48px 0}.icon-envelope{background-position:-72px 0}.icon-heart{background-position:-96px 0}.icon-star{background-position:-120px 0}.icon-star-empty{background-position:-144px 0}.icon-user{background-position:-168px 0}.icon-film{background-position:-192px 0}.icon-th-large{background-position:-216px 0}.icon-th{background-position:-240px 0}.icon-th-list{background-position:-264px 0}.icon-ok{background-position:-288px 0}.icon-remove{background-position:-312px 0}.icon-zoom-in{background-position:-336px 0}.icon-zoom-out{background-position:-360px 0}.icon-off{background-position:-384px 0}.icon-signal{background-position:-408px 0}.icon-cog{background-position:-432px 0}.icon-trash{background-position:-456px 0}.icon-home{background-position:0 -24px}.icon-file{background-position:-24px -24px}.icon-time{background-position:-48px -24px}.icon-road{background-position:-72px -24px}.icon-download-alt{background-position:-96px -24px}.icon-download{background-position:-120px -24px}.icon-upload{background-position:-144px -24px}.icon-inbox{background-position:-168px -24px}.icon-play-circle{background-position:-192px -24px}.icon-repeat{background-position:-216px -24px}.icon-refresh{background-position:-240px -24px}.icon-list-alt{background-position:-264px -24px}.icon-lock{background-position:-287px -24px}.icon-flag{background-position:-312px -24px}.icon-headphones{background-position:-336px -24px}.icon-volume-off{background-position:-360px -24px}.icon-volume-down{background-position:-384px -24px}.icon-volume-up{background-position:-408px -24px}.icon-qrcode{background-position:-432px -24px}.icon-barcode{background-position:-456px -24px}.icon-tag{background-position:0 -48px}.icon-tags{background-position:-25px -48px}.icon-book{background-position:-48px -48px}.icon-bookmark{background-position:-72px -48px}.icon-print{background-position:-96px -48px}.icon-camera{background-position:-120px -48px}.icon-font{background-position:-144px -48px}.icon-bold{background-position:-167px -48px}.icon-italic{background-position:-192px -48px}.icon-text-height{background-position:-216px -48px}.icon-text-width{background-position:-240px -48px}.icon-align-left{background-position:-264px -48px}.icon-align-center{background-position:-288px -48px}.icon-align-right{background-position:-312px -48px}.icon-align-justify{background-position:-336px -48px}.icon-list{background-position:-360px -48px}.icon-indent-left{background-position:-384px -48px}.icon-indent-right{background-position:-408px -48px}.icon-facetime-video{background-position:-432px -48px}.icon-picture{background-position:-456px -48px}.icon-pencil{background-position:0 -72px}.icon-map-marker{background-position:-24px -72px}.icon-adjust{background-position:-48px -72px}.icon-tint{background-position:-72px -72px}.icon-edit{background-position:-96px -72px}.icon-share{background-position:-120px -72px}.icon-check{background-position:-144px -72px}.icon-move{background-position:-168px -72px}.icon-step-backward{background-position:-192px -72px}.icon-fast-backward{background-position:-216px -72px}.icon-backward{background-position:-240px -72px}.icon-play{background-position:-264px -72px}.icon-pause{background-position:-288px -72px}.icon-stop{background-position:-312px -72px}.icon-forward{background-position:-336px -72px}.icon-fast-forward{background-position:-360px -72px}.icon-step-forward{background-position:-384px -72px}.icon-eject{background-position:-408px -72px}.icon-chevron-left{background-position:-432px -72px}.icon-chevron-right{background-position:-456px -72px}.icon-plus-sign{background-position:0 -96px}.icon-minus-sign{background-position:-24px -96px}.icon-remove-sign{background-position:-48px -96px}.icon-ok-sign{background-position:-72px -96px}.icon-question-sign{background-position:-96px -96px}.icon-info-sign{background-position:-120px -96px}.icon-screenshot{background-position:-144px -96px}.icon-remove-circle{background-position:-168px -96px}.icon-ok-circle{background-position:-192px -96px}.icon-ban-circle{background-position:-216px -96px}.icon-arrow-left{background-position:-240px -96px}.icon-arrow-right{background-position:-264px -96px}.icon-arrow-up{background-position:-289px -96px}.icon-arrow-down{background-position:-312px -96px}.icon-share-alt{background-position:-336px -96px}.icon-resize-full{background-position:-360px -96px}.icon-resize-small{background-position:-384px -96px}.icon-plus{background-position:-408px -96px}.icon-minus{background-position:-433px -96px}.icon-asterisk{background-position:-456px -96px}.icon-exclamation-sign{background-position:0 -120px}.icon-gift{background-position:-24px -120px}.icon-leaf{background-position:-48px -120px}.icon-fire{background-position:-72px -120px}.icon-eye-open{background-position:-96px -120px}.icon-eye-close{background-position:-120px -120px}.icon-warning-sign{background-position:-144px -120px}.icon-plane{background-position:-168px -120px}.icon-calendar{background-position:-192px -120px}.icon-random{width:16px;background-position:-216px -120px}.icon-comment{background-position:-240px -120px}.icon-magnet{background-position:-264px -120px}.icon-chevron-up{background-position:-288px -120px}.icon-chevron-down{background-position:-313px -119px}.icon-retweet{background-position:-336px -120px}.icon-shopping-cart{background-position:-360px -120px}.icon-folder-close{width:16px;background-position:-384px -120px}.icon-folder-open{width:16px;background-position:-408px -120px}.icon-resize-vertical{background-position:-432px -119px}.icon-resize-horizontal{background-position:-456px -118px}.icon-hdd{background-position:0 -144px}.icon-bullhorn{background-position:-24px -144px}.icon-bell{background-position:-48px -144px}.icon-certificate{background-position:-72px -144px}.icon-thumbs-up{background-position:-96px -144px}.icon-thumbs-down{background-position:-120px -144px}.icon-hand-right{background-position:-144px -144px}.icon-hand-left{background-position:-168px -144px}.icon-hand-up{background-position:-192px -144px}.icon-hand-down{background-position:-216px -144px}.icon-circle-arrow-right{background-position:-240px -144px}.icon-circle-arrow-left{background-position:-264px -144px}.icon-circle-arrow-up{background-position:-288px -144px}.icon-circle-arrow-down{background-position:-312px -144px}.icon-globe{background-position:-336px -144px}.icon-wrench{background-position:-360px -144px}.icon-tasks{background-position:-384px -144px}.icon-filter{background-position:-408px -144px}.icon-briefcase{background-position:-432px -144px}.icon-fullscreen{background-position:-456px -144px}.dropup,.dropdown{position:relative}.dropdown-toggle{*margin-bottom:-3px}.dropdown-toggle:active,.open .dropdown-toggle{outline:0}.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000;border-right:4px solid transparent;border-left:4px solid transparent;content:""}.dropdown .caret{margin-top:8px;margin-left:2px}.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);*border-right-width:2px;*border-bottom-width:2px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box}.dropdown-menu.pull-right{right:0;left:auto}.dropdown-menu .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:normal;line-height:20px;color:#333;white-space:nowrap}.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-submenu:hover>a,.dropdown-submenu:focus>a{color:#fff;text-decoration:none;background-color:#0081c2;background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc',endColorstr='#ff0077b3',GradientType=0)}.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus{color:#fff;text-decoration:none;background-color:#0081c2;background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);background-repeat:repeat-x;outline:0;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc',endColorstr='#ff0077b3',GradientType=0)}.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{color:#999}.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{text-decoration:none;cursor:default;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.open{*z-index:1000}.open>.dropdown-menu{display:block}.dropdown-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:990}.pull-right>.dropdown-menu{right:0;left:auto}.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000;content:""}.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px}.dropdown-submenu{position:relative}.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px}.dropdown-submenu:hover>.dropdown-menu{display:block}.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0}.dropdown-submenu>a:after{display:block;float:right;width:0;height:0;margin-top:5px;margin-right:-10px;border-color:transparent;border-left-color:#ccc;border-style:solid;border-width:5px 0 5px 5px;content:" "}.dropdown-submenu:hover>a:after{border-left-color:#fff}.dropdown-submenu.pull-left{float:none}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}.dropdown .dropdown-menu .nav-header{padding-right:20px;padding-left:20px}.typeahead{z-index:1051;margin-top:2px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);box-shadow:inset 0 1px 1px rgba(0,0,0,0.05)}.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,0.15)}.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.well-small{padding:9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.fade{opacity:0;-webkit-transition:opacity .15s linear;-moz-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}.fade.in{opacity:1}.collapse{position:relative;height:0;overflow:hidden;-webkit-transition:height .35s ease;-moz-transition:height .35s ease;-o-transition:height .35s ease;transition:height .35s ease}.collapse.in{height:auto}.close{float:right;font-size:20px;font-weight:bold;line-height:20px;color:#000;text-shadow:0 1px 0 #fff;opacity:.2;filter:alpha(opacity=20)}.close:hover,.close:focus{color:#000;text-decoration:none;cursor:pointer;opacity:.4;filter:alpha(opacity=40)}button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none}.btn{display:inline-block;*display:inline;padding:4px 12px;margin-bottom:0;*margin-left:.3em;font-size:14px;line-height:20px;color:#333;text-align:center;text-shadow:0 1px 1px rgba(255,255,255,0.75);vertical-align:middle;cursor:pointer;background-color:#f5f5f5;*background-color:#e6e6e6;background-image:-moz-linear-gradient(top,#fff,#e6e6e6);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));background-image:-webkit-linear-gradient(top,#fff,#e6e6e6);background-image:-o-linear-gradient(top,#fff,#e6e6e6);background-image:linear-gradient(to bottom,#fff,#e6e6e6);background-repeat:repeat-x;border:1px solid #ccc;*border:0;border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);border-bottom-color:#b3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);*zoom:1;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);box-shadow:inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05)}.btn:hover,.btn:focus,.btn:active,.btn.active,.btn.disabled,.btn[disabled]{color:#333;background-color:#e6e6e6;*background-color:#d9d9d9}.btn:active,.btn.active{background-color:#ccc \9}.btn:first-child{*margin-left:0}.btn:hover,.btn:focus{color:#333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position .1s linear;-moz-transition:background-position .1s linear;-o-transition:background-position .1s linear;transition:background-position .1s linear}.btn:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);box-shadow:inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05)}.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.btn-large [class^="icon-"],.btn-large [class*=" icon-"]{margin-top:4px}.btn-small{padding:2px 10px;font-size:11.9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.btn-small [class^="icon-"],.btn-small [class*=" icon-"]{margin-top:0}.btn-mini [class^="icon-"],.btn-mini [class*=" icon-"]{margin-top:-1px}.btn-mini{padding:0 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.btn-block{display:block;width:100%;padding-right:0;padding-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.btn-block+.btn-block{margin-top:5px}input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%}.btn-primary.active,.btn-warning.active,.btn-danger.active,.btn-success.active,.btn-info.active,.btn-inverse.active{color:rgba(255,255,255,0.75)}.btn-primary{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#006dcc;*background-color:#04c;background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(to bottom,#08c,#04c);background-repeat:repeat-x;border-color:#04c #04c #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc',endColorstr='#ff0044cc',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-primary:hover,.btn-primary:focus,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#fff;background-color:#04c;*background-color:#003bb3}.btn-primary:active,.btn-primary.active{background-color:#039 \9}.btn-warning{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#faa732;*background-color:#f89406;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);background-repeat:repeat-x;border-color:#f89406 #f89406 #ad6704;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450',endColorstr='#fff89406',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-warning:hover,.btn-warning:focus,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#fff;background-color:#f89406;*background-color:#df8505}.btn-warning:active,.btn-warning.active{background-color:#c67605 \9}.btn-danger{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#da4f49;*background-color:#bd362f;background-image:-moz-linear-gradient(top,#ee5f5b,#bd362f);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#bd362f));background-image:-webkit-linear-gradient(top,#ee5f5b,#bd362f);background-image:-o-linear-gradient(top,#ee5f5b,#bd362f);background-image:linear-gradient(to bottom,#ee5f5b,#bd362f);background-repeat:repeat-x;border-color:#bd362f #bd362f #802420;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b',endColorstr='#ffbd362f',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-danger:hover,.btn-danger:focus,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#fff;background-color:#bd362f;*background-color:#a9302a}.btn-danger:active,.btn-danger.active{background-color:#942a25 \9}.btn-success{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#5bb75b;*background-color:#51a351;background-image:-moz-linear-gradient(top,#62c462,#51a351);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#51a351));background-image:-webkit-linear-gradient(top,#62c462,#51a351);background-image:-o-linear-gradient(top,#62c462,#51a351);background-image:linear-gradient(to bottom,#62c462,#51a351);background-repeat:repeat-x;border-color:#51a351 #51a351 #387038;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462',endColorstr='#ff51a351',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-success:hover,.btn-success:focus,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#fff;background-color:#51a351;*background-color:#499249}.btn-success:active,.btn-success.active{background-color:#408140 \9}.btn-info{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#49afcd;*background-color:#2f96b4;background-image:-moz-linear-gradient(top,#5bc0de,#2f96b4);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#2f96b4));background-image:-webkit-linear-gradient(top,#5bc0de,#2f96b4);background-image:-o-linear-gradient(top,#5bc0de,#2f96b4);background-image:linear-gradient(to bottom,#5bc0de,#2f96b4);background-repeat:repeat-x;border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de',endColorstr='#ff2f96b4',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-info:hover,.btn-info:focus,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#fff;background-color:#2f96b4;*background-color:#2a85a0}.btn-info:active,.btn-info.active{background-color:#24748c \9}.btn-inverse{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#363636;*background-color:#222;background-image:-moz-linear-gradient(top,#444,#222);background-image:-webkit-gradient(linear,0 0,0 100%,from(#444),to(#222));background-image:-webkit-linear-gradient(top,#444,#222);background-image:-o-linear-gradient(top,#444,#222);background-image:linear-gradient(to bottom,#444,#222);background-repeat:repeat-x;border-color:#222 #222 #000;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444',endColorstr='#ff222222',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-inverse:hover,.btn-inverse:focus,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#fff;background-color:#222;*background-color:#151515}.btn-inverse:active,.btn-inverse.active{background-color:#080808 \9}button.btn,input[type="submit"].btn{*padding-top:3px;*padding-bottom:3px}button.btn::-moz-focus-inner,input[type="submit"].btn::-moz-focus-inner{padding:0;border:0}button.btn.btn-large,input[type="submit"].btn.btn-large{*padding-top:7px;*padding-bottom:7px}button.btn.btn-small,input[type="submit"].btn.btn-small{*padding-top:3px;*padding-bottom:3px}button.btn.btn-mini,input[type="submit"].btn.btn-mini{*padding-top:1px;*padding-bottom:1px}.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.btn-link{color:#08c;cursor:pointer;border-color:transparent;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.btn-link:hover,.btn-link:focus{color:#005580;text-decoration:underline;background-color:transparent}.btn-link[disabled]:hover,.btn-link[disabled]:focus{color:#333;text-decoration:none}.btn-group{position:relative;display:inline-block;*display:inline;*margin-left:.3em;font-size:0;white-space:nowrap;vertical-align:middle;*zoom:1}.btn-group:first-child{*margin-left:0}.btn-group+.btn-group{margin-left:5px}.btn-toolbar{margin-top:10px;margin-bottom:10px;font-size:0}.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group{margin-left:5px}.btn-group>.btn{position:relative;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.btn-group>.btn+.btn{margin-left:-1px}.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px}.btn-group>.btn-mini{font-size:10.5px}.btn-group>.btn-small{font-size:11.9px}.btn-group>.btn-large{font-size:17.5px}.btn-group>.btn:first-child{margin-left:0;-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-bottomleft:4px;-moz-border-radius-topleft:4px}.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-moz-border-radius-topright:4px;-moz-border-radius-bottomright:4px}.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-bottom-left-radius:6px;border-bottom-left-radius:6px;-webkit-border-top-left-radius:6px;border-top-left-radius:6px;-moz-border-radius-bottomleft:6px;-moz-border-radius-topleft:6px}.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;border-bottom-right-radius:6px;-moz-border-radius-topright:6px;-moz-border-radius-bottomright:6px}.btn-group>.btn:hover,.btn-group>.btn:focus,.btn-group>.btn:active,.btn-group>.btn.active{z-index:2}.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}.btn-group>.btn+.dropdown-toggle{*padding-top:5px;padding-right:8px;*padding-bottom:5px;padding-left:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,0.125),inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,0.125),inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);box-shadow:inset 1px 0 0 rgba(255,255,255,0.125),inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05)}.btn-group>.btn-mini+.dropdown-toggle{*padding-top:2px;padding-right:5px;*padding-bottom:2px;padding-left:5px}.btn-group>.btn-small+.dropdown-toggle{*padding-top:5px;*padding-bottom:4px}.btn-group>.btn-large+.dropdown-toggle{*padding-top:7px;padding-right:12px;*padding-bottom:7px;padding-left:12px}.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);box-shadow:inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05)}.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6}.btn-group.open .btn-primary.dropdown-toggle{background-color:#04c}.btn-group.open .btn-warning.dropdown-toggle{background-color:#f89406}.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f}.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351}.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4}.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222}.btn .caret{margin-top:8px;margin-left:0}.btn-large .caret{margin-top:6px}.btn-large .caret{border-top-width:5px;border-right-width:5px;border-left-width:5px}.btn-mini .caret,.btn-small .caret{margin-top:8px}.dropup .btn-large .caret{border-bottom-width:5px}.btn-primary .caret,.btn-warning .caret,.btn-danger .caret,.btn-info .caret,.btn-success .caret,.btn-inverse .caret{border-top-color:#fff;border-bottom-color:#fff}.btn-group-vertical{display:inline-block;*display:inline;*zoom:1}.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.btn-group-vertical>.btn+.btn{margin-top:-1px;margin-left:0}.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0}.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}.alert{padding:8px 35px 8px 14px;margin-bottom:20px;text-shadow:0 1px 0 rgba(255,255,255,0.5);background-color:#fcf8e3;border:1px solid #fbeed5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.alert,.alert h4{color:#c09853}.alert h4{margin:0}.alert .close{position:relative;top:-2px;right:-21px;line-height:20px}.alert-success{color:#468847;background-color:#dff0d8;border-color:#d6e9c6}.alert-success h4{color:#468847}.alert-danger,.alert-error{color:#b94a48;background-color:#f2dede;border-color:#eed3d7}.alert-danger h4,.alert-error h4{color:#b94a48}.alert-info{color:#3a87ad;background-color:#d9edf7;border-color:#bce8f1}.alert-info h4{color:#3a87ad}.alert-block{padding-top:14px;padding-bottom:14px}.alert-block>p,.alert-block>ul{margin-bottom:0}.alert-block p+p{margin-top:5px}.nav{margin-bottom:20px;margin-left:0;list-style:none}.nav>li>a{display:block}.nav>li>a:hover,.nav>li>a:focus{text-decoration:none;background-color:#eee}.nav>li>a>img{max-width:none}.nav>.pull-right{float:right}.nav-header{display:block;padding:3px 15px;font-size:11px;font-weight:bold;line-height:20px;color:#999;text-shadow:0 1px 0 rgba(255,255,255,0.5);text-transform:uppercase}.nav li+.nav-header{margin-top:9px}.nav-list{padding-right:15px;padding-left:15px;margin-bottom:0}.nav-list>li>a,.nav-list .nav-header{margin-right:-15px;margin-left:-15px;text-shadow:0 1px 0 rgba(255,255,255,0.5)}.nav-list>li>a{padding:3px 15px}.nav-list>.active>a,.nav-list>.active>a:hover,.nav-list>.active>a:focus{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.2);background-color:#08c}.nav-list [class^="icon-"],.nav-list [class*=" icon-"]{margin-right:2px}.nav-list .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}.nav-tabs,.nav-pills{*zoom:1}.nav-tabs:before,.nav-pills:before,.nav-tabs:after,.nav-pills:after{display:table;line-height:0;content:""}.nav-tabs:after,.nav-pills:after{clear:both}.nav-tabs>li,.nav-pills>li{float:left}.nav-tabs>li>a,.nav-pills>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px}.nav-tabs{border-bottom:1px solid #ddd}.nav-tabs>li{margin-bottom:-1px}.nav-tabs>li>a{padding-top:8px;padding-bottom:8px;line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}.nav-tabs>li>a:hover,.nav-tabs>li>a:focus{border-color:#eee #eee #ddd}.nav-tabs>.active>a,.nav-tabs>.active>a:hover,.nav-tabs>.active>a:focus{color:#555;cursor:default;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent}.nav-pills>li>a{padding-top:8px;padding-bottom:8px;margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px}.nav-pills>.active>a,.nav-pills>.active>a:hover,.nav-pills>.active>a:focus{color:#fff;background-color:#08c}.nav-stacked>li{float:none}.nav-stacked>li>a{margin-right:0}.nav-tabs.nav-stacked{border-bottom:0}.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-topright:4px;-moz-border-radius-topleft:4px}.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-moz-border-radius-bottomright:4px;-moz-border-radius-bottomleft:4px}.nav-tabs.nav-stacked>li>a:hover,.nav-tabs.nav-stacked>li>a:focus{z-index:2;border-color:#ddd}.nav-pills.nav-stacked>li>a{margin-bottom:3px}.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px}.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.nav .dropdown-toggle .caret{margin-top:6px;border-top-color:#08c;border-bottom-color:#08c}.nav .dropdown-toggle:hover .caret,.nav .dropdown-toggle:focus .caret{border-top-color:#005580;border-bottom-color:#005580}.nav-tabs .dropdown-toggle .caret{margin-top:8px}.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}.nav>.dropdown.active>a:hover,.nav>.dropdown.active>a:focus{cursor:pointer}.nav-tabs .open .dropdown-toggle,.nav-pills .open .dropdown-toggle,.nav>li.dropdown.open.active>a:hover,.nav>li.dropdown.open.active>a:focus{color:#fff;background-color:#999;border-color:#999}.nav li.dropdown.open .caret,.nav li.dropdown.open.active .caret,.nav li.dropdown.open a:hover .caret,.nav li.dropdown.open a:focus .caret{border-top-color:#fff;border-bottom-color:#fff;opacity:1;filter:alpha(opacity=100)}.tabs-stacked .open>a:hover,.tabs-stacked .open>a:focus{border-color:#999}.tabbable{*zoom:1}.tabbable:before,.tabbable:after{display:table;line-height:0;content:""}.tabbable:after{clear:both}.tab-content{overflow:auto}.tabs-below>.nav-tabs,.tabs-right>.nav-tabs,.tabs-left>.nav-tabs{border-bottom:0}.tab-content>.tab-pane,.pill-content>.pill-pane{display:none}.tab-content>.active,.pill-content>.active{display:block}.tabs-below>.nav-tabs{border-top:1px solid #ddd}.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0}.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}.tabs-below>.nav-tabs>li>a:hover,.tabs-below>.nav-tabs>li>a:focus{border-top-color:#ddd;border-bottom-color:transparent}.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:hover,.tabs-below>.nav-tabs>.active>a:focus{border-color:transparent #ddd #ddd #ddd}.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none}.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px}.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd}.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.tabs-left>.nav-tabs>li>a:hover,.tabs-left>.nav-tabs>li>a:focus{border-color:#eee #ddd #eee #eee}.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:hover,.tabs-left>.nav-tabs .active>a:focus{border-color:#ddd transparent #ddd #ddd;*border-right-color:#fff}.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd}.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.tabs-right>.nav-tabs>li>a:hover,.tabs-right>.nav-tabs>li>a:focus{border-color:#eee #eee #eee #ddd}.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:hover,.tabs-right>.nav-tabs .active>a:focus{border-color:#ddd #ddd #ddd transparent;*border-left-color:#fff}.nav>.disabled>a{color:#999}.nav>.disabled>a:hover,.nav>.disabled>a:focus{text-decoration:none;cursor:default;background-color:transparent}.navbar{*position:relative;*z-index:2;margin-bottom:20px;overflow:visible}.navbar-inner{min-height:40px;padding-right:20px;padding-left:20px;background-color:#fafafa;background-image:-moz-linear-gradient(top,#fff,#f2f2f2);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#f2f2f2));background-image:-webkit-linear-gradient(top,#fff,#f2f2f2);background-image:-o-linear-gradient(top,#fff,#f2f2f2);background-image:linear-gradient(to bottom,#fff,#f2f2f2);background-repeat:repeat-x;border:1px solid #d4d4d4;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#fff2f2f2',GradientType=0);*zoom:1;-webkit-box-shadow:0 1px 4px rgba(0,0,0,0.065);-moz-box-shadow:0 1px 4px rgba(0,0,0,0.065);box-shadow:0 1px 4px rgba(0,0,0,0.065)}.navbar-inner:before,.navbar-inner:after{display:table;line-height:0;content:""}.navbar-inner:after{clear:both}.navbar .container{width:auto}.nav-collapse.collapse{height:auto;overflow:visible}.navbar .brand{display:block;float:left;padding:10px 20px 10px;margin-left:-20px;font-size:20px;font-weight:200;color:#777;text-shadow:0 1px 0 #fff}.navbar .brand:hover,.navbar .brand:focus{text-decoration:none}.navbar-text{margin-bottom:0;line-height:40px;color:#777}.navbar-link{color:#777}.navbar-link:hover,.navbar-link:focus{color:#333}.navbar .divider-vertical{height:40px;margin:0 9px;border-right:1px solid #fff;border-left:1px solid #f2f2f2}.navbar .btn,.navbar .btn-group{margin-top:5px}.navbar .btn-group .btn,.navbar .input-prepend .btn,.navbar .input-append .btn,.navbar .input-prepend .btn-group,.navbar .input-append .btn-group{margin-top:0}.navbar-form{margin-bottom:0;*zoom:1}.navbar-form:before,.navbar-form:after{display:table;line-height:0;content:""}.navbar-form:after{clear:both}.navbar-form input,.navbar-form select,.navbar-form .radio,.navbar-form .checkbox{margin-top:5px}.navbar-form input,.navbar-form select,.navbar-form .btn{display:inline-block;margin-bottom:0}.navbar-form input[type="image"],.navbar-form input[type="checkbox"],.navbar-form input[type="radio"]{margin-top:3px}.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap}.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0}.navbar-search{position:relative;float:left;margin-top:5px;margin-bottom:0}.navbar-search .search-query{padding:4px 14px;margin-bottom:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:13px;font-weight:normal;line-height:1;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}.navbar-static-top{position:static;margin-bottom:0}.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0}.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px}.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0}.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding-right:0;padding-left:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px}.navbar-fixed-top{top:0}.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{-webkit-box-shadow:0 1px 10px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,0.1);box-shadow:0 1px 10px rgba(0,0,0,0.1)}.navbar-fixed-bottom{bottom:0}.navbar-fixed-bottom .navbar-inner{-webkit-box-shadow:0 -1px 10px rgba(0,0,0,0.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,0.1);box-shadow:0 -1px 10px rgba(0,0,0,0.1)}.navbar .nav{position:relative;left:0;display:block;float:left;margin:0 10px 0 0}.navbar .nav.pull-right{float:right;margin-right:0}.navbar .nav>li{float:left}.navbar .nav>li>a{float:none;padding:10px 15px 10px;color:#777;text-decoration:none;text-shadow:0 1px 0 #fff}.navbar .nav .dropdown-toggle .caret{margin-top:8px}.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{color:#333;text-decoration:none;background-color:transparent}.navbar .nav>.active>a,.navbar .nav>.active>a:hover,.navbar .nav>.active>a:focus{color:#555;text-decoration:none;background-color:#e5e5e5;-webkit-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);-moz-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);box-shadow:inset 0 3px 8px rgba(0,0,0,0.125)}.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-right:5px;margin-left:5px;color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#ededed;*background-color:#e5e5e5;background-image:-moz-linear-gradient(top,#f2f2f2,#e5e5e5);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f2f2f2),to(#e5e5e5));background-image:-webkit-linear-gradient(top,#f2f2f2,#e5e5e5);background-image:-o-linear-gradient(top,#f2f2f2,#e5e5e5);background-image:linear-gradient(to bottom,#f2f2f2,#e5e5e5);background-repeat:repeat-x;border-color:#e5e5e5 #e5e5e5 #bfbfbf;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2f2f2',endColorstr='#ffe5e5e5',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.075);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.075);box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.075)}.navbar .btn-navbar:hover,.navbar .btn-navbar:focus,.navbar .btn-navbar:active,.navbar .btn-navbar.active,.navbar .btn-navbar.disabled,.navbar .btn-navbar[disabled]{color:#fff;background-color:#e5e5e5;*background-color:#d9d9d9}.navbar .btn-navbar:active,.navbar .btn-navbar.active{background-color:#ccc \9}.navbar .btn-navbar .icon-bar{display:block;width:18px;height:2px;background-color:#f5f5f5;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px;-webkit-box-shadow:0 1px 0 rgba(0,0,0,0.25);-moz-box-shadow:0 1px 0 rgba(0,0,0,0.25);box-shadow:0 1px 0 rgba(0,0,0,0.25)}.btn-navbar .icon-bar+.icon-bar{margin-top:3px}.navbar .nav>li>.dropdown-menu:before{position:absolute;top:-7px;left:9px;display:inline-block;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-left:7px solid transparent;border-bottom-color:rgba(0,0,0,0.2);content:''}.navbar .nav>li>.dropdown-menu:after{position:absolute;top:-6px;left:10px;display:inline-block;border-right:6px solid transparent;border-bottom:6px solid #fff;border-left:6px solid transparent;content:''}.navbar-fixed-bottom .nav>li>.dropdown-menu:before{top:auto;bottom:-7px;border-top:7px solid #ccc;border-bottom:0;border-top-color:rgba(0,0,0,0.2)}.navbar-fixed-bottom .nav>li>.dropdown-menu:after{top:auto;bottom:-6px;border-top:6px solid #fff;border-bottom:0}.navbar .nav li.dropdown>a:hover .caret,.navbar .nav li.dropdown>a:focus .caret{border-top-color:#333;border-bottom-color:#333}.navbar .nav li.dropdown.open>.dropdown-toggle,.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle{color:#555;background-color:#e5e5e5}.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#777;border-bottom-color:#777}.navbar .nav li.dropdown.open>.dropdown-toggle .caret,.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}.navbar .pull-right>li>.dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right{right:0;left:auto}.navbar .pull-right>li>.dropdown-menu:before,.navbar .nav>li>.dropdown-menu.pull-right:before{right:12px;left:auto}.navbar .pull-right>li>.dropdown-menu:after,.navbar .nav>li>.dropdown-menu.pull-right:after{right:13px;left:auto}.navbar .pull-right>li>.dropdown-menu .dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu{right:100%;left:auto;margin-right:-1px;margin-left:0;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}.navbar-inverse .navbar-inner{background-color:#1b1b1b;background-image:-moz-linear-gradient(top,#222,#111);background-image:-webkit-gradient(linear,0 0,0 100%,from(#222),to(#111));background-image:-webkit-linear-gradient(top,#222,#111);background-image:-o-linear-gradient(top,#222,#111);background-image:linear-gradient(to bottom,#222,#111);background-repeat:repeat-x;border-color:#252525;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222',endColorstr='#ff111111',GradientType=0)}.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#999;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:hover,.navbar-inverse .brand:focus,.navbar-inverse .nav>li>a:focus{color:#fff}.navbar-inverse .brand{color:#999}.navbar-inverse .navbar-text{color:#999}.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{color:#fff;background-color:transparent}.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:hover,.navbar-inverse .nav .active>a:focus{color:#fff;background-color:#111}.navbar-inverse .navbar-link{color:#999}.navbar-inverse .navbar-link:hover,.navbar-inverse .navbar-link:focus{color:#fff}.navbar-inverse .divider-vertical{border-right-color:#222;border-left-color:#111}.navbar-inverse .nav li.dropdown.open>.dropdown-toggle,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle{color:#fff;background-color:#111}.navbar-inverse .nav li.dropdown>a:hover .caret,.navbar-inverse .nav li.dropdown>a:focus .caret{border-top-color:#fff;border-bottom-color:#fff}.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#999;border-bottom-color:#999}.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}.navbar-inverse .navbar-search .search-query{color:#fff;background-color:#515151;border-color:#111;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1),0 1px 0 rgba(255,255,255,0.15);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1),0 1px 0 rgba(255,255,255,0.15);box-shadow:inset 0 1px 2px rgba(0,0,0,0.1),0 1px 0 rgba(255,255,255,0.15);-webkit-transition:none;-moz-transition:none;-o-transition:none;transition:none}.navbar-inverse .navbar-search .search-query:-moz-placeholder{color:#ccc}.navbar-inverse .navbar-search .search-query:-ms-input-placeholder{color:#ccc}.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder{color:#ccc}.navbar-inverse .navbar-search .search-query:focus,.navbar-inverse .navbar-search .search-query.focused{padding:5px 15px;color:#333;text-shadow:0 1px 0 #fff;background-color:#fff;border:0;outline:0;-webkit-box-shadow:0 0 3px rgba(0,0,0,0.15);-moz-box-shadow:0 0 3px rgba(0,0,0,0.15);box-shadow:0 0 3px rgba(0,0,0,0.15)}.navbar-inverse .btn-navbar{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#0e0e0e;*background-color:#040404;background-image:-moz-linear-gradient(top,#151515,#040404);background-image:-webkit-gradient(linear,0 0,0 100%,from(#151515),to(#040404));background-image:-webkit-linear-gradient(top,#151515,#040404);background-image:-o-linear-gradient(top,#151515,#040404);background-image:linear-gradient(to bottom,#151515,#040404);background-repeat:repeat-x;border-color:#040404 #040404 #000;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff151515',endColorstr='#ff040404',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.navbar-inverse .btn-navbar:hover,.navbar-inverse .btn-navbar:focus,.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active,.navbar-inverse .btn-navbar.disabled,.navbar-inverse .btn-navbar[disabled]{color:#fff;background-color:#040404;*background-color:#000}.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active{background-color:#000 \9}.breadcrumb{padding:8px 15px;margin:0 0 20px;list-style:none;background-color:#f5f5f5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.breadcrumb>li{display:inline-block;*display:inline;text-shadow:0 1px 0 #fff;*zoom:1}.breadcrumb>li>.divider{padding:0 5px;color:#ccc}.breadcrumb>.active{color:#999}.pagination{margin:20px 0}.pagination ul{display:inline-block;*display:inline;margin-bottom:0;margin-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;*zoom:1;-webkit-box-shadow:0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,0.05);box-shadow:0 1px 2px rgba(0,0,0,0.05)}.pagination ul>li{display:inline}.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#fff;border:1px solid #ddd;border-left-width:0}.pagination ul>li>a:hover,.pagination ul>li>a:focus,.pagination ul>.active>a,.pagination ul>.active>span{background-color:#f5f5f5}.pagination ul>.active>a,.pagination ul>.active>span{color:#999;cursor:default}.pagination ul>.disabled>span,.pagination ul>.disabled>a,.pagination ul>.disabled>a:hover,.pagination ul>.disabled>a:focus{color:#999;cursor:default;background-color:transparent}.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-bottomleft:4px;-moz-border-radius-topleft:4px}.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-moz-border-radius-topright:4px;-moz-border-radius-bottomright:4px}.pagination-centered{text-align:center}.pagination-right{text-align:right}.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px}.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-bottom-left-radius:6px;border-bottom-left-radius:6px;-webkit-border-top-left-radius:6px;border-top-left-radius:6px;-moz-border-radius-bottomleft:6px;-moz-border-radius-topleft:6px}.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;border-bottom-right-radius:6px;-moz-border-radius-topright:6px;-moz-border-radius-bottomright:6px}.pagination-mini ul>li:first-child>a,.pagination-small ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>span{-webkit-border-bottom-left-radius:3px;border-bottom-left-radius:3px;-webkit-border-top-left-radius:3px;border-top-left-radius:3px;-moz-border-radius-bottomleft:3px;-moz-border-radius-topleft:3px}.pagination-mini ul>li:last-child>a,.pagination-small ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;border-bottom-right-radius:3px;-moz-border-radius-topright:3px;-moz-border-radius-bottomright:3px}.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px}.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0 6px;font-size:10.5px}.pager{margin:20px 0;text-align:center;list-style:none;*zoom:1}.pager:before,.pager:after{display:table;line-height:0;content:""}.pager:after{clear:both}.pager li{display:inline}.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}.pager li>a:hover,.pager li>a:focus{text-decoration:none;background-color:#f5f5f5}.pager .next>a,.pager .next>span{float:right}.pager .previous>a,.pager .previous>span{float:left}.pager .disabled>a,.pager .disabled>a:hover,.pager .disabled>a:focus,.pager .disabled>span{color:#999;cursor:default;background-color:#fff}.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}.modal-backdrop.fade{opacity:0}.modal-backdrop,.modal-backdrop.fade.in{opacity:.8;filter:alpha(opacity=80)}.modal{position:fixed;top:10%;left:50%;z-index:1050;width:560px;margin-left:-280px;background-color:#fff;border:1px solid #999;border:1px solid rgba(0,0,0,0.3);*border:1px solid #999;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;outline:0;-webkit-box-shadow:0 3px 7px rgba(0,0,0,0.3);-moz-box-shadow:0 3px 7px rgba(0,0,0,0.3);box-shadow:0 3px 7px rgba(0,0,0,0.3);-webkit-background-clip:padding-box;-moz-background-clip:padding-box;background-clip:padding-box}.modal.fade{top:-25%;-webkit-transition:opacity .3s linear,top .3s ease-out;-moz-transition:opacity .3s linear,top .3s ease-out;-o-transition:opacity .3s linear,top .3s ease-out;transition:opacity .3s linear,top .3s ease-out}.modal.fade.in{top:10%}.modal-header{padding:9px 15px;border-bottom:1px solid #eee}.modal-header .close{margin-top:2px}.modal-header h3{margin:0;line-height:30px}.modal-body{position:relative;max-height:400px;padding:15px;overflow-y:auto}.modal-form{margin-bottom:0}.modal-footer{padding:14px 15px 15px;margin-bottom:0;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;*zoom:1;-webkit-box-shadow:inset 0 1px 0 #fff;-moz-box-shadow:inset 0 1px 0 #fff;box-shadow:inset 0 1px 0 #fff}.modal-footer:before,.modal-footer:after{display:table;line-height:0;content:""}.modal-footer:after{clear:both}.modal-footer .btn+.btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn+.btn{margin-left:-1px}.modal-footer .btn-block+.btn-block{margin-left:0}.tooltip{position:absolute;z-index:1030;display:block;font-size:11px;line-height:1.4;opacity:0;filter:alpha(opacity=0);visibility:visible}.tooltip.in{opacity:.8;filter:alpha(opacity=80)}.tooltip.top{padding:5px 0;margin-top:-3px}.tooltip.right{padding:0 5px;margin-left:3px}.tooltip.bottom{padding:5px 0;margin-top:3px}.tooltip.left{padding:0 5px;margin-left:-3px}.tooltip-inner{max-width:200px;padding:8px;color:#fff;text-align:center;text-decoration:none;background-color:#000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid}.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-top-color:#000;border-width:5px 5px 0}.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-right-color:#000;border-width:5px 5px 5px 0}.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-left-color:#000;border-width:5px 0 5px 5px}.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-bottom-color:#000;border-width:0 5px 5px}.popover{position:absolute;top:0;left:0;z-index:1010;display:none;max-width:276px;padding:1px;text-align:left;white-space:normal;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box}.popover.top{margin-top:-10px}.popover.right{margin-left:10px}.popover.bottom{margin-top:10px}.popover.left{margin-left:-10px}.popover-title{padding:8px 14px;margin:0;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0}.popover-title:empty{display:none}.popover-content{padding:9px 14px}.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}.popover .arrow{border-width:11px}.popover .arrow:after{border-width:10px;content:""}.popover.top .arrow{bottom:-11px;left:50%;margin-left:-11px;border-top-color:#999;border-top-color:rgba(0,0,0,0.25);border-bottom-width:0}.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-top-color:#fff;border-bottom-width:0}.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-right-color:#999;border-right-color:rgba(0,0,0,0.25);border-left-width:0}.popover.right .arrow:after{bottom:-10px;left:1px;border-right-color:#fff;border-left-width:0}.popover.bottom .arrow{top:-11px;left:50%;margin-left:-11px;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,0.25);border-top-width:0}.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-bottom-color:#fff;border-top-width:0}.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-left-color:#999;border-left-color:rgba(0,0,0,0.25);border-right-width:0}.popover.left .arrow:after{right:1px;bottom:-10px;border-left-color:#fff;border-right-width:0}.thumbnails{margin-left:-20px;list-style:none;*zoom:1}.thumbnails:before,.thumbnails:after{display:table;line-height:0;content:""}.thumbnails:after{clear:both}.row-fluid .thumbnails{margin-left:0}.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px}.thumbnail{display:block;padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.055);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.055);box-shadow:0 1px 3px rgba(0,0,0,0.055);-webkit-transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}a.thumbnail:hover,a.thumbnail:focus{border-color:#08c;-webkit-box-shadow:0 1px 4px rgba(0,105,214,0.25);-moz-box-shadow:0 1px 4px rgba(0,105,214,0.25);box-shadow:0 1px 4px rgba(0,105,214,0.25)}.thumbnail>img{display:block;max-width:100%;margin-right:auto;margin-left:auto}.thumbnail .caption{padding:9px;color:#555}.media,.media-body{overflow:hidden;*overflow:visible;zoom:1}.media,.media .media{margin-top:15px}.media:first-child{margin-top:0}.media-object{display:block}.media-heading{margin:0 0 5px}.media>.pull-left{margin-right:10px}.media>.pull-right{margin-left:10px}.media-list{margin-left:0;list-style:none}.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);white-space:nowrap;vertical-align:baseline;background-color:#999}.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.badge{padding-right:9px;padding-left:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px}.label:empty,.badge:empty{display:none}a.label:hover,a.label:focus,a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}.label-important,.badge-important{background-color:#b94a48}.label-important[href],.badge-important[href]{background-color:#953b39}.label-warning,.badge-warning{background-color:#f89406}.label-warning[href],.badge-warning[href]{background-color:#c67605}.label-success,.badge-success{background-color:#468847}.label-success[href],.badge-success[href]{background-color:#356635}.label-info,.badge-info{background-color:#3a87ad}.label-info[href],.badge-info[href]{background-color:#2d6987}.label-inverse,.badge-inverse{background-color:#333}.label-inverse[href],.badge-inverse[href]{background-color:#1a1a1a}.btn .label,.btn .badge{position:relative;top:-1px}.btn-mini .label,.btn-mini .badge{top:0}@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-moz-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-ms-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-o-keyframes progress-bar-stripes{from{background-position:0 0}to{background-position:40px 0}}@keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}.progress{height:20px;margin-bottom:20px;overflow:hidden;background-color:#f7f7f7;background-image:-moz-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f5f5f5),to(#f9f9f9));background-image:-webkit-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-o-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:linear-gradient(to bottom,#f5f5f5,#f9f9f9);background-repeat:repeat-x;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5',endColorstr='#fff9f9f9',GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);box-shadow:inset 0 1px 2px rgba(0,0,0,0.1)}.progress .bar{float:left;width:0;height:100%;font-size:12px;color:#fff;text-align:center;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#0e90d2;background-image:-moz-linear-gradient(top,#149bdf,#0480be);background-image:-webkit-gradient(linear,0 0,0 100%,from(#149bdf),to(#0480be));background-image:-webkit-linear-gradient(top,#149bdf,#0480be);background-image:-o-linear-gradient(top,#149bdf,#0480be);background-image:linear-gradient(to bottom,#149bdf,#0480be);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf',endColorstr='#ff0480be',GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-moz-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width .6s ease;-moz-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,0.15),inset 0 -1px 0 rgba(0,0,0,0.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,0.15),inset 0 -1px 0 rgba(0,0,0,0.15);box-shadow:inset 1px 0 0 rgba(0,0,0,0.15),inset 0 -1px 0 rgba(0,0,0,0.15)}.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px}.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}.progress-danger .bar,.progress .bar-danger{background-color:#dd514c;background-image:-moz-linear-gradient(top,#ee5f5b,#c43c35);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#c43c35));background-image:-webkit-linear-gradient(top,#ee5f5b,#c43c35);background-image:-o-linear-gradient(top,#ee5f5b,#c43c35);background-image:linear-gradient(to bottom,#ee5f5b,#c43c35);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b',endColorstr='#ffc43c35',GradientType=0)}.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}.progress-success .bar,.progress .bar-success{background-color:#5eb95e;background-image:-moz-linear-gradient(top,#62c462,#57a957);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#57a957));background-image:-webkit-linear-gradient(top,#62c462,#57a957);background-image:-o-linear-gradient(top,#62c462,#57a957);background-image:linear-gradient(to bottom,#62c462,#57a957);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462',endColorstr='#ff57a957',GradientType=0)}.progress-success.progress-striped .bar,.progress-striped .bar-success{background-color:#62c462;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}.progress-info .bar,.progress .bar-info{background-color:#4bb1cf;background-image:-moz-linear-gradient(top,#5bc0de,#339bb9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#339bb9));background-image:-webkit-linear-gradient(top,#5bc0de,#339bb9);background-image:-o-linear-gradient(top,#5bc0de,#339bb9);background-image:linear-gradient(to bottom,#5bc0de,#339bb9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de',endColorstr='#ff339bb9',GradientType=0)}.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}.progress-warning .bar,.progress .bar-warning{background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450',endColorstr='#fff89406',GradientType=0)}.progress-warning.progress-striped .bar,.progress-striped .bar-warning{background-color:#fbb450;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}.accordion{margin-bottom:20px}.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.accordion-heading{border-bottom:0}.accordion-heading .accordion-toggle{display:block;padding:8px 15px}.accordion-toggle{cursor:pointer}.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5}.carousel{position:relative;margin-bottom:20px;line-height:1}.carousel-inner{position:relative;width:100%;overflow:hidden}.carousel-inner>.item{position:relative;display:none;-webkit-transition:.6s ease-in-out left;-moz-transition:.6s ease-in-out left;-o-transition:.6s ease-in-out left;transition:.6s ease-in-out left}.carousel-inner>.item>img,.carousel-inner>.item>a>img{display:block;line-height:1}.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block}.carousel-inner>.active{left:0}.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%}.carousel-inner>.next{left:100%}.carousel-inner>.prev{left:-100%}.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0}.carousel-inner>.active.left{left:-100%}.carousel-inner>.active.right{left:100%}.carousel-control{position:absolute;top:40%;left:15px;width:40px;height:40px;margin-top:-20px;font-size:60px;font-weight:100;line-height:30px;color:#fff;text-align:center;background:#222;border:3px solid #fff;-webkit-border-radius:23px;-moz-border-radius:23px;border-radius:23px;opacity:.5;filter:alpha(opacity=50)}.carousel-control.right{right:15px;left:auto}.carousel-control:hover,.carousel-control:focus{color:#fff;text-decoration:none;opacity:.9;filter:alpha(opacity=90)}.carousel-indicators{position:absolute;top:15px;right:15px;z-index:5;margin:0;list-style:none}.carousel-indicators li{display:block;float:left;width:10px;height:10px;margin-left:5px;text-indent:-999px;background-color:#ccc;background-color:rgba(255,255,255,0.25);border-radius:5px}.carousel-indicators .active{background-color:#fff}.carousel-caption{position:absolute;right:0;bottom:0;left:0;padding:15px;background:#333;background:rgba(0,0,0,0.75)}.carousel-caption h4,.carousel-caption p{line-height:20px;color:#fff}.carousel-caption h4{margin:0 0 5px}.carousel-caption p{margin-bottom:0}.hero-unit{padding:60px;margin-bottom:30px;font-size:18px;font-weight:200;line-height:30px;color:inherit;background-color:#eee;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.hero-unit h1{margin-bottom:0;font-size:60px;line-height:1;letter-spacing:-1px;color:inherit}.hero-unit li{line-height:30px}.pull-right{float:right}.pull-left{float:left}.hide{display:none}.show{display:block}.invisible{visibility:hidden}.affix{position:fixed}
  /* Pretty printing styles. Used with prettify.js. */
  /* Vim sunburst theme by David Leibovic */
  pre .str {
    color: #65B042;
  }
  /* string  - green */
  pre .kwd {
    color: #E28964;
  }
  /* keyword - dark pink */
  pre .com {
    color: #AEAEAE;
    font-style: italic;
  }
  /* comment - gray */
  pre .typ {
    color: #89bdff;
  }
  /* type - light blue */
  pre .lit {
    color: #3387CC;
  }
  /* literal - blue */
  pre .pun {
    color: #fff;
  }
  /* punctuation - white */
  pre .pln {
    color: #fff;
  }
  /* plaintext - white */
  pre .tag {
    color: #89bdff;
  }
  /* html/xml tag    - light blue */
  pre .atn {
    color: #bdb76b;
  }
  /* html/xml attribute name  - khaki */
  pre .atv {
    color: #65B042;
  }
  /* html/xml attribute value - green */
  pre .dec {
    color: #3387CC;
  }
  /* decimal - blue */
  /* Specify class=linenums on a pre to get line numbering */
  ol.linenums {
    margin-top: 0;
    margin-bottom: 0;
    color: #AEAEAE;
  }
  /* IE indents via margin-left */
  li.L0,
  li.L1,
  li.L2,
  li.L3,
  li.L5,
  li.L6,
  li.L7,
  li.L8 {
    list-style-type: none;
  }
  /* Alternate shading for lines */
  @media print {
    pre .str {
      color: #060;
    }
    pre .kwd {
      color: #006;
      font-weight: bold;
    }
    pre .com {
      color: #600;
      font-style: italic;
    }
    pre .typ {
      color: #404;
      font-weight: bold;
    }
    pre .lit {
      color: #044;
    }
    pre .pun {
      color: #440;
    }
    pre .pln {
      color: #000;
    }
    pre .tag {
      color: #006;
      font-weight: bold;
    }
    pre .atn {
      color: #404;
    }
    pre .atv {
      color: #060;
    }
  }  /* ------------------------------------------------------------------------------------------
   * Content
   * ------------------------------------------------------------------------------------------ */
  
  @import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');
  * {
    font-family: 'Source Code Pro', sans-serif;
  }
  body {
    min-width: 980px;
  }
  
  body, p, a, div, th, td {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 400;
    font-size: 16px;
    text-shadow: none !important;
  }
  
  td.code {
    font-size: 14px;
    font-family: "Source Code Pro", monospace;
    font-style: normal;
    font-weight: 400;
  }
  
  #content {
    padding-top: 16px;
    z-Index: -1;
    margin-left: 270px;
  }
  
  p {
    color: #808080;
  }
  
  h1 {
    font-family: "Source Sans Pro Semibold", sans-serif;
    font-weight: normal;
    font-size: 44px;
    line-height: 50px;
    margin: 0 0 10px 0;
    padding: 0;
  }
  
  h2 {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: normal;
    font-size: 24px;
    line-height: 40px;
    margin: 0 0 20px 0;
    padding: 0;
  }
  
  section {
    border-top: 1px solid #ebebeb;
    padding: 30px 0;
  }
  
  section h1 {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 700;
    font-size: 32px;
    line-height: 40px;
    padding-bottom: 14px;
    margin: 0 0 20px 0;
    padding: 0;
  }
  
  article {
    padding: 14px 0 30px 0;
  }
  
  article h1 {
    font-family: "Source Sans Pro Bold", sans-serif;
    font-weight: 600;
    font-size: 24px;
    line-height: 26px;
  }
  
  article h2 {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 600;
    font-size: 18px;
    line-height: 24px;
    margin: 0 0 10px 0;
  }
  
  article h3 {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 600;
    font-size: 16px;
    line-height: 18px;
    margin: 0 0 10px 0;
  }
  
  article h4 {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 600;
    font-size: 14px;
    line-height: 16px;
    margin: 0 0 8px 0;
  }
  
  table {
    border-collapse: collapse;
    width: 100%;
    margin: 0 0 20px 0;
  }
  
  th {
    background-color: #f5f5f5;
    text-align: left;
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 700;
    padding: 4px 8px;
    border: #e0e0e0 1px solid;
  }
  
  td {
    vertical-align: top;
    padding: 2px 8px;
    border: #e0e0e0 1px solid;
  }
  
  #generator .content {
    color: #b0b0b0;
    border-top: 1px solid #ebebeb;
    padding: 10px 0;
  }
  
  .label-optional {
    float: right;
  }
  
  .open-left {
    right: 0;
    left: auto;
  }
  
  /* ------------------------------------------------------------------------------------------
   * apidoc - intro
   * ------------------------------------------------------------------------------------------ */
  
  #apidoc .apidoc {
    border-top: 1px solid #ebebeb;
    padding: 30px 0;
  }
  
  #apidoc h1 {
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 700;
    font-size: 32px;
    line-height: 40px;
    padding-bottom: 14px;
    margin: 0 0 20px 0;
    padding: 0;
  }
  
  #apidoc h2 {
    font-family: "Source Sans Pro Bold", sans-serif;
    font-weight: 600;
    font-size: 22px;
    line-height: 26px;
    padding-top: 14px;
  }
  
  /* ------------------------------------------------------------------------------------------
   * pre / code
   * ------------------------------------------------------------------------------------------ */
  pre {
    background-color: #292b36;
    color: #ffffff;
    padding: 10px;
    border-radius: 6px;
    position: relative;
    margin: 10px 0 20px 0;
  }
  
  code.language-text {
    word-wrap: break-word;
  }
  
  pre.language-json {
    overflow: auto;
  }
  
  pre.language-html {
    margin: 40px 0 20px 0;
  }
  
  pre.language-html:before {
    content: attr(data-type);
    position: absolute;
    top: -30px;
    left: 0;
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 600;
    font-size: 15px;
    display: inline-block;
    padding: 2px 5px;
    border-radius: 6px;
    text-transform: uppercase;
    background-color: #3387CC;
    color: #ffffff;
  }
  
  pre.language-html[data-type="get"]:before {
    background-color: green;
  }
  
  pre.language-html[data-type="put"]:before {
    background-color: #e5c500;
  }
  
  pre.language-html[data-type="post"]:before {
    background-color: #4070ec;
  }
  
  pre.language-html[data-type="delete"]:before {
    background-color: #ed0039;
  }
  
  pre.language-api .str {
    color: #ffffff;
  }
  
  pre.language-api .pln,
  pre.language-api .pun {
    color: #65B042;
  }
  
  pre code {
    display: block;
    font-size: 14px;
    font-family: "Source Code Pro", monospace;
    font-style: normal;
    font-weight: 400;
  }
  
  pre code.sample-request-response-json {
    white-space: pre-wrap;
    max-height: 500px;
    overflow: auto;
  }
  
  /* ------------------------------------------------------------------------------------------
   * Sidenav
   * ------------------------------------------------------------------------------------------ */
  .sidenav {
    width: 228px;
    margin: 0;
    padding: 20px;
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    overflow-x: hidden;
    overflow-y: auto;
    background-color: #f5f5f5;
    z-index: 10;
  }
  
  .sidenav > li > a {
    display: block;
    width: 192px;
    margin: 0;
    padding: 2px 11px;
    border: 0;
    border-left: transparent 4px solid;
    border-right: transparent 4px solid;
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 400;
    font-size: 14px;
  }
  
  .sidenav > li.nav-header > a {
    padding: 5px 15px;
    border: 1px solid #e5e5e5;
    width: 190px;
    font-family: "Source Sans Pro", sans-serif;
    font-weight: 700;
    font-size: 16px;
    background-color: #4c8eca;
    color: #fff;
  }
  
  .sidenav > li.nav-header.active > a {
    background-color: #4c8eca;
    color: #fff;
  }
  
  
  00427D
  
  .sidenav > .active > a {
    position: relative;
    z-index: 2;
  }
  
  .sidenav > li > a:hover {
    background-color: #ffffff;
  }
  
  .sidenav > li.has-modifications a {
    border-right: #60d060 4px solid;
  }
  
  .sidenav > li.is-new a {
    border-left: #e5e5e5 4px solid;
  }
  
  
  
  /* ------------------------------------------------------------------------------------------
   * Tabs
   * ------------------------------------------------------------------------------------------ */
  ul.nav-tabs {
    margin: 0;
  }
  
  /* ------------------------------------------------------------------------------------------
   * Print
   * ------------------------------------------------------------------------------------------ */
  
  @media print {
  
    #sidenav,
    #version,
    #versions,
    section .version,
    section .versions {
      display: none;
    }
  
    #content {
      margin-left: 0;
    }
  
    a {
      text-decoration: none;
      color: inherit;
    }
  
    a:after {
      content: " [" attr(href) "] ";
    }
  
    p {
      color: #000000
    }
  
    pre {
      background-color: #ffffff;
      color: #000000;
      padding: 10px;
      border: #808080 1px solid;
      border-radius: 6px;
      position: relative;
      margin: 10px 0 20px 0;
    }
  
  } /* /@media print */
  
  
  .doc-chapter
  {
  display:none;
  background-color: #eee;
  border-radius: 1px;
  padding: 10px;
  margin-bottom: 20px;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  /*!
   * json-schema-view-js
   * https://github.com/mohsen1/json-schema-view-js#readme
   * Version: 0.4.1 - 2015-11-12T17:19:27.615Z
   * License: MIT
   */.json-schema-view .toggle-handle:after,.json-schema-view.json-schema-view-dark .toggle-handle:after,json-schema-view .toggle-handle:after,json-schema-view[json-schema-view-dark] .toggle-handle:after{content:"\25BC"}.json-schema-view .title,.json-schema-view.json-schema-view-dark .title,json-schema-view .title,json-schema-view[json-schema-view-dark] .title{font-weight:700;cursor:pointer}.json-schema-view,json-schema-view{font-family:monospace;font-size:0;display:table-cell}.json-schema-view>*,json-schema-view>*{font-size:14px}.json-schema-view .toggle-handle,json-schema-view .toggle-handle{cursor:pointer;margin:auto .3em;font-size:10px;display:inline-block;transform-origin:50% 40%;transition:transform 150ms ease-in}.json-schema-view .toggle-handle,.json-schema-view .toggle-handle:hover,json-schema-view .toggle-handle,json-schema-view .toggle-handle:hover{text-decoration:none;color:#333}.json-schema-view .description,json-schema-view .description{color:gray;font-style:italic}
     .pattern {
      color: blue;
    }
    .default {
      color: black;
    }
    .required {
      color:black;
    }
    .json-schema-view .title,.json-schema-view .title:hover,json-schema-view .title,json-schema-view .title:hover{text-decoration:none;color:#333}.json-schema-view .brace,.json-schema-view .bracket,.json-schema-view .title,json-schema-view .brace,json-schema-view .bracket,json-schema-view .title{color:#333}.json-schema-view .property,json-schema-view .property{font-size:0;display:table-row}.json-schema-view .property>*,json-schema-view .property>*{font-size:14px;padding:.2em}.json-schema-view .name,json-schema-view .name{color:#00f;display:table-cell;vertical-align:top}.json-schema-view .type,json-schema-view .type{color:green}.json-schema-view .type-any,json-schema-view .type-any{color:#33f}.json-schema-view .required,json-schema-view .required{color:red}.json-schema-view .inner,json-schema-view .inner{padding-left:18px}.json-schema-view.collapsed .description,.json-schema-view.collapsed .property,json-schema-view.collapsed .description,json-schema-view.collapsed .property{display:none}.json-schema-view.collapsed .closeing.brace,json-schema-view.collapsed .closeing.brace{display:inline-block}.json-schema-view.collapsed .toggle-handle,json-schema-view.collapsed .toggle-handle{transform:rotate(-90deg)}.json-schema-view.json-schema-view-dark,json-schema-view[json-schema-view-dark]{font-family:monospace;font-size:0;display:table-cell}.json-schema-view.json-schema-view-dark>*,json-schema-view[json-schema-view-dark]>*{font-size:14px}.json-schema-view.json-schema-view-dark .toggle-handle,json-schema-view[json-schema-view-dark] .toggle-handle{cursor:pointer;margin:auto .3em;font-size:10px;display:inline-block;transform-origin:50% 40%;transition:transform 150ms ease-in}.json-schema-view.json-schema-view-dark .toggle-handle,.json-schema-view.json-schema-view-dark .toggle-handle:hover,json-schema-view[json-schema-view-dark] .toggle-handle,json-schema-view[json-schema-view-dark] .toggle-handle:hover{text-decoration:none;color:#eee}.json-schema-view.json-schema-view-dark .description,json-schema-view[json-schema-view-dark] .description{color:gray;font-style:italic}.json-schema-view.json-schema-view-dark .title,.json-schema-view.json-schema-view-dark .title:hover,json-schema-view[json-schema-view-dark] .title,json-schema-view[json-schema-view-dark] .title:hover{text-decoration:none;color:#eee}.json-schema-view.json-schema-view-dark .brace,.json-schema-view.json-schema-view-dark .bracket,.json-schema-view.json-schema-view-dark .title,json-schema-view[json-schema-view-dark] .brace,json-schema-view[json-schema-view-dark] .bracket,json-schema-view[json-schema-view-dark] .title{color:#eee}.json-schema-view.json-schema-view-dark .property,json-schema-view[json-schema-view-dark] .property{font-size:0;display:table-row}.json-schema-view.json-schema-view-dark .property>*,json-schema-view[json-schema-view-dark] .property>*{font-size:14px;padding:.2em}.json-schema-view.json-schema-view-dark .name,json-schema-view[json-schema-view-dark] .name{color:#add8e6;display:table-cell;vertical-align:top}.json-schema-view.json-schema-view-dark .type,json-schema-view[json-schema-view-dark] .type{color:#90ee90}.json-schema-view.json-schema-view-dark .type-any,json-schema-view[json-schema-view-dark] .type-any{color:#d4ebf2}.json-schema-view.json-schema-view-dark .required,json-schema-view[json-schema-view-dark] .required{color:#fe0000}.json-schema-view.json-schema-view-dark .inner,json-schema-view[json-schema-view-dark] .inner{padding-left:18px}.json-schema-view.json-schema-view-dark.collapsed .description,.json-schema-view.json-schema-view-dark.collapsed .property,json-schema-view[json-schema-view-dark].collapsed .description,json-schema-view[json-schema-view-dark].collapsed .property{display:none}.json-schema-view.json-schema-view-dark.collapsed .closeing.brace,json-schema-view[json-schema-view-dark].collapsed .closeing.brace{display:inline-block}.json-schema-view.json-schema-view-dark.collapsed .toggle-handle,json-schema-view[json-schema-view-dark].collapsed .toggle-handle{transform:rotate(-90deg)}
  </style>
</head>

<body>
  <script>
    // Script section to load models into a JS Var
    var defs = {}
  </script>

  <div class="container-fluid">
    <div class="row-fluid">
      <div id="sidenav" class="span2">
        <nav id="scrollingNav">
          <ul class="sidenav nav nav-list">
            <!-- Logo Area -->
              <!--<div style="width: 80%; background-color: #4c8eca; color: white; padding: 20px; text-align: center; margin-bottom: 20px; ">

              API Docs 2

              </div>
            -->
            <li class="nav-fixed nav-header active" data-group="_"><a href="#api-_">API Summary</a></li>

                  <li class="nav-header" data-group="Default"><a href="#api-Default">API Methods </a></li>
                    <li data-group="Default" data-name="steveManagerChargepointsAddSinglePost" class="">
                      <a href="#api-Default-steveManagerChargepointsAddSinglePost">Add Single Chargepoint</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerChargepointsJsonGet" class="">
                      <a href="#api-Default-steveManagerChargepointsJsonGet">Chargepoints</a>
                    </li>
					<li data-group="Default" data-name="steveManagerChargepointsJsonDetails2Get" class="">
                      <a href="#api-Default-steveManagerChargepointsJsonDetails2Get">Chargepoints Details</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerChargepointsJsonQueryGet" class="">
                      <a href="#api-Default-steveManagerChargepointsJsonQueryGet">Chargepoints Query</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerOcppTagsJsonGet" class="">
                      <a href="#api-Default-steveManagerOcppTagsJsonGet">OCPP Tags</a>
                    </li>
					<li data-group="Default" data-name="steveManagerOcppTagsJsonDetails1Get" class="">
                      <a href="#api-Default-steveManagerOcppTagsJsonDetails1Get">OCPP Tags Details</a>
                    </li>
					<li data-group="Default" data-name="steveManagerOcppTagsJsonQueryGet" class="">
                      <a href="#api-Default-steveManagerOcppTagsJsonQueryGet">OCPP Tags Query</a>
                    </li>
					<li data-group="Default" data-name="steveManagerOcppTagsAddSinglePost" class="">
                      <a href="#api-Default-steveManagerOcppTagsAddSinglePost">Add OCPP Tag</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerOperationsV16RemoteStartTransactionPost" class="">
                      <a href="#api-Default-steveManagerOperationsV16RemoteStartTransactionPost">Remote Start Transaction</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerOperationsV16RemoteStopTransactionPost" class="">
                      <a href="#api-Default-steveManagerOperationsV16RemoteStopTransactionPost">Remote Stop Transaction</a>
                    </li>
					<li data-group="Default" data-name="steveManagerOperationsV16CancelReservationPost" class="">
                      <a href="#api-Default-steveManagerOperationsV16CancelReservationPost">Cancel Reservation</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerOperationsV16ReserveNowPost" class="">
                      <a href="#api-Default-steveManagerOperationsV16ReserveNowPost">Reserve</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerReservationsJsonGet" class="">
                      <a href="#api-Default-steveManagerReservationsJsonGet">Reservations</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerReservationsJsonQueryGet" class="">
                      <a href="#api-Default-steveManagerReservationsJsonQueryGet">Reservations Query</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerTransactionsJsonGet" class="">
                      <a href="#api-Default-steveManagerTransactionsJsonGet">Transactions</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerTransactionsJsonQueryGet" class="">
                      <a href="#api-Default-steveManagerTransactionsJsonQueryGet">Transactions Query</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerTransactionsJsonDetails2Get" class="">
                      <a href="#api-Default-steveManagerTransactionsJsonDetails2Get">Transactions Details</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerUsersJsonGet" class="">
                      <a href="#api-Default-steveManagerUsersJsonGet">Users</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerUsersJsonQueryGet" class="">
                      <a href="#api-Default-steveManagerUsersJsonQueryGet">Users Query</a>
                    </li>
					<li data-group="Default" data-name="steveManagerUsersAddPost" class="">
                      <a href="#api-Default-steveManagerUsersAddPost">Add User</a>
                    </li>
                    <li data-group="Default" data-name="steveManagerUsersJsonDetails1Get" class="">
                      <a href="#api-Default-steveManagerUsersJsonDetails1Get">User Details</a>
                    </li>
          </ul>
        </nav>
      </div>
      <div id="content">
        <div id="project">
          <div class="pull-left">
            <h1>SteVe</h1>
          </div>
          <div class="clearfix"></div>
        </div>
        <div id="header">
          <div id="api-_">
            <h2 id="welcome-to-apidoc">API Documentation</h2>
              <div class="app-desc">Version: 0.1</div>
            <hr>
            <div>SteVe functionalities' API implementations</div>
          </div>
        </div>
        <div id="sections">
                <section id="api-Default">
                  <h1>API Methods</h1>
                    <div id="api-Default-steveManagerChargepointsAddSinglePost">
                      <article id="api-Default-steveManagerChargepointsAddSinglePost-0" data-group="User" data-name="steveManagerChargepointsAddSinglePost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Chargepoints/Add/Single</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Add a single charge point</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/chargepoints/add/single</span></code></pre>
                        

                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">add</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_add">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">note</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_note">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">registrationStatus</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_registrationStatus">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.city</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_address.city">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">adminAddress</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_adminAddress">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">locationLatitude</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_locationLatitude">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">description</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_description">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">_insertConnectorStatusAfterTransactionMsg</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_insertConnectorStatusAfterTransactionMsg">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.country</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_address.country">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">locationLongitude</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_locationLongitude">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.houseNumber</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_address.houseNumber">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.street</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_address.street">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargeBoxId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_chargeBoxId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.zipCode</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsAddSinglePost_address.zipCode">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200</h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerChargepointsJsonGet">
                      <article id="api-Default-steveManagerChargepointsJsonGet-0" data-group="User" data-name="steveManagerChargepointsJsonGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Chargepoints/Json</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get all chargepoints</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/chargepoints/json</span></code></pre>
                        

                          <h2>Parameters</h2>
							<div class="methodsubtabletitle">none</div>

                          <h2>Responses</h2>
                            <h3> Status: 200</h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerChargepointsJsonGet-200-schema">Response body</a>
								 
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerChargepointsJsonGet-200-schema">
                                  <div id='responses-steveManagerChargepointsJsonGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>
									{
  "Chargepoints information": [
    {
      "protocol": "ocpp1.6J",
      "heartbeat": "2021-01-28 at 14:48",
      "description": "dummy",
      "chargeboxid": "chargepoint2"
    },
    {
      "protocol": "ocpp1.6J",
      "heartbeat": "2021-01-28 at 14:43",
      "description": "dummy code",
      "chargeboxid": "remote"
    },
    {
      "protocol": "null",
      "heartbeat": "",
      "description": "dummy inspector",
      "chargeboxid": "remote2"
    }
  ]
}
									
									</p>
									
									
									
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
 {"Chargepoints information":[{"protocol":"ocpp1.6J","heartbeat":"2021-01-28 at 14:48","description":"dummy","chargeboxid":"chargepoint2"},{"protocol":"ocpp1.6J","heartbeat":"2021-01-28 at 14:43","description":"dummy code","chargeboxid":"remote"},{"protocol":"null","heartbeat":"","description":"dummy inspector","chargeboxid":"remote2"}]}
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerChargepointsJsonGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerChargepointsJsonGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerChargepointsJsonGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOcppTagsJsonGet">
                      <article id="api-Default-steveManagerOcppTagsJsonGet-0" data-group="User" data-name="steveManagerOcppTagsJsonGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/OcppTags/Json</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get all ocpp Tags</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/ocppTags/json</span></code></pre>
                        

                          <h2>Parameters</h2>

							<div class="methodsubtabletitle">none</div>




                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerOcppTagsJsonGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerOcppTagsJsonGet-200-schema">
                                  <div id='responses-steveManagerOcppTagsJsonGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>
									{"OCPP Tags information":[{"Parent ID Tag":"null","ID Tag":"ABCDEF01020304","Expiry Date/Time":"","Blocked?":"false","In Transaction?":"false"},{"Parent ID Tag":"null","ID Tag":"01020304","Expiry Date/Time":"","Blocked?":"false","In Transaction?":"false"},{"Parent ID Tag":"null","ID Tag":"ABCDEF0","Expiry Date/Time":"","Blocked?":"false","In Transaction?":"false"}]}
									</p>
									
									
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerOcppTagsJsonGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerOcppTagsJsonGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerOcppTagsJsonGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOperationsV16CancelReservationPost">
                      <article id="api-Default-steveManagerOperationsV16CancelReservationPost-0" data-group="User" data-name="steveManagerOperationsV16CancelReservationPost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Operations/V16/CancelReservation</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Given a reservation ID cancel it</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/operations/v1.6/CancelReservation</span></code></pre>
                        

                          <h2>Parameters</h2>




                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">reservationId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16CancelReservationPost_reservationId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargePointSelectList</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16CancelReservationPost_chargePointSelectList">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200</h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOperationsV16RemoteStartTransactionPost">
                      <article id="api-Default-steveManagerOperationsV16RemoteStartTransactionPost-0" data-group="User" data-name="steveManagerOperationsV16RemoteStartTransactionPost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Operations/V16/RemoteStartTransaction</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Remotely start a transaction</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/operations/v1.6/RemoteStartTransaction</span></code></pre>
                        

                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">connectorId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16RemoteStartTransactionPost_connectorId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">idTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16RemoteStartTransactionPost_idTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargePointSelectList</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16RemoteStartTransactionPost_chargePointSelectList">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOperationsV16RemoteStopTransactionPost">
                      <article id="api-Default-steveManagerOperationsV16RemoteStopTransactionPost-0" data-group="User" data-name="steveManagerOperationsV16RemoteStopTransactionPost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Operations/V16/RemoteStopTransaction</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Remotely stop a transaction</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/operations/v1.6/RemoteStopTransaction</span></code></pre>
                        

                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">chargePointSelectList</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16RemoteStopTransactionPost_chargePointSelectList">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">transactionId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16RemoteStopTransactionPost_transactionId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOperationsV16ReserveNowPost">
                      <article id="api-Default-steveManagerOperationsV16ReserveNowPost-0" data-group="User" data-name="steveManagerOperationsV16ReserveNowPost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Operations/V16/ReserveNow</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Create a reservation</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/operations/v1.6/ReserveNow</span></code></pre>
                        
                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">connectorId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16ReserveNowPost_connectorId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">idTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16ReserveNowPost_idTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">expiry</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16ReserveNowPost_expiry">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargePointSelectList</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOperationsV16ReserveNowPost_chargePointSelectList">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerReservationsJsonGet">
                      <article id="api-Default-steveManagerReservationsJsonGet-0" data-group="User" data-name="steveManagerReservationsJsonGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Reservations/Json</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get all active reservations</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/reservations/json</span></code></pre>
                        

                          <h2>Parameters</h2>
							<div class="methodsubtabletitle">none</div>






                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerReservationsJsonGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerReservationsJsonGet-200-schema">
                                  <div id='responses-steveManagerReservationsJsonGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Reservations Information":[]}</p>
									
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerReservationsJsonGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerReservationsJsonGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerReservationsJsonGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerReservationsJsonQueryGet">
                      <article id="api-Default-steveManagerReservationsJsonQueryGet-0" data-group="User" data-name="steveManagerReservationsJsonQueryGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Reservations/Json/Query</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get all reservations made in a specified time period</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/reservations/json/query</span></code></pre>
                        

                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">periodType</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerReservationsJsonQueryGet_periodType">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">ocppIdTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerReservationsJsonQueryGet_ocppIdTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">from</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerReservationsJsonQueryGet_from">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">to</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerReservationsJsonQueryGet_to">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargeBoxId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerReservationsJsonQueryGet_chargeBoxId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">status</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerReservationsJsonQueryGet_status">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerReservationsJsonQueryGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerReservationsJsonQueryGet-200-schema">
                                  <div id='responses-steveManagerReservationsJsonQueryGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>
									{"Reservations Information":[{"Status":"CANCELLED","ChargeBox ID":"remote","OCPP ID Tag":"ABCDEF01020304","Reservation ID":"7","Start Date/Time":"2021-01-28 at 15:30","Expiry Date/Time":"2021-01-29 at 00:00","Connector ID":"1","Transaction ID":""},{"Status":"CANCELLED","ChargeBox ID":"remote","OCPP ID Tag":"ABCDEF01020304","Reservation ID":"6","Start Date/Time":"2021-01-28 at 15:14","Expiry Date/Time":"2021-01-31 at 00:00","Connector ID":"1","Transaction ID":""}]}
									</p>
									
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerReservationsJsonQueryGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerReservationsJsonQueryGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerReservationsJsonQueryGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerTransactionsJsonGet">
                      <article id="api-Default-steveManagerTransactionsJsonGet-0" data-group="User" data-name="steveManagerTransactionsJsonGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Transactions/Json</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get all active transactions</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/transactions/json</span></code></pre>
                        

                          <h2>Parameters</h2>
						  
							<div class="methodsubtabletitle">none</div>






                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerTransactionsJsonGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerTransactionsJsonGet-200-schema">
                                  <div id='responses-steveManagerTransactionsJsonGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Transactions information":[]}</p>
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerTransactionsJsonGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerTransactionsJsonGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerTransactionsJsonGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerTransactionsJsonQueryGet">
                      <article id="api-Default-steveManagerTransactionsJsonQueryGet-0" data-group="User" data-name="steveManagerTransactionsJsonQueryGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Transactions/Json/Query</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get transactions that respond to the query results</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/transactions/json/query</span></code></pre>
                        

                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">periodType</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerTransactionsJsonQueryGet_periodType">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">_returnCSV</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerTransactionsJsonQueryGet_returnCSV">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">ocppIdTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerTransactionsJsonQueryGet_ocppIdTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">type</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerTransactionsJsonQueryGet_type">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">transactionPk</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerTransactionsJsonQueryGet_transactionPk">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargeBoxId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerTransactionsJsonQueryGet_chargeBoxId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerTransactionsJsonQueryGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerTransactionsJsonQueryGet-200-schema">
                                  <div id='responses-steveManagerTransactionsJsonQueryGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    
									<p>{"Transactions information":[{"Stop Value":"16000","ChargeBox ID":"chargepoint2","OCPP ID Tag":"ABCDEF01020304","Stop Date/Time":"2021-01-28 at 15:13","Start Value":"0","Start Date/Time":"2021-01-28 at 15:13","Stop Reason":"null","Connector ID":"1","Transaction ID":"2"},{"Stop Value":"16000","ChargeBox ID":"remote","OCPP ID Tag":"ABCDEF01020304","Stop Date/Time":"2021-01-28 at 15:12","Start Value":"0","Start Date/Time":"2021-01-28 at 15:12","Stop Reason":"null","Connector ID":"1","Transaction ID":"1"}]}</p>
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerTransactionsJsonQueryGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerTransactionsJsonQueryGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerTransactionsJsonQueryGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
					  <div id="api-Default-steveManagerChargepointsJsonDetails2Get">
                      <article id="api-Default-steveManagerChargepointsJsonDetails2Get-0" data-group="User" data-name="steveManagerChargepointsJsonDetails2Get" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Chargepoints/Json/Details/2</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get details about a specific chargepoint (in this case chargepoint 2)</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/chargepoints/json/details/2</span></code></pre>
                        

                          <h2>Parameters</h2>

							<div class="methodsubtabletitle">none </div>




                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerChargepointsJsonDetails2Get-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerChargepointsJsonDetails2Get-200-schema">
                                  <div id='responses-steveManagerChargepointsJsonDetails2Get-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Endpoint Address":"null","Last Heartbeat Stamp":"Jan-28-2021 14:48","Firmware Version":"1.0.0","Charge Point Model":"Test Basic","Diagnostics Timestamp":"null","Meter Serial Number":"null","Firmware Update Timestamp":"null","Chargeboxid":"chargepoint2","OCPP Protocol":"ocpp1.6J","Charge Point Serial Number":"chargepoint2","Charge Box Serial Number":"chargepoint2","Meter Type":"null","Iccid":"null","Imsi":"null","Charge Point Vendor":"The New Motion BV","Diagnostics Status":"null"}
									</p>
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerChargepointsJsonDetails2Get-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerChargepointsJsonDetails2Get-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerChargepointsJsonDetails2Get-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerChargepointsJsonQueryGet">
                      <article id="api-Default-steveManagerChargepointsJsonQueryGet-0" data-group="User" data-name="steveManagerChargepointsJsonQueryGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Chargepoints/Json/Query</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get chargepoints that respond to the query results</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/chargepoints/json/query</span></code></pre>
                        
                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">ocppVersion</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsJsonQueryGet_ocppVersion">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">description</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsJsonQueryGet_description">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">heartbeatPeriod</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsJsonQueryGet_heartbeatPeriod">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">chargeBoxId</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerChargepointsJsonQueryGet_chargeBoxId">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerChargepointsJsonQueryGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerChargepointsJsonQueryGet-200-schema">
                                  <div id='responses-steveManagerChargepointsJsonQueryGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Chargepoints information":[{"protocol":"ocpp1.6J","heartbeat":"2021-01-28 at 14:48","description":"dummy","chargeboxid":"chargepoint2"},{"protocol":"ocpp1.6J","heartbeat":"2021-01-28 at 14:43","description":"dummy code","chargeboxid":"remote"},{"protocol":"null","heartbeat":"","description":"dummy inspector","chargeboxid":"remote2"}]}</p>
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerChargepointsJsonQueryGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerChargepointsJsonQueryGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerChargepointsJsonQueryGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOcppTagsJsonDetails1Get">
                      <article id="api-Default-steveManagerOcppTagsJsonDetails1Get-0" data-group="User" data-name="steveManagerOcppTagsJsonDetails1Get" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/OcppTags/Json/Details/1</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get details about a specific OCPP Tag (in this case tag 1)</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/ocppTags/json/details/1</span></code></pre>
                        

                          <h2>Parameters</h2>
						  <div class="methodsubtabletitle">none</div>






                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerOcppTagsJsonDetails1Get-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerOcppTagsJsonDetails1Get-200-schema">
                                  <div id='responses-steveManagerOcppTagsJsonDetails1Get-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Parent Id Tag":"-- Empty --","Id Tag":"ABCDEF01020304","Max. Active Transaction Count":"1","Expiry Date/Time":"null","Active Transaction Count":"0"}</p>
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerOcppTagsJsonDetails1Get-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerOcppTagsJsonDetails1Get-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerOcppTagsJsonDetails1Get-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerOcppTagsJsonQueryGet">
                      <article id="api-Default-steveManagerOcppTagsJsonQueryGet-0" data-group="User" data-name="steveManagerOcppTagsJsonQueryGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/OcppTags/Json/Query</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get OCPP Tags that respond to the query results</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/ocppTags/json/query</span></code></pre>
                        
                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">parentIdTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsJsonQueryGet_parentIdTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">expired</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsJsonQueryGet_expired">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    Boolean
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">inTransaction</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsJsonQueryGet_inTransaction">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">blocked</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsJsonQueryGet_blocked">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    Boolean
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">idTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsJsonQueryGet_idTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerOcppTagsJsonQueryGet-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerOcppTagsJsonQueryGet-200-schema">
                                  <div id='responses-steveManagerOcppTagsJsonQueryGet-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"OCPP Tags information":[{"Parent ID Tag":"null","ID Tag":"ABCDEF01020304","Expiry Date/Time":"","Blocked?":"false","In Transaction?":"false"},{"Parent ID Tag":"null","ID Tag":"01020304","Expiry Date/Time":"","Blocked?":"false","In Transaction?":"false"},{"Parent ID Tag":"null","ID Tag":"ABCDEF0","Expiry Date/Time":"","Blocked?":"false","In Transaction?":"false"}]}</p>
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerOcppTagsJsonQueryGet-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerOcppTagsJsonQueryGet-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerOcppTagsJsonQueryGet-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerTransactionsJsonDetails2Get">
                      <article id="api-Default-steveManagerTransactionsJsonDetails2Get-0" data-group="User" data-name="steveManagerTransactionsJsonDetails2Get" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Transactions/Json/Details/2</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get details about a specific transaction (in this case transaction 2)</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/transactions/json/details/2</span></code></pre>
                        
                          <h2>Parameters</h2>
						  <div class="methodsubtabletitle">none</div>






                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerTransactionsJsonDetails2Get-200-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerTransactionsJsonDetails2Get-200-schema">
                                  <div id='responses-steveManagerTransactionsJsonDetails2Get-200-schema-200' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Stop Value":"16000","ChargeBox ID":"chargepoint2","OCPP ID Tag":"ABCDEF01020304","Stop Date/Time":"2021-01-28 at 15:13","Stop Event Actor":"station","Start Value":"0","Intermediate Meter Values information":[],"Start Date/Time":"2021-01-28 at 15:13","Stop Reason":"null","Connector ID":"1","Transaction ID":"2"}</p>
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "application/json;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "application/json;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["application/json;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerTransactionsJsonDetails2Get-200-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerTransactionsJsonDetails2Get-200-schema-200');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerTransactionsJsonDetails2Get-200-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerUsersJsonGet">
                      <article id="api-Default-steveManagerUsersJsonGet-0" data-group="User" data-name="steveManagerUsersJsonGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Users/Json</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get all users</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/users/json</span></code></pre>
                        
                          <h2>Parameters</h2>
						  <div class="methodsubtabletitle">none</div>






                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerUsersJsonGet-404-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerUsersJsonGet-404-schema">
                                  <div id='responses-steveManagerUsersJsonGet-404-schema-404' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Users information":[{"User ID":"1","OCPP ID Tag":"ABCDEF01020304","phone":"null","name":"mc tsanta","email":"tsanta@ceid.upatras.gr"}]}</p>
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "text/html;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "text/html;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["text/html;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerUsersJsonGet-404-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerUsersJsonGet-404-schema-404');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerUsersJsonGet-404-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerUsersJsonQueryGet">
                      <article id="api-Default-steveManagerUsersJsonQueryGet-0" data-group="User" data-name="steveManagerUsersJsonQueryGet" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Users/Json/Query</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get users that respond to the query results</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/users/json/query</span></code></pre>
                        
                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">ocppIdTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersJsonQueryGet_ocppIdTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">name</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersJsonQueryGet_name">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">userPk</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersJsonQueryGet_userPk">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">email</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersJsonQueryGet_email">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerUsersJsonQueryGet-404-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerUsersJsonQueryGet-404-schema">
                                  <div id='responses-steveManagerUsersJsonQueryGet-404-schema-404' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Users information":[{"User ID":"1","OCPP ID Tag":"ABCDEF01020304","phone":"null","name":"mc tsanta","email":"tsanta@ceid.upatras.gr"}]}</p>
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "text/html;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "text/html;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["text/html;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerUsersJsonQueryGet-404-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerUsersJsonQueryGet-404-schema-404');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerUsersJsonQueryGet-404-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
					  <div id="api-Default-steveManagerOcppTagsAddSinglePost">
                      <article id="api-Default-steveManagerOcppTagsAddSinglePost-0" data-group="User" data-name="steveManagerOcppTagsAddSinglePost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/OcppTags/Add/Single</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Add a single OCPP Tag</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/ocppTags/add/single</span></code></pre>
                        
                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">parentIdTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsAddSinglePost_parentIdTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">add</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsAddSinglePost_add">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">note</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsAddSinglePost_note">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">maxActiveTransactionCount</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsAddSinglePost_maxActiveTransactionCount">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">idTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsAddSinglePost_idTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">expiration</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerOcppTagsAddSinglePost_expiration">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerUsersAddPost">
                      <article id="api-Default-steveManagerUsersAddPost-0" data-group="User" data-name="steveManagerUsersAddPost" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Users/Add</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Add a user</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="post"><code><span class="pln">/steve/manager/users/add</span></code></pre>
                        
                          <h2>Parameters</h2>





                            <div class="methodsubtabletitle">Query parameters</div>
                            <table id="methodsubtable">
                              <tr>
                                <th width="150px">Name</th>
                                <th>Description</th>
                              </tr>
                                <tr><td style="width:150px;">add</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_add">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">lastName</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_lastName">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">birthDay</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_birthDay">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">note</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_note">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.city</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_address.city">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">sex</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_sex">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">ocppIdTag</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_ocppIdTag">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">eMail</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_eMail">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.country</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_address.country">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">firstName</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_firstName">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">phone</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_phone">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.houseNumber</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_address.houseNumber">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.street</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_address.street">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr><td style="width:150px;">address.zipCode</td>
                                <td>
                                
                                
                                    <div id="d2e199_steveManagerUsersAddPost_address.zipCode">
                                        <div class="json-schema-view">
                                            <div class="primitive">
                                                <span class="type">
                                                    String
                                                </span>
                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </table>

                          <h2>Responses</h2>
                            <h3> Status: 200  </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                            </div>

                        </article>
                      </div>
                      <hr>
                    <div id="api-Default-steveManagerUsersJsonDetails1Get">
                      <article id="api-Default-steveManagerUsersJsonDetails1Get-0" data-group="User" data-name="steveManagerUsersJsonDetails1Get" data-version="0">
                        <div class="pull-left">
                          <h1>steve/Manager/Users/Json/Details/1</h1>
                          <p></p>
                        </div>
                        <div class="pull-right"></div>
                        <div class="clearfix"></div>
                        <p></p>
                        <p class="marked">Get details about a specific user (in this case user 1)</p>
                        <p></p>
                        <br />
                        <pre class="prettyprint language-html prettyprinted" data-type="get"><code><span class="pln">/steve/manager/users/json/details/1</span></code></pre>
                        

                          <h2>Parameters</h2>
						  <div class="methodsubtabletitle">none</div>






                          <h2>Responses</h2>
                            <h3> Status: 200 </h3>

                            <ul class="nav nav-tabs nav-tabs-examples" >
                                <li class="active">
                                  <a data-toggle="tab" href="#responses-steveManagerUsersJsonDetails1Get-404-schema">Response body</a>
                                </li>

                            </ul>

                            <div class="tab-content" style='margin-bottom: 10px;'>
                                <div class="tab-pane active" id="responses-steveManagerUsersJsonDetails1Get-404-schema">
                                  <div id='responses-steveManagerUsersJsonDetails1Get-404-schema-404' style="padding: 30px; border-left: 1px solid #eee; border-right: 1px solid #eee; border-bottom: 1px solid #eee;">
                                    <p>{"Zip":"26442","House Number":"15C","Email":"tsanta@ceid.upatras.gr","Sex":"Female","First Name":"mc","Additional Note":"null","Birthday":"Feb-16-1997","City":"Patras","OCPP ID Tag":"ABCDEF01020304","Phone":"null","Street":"Neoptolemou","Country":"GR","Last Name":"tsanta"}</p>
									
									<script>
                                      $(document).ready(function() {
                                        var schemaWrapper = {
  "description" : "Auto generated using Swagger Inspector",
  "content" : {
    "text/html;charset=iso-8859-1" : {
      "schema" : {
        "type" : "string",
        "x-content-type" : "text/html;charset=iso-8859-1"
      },
      "examples" : { }
    }
  }
};
                                        var schema = schemaWrapper.content["text/html;charset&#x3D;iso-8859-1"].schema;
                                        if (schema.$ref != null) {
                                          schema = defsParser.$refs.get(schema.$ref);
                                        } else {
                                          schemaWrapper.components = {};
                                          schemaWrapper.components.schemas = Object.assign({}, defs);
                                          $RefParser.dereference(schemaWrapper).catch(function(err) {
                                            console.log(err);
                                          });
                                        }

                                        //console.log(JSON.stringify(schema));
                                        var view = new JSONSchemaView(schema, 3);
                                        $('#responses-steveManagerUsersJsonDetails1Get-404-schema-data').val(stringify(schema));
                                        var result = $('#responses-steveManagerUsersJsonDetails1Get-404-schema-404');
                                        result.empty();
                                        result.append(view.render());
                                      });
                                    </script>
                                  </div>
                                  <input id='responses-steveManagerUsersJsonDetails1Get-404-schema-data' type='hidden' value=''></input>
                                </div>
                            </div>

                        </article>
                      </div>
                      <hr>
					  
					  
                  </section>
          </div>
          <div id="footer">
            <div id="api-_footer">

                <div class="license-info">All rights reserved</div>
                <div class="license-url">http://apache.org/licenses/LICENSE-2.0.html</div>
            </div>
          </div>
      </div>
    </div>
  </div>
  <script>
  (function webpackUniversalModuleDefinition(root, factory) {
  	if(typeof exports === 'object' && typeof module === 'object')
  		module.exports = factory();
  	else if(typeof define === 'function' && define.amd)
  		define("JSONFormatter", [], factory);
  	else if(typeof exports === 'object')
  		exports["JSONFormatter"] = factory();
  	else
  		root["JSONFormatter"] = factory();
  })(this, function() {
  return /******/ (function(modules) { // webpackBootstrap
  /******/ 	// The module cache
  /******/ 	var installedModules = {};
  /******/
  /******/ 	// The require function
  /******/ 	function __webpack_require__(moduleId) {
  /******/
  /******/ 		// Check if module is in cache
  /******/ 		if(installedModules[moduleId])
  /******/ 			return installedModules[moduleId].exports;
  /******/
  /******/ 		// Create a new module (and put it into the cache)
  /******/ 		var module = installedModules[moduleId] = {
  /******/ 			exports: {},
  /******/ 			id: moduleId,
  /******/ 			loaded: false
  /******/ 		};
  /******/
  /******/ 		// Execute the module function
  /******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
  /******/
  /******/ 		// Flag the module as loaded
  /******/ 		module.loaded = true;
  /******/
  /******/ 		// Return the exports of the module
  /******/ 		return module.exports;
  /******/ 	}
  /******/
  /******/
  /******/ 	// expose the modules object (__webpack_modules__)
  /******/ 	__webpack_require__.m = modules;
  /******/
  /******/ 	// expose the module cache
  /******/ 	__webpack_require__.c = installedModules;
  /******/
  /******/ 	// __webpack_public_path__
  /******/ 	__webpack_require__.p = "dist";
  /******/
  /******/ 	// Load entry module and return exports
  /******/ 	return __webpack_require__(0);
  /******/ })
  /************************************************************************/
  /******/ ([
  /* 0 */
  /***/ function(module, exports, __webpack_require__) {
  
  	module.exports = __webpack_require__(1);
  
  
  /***/ },
  /* 1 */
  /***/ function(module, exports, __webpack_require__) {
  
  	"use strict";
  	__webpack_require__(2);
  	var helpers_ts_1 = __webpack_require__(6);
  	var DATE_STRING_REGEX = /(^\d{1,4}[\.|\\/|-]\d{1,2}[\.|\\/|-]\d{1,4})(\s*(?:0?[1-9]:[0-5]|1(?=[012])\d:[0-5])\d\s*[ap]m)?$/;
  	var PARTIAL_DATE_REGEX = /\d{2}:\d{2}:\d{2} GMT-\d{4}/;
  	var JSON_DATE_REGEX = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z/;
  	// When toggleing, don't animated removal or addition of more than a few items
  	var MAX_ANIMATED_TOGGLE_ITEMS = 10;
  	var requestAnimationFrame = window.requestAnimationFrame || function (cb) { cb(); return 0; };
  	;
  	var _defaultConfig = {
  	    hoverPreviewEnabled: false,
  	    hoverPreviewArrayCount: 100,
  	    hoverPreviewFieldCount: 5,
  	    animateOpen: true,
  	    animateClose: true,
  	    theme: null
  	};
  	module.exports = (function () {
  	    /**
  	     * @param {object} json The JSON object you want to render. It has to be an
  	     * object or array. Do NOT pass raw JSON string.
  	     *
  	     * @param {number} [open=1] his number indicates up to how many levels the
  	     * rendered tree should expand. Set it to `0` to make the whole tree collapsed
  	     * or set it to `Infinity` to expand the tree deeply
  	     *
  	     * @param {object} [config=defaultConfig] -
  	     *  defaultConfig = {
  	     *   hoverPreviewEnabled: false,
  	     *   hoverPreviewArrayCount: 100,
  	     *   hoverPreviewFieldCount: 5
  	     * }
  	     *
  	     * Available configurations:
  	     *  #####Hover Preview
  	     * * `hoverPreviewEnabled`:  enable preview on hover
  	     * * `hoverPreviewArrayCount`: number of array items to show in preview Any
  	     *    array larger than this number will be shown as `Array[XXX]` where `XXX`
  	     *    is length of the array.
  	     * * `hoverPreviewFieldCount`: number of object properties to show for object
  	     *   preview. Any object with more properties that thin number will be
  	     *   truncated.
  	     *
  	     * @param {string} [key=undefined] The key that this object in it's parent
  	     * context
  	    */
  	    function JSONFormatter(json, open, config, key) {
  	        if (open === void 0) { open = 1; }
  	        if (config === void 0) { config = _defaultConfig; }
  	        this.json = json;
  	        this.open = open;
  	        this.config = config;
  	        this.key = key;
  	        // Hold the open state after the toggler is used
  	        this._isOpen = null;
  	        // Setting default values for config object
  	        if (this.config.hoverPreviewEnabled === undefined) {
  	            this.config.hoverPreviewEnabled = _defaultConfig.hoverPreviewEnabled;
  	        }
  	        if (this.config.hoverPreviewArrayCount === undefined) {
  	            this.config.hoverPreviewArrayCount = _defaultConfig.hoverPreviewArrayCount;
  	        }
  	        if (this.config.hoverPreviewFieldCount === undefined) {
  	            this.config.hoverPreviewFieldCount = _defaultConfig.hoverPreviewFieldCount;
  	        }
  	    }
  	    Object.defineProperty(JSONFormatter.prototype, "isOpen", {
  	        /*
  	         * is formatter open?
  	        */
  	        get: function () {
  	            if (this._isOpen !== null) {
  	                return this._isOpen;
  	            }
  	            else {
  	                return this.open > 0;
  	            }
  	        },
  	        /*
  	         * set open state (from toggler)
  	        */
  	        set: function (value) {
  	            this._isOpen = value;
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "isDate", {
  	        /*
  	         * is this a date string?
  	        */
  	        get: function () {
  	            return (this.type === 'string') &&
  	                (DATE_STRING_REGEX.test(this.json) ||
  	                    JSON_DATE_REGEX.test(this.json) ||
  	                    PARTIAL_DATE_REGEX.test(this.json));
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "isUrl", {
  	        /*
  	         * is this a URL string?
  	        */
  	        get: function () {
  	            return this.type === 'string' && (this.json.indexOf('http') === 0);
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "isArray", {
  	        /*
  	         * is this an array?
  	        */
  	        get: function () {
  	            return Array.isArray(this.json);
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "isObject", {
  	        /*
  	         * is this an object?
  	         * Note: In this context arrays are object as well
  	        */
  	        get: function () {
  	            return helpers_ts_1.isObject(this.json);
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "isEmptyObject", {
  	        /*
  	         * is this an empty object with no properties?
  	        */
  	        get: function () {
  	            return !this.keys.length && !this.isArray;
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "isEmpty", {
  	        /*
  	         * is this an empty object or array?
  	        */
  	        get: function () {
  	            return this.isEmptyObject || (this.keys && !this.keys.length && this.isArray);
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "hasKey", {
  	        /*
  	         * did we receive a key argument?
  	         * This means that the formatter was called as a sub formatter of a parent formatter
  	        */
  	        get: function () {
  	            return typeof this.key !== 'undefined';
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "constructorName", {
  	        /*
  	         * if this is an object, get constructor function name
  	        */
  	        get: function () {
  	            return helpers_ts_1.getObjectName(this.json);
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "type", {
  	        /*
  	         * get type of this value
  	         * Possible values: all JavaScript primitive types plus "array" and "null"
  	        */
  	        get: function () {
  	            return helpers_ts_1.getType(this.json);
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    Object.defineProperty(JSONFormatter.prototype, "keys", {
  	        /*
  	         * get object keys
  	         * If there is an empty key we pad it wit quotes to make it visible
  	        */
  	        get: function () {
  	            if (this.isObject) {
  	                return Object.keys(this.json).map(function (key) { return key ? key : '""'; });
  	            }
  	            else {
  	                return [];
  	            }
  	        },
  	        enumerable: true,
  	        configurable: true
  	    });
  	    /**
  	     * Toggles `isOpen` state
  	     *
  	    */
  	    JSONFormatter.prototype.toggleOpen = function () {
  	        this.isOpen = !this.isOpen;
  	        if (this.element) {
  	            if (this.isOpen) {
  	                this.appendChildren(this.config.animateOpen);
  	            }
  	            else {
  	                this.removeChildren(this.config.animateClose);
  	            }
  	            this.element.classList.toggle(helpers_ts_1.cssClass('open'));
  	        }
  	    };
  	    /**
  	    * Open all children up to a certain depth.
  	    * Allows actions such as expand all/collapse all
  	    *
  	    */
  	    JSONFormatter.prototype.openAtDepth = function (depth) {
  	        if (depth === void 0) { depth = 1; }
  	        if (depth < 0) {
  	            return;
  	        }
  	        this.open = depth;
  	        this.isOpen = (depth !== 0);
  	        if (this.element) {
  	            this.removeChildren(false);
  	            if (depth === 0) {
  	                this.element.classList.remove(helpers_ts_1.cssClass('open'));
  	            }
  	            else {
  	                this.appendChildren(this.config.animateOpen);
  	                this.element.classList.add(helpers_ts_1.cssClass('open'));
  	            }
  	        }
  	    };
  	    /**
  	     * Generates inline preview
  	     *
  	     * @returns {string}
  	    */
  	    JSONFormatter.prototype.getInlinepreview = function () {
  	        var _this = this;
  	        if (this.isArray) {
  	            // if array length is greater then 100 it shows "Array[101]"
  	            if (this.json.length > this.config.hoverPreviewArrayCount) {
  	                return "Array[" + this.json.length + "]";
  	            }
  	            else {
  	                return "[" + this.json.map(helpers_ts_1.getPreview).join(', ') + "]";
  	            }
  	        }
  	        else {
  	            var keys = this.keys;
  	            // the first five keys (like Chrome Developer Tool)
  	            var narrowKeys = keys.slice(0, this.config.hoverPreviewFieldCount);
  	            // json value schematic information
  	            var kvs = narrowKeys.map(function (key) { return (key + ":" + helpers_ts_1.getPreview(_this.json[key])); });
  	            // if keys count greater then 5 then show ellipsis
  	            var ellipsis = keys.length >= this.config.hoverPreviewFieldCount ? '…' : '';
  	            return "{" + kvs.join(', ') + ellipsis + "}";
  	        }
  	    };
  	    /**
  	     * Renders an HTML element and installs event listeners
  	     *
  	     * @returns {HTMLDivElement}
  	    */
  	    JSONFormatter.prototype.render = function () {
  	        // construct the root element and assign it to this.element
  	        this.element = helpers_ts_1.createElement('div', 'row');
  	        // construct the toggler link
  	        var togglerLink = helpers_ts_1.createElement('a', 'toggler-link');
  	        // if this is an object we need a wrapper span (toggler)
  	        if (this.isObject) {
  	            togglerLink.appendChild(helpers_ts_1.createElement('span', 'toggler'));
  	        }
  	        // if this is child of a parent formatter we need to append the key
  	        if (this.hasKey) {
  	            togglerLink.appendChild(helpers_ts_1.createElement('span', 'key', this.key + ":"));
  	        }
  	        // Value for objects and arrays
  	        if (this.isObject) {
  	            // construct the value holder element
  	            var value = helpers_ts_1.createElement('span', 'value');
  	            // we need a wrapper span for objects
  	            var objectWrapperSpan = helpers_ts_1.createElement('span');
  	            // get constructor name and append it to wrapper span
  	            var constructorName = helpers_ts_1.createElement('span', 'constructor-name', this.constructorName);
  	            objectWrapperSpan.appendChild(constructorName);
  	            // if it's an array append the array specific elements like brackets and length
  	            if (this.isArray) {
  	                var arrayWrapperSpan = helpers_ts_1.createElement('span');
  	                arrayWrapperSpan.appendChild(helpers_ts_1.createElement('span', 'bracket', '['));
  	                arrayWrapperSpan.appendChild(helpers_ts_1.createElement('span', 'number', (this.json.length)));
  	                arrayWrapperSpan.appendChild(helpers_ts_1.createElement('span', 'bracket', ']'));
  	                objectWrapperSpan.appendChild(arrayWrapperSpan);
  	            }
  	            // append object wrapper span to toggler link
  	            value.appendChild(objectWrapperSpan);
  	            togglerLink.appendChild(value);
  	        }
  	        else {
  	            // make a value holder element
  	            var value = this.isUrl ? helpers_ts_1.createElement('a') : helpers_ts_1.createElement('span');
  	            // add type and other type related CSS classes
  	            value.classList.add(helpers_ts_1.cssClass(this.type));
  	            if (this.isDate) {
  	                value.classList.add(helpers_ts_1.cssClass('date'));
  	            }
  	            if (this.isUrl) {
  	                value.classList.add(helpers_ts_1.cssClass('url'));
  	                value.setAttribute('href', this.json);
  	            }
  	            // Append value content to value element
  	            var valuePreview = helpers_ts_1.getValuePreview(this.json, this.json);
  	            value.appendChild(document.createTextNode(valuePreview));
  	            // append the value element to toggler link
  	            togglerLink.appendChild(value);
  	        }
  	        // if hover preview is enabled, append the inline preview element
  	        if (this.isObject && this.config.hoverPreviewEnabled) {
  	            var preview = helpers_ts_1.createElement('span', 'preview-text');
  	            preview.appendChild(document.createTextNode(this.getInlinepreview()));
  	            togglerLink.appendChild(preview);
  	        }
  	        // construct a children element
  	        var children = helpers_ts_1.createElement('div', 'children');
  	        // set CSS classes for children
  	        if (this.isObject) {
  	            children.classList.add(helpers_ts_1.cssClass('object'));
  	        }
  	        if (this.isArray) {
  	            children.classList.add(helpers_ts_1.cssClass('array'));
  	        }
  	        if (this.isEmpty) {
  	            children.classList.add(helpers_ts_1.cssClass('empty'));
  	        }
  	        // set CSS classes for root element
  	        if (this.config && this.config.theme) {
  	            this.element.classList.add(helpers_ts_1.cssClass(this.config.theme));
  	        }
  	        if (this.isOpen) {
  	            this.element.classList.add(helpers_ts_1.cssClass('open'));
  	        }
  	        // append toggler and children elements to root element
  	        this.element.appendChild(togglerLink);
  	        this.element.appendChild(children);
  	        // if formatter is set to be open call appendChildren
  	        if (this.isObject && this.isOpen) {
  	            this.appendChildren();
  	        }
  	        // add event listener for toggling
  	        if (this.isObject) {
  	            togglerLink.addEventListener('click', this.toggleOpen.bind(this));
  	        }
  	        return this.element;
  	    };
  	    /**
  	     * Appends all the children to children element
  	     * Animated option is used when user triggers this via a click
  	    */
  	    JSONFormatter.prototype.appendChildren = function (animated) {
  	        var _this = this;
  	        if (animated === void 0) { animated = false; }
  	        var children = this.element.querySelector("div." + helpers_ts_1.cssClass('children'));
  	        if (!children || this.isEmpty) {
  	            return;
  	        }
  	        if (animated) {
  	            var index_1 = 0;
  	            var addAChild_1 = function () {
  	                var key = _this.keys[index_1];
  	                var formatter = new JSONFormatter(_this.json[key], _this.open - 1, _this.config, key);
  	                children.appendChild(formatter.render());
  	                index_1 += 1;
  	                if (index_1 < _this.keys.length) {
  	                    if (index_1 > MAX_ANIMATED_TOGGLE_ITEMS) {
  	                        addAChild_1();
  	                    }
  	                    else {
  	                        requestAnimationFrame(addAChild_1);
  	                    }
  	                }
  	            };
  	            requestAnimationFrame(addAChild_1);
  	        }
  	        else {
  	            this.keys.forEach(function (key) {
  	                var formatter = new JSONFormatter(_this.json[key], _this.open - 1, _this.config, key);
  	                children.appendChild(formatter.render());
  	            });
  	        }
  	    };
  	    /**
  	     * Removes all the children from children element
  	     * Animated option is used when user triggers this via a click
  	    */
  	    JSONFormatter.prototype.removeChildren = function (animated) {
  	        if (animated === void 0) { animated = false; }
  	        var childrenElement = this.element.querySelector("div." + helpers_ts_1.cssClass('children'));
  	        if (animated) {
  	            var childrenRemoved_1 = 0;
  	            var removeAChild_1 = function () {
  	                if (childrenElement && childrenElement.children.length) {
  	                    childrenElement.removeChild(childrenElement.children[0]);
  	                    childrenRemoved_1 += 1;
  	                    if (childrenRemoved_1 > MAX_ANIMATED_TOGGLE_ITEMS) {
  	                        removeAChild_1();
  	                    }
  	                    else {
  	                        requestAnimationFrame(removeAChild_1);
  	                    }
  	                }
  	            };
  	            requestAnimationFrame(removeAChild_1);
  	        }
  	        else {
  	            if (childrenElement) {
  	                childrenElement.innerHTML = '';
  	            }
  	        }
  	    };
  	    return JSONFormatter;
  	}());
  
  
  /***/ },
  /* 2 */
  /***/ function(module, exports, __webpack_require__) {
  
  	// style-loader: Adds some css to the DOM by adding a <style> tag
  	
  	// load the styles
  	var content = __webpack_require__(3);
  	if(typeof content === 'string') content = [[module.id, content, '']];
  	// add the styles to the DOM
  	var update = __webpack_require__(5)(content, {"sourceMap":true});
  	if(content.locals) module.exports = content.locals;
  	// Hot Module Replacement
  	if(false) {
  		// When the styles change, update the <style> tags
  		if(!content.locals) {
  			module.hot.accept("!!./../node_modules/css-loader/index.js?sourceMap!./../node_modules/less-loader/index.js?sourceMap!./style.less", function() {
  				var newContent = require("!!./../node_modules/css-loader/index.js?sourceMap!./../node_modules/less-loader/index.js?sourceMap!./style.less");
  				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
  				update(newContent);
  			});
  		}
  		// When the module is disposed, remove the <style> tags
  		module.hot.dispose(function() { update(); });
  	}
  
  /***/ },
  /* 3 */
  /***/ function(module, exports, __webpack_require__) {
  
  	exports = module.exports = __webpack_require__(4)();
  	// imports
  	
  	
  	// module
  	exports.push([module.id, ".json-formatter-row {\n  font-family: monospace;\n}\n.json-formatter-row,\n.json-formatter-row a,\n.json-formatter-row a:hover {\n  color: black;\n  text-decoration: none;\n}\n.json-formatter-row .json-formatter-row {\n  margin-left: 1rem;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty {\n  opacity: 0.5;\n  margin-left: 1rem;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty:after {\n  display: none;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-object:after {\n  content: \"No properties\";\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-array:after {\n  content: \"[]\";\n}\n.json-formatter-row .json-formatter-string {\n  color: green;\n  white-space: pre;\n  word-wrap: break-word;\n}\n.json-formatter-row .json-formatter-number {\n  color: blue;\n}\n.json-formatter-row .json-formatter-boolean {\n  color: red;\n}\n.json-formatter-row .json-formatter-null {\n  color: #855A00;\n}\n.json-formatter-row .json-formatter-undefined {\n  color: #ca0b69;\n}\n.json-formatter-row .json-formatter-function {\n  color: #FF20ED;\n}\n.json-formatter-row .json-formatter-date {\n  background-color: rgba(0, 0, 0, 0.05);\n}\n.json-formatter-row .json-formatter-url {\n  text-decoration: underline;\n  color: blue;\n  cursor: pointer;\n}\n.json-formatter-row .json-formatter-bracket {\n  color: blue;\n}\n.json-formatter-row .json-formatter-key {\n  color: #00008B;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-row .json-formatter-constructor-name {\n  cursor: pointer;\n}\n.json-formatter-row .json-formatter-toggler {\n  line-height: 1.2rem;\n  font-size: 0.7rem;\n  vertical-align: middle;\n  opacity: 0.6;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-row .json-formatter-toggler:after {\n  display: inline-block;\n  transition: transform 100ms ease-in;\n  content: \"\\25BA\";\n}\n.json-formatter-row > a > .json-formatter-preview-text {\n  opacity: 0;\n  transition: opacity 0.15s ease-in;\n  font-style: italic;\n}\n.json-formatter-row:hover > a > .json-formatter-preview-text {\n  opacity: 0.6;\n}\n.json-formatter-row.json-formatter-open > .json-formatter-toggler-link .json-formatter-toggler:after {\n  transform: rotate(90deg);\n}\n.json-formatter-row.json-formatter-open > .json-formatter-children:after {\n  display: inline-block;\n}\n.json-formatter-row.json-formatter-open > a > .json-formatter-preview-text {\n  display: none;\n}\n.json-formatter-row.json-formatter-open.json-formatter-empty:after {\n  display: block;\n}\n.json-formatter-dark.json-formatter-row {\n  font-family: monospace;\n}\n.json-formatter-dark.json-formatter-row,\n.json-formatter-dark.json-formatter-row a,\n.json-formatter-dark.json-formatter-row a:hover {\n  color: white;\n  text-decoration: none;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-row {\n  margin-left: 1rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty {\n  opacity: 0.5;\n  margin-left: 1rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty:after {\n  display: none;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-object:after {\n  content: \"No properties\";\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-array:after {\n  content: \"[]\";\n}\n.json-formatter-dark.json-formatter-row .json-formatter-string {\n  color: #31F031;\n  white-space: pre;\n  word-wrap: break-word;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-number {\n  color: #66C2FF;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-boolean {\n  color: #EC4242;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-null {\n  color: #EEC97D;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-undefined {\n  color: #ef8fbe;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-function {\n  color: #FD48CB;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-date {\n  background-color: rgba(255, 255, 255, 0.05);\n}\n.json-formatter-dark.json-formatter-row .json-formatter-url {\n  text-decoration: underline;\n  color: #027BFF;\n  cursor: pointer;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-bracket {\n  color: #9494FF;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-key {\n  color: #23A0DB;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-constructor-name {\n  cursor: pointer;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler {\n  line-height: 1.2rem;\n  font-size: 0.7rem;\n  vertical-align: middle;\n  opacity: 0.6;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler:after {\n  display: inline-block;\n  transition: transform 100ms ease-in;\n  content: \"\\25BA\";\n}\n.json-formatter-dark.json-formatter-row > a > .json-formatter-preview-text {\n  opacity: 0;\n  transition: opacity 0.15s ease-in;\n  font-style: italic;\n}\n.json-formatter-dark.json-formatter-row:hover > a > .json-formatter-preview-text {\n  opacity: 0.6;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > .json-formatter-toggler-link .json-formatter-toggler:after {\n  transform: rotate(90deg);\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > .json-formatter-children:after {\n  display: inline-block;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > a > .json-formatter-preview-text {\n  display: none;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open.json-formatter-empty:after {\n  display: block;\n}\n", "", {"version":3,"sources":["/./src/style.less","/./src/style.less"],"names":[],"mappings":"AA0GA;EA3FE,uBAAA;CCbD;ADcC;;;EACE,aAAA;EACA,sBAAA;CCVH;ADkGD;EApFI,kBAAA;CCXH;ADeG;EACE,aAAA;EACA,kBAAA;CCbL;ADeK;EAAU,cAAA;CCZf;ADaK;EAAgC,yBAAA;CCVrC;ADWK;EAA+B,cAAA;CCRpC;ADkFD;EArEI,aAAA;EACA,iBAAA;EACA,sBAAA;CCVH;AD6ED;EAjE2B,YAAA;CCT1B;AD0ED;EAhE4B,WAAA;CCP3B;ADuED;EA/DyB,eAAA;CCLxB;ADoED;EA9D8B,eAAA;CCH7B;ADiED;EA7D6B,eAAA;CCD5B;AD8DD;EA5DyB,sCAAA;CCCxB;AD2DD;EA1DI,2BAAA;EACA,YAAA;EACA,gBAAA;CCEH;ADsDD;EArD4B,YAAA;CCE3B;ADmDD;EAnDI,eAAA;EACA,gBAAA;EACA,sBAAA;CCGH;AD8CD;EA9CI,gBAAA;CCGH;AD2CD;EA1CI,oBAAA;EACA,kBAAA;EACA,uBAAA;EACA,aAAA;EACA,gBAAA;EACA,sBAAA;CCEH;ADAG;EACE,sBAAA;EACA,oCAAA;EACA,iBAAA;CCEL;AD8BD;EA1BI,WAAA;EACA,kCAAA;EACA,mBAAA;CCDH;ADGC;EACE,aAAA;CCDH;ADKC;EAEI,yBAAA;CCJL;ADEC;EAKI,sBAAA;CCJL;ADDC;EAQI,cAAA;CCJL;ADMG;EACE,eAAA;CCJL;ADeD;EAhGE,uBAAA;CCoFD;ADnFC;;;EACE,aAAA;EACA,sBAAA;CCuFH;ADMD;EAzFI,kBAAA;CCsFH;ADlFG;EACE,aAAA;EACA,kBAAA;CCoFL;ADlFK;EAAU,cAAA;CCqFf;ADpFK;EAAgC,yBAAA;CCuFrC;ADtFK;EAA+B,cAAA;CCyFpC;ADVD;EA1EI,eAAA;EACA,iBAAA;EACA,sBAAA;CCuFH;ADfD;EAtE2B,eAAA;CCwF1B;ADlBD;EArE4B,eAAA;CC0F3B;ADrBD;EApEyB,eAAA;CC4FxB;ADxBD;EAnE8B,eAAA;CC8F7B;AD3BD;EAlE6B,eAAA;CCgG5B;AD9BD;EAjEyB,4CAAA;CCkGxB;ADjCD;EA/DI,2BAAA;EACA,eAAA;EACA,gBAAA;CCmGH;ADtCD;EA1D4B,eAAA;CCmG3B;ADzCD;EAxDI,eAAA;EACA,gBAAA;EACA,sBAAA;CCoGH;AD9CD;EAnDI,gBAAA;CCoGH;ADjDD;EA/CI,oBAAA;EACA,kBAAA;EACA,uBAAA;EACA,aAAA;EACA,gBAAA;EACA,sBAAA;CCmGH;ADjGG;EACE,sBAAA;EACA,oCAAA;EACA,iBAAA;CCmGL;AD9DD;EA/BI,WAAA;EACA,kCAAA;EACA,mBAAA;CCgGH;AD9FC;EACE,aAAA;CCgGH;AD5FC;EAEI,yBAAA;CC6FL;AD/FC;EAKI,sBAAA;CC6FL;ADlGC;EAQI,cAAA;CC6FL;AD3FG;EACE,eAAA;CC6FL","file":"style.less","sourcesContent":[".theme(\n  @default-color: black,\n  @string-color: green,\n  @number-color: blue,\n  @boolean-color: red,\n  @null-color: #855A00,\n  @undefined-color: rgb(202, 11, 105),\n  @function-color: #FF20ED,\n  @rotate-time: 100ms,\n  @toggler-opacity: 0.6,\n  @toggler-color: #45376F,\n  @bracket-color: blue,\n  @key-color: #00008B,\n  @url-color: blue ){\n\n  font-family: monospace;\n  &, a, a:hover {\n    color: @default-color;\n    text-decoration: none;\n  }\n\n  .json-formatter-row {\n    margin-left: 1rem;\n  }\n\n  .json-formatter-children {\n    &.json-formatter-empty {\n      opacity: 0.5;\n      margin-left: 1rem;\n\n      &:after { display: none; }\n      &.json-formatter-object:after { content: \"No properties\"; }\n      &.json-formatter-array:after { content: \"[]\"; }\n    }\n  }\n\n  .json-formatter-string {\n    color: @string-color;\n    white-space: pre;\n    word-wrap: break-word;\n  }\n  .json-formatter-number { color: @number-color; }\n  .json-formatter-boolean { color: @boolean-color; }\n  .json-formatter-null { color: @null-color; }\n  .json-formatter-undefined { color: @undefined-color; }\n  .json-formatter-function { color: @function-color; }\n  .json-formatter-date { background-color: fade(@default-color, 5%); }\n  .json-formatter-url {\n    text-decoration: underline;\n    color: @url-color;\n    cursor: pointer;\n  }\n\n  .json-formatter-bracket { color: @bracket-color; }\n  .json-formatter-key {\n    color: @key-color;\n    cursor: pointer;\n    padding-right: 0.2rem;\n  }\n  .json-formatter-constructor-name {\n    cursor: pointer;\n  }\n\n  .json-formatter-toggler {\n    line-height: 1.2rem;\n    font-size: 0.7rem;\n    vertical-align: middle;\n    opacity: @toggler-opacity;\n    cursor: pointer;\n    padding-right: 0.2rem;\n\n    &:after {\n      display: inline-block;\n      transition: transform @rotate-time ease-in;\n      content: \"►\";\n    }\n  }\n\n  // Inline preview on hover (optional)\n  > a > .json-formatter-preview-text {\n    opacity: 0;\n    transition: opacity .15s ease-in;\n    font-style: italic;\n  }\n  &:hover > a > .json-formatter-preview-text {\n    opacity: 0.6;\n  }\n\n  // Open state\n  &.json-formatter-open {\n    > .json-formatter-toggler-link .json-formatter-toggler:after{\n      transform: rotate(90deg);\n    }\n    > .json-formatter-children:after {\n      display: inline-block;\n    }\n    > a > .json-formatter-preview-text {\n      display: none;\n    }\n    &.json-formatter-empty:after {\n      display: block;\n    }\n  }\n}\n\n// Default theme\n.json-formatter-row {\n  .theme();\n}\n\n// Dark theme\n.json-formatter-dark.json-formatter-row {\n  .theme(\n    @default-color: white,\n    @string-color: #31F031,\n    @number-color: #66C2FF,\n    @boolean-color: #EC4242,\n    @null-color: #EEC97D,\n    @undefined-color: rgb(239, 143, 190),\n    @function-color: #FD48CB,\n    @rotate-time: 100ms,\n    @toggler-opacity: 0.6,\n    @toggler-color: #45376F,\n    @bracket-color: #9494FF,\n    @key-color: #23A0DB,\n    @url-color: #027BFF);\n}\n",".json-formatter-row {\n  font-family: monospace;\n}\n.json-formatter-row,\n.json-formatter-row a,\n.json-formatter-row a:hover {\n  color: black;\n  text-decoration: none;\n}\n.json-formatter-row .json-formatter-row {\n  margin-left: 1rem;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty {\n  opacity: 0.5;\n  margin-left: 1rem;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty:after {\n  display: none;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-object:after {\n  content: \"No properties\";\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-array:after {\n  content: \"[]\";\n}\n.json-formatter-row .json-formatter-string {\n  color: green;\n  white-space: pre;\n  word-wrap: break-word;\n}\n.json-formatter-row .json-formatter-number {\n  color: blue;\n}\n.json-formatter-row .json-formatter-boolean {\n  color: red;\n}\n.json-formatter-row .json-formatter-null {\n  color: #855A00;\n}\n.json-formatter-row .json-formatter-undefined {\n  color: #ca0b69;\n}\n.json-formatter-row .json-formatter-function {\n  color: #FF20ED;\n}\n.json-formatter-row .json-formatter-date {\n  background-color: rgba(0, 0, 0, 0.05);\n}\n.json-formatter-row .json-formatter-url {\n  text-decoration: underline;\n  color: blue;\n  cursor: pointer;\n}\n.json-formatter-row .json-formatter-bracket {\n  color: blue;\n}\n.json-formatter-row .json-formatter-key {\n  color: #00008B;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-row .json-formatter-constructor-name {\n  cursor: pointer;\n}\n.json-formatter-row .json-formatter-toggler {\n  line-height: 1.2rem;\n  font-size: 0.7rem;\n  vertical-align: middle;\n  opacity: 0.6;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-row .json-formatter-toggler:after {\n  display: inline-block;\n  transition: transform 100ms ease-in;\n  content: \"►\";\n}\n.json-formatter-row > a > .json-formatter-preview-text {\n  opacity: 0;\n  transition: opacity 0.15s ease-in;\n  font-style: italic;\n}\n.json-formatter-row:hover > a > .json-formatter-preview-text {\n  opacity: 0.6;\n}\n.json-formatter-row.json-formatter-open > .json-formatter-toggler-link .json-formatter-toggler:after {\n  transform: rotate(90deg);\n}\n.json-formatter-row.json-formatter-open > .json-formatter-children:after {\n  display: inline-block;\n}\n.json-formatter-row.json-formatter-open > a > .json-formatter-preview-text {\n  display: none;\n}\n.json-formatter-row.json-formatter-open.json-formatter-empty:after {\n  display: block;\n}\n.json-formatter-dark.json-formatter-row {\n  font-family: monospace;\n}\n.json-formatter-dark.json-formatter-row,\n.json-formatter-dark.json-formatter-row a,\n.json-formatter-dark.json-formatter-row a:hover {\n  color: white;\n  text-decoration: none;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-row {\n  margin-left: 1rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty {\n  opacity: 0.5;\n  margin-left: 1rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty:after {\n  display: none;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-object:after {\n  content: \"No properties\";\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-array:after {\n  content: \"[]\";\n}\n.json-formatter-dark.json-formatter-row .json-formatter-string {\n  color: #31F031;\n  white-space: pre;\n  word-wrap: break-word;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-number {\n  color: #66C2FF;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-boolean {\n  color: #EC4242;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-null {\n  color: #EEC97D;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-undefined {\n  color: #ef8fbe;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-function {\n  color: #FD48CB;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-date {\n  background-color: rgba(255, 255, 255, 0.05);\n}\n.json-formatter-dark.json-formatter-row .json-formatter-url {\n  text-decoration: underline;\n  color: #027BFF;\n  cursor: pointer;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-bracket {\n  color: #9494FF;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-key {\n  color: #23A0DB;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-constructor-name {\n  cursor: pointer;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler {\n  line-height: 1.2rem;\n  font-size: 0.7rem;\n  vertical-align: middle;\n  opacity: 0.6;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler:after {\n  display: inline-block;\n  transition: transform 100ms ease-in;\n  content: \"►\";\n}\n.json-formatter-dark.json-formatter-row > a > .json-formatter-preview-text {\n  opacity: 0;\n  transition: opacity 0.15s ease-in;\n  font-style: italic;\n}\n.json-formatter-dark.json-formatter-row:hover > a > .json-formatter-preview-text {\n  opacity: 0.6;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > .json-formatter-toggler-link .json-formatter-toggler:after {\n  transform: rotate(90deg);\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > .json-formatter-children:after {\n  display: inline-block;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > a > .json-formatter-preview-text {\n  display: none;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open.json-formatter-empty:after {\n  display: block;\n}\n"],"sourceRoot":"webpack://"}]);
  	
  	// exports
  
  
  /***/ },
  /* 4 */
  /***/ function(module, exports) {
  
  	/*
  		MIT License http://www.opensource.org/licenses/mit-license.php
  		Author Tobias Koppers @sokra
  	*/
  	// css base code, injected by the css-loader
  	module.exports = function() {
  		var list = [];
  	
  		// return the list of modules as css string
  		list.toString = function toString() {
  			var result = [];
  			for(var i = 0; i < this.length; i++) {
  				var item = this[i];
  				if(item[2]) {
  					result.push("@media " + item[2] + "{" + item[1] + "}");
  				} else {
  					result.push(item[1]);
  				}
  			}
  			return result.join("");
  		};
  	
  		// import a list of modules into the list
  		list.i = function(modules, mediaQuery) {
  			if(typeof modules === "string")
  				modules = [[null, modules, ""]];
  			var alreadyImportedModules = {};
  			for(var i = 0; i < this.length; i++) {
  				var id = this[i][0];
  				if(typeof id === "number")
  					alreadyImportedModules[id] = true;
  			}
  			for(i = 0; i < modules.length; i++) {
  				var item = modules[i];
  				// skip already imported module
  				// this implementation is not 100% perfect for weird media query combinations
  				//  when a module is imported multiple times with different media queries.
  				//  I hope this will never occur (Hey this way we have smaller bundles)
  				if(typeof item[0] !== "number" || !alreadyImportedModules[item[0]]) {
  					if(mediaQuery && !item[2]) {
  						item[2] = mediaQuery;
  					} else if(mediaQuery) {
  						item[2] = "(" + item[2] + ") and (" + mediaQuery + ")";
  					}
  					list.push(item);
  				}
  			}
  		};
  		return list;
  	};
  
  
  /***/ },
  /* 5 */
  /***/ function(module, exports, __webpack_require__) {
  
  	/*
  		MIT License http://www.opensource.org/licenses/mit-license.php
  		Author Tobias Koppers @sokra
  	*/
  	var stylesInDom = {},
  		memoize = function(fn) {
  			var memo;
  			return function () {
  				if (typeof memo === "undefined") memo = fn.apply(this, arguments);
  				return memo;
  			};
  		},
  		isOldIE = memoize(function() {
  			return /msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase());
  		}),
  		getHeadElement = memoize(function () {
  			return document.head || document.getElementsByTagName("head")[0];
  		}),
  		singletonElement = null,
  		singletonCounter = 0,
  		styleElementsInsertedAtTop = [];
  	
  	module.exports = function(list, options) {
  		if(false) {
  			if(typeof document !== "object") throw new Error("The style-loader cannot be used in a non-browser environment");
  		}
  	
  		options = options || {};
  		// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
  		// tags it will allow on a page
  		if (typeof options.singleton === "undefined") options.singleton = isOldIE();
  	
  		// By default, add <style> tags to the bottom of <head>.
  		if (typeof options.insertAt === "undefined") options.insertAt = "bottom";
  	
  		var styles = listToStyles(list);
  		addStylesToDom(styles, options);
  	
  		return function update(newList) {
  			var mayRemove = [];
  			for(var i = 0; i < styles.length; i++) {
  				var item = styles[i];
  				var domStyle = stylesInDom[item.id];
  				domStyle.refs--;
  				mayRemove.push(domStyle);
  			}
  			if(newList) {
  				var newStyles = listToStyles(newList);
  				addStylesToDom(newStyles, options);
  			}
  			for(var i = 0; i < mayRemove.length; i++) {
  				var domStyle = mayRemove[i];
  				if(domStyle.refs === 0) {
  					for(var j = 0; j < domStyle.parts.length; j++)
  						domStyle.parts[j]();
  					delete stylesInDom[domStyle.id];
  				}
  			}
  		};
  	}
  	
  	function addStylesToDom(styles, options) {
  		for(var i = 0; i < styles.length; i++) {
  			var item = styles[i];
  			var domStyle = stylesInDom[item.id];
  			if(domStyle) {
  				domStyle.refs++;
  				for(var j = 0; j < domStyle.parts.length; j++) {
  					domStyle.parts[j](item.parts[j]);
  				}
  				for(; j < item.parts.length; j++) {
  					domStyle.parts.push(addStyle(item.parts[j], options));
  				}
  			} else {
  				var parts = [];
  				for(var j = 0; j < item.parts.length; j++) {
  					parts.push(addStyle(item.parts[j], options));
  				}
  				stylesInDom[item.id] = {id: item.id, refs: 1, parts: parts};
  			}
  		}
  	}
  	
  	function listToStyles(list) {
  		var styles = [];
  		var newStyles = {};
  		for(var i = 0; i < list.length; i++) {
  			var item = list[i];
  			var id = item[0];
  			var css = item[1];
  			var media = item[2];
  			var sourceMap = item[3];
  			var part = {css: css, media: media, sourceMap: sourceMap};
  			if(!newStyles[id])
  				styles.push(newStyles[id] = {id: id, parts: [part]});
  			else
  				newStyles[id].parts.push(part);
  		}
  		return styles;
  	}
  	
  	function insertStyleElement(options, styleElement) {
  		var head = getHeadElement();
  		var lastStyleElementInsertedAtTop = styleElementsInsertedAtTop[styleElementsInsertedAtTop.length - 1];
  		if (options.insertAt === "top") {
  			if(!lastStyleElementInsertedAtTop) {
  				head.insertBefore(styleElement, head.firstChild);
  			} else if(lastStyleElementInsertedAtTop.nextSibling) {
  				head.insertBefore(styleElement, lastStyleElementInsertedAtTop.nextSibling);
  			} else {
  				head.appendChild(styleElement);
  			}
  			styleElementsInsertedAtTop.push(styleElement);
  		} else if (options.insertAt === "bottom") {
  			head.appendChild(styleElement);
  		} else {
  			throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
  		}
  	}
  	
  	function removeStyleElement(styleElement) {
  		styleElement.parentNode.removeChild(styleElement);
  		var idx = styleElementsInsertedAtTop.indexOf(styleElement);
  		if(idx >= 0) {
  			styleElementsInsertedAtTop.splice(idx, 1);
  		}
  	}
  	
  	function createStyleElement(options) {
  		var styleElement = document.createElement("style");
  		styleElement.type = "text/css";
  		insertStyleElement(options, styleElement);
  		return styleElement;
  	}
  	
  	function createLinkElement(options) {
  		var linkElement = document.createElement("link");
  		linkElement.rel = "stylesheet";
  		insertStyleElement(options, linkElement);
  		return linkElement;
  	}
  	
  	function addStyle(obj, options) {
  		var styleElement, update, remove;
  	
  		if (options.singleton) {
  			var styleIndex = singletonCounter++;
  			styleElement = singletonElement || (singletonElement = createStyleElement(options));
  			update = applyToSingletonTag.bind(null, styleElement, styleIndex, false);
  			remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true);
  		} else if(obj.sourceMap &&
  			typeof URL === "function" &&
  			typeof URL.createObjectURL === "function" &&
  			typeof URL.revokeObjectURL === "function" &&
  			typeof Blob === "function" &&
  			typeof btoa === "function") {
  			styleElement = createLinkElement(options);
  			update = updateLink.bind(null, styleElement);
  			remove = function() {
  				removeStyleElement(styleElement);
  				if(styleElement.href)
  					URL.revokeObjectURL(styleElement.href);
  			};
  		} else {
  			styleElement = createStyleElement(options);
  			update = applyToTag.bind(null, styleElement);
  			remove = function() {
  				removeStyleElement(styleElement);
  			};
  		}
  	
  		update(obj);
  	
  		return function updateStyle(newObj) {
  			if(newObj) {
  				if(newObj.css === obj.css && newObj.media === obj.media && newObj.sourceMap === obj.sourceMap)
  					return;
  				update(obj = newObj);
  			} else {
  				remove();
  			}
  		};
  	}
  	
  	var replaceText = (function () {
  		var textStore = [];
  	
  		return function (index, replacement) {
  			textStore[index] = replacement;
  			return textStore.filter(Boolean).join('\n');
  		};
  	})();
  	
  	function applyToSingletonTag(styleElement, index, remove, obj) {
  		var css = remove ? "" : obj.css;
  	
  		if (styleElement.styleSheet) {
  			styleElement.styleSheet.cssText = replaceText(index, css);
  		} else {
  			var cssNode = document.createTextNode(css);
  			var childNodes = styleElement.childNodes;
  			if (childNodes[index]) styleElement.removeChild(childNodes[index]);
  			if (childNodes.length) {
  				styleElement.insertBefore(cssNode, childNodes[index]);
  			} else {
  				styleElement.appendChild(cssNode);
  			}
  		}
  	}
  	
  	function applyToTag(styleElement, obj) {
  		var css = obj.css;
  		var media = obj.media;
  	
  		if(media) {
  			styleElement.setAttribute("media", media)
  		}
  	
  		if(styleElement.styleSheet) {
  			styleElement.styleSheet.cssText = css;
  		} else {
  			while(styleElement.firstChild) {
  				styleElement.removeChild(styleElement.firstChild);
  			}
  			styleElement.appendChild(document.createTextNode(css));
  		}
  	}
  	
  	function updateLink(linkElement, obj) {
  		var css = obj.css;
  		var sourceMap = obj.sourceMap;
  	
  		if(sourceMap) {
              // https://developer.mozilla.org/en/docs/Web/API/WindowBase64/Base64_encoding_and_decoding
  			css += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + " */";
  		}
  	
  		var blob = new Blob([css], { type: "text/css" });
  	
  		var oldSrc = linkElement.href;
  	
  		linkElement.href = URL.createObjectURL(blob);
  	
  		if(oldSrc)
  			URL.revokeObjectURL(oldSrc);
  	}
  
  
  /***/ },
  /* 6 */
  /***/ function(module, exports) {
  
  	"use strict";
  	/*
  	 * Escapes `"` characters from string
  	 */
  	function escapeString(str) {
  	    return str.replace('"', '\"');
  	}
  	/*
  	 * Determines if a value is an object
  	 */
  	function isObject(value) {
  	    var type = typeof value;
  	    return !!value && (type == 'object');
  	}
  	exports.isObject = isObject;
  	/*
  	 * Gets constructor name of an object.
  	 *
  	 */
  	function getObjectName(object) {
  	    if (object === undefined) {
  	        return '';
  	    }
  	    if (object === null || (typeof object === 'object' && !object.constructor)) {
  	        return 'Object';
  	    }
  	    var funcNameRegex = /function ([^(]*)/;
  	    var results = (funcNameRegex).exec((object).constructor.toString());
  	    if (results && results.length > 1) {
  	        return results[1];
  	    } else {
  	        return '';
  	    }
  	}
  	exports.getObjectName = getObjectName;
  	/*
  	 * Gets type of an object. Returns "null" for null objects
  	 */
  	function getType(object) {
  	    if (object === null) {
  	        return 'null';
  	    }
  	    return typeof object;
  	}
  	exports.getType = getType;
  	/*
  	 * Generates inline preview for a JavaScript object based on a value
  	*/
  	function getValuePreview(object, value) {
  	    var type = getType(object);
  	    if (type === 'null' || type === 'undefined') {
  	        return type;
  	    }
  	    if (type === 'string') {
  	        value = '"' + escapeString(value) + '"';
  	    }
  	    if (type === 'function') {
  	        // Remove content of the function
  	        return object.toString()
  	            .replace(/[\r\n]/g, '')
  	            .replace(/\{.*\}/, '') + '{…}';
  	    }
  	    return value;
  	}
  	exports.getValuePreview = getValuePreview;
  	/*
  	 * Generates inline preview for a JavaScript object
  	*/
  	function getPreview(object) {
  	    var value = '';
  	    if (isObject(object)) {
  	        value = getObjectName(object);
  	        if (Array.isArray(object))
  	            value += '[' + object.length + ']';
  	    }
  	    else {
  	        value = getValuePreview(object, object);
  	    }
  	    return value;
  	}
  	exports.getPreview = getPreview;
  	/*
  	 * Generates a prefixed CSS class name
  	*/
  	function cssClass(className) {
  	    return "json-formatter-" + className;
  	}
  	exports.cssClass = cssClass;
  	/*
  	  * Creates a new DOM element with given type and class
  	  * TODO: move me to helpers
  	*/
  	function createElement(type, className, content) {
  	    var el = document.createElement(type);
  	    if (className) {
  	        el.classList.add(cssClass(className));
  	    }
  	    if (content !== undefined) {
  	        if (content instanceof Node) {
  	            el.appendChild(content);
  	        }
  	        else {
  	            el.appendChild(document.createTextNode(String(content)));
  	        }
  	    }
  	    return el;
  	}
  	exports.createElement = createElement;
  
  
  /***/ }
  /******/ ])
  });
  ;
  //# sourceMappingURL=json-formatter.js.map
  
  </script>
  <script>
  
  (function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.JSONSchemaView = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
  'use strict';
  /*
   * Converts anyOf, allOf and oneOf to human readable string
  */
  Object.defineProperty(exports, '__esModule', {
    value: true
  });
  exports.convertXOf = convertXOf;
  exports._if = _if;
  
  function convertXOf(type) {
    return type.substring(0, 3) + ' of';
  }
  
  
  
  function _if(condition) {
    return condition ? normal : empty;
  }
  
  function empty() {
    return '';
  }
  function normal(template) {
    for (var _len = arguments.length, expressions = Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
      expressions[_key - 1] = arguments[_key];
    }
  
    return template.slice(1).reduce(function (accumulator, part, i) {
      return accumulator + expressions[i] + part;
    }, template[0]);
  }
  
  },{}],2:[function(require,module,exports){
  'use strict';
  
  /* globals JSONSchemaView */
  
  Object.defineProperty(exports, '__esModule', {
    value: true
  });
  
  var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();
  
  var _templateObject = _taggedTemplateLiteral(['\n        <div class="any">\n          ', '\n\n          <span class="type type-any">&lt;any&gt;</span>\n\n          ', '\n\t\t \n\t\t  ', '\n\t\t  ', '\n\t\t   ', '\n        </div>\n      '], ['\n        <div class="any">\n          ', '\n\n          <span class="type type-any">&lt;any&gt;</span>\n\n          ', '\n\t\t \n\t\t  ', '\n\t\t  ', '\n\t\t   ', '\n        </div>\n      ']),
      _templateObject2 = _taggedTemplateLiteral(['\n            <a class="title"><span class="toggle-handle"></span>', ' </a>\n          '], ['\n            <a class="title"><span class="toggle-handle"></span>', ' </a>\n          ']),
      _templateObject3 = _taggedTemplateLiteral(['\n            <div class="inner description marked">', '</div>\n          '], ['\n            <div class="inner description marked">', '</div>\n          ']),
      _templateObject4 = _taggedTemplateLiteral(['\n            <div class="inner required">Required: ', '</div>\n          '], ['\n            <div class="inner required">Required: ', '</div>\n          ']),
      _templateObject5 = _taggedTemplateLiteral(['\n            <div class="inner default">Default: ', '</div>\n          '], ['\n            <div class="inner default">Default: ', '</div>\n          ']),
      _templateObject6 = _taggedTemplateLiteral(['\n            <div class="inner pattern">Pattern: ', '</div>\n          '], ['\n            <div class="inner pattern">Pattern: ', '</div>\n          ']),
      _templateObject7 = _taggedTemplateLiteral(['\n        <div class="primitive">\n          ', '\n\n            <span class="type">', '</span>\n\n         \n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\t\t  \n\t\t \n\t\t  \n\t\t   ', '\n\t\t  ', '\n\t\t   ', '\n\n          ', '\n\n          ', '\n          ', '\n          ', '\n        </div>\n      '], ['\n        <div class="primitive">\n          ', '\n\n            <span class="type">', '</span>\n\n         \n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\n          ', '\n\t\t  \n\t\t \n\t\t  \n\t\t   ', '\n\t\t  ', '\n\t\t   ', '\n\n          ', '\n\n          ', '\n          ', '\n          ', '\n        </div>\n      ']),
      _templateObject8 = _taggedTemplateLiteral(['\n            <span class="format">(', ')</span>\n          '], ['\n            <span class="format">(', ')</span>\n          ']),
      _templateObject9 = _taggedTemplateLiteral(['\n            <span class="range minimum">minimum:', '</span>\n          '], ['\n            <span class="range minimum">minimum:', '</span>\n          ']),
      _templateObject10 = _taggedTemplateLiteral(['\n            <span class="range exclusiveMinimum">(ex)minimum:', '</span>\n          '], ['\n            <span class="range exclusiveMinimum">(ex)minimum:', '</span>\n          ']),
      _templateObject11 = _taggedTemplateLiteral(['\n            <span class="range maximum">maximum:', '</span>\n          '], ['\n            <span class="range maximum">maximum:', '</span>\n          ']),
      _templateObject12 = _taggedTemplateLiteral(['\n            <span class="range exclusiveMaximum">(ex)maximum:', '</span>\n          '], ['\n            <span class="range exclusiveMaximum">(ex)maximum:', '</span>\n          ']),
      _templateObject13 = _taggedTemplateLiteral(['\n            <span class="range minLength">minLength:', '</span>\n          '], ['\n            <span class="range minLength">minLength:', '</span>\n          ']),
      _templateObject14 = _taggedTemplateLiteral(['\n            <span class="range maxLength">maxLength:', '</span>\n          '], ['\n            <span class="range maxLength">maxLength:', '</span>\n          ']),
      _templateObject15 = _taggedTemplateLiteral(['\n            <div class="inner required">Required</div>\n          '], ['\n            <div class="inner required">Required</div>\n          ']),
      _templateObject16 = _taggedTemplateLiteral(['\n            ', '\n          '], ['\n            ', '\n          ']),
      _templateObject17 = _taggedTemplateLiteral(['', ''], ['', '']),
      _templateObject18 = _taggedTemplateLiteral(['\n        <div class="array">\n          <a class="title"><span class="toggle-handle"></span>', '<span class="opening bracket">[</span>', '</a>\n          ', '\n          <div class="inner">\n            ', '\n          </div>\n\n          ', '\n\n          ', '\n          ', '\n          ', '\n\n          ', '\n        </div>\n      '], ['\n        <div class="array">\n          <a class="title"><span class="toggle-handle"></span>', '<span class="opening bracket">[</span>', '</a>\n          ', '\n          <div class="inner">\n            ', '\n          </div>\n\n          ', '\n\n          ', '\n          ', '\n          ', '\n\n          ', '\n        </div>\n      ']),
      _templateObject19 = _taggedTemplateLiteral(['<span class="closing bracket">]</span>'], ['<span class="closing bracket">]</span>']),
      _templateObject20 = _taggedTemplateLiteral(['\n          <span>\n            <span title="items range">(', '..', ')</span>\n            ', '\n          </span>\n          '], ['\n          <span>\n            <span title="items range">(', '..', ')</span>\n            ', '\n          </span>\n          ']),
      _templateObject21 = _taggedTemplateLiteral(['<span title="unique" class="uniqueItems">♦</span>'], ['<span title="unique" class="uniqueItems">♦</span>']),
      _templateObject22 = _taggedTemplateLiteral(['\n              <div class="description">', '</div>\n            '], ['\n              <div class="description">', '</div>\n            ']),
      _templateObject23 = _taggedTemplateLiteral(['\n          <span class="closing bracket">]</span>\n          '], ['\n          <span class="closing bracket">]</span>\n          ']),
      _templateObject24 = _taggedTemplateLiteral(['\n        <div class="object">\n          <a class="title"><span\n            class="toggle-handle"></span>', ' <span\n            class="opening brace">{</span>', '</a>\n\n          <div class="inner">\n            ', '\n            <!-- children go here -->\n\t\t  \n\t\t   ', '\n\t\t  ', '\n\t\t  \n\t\t\t', '\n          </div>\n\n          ', '\n\n          ', '\n          ', '\n          ', '\n\n          ', '\n        </div>\n      '], ['\n        <div class="object">\n          <a class="title"><span\n            class="toggle-handle"></span>', ' <span\n            class="opening brace">{</span>', '</a>\n\n          <div class="inner">\n            ', '\n            <!-- children go here -->\n\t\t  \n\t\t   ', '\n\t\t  ', '\n\t\t  \n\t\t\t', '\n          </div>\n\n          ', '\n\n          ', '\n          ', '\n          ', '\n\n          ', '\n        </div>\n      ']),
      _templateObject25 = _taggedTemplateLiteral(['\n              <span class="closing brace" ng-if="isCollapsed">}</span>\n          '], ['\n              <span class="closing brace" ng-if="isCollapsed">}</span>\n          ']),
      _templateObject26 = _taggedTemplateLiteral(['\n            <div class="required">Required: ', '</div>\n          '], ['\n            <div class="required">Required: ', '</div>\n          ']),
     _templateObject266 = _taggedTemplateLiteral(['\n            <div class="required">Required: ', '</div>\n          '], ['\n            <div class="required">Required: ', '</div>\n          ']),
      _templateObject27 = _taggedTemplateLiteral(['\n            <div class="default">Default: ', '</div>\n          '], ['\n            <div class="default">Default: ', '</div>\n          ']),
      _templateObject28 = _taggedTemplateLiteral(['\n              <div class="pattern">Pattern: ', '</div>\n            '], ['\n              <div class="pattern">Pattern: ', '</div>\n            ']),
      _templateObject29 = _taggedTemplateLiteral(['\n          <span class="closing brace">}</span>\n          '], ['\n          <span class="closing brace">}</span>\n          ']),
      _templateObject30 = _taggedTemplateLiteral(['\n        <div class="inner enums">\n          <b>Enum:</b>\n        </div>\n      '], ['\n        <div class="inner enums">\n          <b>Enum:</b>\n        </div>\n      ']);
  
  function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }
  
  function _taggedTemplateLiteral(strings, raw) { return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }
  
  var _helpersJs = require('./helpers.js');
  
  /**
   * @class JSONSchemaView
   *
   * A pure JavaScript component for rendering JSON Schema in HTML.
  */
  
  var JSONSchemaView = (function () {
  
    /**
     * @param {object} schema The JSON Schema object
     *
     * @param {number} [open=1] his number indicates up to how many levels the
     * rendered tree should expand. Set it to `0` to make the whole tree collapsed
     * or set it to `Infinity` to expand the tree deeply
     * @param {object} options.
     *  theme {string}: one of the following options: ['dark']
    */
  
    function JSONSchemaView(schema, open) {
      var _this = this;
  
      var options = arguments.length <= 2 || arguments[2] === undefined ? { theme: null } : arguments[2];
  
      _classCallCheck(this, JSONSchemaView);
  
      this.schema = schema;
      this.open = open;
      this.options = options;
      this.isCollapsed = open <= 0;
  
      // if schema is an empty object which means any JOSN
      this.isAny = typeof schema === 'object' && !Array.isArray(schema) && !Object.keys(schema).filter(function (k) {
        return ['title', 'description'].indexOf(k) === -1;
      }).length;
  
      // Determine if a schema is an array
      this.isArray = !this.isAny && this.schema && this.schema.type === 'array';
  
      this.isObject = this.schema && (this.schema.type === 'object' || this.schema.properties || this.schema.allOf);
  
      // Determine if a schema is a primitive
      this.isPrimitive = !this.isAny && !this.isArray && !this.isObject;
  
      //
      this.showToggle = this.schema.description || this.schema.title || this.isPrimitive && (this.schema.minimum || this.schema.maximum || this.schema.exclusiveMinimum || this.schema.exclusiveMaximum);
  
      // populate isRequired property down to properties
      if (this.schema && Array.isArray(this.schema.required)) {
        this.schema.required.forEach(function (requiredProperty) {
          if (typeof _this.schema.properties[requiredProperty] === 'object') {
            _this.schema.properties[requiredProperty].isRequired = true;
          }
        });
      }
    }
  
    /*
     * Returns the template with populated properties.
     * This template does not have the children
    */
  
    _createClass(JSONSchemaView, [{
      key: 'template',
      value: function template() {
        if (!this.schema) {
          return '';
        }
  
        return ('\n      <!-- Any -->\n      ' + (0, _helpersJs._if)(this.isAny)(_templateObject, (0, _helpersJs._if)(this.showToggle)(_templateObject2, this.schema.title || ''), (0, _helpersJs._if)(this.schema.description && !this.isCollapsed)(_templateObject3, marked(this.schema.description || "")), (0, _helpersJs._if)(this.schema.required && !this.isCollapsed)(_templateObject4, this.schema.required), (0, _helpersJs._if)(this.schema['default'] && !this.isCollapsed)(_templateObject5, this.schema['default']), (0, _helpersJs._if)(this.schema.pattern && !this.isCollapsed)(_templateObject6, this.schema.pattern)) + '\n\n      <!-- Primitive -->\n      ' + (0, _helpersJs._if)(this.isPrimitive)(_templateObject7, (0, _helpersJs._if)(this.showToggle)(_templateObject2, this.schema.title || ''), this.schema.type, (0, _helpersJs._if)(!this.isCollapsed && this.schema.format)(_templateObject8, this.schema.format), (0, _helpersJs._if)(!this.isCollapsed && this.schema.minimum)(_templateObject9, this.schema.minimum), (0, _helpersJs._if)(!this.isCollapsed && this.schema.exclusiveMinimum)(_templateObject10, this.schema.exclusiveMinimum), (0, _helpersJs._if)(!this.isCollapsed && this.schema.maximum)(_templateObject11, this.schema.maximum), (0, _helpersJs._if)(!this.isCollapsed && this.schema.exclusiveMaximum)(_templateObject12, this.schema.exclusiveMaximum), (0, _helpersJs._if)(!this.isCollapsed && this.schema.minLength)(_templateObject13, this.schema.minLength), (0, _helpersJs._if)(!this.isCollapsed && this.schema.maxLength)(_templateObject14, this.schema.maxLength), (0, _helpersJs._if)(this.schema.description && !this.isCollapsed)(_templateObject3, marked(this.schema.description || "")), (0, _helpersJs._if)(this.schema.required && !this.isCollapsed)(_templateObject15), (0, _helpersJs._if)(this.schema['default'] && !this.isCollapsed)(_templateObject5, this.schema['default']), (0, _helpersJs._if)(this.schema.pattern && !this.isCollapsed)(_templateObject6, this.schema.pattern), (0, _helpersJs._if)(!this.isCollapsed && this.schema['enum'])(_templateObject16, this['enum'](this.schema, this.isCollapsed, this.open)), (0, _helpersJs._if)(this.schema.allOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'allOf')), (0, _helpersJs._if)(this.schema.oneOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'oneOf')), (0, _helpersJs._if)(this.schema.anyOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'anyOf'))) + '\n\n\n      <!-- Array -->\n      ' + (0, _helpersJs._if)(this.isArray)(_templateObject18, this.schema.title || '', (0, _helpersJs._if)(this.isCollapsed)(_templateObject19), (0, _helpersJs._if)(!this.isCollapsed && (this.schema.uniqueItems || this.schema.minItems || this.schema.maxItems))(_templateObject20, this.schema.minItems || 0, this.schema.maxItems || '∞', (0, _helpersJs._if)(!this.isCollapsed && this.schema.uniqueItems)(_templateObject21)), (0, _helpersJs._if)(!this.isCollapsed && this.schema.description)(_templateObject22, marked(this.schema.description || "")), (0, _helpersJs._if)(!this.isCollapsed && this.schema['enum'])(_templateObject16, this['enum'](this.schema, this.isCollapsed, this.open)), (0, _helpersJs._if)(this.schema.allOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'allOf')), (0, _helpersJs._if)(this.schema.oneOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'oneOf')), (0, _helpersJs._if)(this.schema.anyOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'anyOf')), (0, _helpersJs._if)(!this.isCollapsed)(_templateObject23)) + '\n\n      <!-- Object -->\n      ' + (0, _helpersJs._if)(!this.isPrimitive && !this.isArray && !this.isAny)(_templateObject24, this.schema.title || '', (0, _helpersJs._if)(this.isCollapsed)(_templateObject25), (0, _helpersJs._if)(!this.isCollapsed && this.schema.description)(_templateObject22, marked(this.schema.description || "")),
  
          (0, _helpersJs._if)(this.schema.required && !this.isCollapsed && this.options.isBodyParam != true)(_templateObject26, this.schema.required),
          (0, _helpersJs._if)(this.schema.required && !this.isCollapsed && this.options.isBodyParam == true)(_templateObject266, this.schema.required),
  
          (0, _helpersJs._if)(this.schema['default'] && !this.isCollapsed)(_templateObject27, this.schema['default']),(0, _helpersJs._if)(!this.isCollapsed)(_templateObject29),
          (0, _helpersJs._if)(!this.isCollapsed && this.schema.pattern)(_templateObject28, this.schema.pattern),
          (0, _helpersJs._if)(!this.isCollapsed && this.schema['enum'])(_templateObject16, this['enum'](this.schema, this.isCollapsed, this.open)), (0, _helpersJs._if)(this.schema.allOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'allOf')), (0, _helpersJs._if)(this.schema.oneOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'oneOf')), (0, _helpersJs._if)(this.schema.anyOf && !this.isCollapsed)(_templateObject17, this.xOf(this.schema, 'anyOf'))) + '\n').replace(/\s*\n/g, '\n').replace(/(\<\!\-\-).+/g, '').trim();
      }
  
      /*
       * Template for oneOf, anyOf and allOf
      */
    }, {
      key: 'xOf',
      value: function xOf(schema, type) {
        return '\n      <div class="inner ' + type + '">\n        <b>' + (0, _helpersJs.convertXOf)(type) + ':</b>\n      </div>\n    ';
      }
  
      /*
       * Template for enums
      */
    }, {
      key: 'enum',
      value: function _enum(schema, isCollapsed, open) {
        return '\n      ' + (0, _helpersJs._if)(!isCollapsed && schema['enum'])(_templateObject30) + '\n    ';
      }
  
      /*
       * Toggles the 'collapsed' state
      */
    }, {
      key: 'toggle',
      value: function toggle() {
        this.isCollapsed = !this.isCollapsed;
        this.render();
      }
  
      /*
       * Renders the element and returns it
      */
    }, {
      key: 'render',
      value: function render() {
        if (!this.element) {
          this.element = document.createElement('div');
          this.element.classList.add('json-schema-view');
        }
  
        if (this.isCollapsed) {
          this.element.classList.add('collapsed');
        } else {
          this.element.classList.remove('collapsed');
        }
  
        if (this.options.theme) {
          this.element.classList.add('json-schema-view-' + this.options.theme);
        }
  
        this.element.innerHTML = this.template();
  
        if (this.schema && this.schema.example) {
          var exampleDiv = document.createElement('div');
          exampleDiv.innerHTML = '<div style="display: block" class="example">\n          <span style="color: #808080" class="name">example: ' + this.schema.example + '</span>\n        </div>';
          this.element.appendChild(exampleDiv.querySelector('.example'));
        }
  
        if (!this.schema) {
          return this.element;
        }
  
        if (!this.isCollapsed) {
          this.appendChildren(this.element);
        }
  
        // add event listener for toggling
        if (this.element.querySelector('a.title')) {
          this.element.querySelector('a.title').addEventListener('click', this.toggle.bind(this));
        }
        return this.element;
      }
  
      /*
       * Appends children to given element based on current schema
      */
    }, {
      key: 'appendChildren',
      value: function appendChildren(element) {
        var _this2 = this;
  
        var inner = element.querySelector('.inner');
  
        if (!inner) {
          return;
        }
  
        if (this.schema['enum']) {
          var tempDiv = document.createElement('span');;
          tempDiv.classList.add('inner');
          tempDiv.innerHTML = '<code>' + this.schema['enum'].join('</code>, <code>') + '</code>';
          element.querySelector('.enums.inner').appendChild(tempDiv);
        }
  
        if (this.isArray) {
          var schemaItems = this.schema.items;
          if (this.schema.items.$ref) {
             var elements = this.schema.items.$ref.split('/');
             var schemaName = elements.pop();
             schemaItems = defs[schemaName];
          }
          var view = new JSONSchemaView(schemaItems, Infinity);
          inner.appendChild(view.render());
        }
  
        if (typeof this.schema.properties === 'object') {
          Object.keys(this.schema.properties).forEach(function (propertyName) {
            var property = _this2.schema.properties[propertyName];
            var tempDiv = document.createElement('div');;
            tempDiv.innerHTML = '<div class="property">\n          <span class="name">' + propertyName + ':</span>\n        </div>';
            var view = new JSONSchemaView(property, _this2.open - 1);
            tempDiv.querySelector('.property').appendChild(view.render());
  
            inner.appendChild(tempDiv.querySelector('.property'));
          });
        }
  
        if (this.schema.allOf) {
          appendXOf.call(this, 'allOf');
        }
        if (this.schema.oneOf) {
          appendXOf.call(this, 'oneOf');
        }
        if (this.schema.anyOf) {
          appendXOf.call(this, 'anyOf');
        }
  
        function appendXOf(type) {
          var _this3 = this;
  
          var innerAllOf = element.querySelector('.inner.' + type);
  
          this.schema[type].forEach(function (schema) {
            var inner = document.createElement('div');
            inner.classList.add('inner');
            var view = new JSONSchemaView(schema, _this3.open - 1);
            inner.appendChild(view.render());
            innerAllOf.appendChild(inner);
          });
        }
      }
    }]);
  
    return JSONSchemaView;
  })();
  
  exports['default'] = JSONSchemaView;
  module.exports = exports['default'];
  
  },{"./helpers.js":1}]},{},[2])(2)
  });
  //# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJDOi9Vc2Vycy9qYW1lc2hpL0Rlc2t0b3AvanNvbi1zY2hlbWEtdmlldy1qcy1tYXN0ZXIvc3JjL2hlbHBlcnMuanMiLCJDOi9Vc2Vycy9qYW1lc2hpL0Rlc2t0b3AvanNvbi1zY2hlbWEtdmlldy1qcy1tYXN0ZXIvc3JjL2luZGV4LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUEsWUFBWSxDQUFDOzs7Ozs7Ozs7O0FBSU4sU0FBUyxVQUFVLENBQUMsSUFBSSxFQUFFO0FBQy9CLFNBQU8sSUFBSSxDQUFDLFNBQVMsQ0FBQyxDQUFDLEVBQUUsQ0FBQyxDQUFDLEdBQUcsS0FBSyxDQUFDO0NBQ3JDOzs7Ozs7Ozs7Ozs7O0FBWU0sU0FBUyxHQUFHLENBQUMsU0FBUyxFQUFFO0FBQzdCLFNBQU8sU0FBUyxHQUFHLE1BQU0sR0FBRyxLQUFLLENBQUM7Q0FDbkM7O0FBQ0QsU0FBUyxLQUFLLEdBQUU7QUFDZCxTQUFPLEVBQUUsQ0FBQztDQUNYO0FBQ0QsU0FBUyxNQUFNLENBQUUsUUFBUSxFQUFrQjtvQ0FBYixXQUFXO0FBQVgsZUFBVzs7O0FBQ3ZDLFNBQU8sUUFBUSxDQUFDLEtBQUssQ0FBQyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsVUFBQyxXQUFXLEVBQUUsSUFBSSxFQUFFLENBQUMsRUFBSztBQUN4RCxXQUFPLFdBQVcsR0FBRyxXQUFXLENBQUMsQ0FBQyxDQUFDLEdBQUcsSUFBSSxDQUFDO0dBQzVDLEVBQUUsUUFBUSxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUM7Q0FDakI7OztBQzVCRCxZQUFZLENBQUM7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozt5QkFPTixjQUFjOzs7Ozs7OztJQVFBLGNBQWM7Ozs7Ozs7Ozs7OztBQVd0QixXQVhRLGNBQWMsQ0FXckIsTUFBTSxFQUFFLElBQUksRUFBMkI7OztRQUF6QixPQUFPLHlEQUFHLEVBQUMsS0FBSyxFQUFFLElBQUksRUFBQzs7MEJBWDlCLGNBQWM7O0FBWS9CLFFBQUksQ0FBQyxNQUFNLEdBQUcsTUFBTSxDQUFDO0FBQ3JCLFFBQUksQ0FBQyxJQUFJLEdBQUcsSUFBSSxDQUFDO0FBQ2pCLFFBQUksQ0FBQyxPQUFPLEdBQUcsT0FBTyxDQUFDO0FBQ3ZCLFFBQUksQ0FBQyxXQUFXLEdBQUcsSUFBSSxJQUFJLENBQUMsQ0FBQzs7O0FBRzdCLFFBQUksQ0FBQyxLQUFLLEdBQUcsT0FBTyxNQUFNLEtBQUssUUFBUSxJQUNyQyxDQUFDLEtBQUssQ0FBQyxPQUFPLENBQUMsTUFBTSxDQUFDLElBQ3RCLENBQUMsTUFBTSxDQUFDLElBQUksQ0FBQyxNQUFNLENBQUMsQ0FDbkIsTUFBTSxDQUFDLFVBQUEsQ0FBQzthQUFHLENBQUMsT0FBTyxFQUFFLGFBQWEsQ0FBQyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDLENBQUM7S0FBQSxDQUFDLENBQUMsTUFBTSxDQUFDOzs7QUFHakUsUUFBSSxDQUFDLE9BQU8sR0FBRyxDQUFDLElBQUksQ0FBQyxLQUFLLElBQUksSUFBSSxDQUFDLE1BQU0sSUFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLElBQUksS0FBSyxPQUFPLENBQUM7O0FBRTFFLFFBQUksQ0FBQyxRQUFRLEdBQUcsSUFBSSxDQUFDLE1BQU0sS0FDeEIsSUFBSSxDQUFDLE1BQU0sQ0FBQyxJQUFJLEtBQUssUUFBUSxJQUM3QixJQUFJLENBQUMsTUFBTSxDQUFDLFVBQVUsSUFDdEIsSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQ2pCLElBQUksQ0FBQyxNQUFNLENBQUMsS0FBSyxJQUNqQixJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssQ0FBQSxBQUFDLENBQUM7OztBQUd0QixRQUFJLENBQUMsV0FBVyxHQUFHLENBQUMsSUFBSSxDQUFDLEtBQUssSUFBSSxDQUFDLElBQUksQ0FBQyxPQUFPLElBQUksQ0FBQyxJQUFJLENBQUMsUUFBUSxDQUFDOzs7QUFHbEUsUUFBSSxDQUFDLFVBQVUsR0FBRyxJQUFJLENBQUMsTUFBTSxDQUFDLFdBQVcsSUFDdkMsSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQ2hCLElBQUksQ0FBQyxXQUFXLEtBQ2YsSUFBSSxDQUFDLE1BQU0sQ0FBQyxPQUFPLElBQ25CLElBQUksQ0FBQyxNQUFNLENBQUMsT0FBTyxJQUNuQixJQUFJLENBQUMsTUFBTSxDQUFDLGdCQUFnQixJQUM1QixJQUFJLENBQUMsTUFBTSxDQUFDLGdCQUFnQixDQUFBLEFBQUMsQUFDOUIsQ0FBQzs7O0FBR0osUUFBSSxJQUFJLENBQUMsTUFBTSxJQUFJLEtBQUssQ0FBQyxPQUFPLENBQUMsSUFBSSxDQUFDLE1BQU0sQ0FBQyxRQUFRLENBQUMsRUFBRTtBQUN0RCxVQUFJLENBQUMsTUFBTSxDQUFDLFFBQVEsQ0FBQyxPQUFPLENBQUMsVUFBQSxnQkFBZ0IsRUFBSTtBQUMvQyxZQUFJLE9BQU8sTUFBSyxNQUFNLENBQUMsVUFBVSxDQUFDLGdCQUFnQixDQUFDLEtBQUssUUFBUSxFQUFFO0FBQ2hFLGdCQUFLLE1BQU0sQ0FBQyxVQUFVLENBQUMsZ0JBQWdCLENBQUMsQ0FBQyxVQUFVLEdBQUcsSUFBSSxDQUFDO1NBQzVEO09BQ0YsQ0FBQyxDQUFDO0tBQ0o7R0FDRjs7Ozs7OztlQXREa0IsY0FBYzs7V0E0RHpCLG9CQUFHO0FBQ1QsVUFBSSxDQUFDLElBQUksQ0FBQyxNQUFNLEVBQUU7QUFDaEIsZUFBTyxFQUFFLENBQUM7T0FDWDs7QUFFRCxhQUFPLGtDQUVILG9CQUFJLElBQUksQ0FBQyxLQUFLLENBQUMsa0JBRVgsb0JBQUksSUFBSSxDQUFDLFVBQVUsQ0FBQyxtQkFDa0MsSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksRUFBRSxHQUs3RSxvQkFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLFdBQVcsSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsbUJBQ2hCLElBQUksQ0FBQyxNQUFNLENBQUMsV0FBVyxHQUc5RCxvQkFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLFFBQVEsSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsbUJBQ0EsSUFBSSxDQUFDLE1BQU0sQ0FBQyxRQUFRLEdBRWxFLG9CQUFJLElBQUksQ0FBQyxNQUFNLFdBQVEsSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsbUJBQ0QsSUFBSSxDQUFDLE1BQU0sV0FBUSxHQUU5RCxvQkFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLE9BQU8sSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsbUJBQ0YsSUFBSSxDQUFDLE1BQU0sQ0FBQyxPQUFPLDhDQU03RCxvQkFBSSxJQUFJLENBQUMsV0FBVyxDQUFDLG1CQUVqQixvQkFBSSxJQUFJLENBQUMsVUFBVSxDQUFDLG1CQUNrQyxJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssSUFBSSxFQUFFLEdBR3hELElBQUksQ0FBQyxNQUFNLENBQUMsSUFBSSxFQUlyQyxvQkFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLElBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxNQUFNLENBQUMsbUJBQ3BCLElBQUksQ0FBQyxNQUFNLENBQUMsTUFBTSxHQUcxQyxvQkFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLElBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxPQUFPLENBQUMsbUJBQ1AsSUFBSSxDQUFDLE1BQU0sQ0FBQyxPQUFPLEdBR3pELG9CQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsSUFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLGdCQUFnQixDQUFDLG9CQUNILElBQUksQ0FBQyxNQUFNLENBQUMsZ0JBQWdCLEdBRy9FLG9CQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsSUFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLE9BQU8sQ0FBQyxvQkFDUCxJQUFJLENBQUMsTUFBTSxDQUFDLE9BQU8sR0FHekQsb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxJQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsZ0JBQWdCLENBQUMsb0JBQ0gsSUFBSSxDQUFDLE1BQU0sQ0FBQyxnQkFBZ0IsR0FHL0Usb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxJQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsU0FBUyxDQUFDLG9CQUNMLElBQUksQ0FBQyxNQUFNLENBQUMsU0FBUyxHQUcvRCxvQkFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLElBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxTQUFTLENBQUMsb0JBQ0wsSUFBSSxDQUFDLE1BQU0sQ0FBQyxTQUFTLEdBRy9ELG9CQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsV0FBVyxJQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsQ0FBQyxtQkFDaEIsSUFBSSxDQUFDLE1BQU0sQ0FBQyxXQUFXLEdBSzdELG9CQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsUUFBUSxJQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsQ0FBQyxxQkFHL0Msb0JBQUksSUFBSSxDQUFDLE1BQU0sV0FBUSxJQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsQ0FBQyxtQkFDRCxJQUFJLENBQUMsTUFBTSxXQUFRLEdBRTlELG9CQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsT0FBTyxJQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsQ0FBQyxtQkFDRixJQUFJLENBQUMsTUFBTSxDQUFDLE9BQU8sR0FHekQsb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxJQUFJLElBQUksQ0FBQyxNQUFNLFFBQUssQ0FBQyxvQkFDeEMsSUFBSSxRQUFLLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxJQUFJLENBQUMsV0FBVyxFQUFFLElBQUksQ0FBQyxJQUFJLENBQUMsR0FHckQsb0JBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLG9CQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxPQUFPLENBQUMsR0FDNUUsb0JBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLG9CQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxPQUFPLENBQUMsR0FDNUUsb0JBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLG9CQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxPQUFPLENBQUMsNENBTWhGLG9CQUFJLElBQUksQ0FBQyxPQUFPLENBQUMsb0JBRXVDLElBQUksQ0FBQyxNQUFNLENBQUMsS0FBSyxJQUFJLEVBQUUsRUFBeUMsb0JBQUksSUFBSSxDQUFDLFdBQVcsQ0FBQyxxQkFDekksb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxLQUFLLElBQUksQ0FBQyxNQUFNLENBQUMsV0FBVyxJQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsUUFBUSxJQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsUUFBUSxDQUFBLEFBQUMsQ0FBQyxvQkFFdEUsSUFBSSxDQUFDLE1BQU0sQ0FBQyxRQUFRLElBQUksQ0FBQyxFQUFLLElBQUksQ0FBQyxNQUFNLENBQUMsUUFBUSxJQUFJLEdBQUcsRUFDcEYsb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxJQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsV0FBVyxDQUFDLHNCQUlqRCxvQkFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLElBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxXQUFXLENBQUMsb0JBQ3RCLElBQUksQ0FBQyxNQUFNLENBQUMsV0FBVyxHQUlwRCxvQkFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLElBQUksSUFBSSxDQUFDLE1BQU0sUUFBSyxDQUFDLG9CQUN4QyxJQUFJLFFBQUssQ0FBQyxJQUFJLENBQUMsTUFBTSxFQUFFLElBQUksQ0FBQyxXQUFXLEVBQUUsSUFBSSxDQUFDLElBQUksQ0FBQyxHQUdyRCxvQkFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsb0JBQUcsSUFBSSxDQUFDLEdBQUcsQ0FBQyxJQUFJLENBQUMsTUFBTSxFQUFFLE9BQU8sQ0FBQyxHQUM1RSxvQkFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsb0JBQUcsSUFBSSxDQUFDLEdBQUcsQ0FBQyxJQUFJLENBQUMsTUFBTSxFQUFFLE9BQU8sQ0FBQyxHQUM1RSxvQkFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsb0JBQUcsSUFBSSxDQUFDLEdBQUcsQ0FBQyxJQUFJLENBQUMsTUFBTSxFQUFFLE9BQU8sQ0FBQyxHQUU1RSxvQkFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsNkRBTzFCLG9CQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsSUFBSSxDQUFDLElBQUksQ0FBQyxPQUFPLElBQUksQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLG9CQUduQixJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssSUFBSSxFQUFFLEVBQ3RCLG9CQUFJLElBQUksQ0FBQyxXQUFXLENBQUMscUJBS25ELG9CQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsSUFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLFdBQVcsQ0FBQyxvQkFDdEIsSUFBSSxDQUFDLE1BQU0sQ0FBQyxXQUFXLEdBSXpELG9CQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsUUFBUSxJQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsQ0FBQyxvQkFDRCxJQUFJLENBQUMsTUFBTSxDQUFDLFFBQVEsR0FFbEUsb0JBQUksSUFBSSxDQUFDLE1BQU0sV0FBUSxJQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsQ0FBQyxvQkFDUCxJQUFJLENBQUMsTUFBTSxXQUFRLEdBRzFELG9CQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsSUFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLE9BQU8sQ0FBQyxvQkFDSixJQUFJLENBQUMsTUFBTSxDQUFDLE9BQU8sR0FJckQsb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxJQUFJLElBQUksQ0FBQyxNQUFNLFFBQUssQ0FBQyxvQkFDeEMsSUFBSSxRQUFLLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxJQUFJLENBQUMsV0FBVyxFQUFFLElBQUksQ0FBQyxJQUFJLENBQUMsR0FHckQsb0JBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLG9CQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxPQUFPLENBQUMsR0FDNUUsb0JBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLG9CQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxPQUFPLENBQUMsR0FDNUUsb0JBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLG9CQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxPQUFPLENBQUMsR0FFNUUsb0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLDZCQUtoQyxPQUFPLENBQUMsUUFBUSxFQUFFLElBQUksQ0FBQyxDQUFDLE9BQU8sQ0FBQyxlQUFlLEVBQUUsRUFBRSxDQUFDLENBQUMsSUFBSSxFQUFFLENBQUM7S0FDM0Q7Ozs7Ozs7V0FLRSxhQUFDLE1BQU0sRUFBRSxJQUFJLEVBQUU7QUFDaEIsNENBQ3NCLElBQUksdUJBQ2pCLDJCQUFXLElBQUksQ0FBQywrQkFFdkI7S0FDSDs7Ozs7OztXQUtHLGVBQUMsTUFBTSxFQUFFLFdBQVcsRUFBRSxJQUFJLEVBQUU7QUFDOUIsMEJBQ0ksb0JBQUksQ0FBQyxXQUFXLElBQUksTUFBTSxRQUFLLENBQUMsK0JBS2xDO0tBQ0g7Ozs7Ozs7V0FLSyxrQkFBRztBQUNQLFVBQUksQ0FBQyxXQUFXLEdBQUcsQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDO0FBQ3JDLFVBQUksQ0FBQyxNQUFNLEVBQUUsQ0FBQztLQUNmOzs7Ozs7O1dBS0ssa0JBQUc7QUFDUCxVQUFJLENBQUMsSUFBSSxDQUFDLE9BQU8sRUFBRTtBQUNqQixZQUFJLENBQUMsT0FBTyxHQUFHLFFBQVEsQ0FBQyxhQUFhLENBQUMsS0FBSyxDQUFDLENBQUM7QUFDN0MsWUFBSSxDQUFDLE9BQU8sQ0FBQyxTQUFTLENBQUMsR0FBRyxDQUFDLGtCQUFrQixDQUFDLENBQUM7T0FDaEQ7O0FBRUQsVUFBSSxJQUFJLENBQUMsV0FBVyxFQUFFO0FBQ3BCLFlBQUksQ0FBQyxPQUFPLENBQUMsU0FBUyxDQUFDLEdBQUcsQ0FBQyxXQUFXLENBQUMsQ0FBQztPQUN6QyxNQUFNO0FBQ0wsWUFBSSxDQUFDLE9BQU8sQ0FBQyxTQUFTLENBQUMsTUFBTSxDQUFDLFdBQVcsQ0FBQyxDQUFDO09BQzVDOztBQUVELFVBQUksSUFBSSxDQUFDLE9BQU8sQ0FBQyxLQUFLLEVBQUU7QUFDdEIsWUFBSSxDQUFDLE9BQU8sQ0FBQyxTQUFTLENBQUMsR0FBRyx1QkFBcUIsSUFBSSxDQUFDLE9BQU8sQ0FBQyxLQUFLLENBQUcsQ0FBQztPQUN0RTs7QUFFRCxVQUFJLENBQUMsT0FBTyxDQUFDLFNBQVMsR0FBRyxJQUFJLENBQUMsUUFBUSxFQUFFLENBQUM7O0FBRXpDLFVBQUksQ0FBQyxJQUFJLENBQUMsTUFBTSxFQUFFO0FBQ2hCLGVBQU8sSUFBSSxDQUFDLE9BQU8sQ0FBQztPQUNyQjs7QUFFRCxVQUFJLENBQUMsSUFBSSxDQUFDLFdBQVcsRUFBRTtBQUNyQixZQUFJLENBQUMsY0FBYyxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsQ0FBQztPQUNuQzs7O0FBR0QsVUFBSSxJQUFJLENBQUMsT0FBTyxDQUFDLGFBQWEsQ0FBQyxTQUFTLENBQUMsRUFBRTtBQUN6QyxZQUFJLENBQUMsT0FBTyxDQUFDLGFBQWEsQ0FBQyxTQUFTLENBQUMsQ0FBQyxnQkFBZ0IsQ0FBQyxPQUFPLEVBQUUsSUFBSSxDQUFDLE1BQU0sQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQztPQUN6RjtBQUNELGFBQU8sSUFBSSxDQUFDLE9BQU8sQ0FBQztLQUNyQjs7Ozs7OztXQUthLHdCQUFDLE9BQU8sRUFBRTs7O0FBQ3RCLFVBQU0sS0FBSyxHQUFHLE9BQU8sQ0FBQyxhQUFhLENBQUMsUUFBUSxDQUFDLENBQUM7O0FBRTlDLFVBQUksQ0FBQyxLQUFLLEVBQUU7QUFDVixlQUFPO09BQ1I7O0FBRUQsVUFBSSxJQUFJLENBQUMsTUFBTSxRQUFLLEVBQUU7QUFDcEIsWUFBTSxTQUFTLEdBQUcsSUFBSSxhQUFhLENBQUMsSUFBSSxDQUFDLE1BQU0sUUFBSyxFQUFFLElBQUksQ0FBQyxJQUFJLEdBQUcsQ0FBQyxDQUFDLENBQUM7QUFDckUsWUFBTSxXQUFXLEdBQUcsU0FBUyxDQUFDLE1BQU0sRUFBRSxDQUFDO0FBQ3ZDLG1CQUFXLENBQUMsU0FBUyxDQUFDLEdBQUcsQ0FBQyxPQUFPLENBQUMsQ0FBQztBQUNuQyxlQUFPLENBQUMsYUFBYSxDQUFDLGNBQWMsQ0FBQyxDQUFDLFdBQVcsQ0FBQyxXQUFXLENBQUMsQ0FBQztPQUVoRTs7QUFFRCxVQUFJLElBQUksQ0FBQyxPQUFPLEVBQUU7QUFDaEIsWUFBTSxJQUFJLEdBQUcsSUFBSSxjQUFjLENBQUMsSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLEVBQUUsSUFBSSxDQUFDLElBQUksR0FBRyxDQUFDLENBQUMsQ0FBQTtBQUNqRSxhQUFLLENBQUMsV0FBVyxDQUFDLElBQUksQ0FBQyxNQUFNLEVBQUUsQ0FBQyxDQUFDO09BQ2xDOztBQUVELFVBQUksT0FBTyxJQUFJLENBQUMsTUFBTSxDQUFDLFVBQVUsS0FBSyxRQUFRLEVBQUU7QUFDOUMsY0FBTSxDQUFDLElBQUksQ0FBQyxJQUFJLENBQUMsTUFBTSxDQUFDLFVBQVUsQ0FBQyxDQUFDLE9BQU8sQ0FBQyxVQUFBLFlBQVksRUFBSTtBQUMxRCxjQUFNLFFBQVEsR0FBRyxPQUFLLE1BQU0sQ0FBQyxVQUFVLENBQUMsWUFBWSxDQUFDLENBQUM7QUFDdEQsY0FBTSxPQUFPLEdBQUcsUUFBUSxDQUFDLGFBQWEsQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDO0FBQy9DLGlCQUFPLENBQUMsU0FBUyw2REFDTSxZQUFZLDZCQUM1QixDQUFDO0FBQ1IsY0FBTSxJQUFJLEdBQUcsSUFBSSxjQUFjLENBQUMsUUFBUSxFQUFFLE9BQUssSUFBSSxHQUFHLENBQUMsQ0FBQyxDQUFDO0FBQ3pELGlCQUFPLENBQUMsYUFBYSxDQUFDLFdBQVcsQ0FBQyxDQUFDLFdBQVcsQ0FBQyxJQUFJLENBQUMsTUFBTSxFQUFFLENBQUMsQ0FBQzs7QUFFOUQsZUFBSyxDQUFDLFdBQVcsQ0FBQyxPQUFPLENBQUMsYUFBYSxDQUFDLFdBQVcsQ0FBQyxDQUFDLENBQUM7U0FDdkQsQ0FBQyxDQUFDO09BQ0o7O0FBRUQsVUFBSSxJQUFJLENBQUMsTUFBTSxDQUFDLEtBQUssRUFBRTtBQUFFLGlCQUFTLENBQUMsSUFBSSxDQUFDLElBQUksRUFBRSxPQUFPLENBQUMsQ0FBQztPQUFFO0FBQ3pELFVBQUksSUFBSSxDQUFDLE1BQU0sQ0FBQyxLQUFLLEVBQUU7QUFBRSxpQkFBUyxDQUFDLElBQUksQ0FBQyxJQUFJLEVBQUUsT0FBTyxDQUFDLENBQUM7T0FBRTtBQUN6RCxVQUFJLElBQUksQ0FBQyxNQUFNLENBQUMsS0FBSyxFQUFFO0FBQUUsaUJBQVMsQ0FBQyxJQUFJLENBQUMsSUFBSSxFQUFFLE9BQU8sQ0FBQyxDQUFDO09BQUU7O0FBRXpELGVBQVMsU0FBUyxDQUFDLElBQUksRUFBRTs7O0FBQ3ZCLFlBQU0sVUFBVSxHQUFHLE9BQU8sQ0FBQyxhQUFhLGFBQVcsSUFBSSxDQUFHLENBQUM7O0FBRTNELFlBQUksQ0FBQyxNQUFNLENBQUMsSUFBSSxDQUFDLENBQUMsT0FBTyxDQUFDLFVBQUEsTUFBTSxFQUFJO0FBQ2xDLGNBQU0sS0FBSyxHQUFHLFFBQVEsQ0FBQyxhQUFhLENBQUMsS0FBSyxDQUFDLENBQUM7QUFDNUMsZUFBSyxDQUFDLFNBQVMsQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLENBQUM7QUFDN0IsY0FBTSxJQUFJLEdBQUcsSUFBSSxjQUFjLENBQUMsTUFBTSxFQUFFLE9BQUssSUFBSSxHQUFHLENBQUMsQ0FBQyxDQUFDO0FBQ3ZELGVBQUssQ0FBQyxXQUFXLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSxDQUFDLENBQUM7QUFDakMsb0JBQVUsQ0FBQyxXQUFXLENBQUMsS0FBSyxDQUFDLENBQUM7U0FDL0IsQ0FBQyxDQUFDO09BQ0o7S0FDRjs7O1NBOVZrQixjQUFjOzs7cUJBQWQsY0FBYyIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCIndXNlIHN0cmljdCc7XG4vKlxuICogQ29udmVydHMgYW55T2YsIGFsbE9mIGFuZCBvbmVPZiB0byBodW1hbiByZWFkYWJsZSBzdHJpbmdcbiovXG5leHBvcnQgZnVuY3Rpb24gY29udmVydFhPZih0eXBlKSB7XG4gIHJldHVybiB0eXBlLnN1YnN0cmluZygwLCAzKSArICcgb2YnO1xufVxuXG4vKlxuICogaWYgY29uZGl0aW9uIGZvciBFUzYgdGVtcGxhdGUgc3RyaW5nc1xuICogdG8gYmUgdXNlZCBvbmx5IGluIHRlbXBsYXRlIHN0cmluZ1xuICpcbiAqIEBleGFtcGxlIG15c3RyID0gYFJhbmRvbSBpcyAke19pZihNYXRoLnJhbmRvbSgpID4gMC41KWBncmVhdGVyIHRoYW4gMC41YGBcbiAqXG4gKiBAcGFyYW0ge2Jvb2xlYW59IGNvbmRpdGlvblxuICpcbiAqIEByZXR1cm5zIHtmdW5jdGlvbn0gdGhlIHRlbXBsYXRlIGZ1bmN0aW9uXG4qL1xuZXhwb3J0IGZ1bmN0aW9uIF9pZihjb25kaXRpb24pIHtcbiAgcmV0dXJuIGNvbmRpdGlvbiA/IG5vcm1hbCA6IGVtcHR5O1xufVxuZnVuY3Rpb24gZW1wdHkoKXtcbiAgcmV0dXJuICcnO1xufVxuZnVuY3Rpb24gbm9ybWFsICh0ZW1wbGF0ZSwgLi4uZXhwcmVzc2lvbnMpIHtcbiAgcmV0dXJuIHRlbXBsYXRlLnNsaWNlKDEpLnJlZHVjZSgoYWNjdW11bGF0b3IsIHBhcnQsIGkpID0+IHtcbiAgICByZXR1cm4gYWNjdW11bGF0b3IgKyBleHByZXNzaW9uc1tpXSArIHBhcnQ7XG4gIH0sIHRlbXBsYXRlWzBdKTtcbn0iLCIndXNlIHN0cmljdCc7XG5cbi8qIGdsb2JhbHMgSlNPTlNjaGVtYVZpZXcgKi9cblxuaW1wb3J0IHtcbiAgY29udmVydFhPZixcbiAgX2lmXG59IGZyb20gJy4vaGVscGVycy5qcyc7XG5cblxuLyoqXG4gKiBAY2xhc3MgSlNPTlNjaGVtYVZpZXdcbiAqXG4gKiBBIHB1cmUgSmF2YVNjcmlwdCBjb21wb25lbnQgZm9yIHJlbmRlcmluZyBKU09OIFNjaGVtYSBpbiBIVE1MLlxuKi9cbmV4cG9ydCBkZWZhdWx0IGNsYXNzIEpTT05TY2hlbWFWaWV3IHtcblxuICAvKipcbiAgICogQHBhcmFtIHtvYmplY3R9IHNjaGVtYSBUaGUgSlNPTiBTY2hlbWEgb2JqZWN0XG4gICAqXG4gICAqIEBwYXJhbSB7bnVtYmVyfSBbb3Blbj0xXSBoaXMgbnVtYmVyIGluZGljYXRlcyB1cCB0byBob3cgbWFueSBsZXZlbHMgdGhlXG4gICAqIHJlbmRlcmVkIHRyZWUgc2hvdWxkIGV4cGFuZC4gU2V0IGl0IHRvIGAwYCB0byBtYWtlIHRoZSB3aG9sZSB0cmVlIGNvbGxhcHNlZFxuICAgKiBvciBzZXQgaXQgdG8gYEluZmluaXR5YCB0byBleHBhbmQgdGhlIHRyZWUgZGVlcGx5XG4gICAqIEBwYXJhbSB7b2JqZWN0fSBvcHRpb25zLlxuICAgKiAgdGhlbWUge3N0cmluZ306IG9uZSBvZiB0aGUgZm9sbG93aW5nIG9wdGlvbnM6IFsnZGFyayddXG4gICovXG4gIGNvbnN0cnVjdG9yKHNjaGVtYSwgb3Blbiwgb3B0aW9ucyA9IHt0aGVtZTogbnVsbH0pIHtcbiAgICB0aGlzLnNjaGVtYSA9IHNjaGVtYTtcbiAgICB0aGlzLm9wZW4gPSBvcGVuO1xuICAgIHRoaXMub3B0aW9ucyA9IG9wdGlvbnM7XG4gICAgdGhpcy5pc0NvbGxhcHNlZCA9IG9wZW4gPD0gMDtcblxuICAgIC8vIGlmIHNjaGVtYSBpcyBhbiBlbXB0eSBvYmplY3Qgd2hpY2ggbWVhbnMgYW55IEpPU05cbiAgICB0aGlzLmlzQW55ID0gdHlwZW9mIHNjaGVtYSA9PT0gJ29iamVjdCcgJiZcbiAgICAgICFBcnJheS5pc0FycmF5KHNjaGVtYSkgJiZcbiAgICAgICFPYmplY3Qua2V5cyhzY2hlbWEpXG4gICAgICAuZmlsdGVyKGs9PiBbJ3RpdGxlJywgJ2Rlc2NyaXB0aW9uJ10uaW5kZXhPZihrKSA9PT0gLTEpLmxlbmd0aDtcblxuICAgIC8vIERldGVybWluZSBpZiBhIHNjaGVtYSBpcyBhbiBhcnJheVxuICAgIHRoaXMuaXNBcnJheSA9ICF0aGlzLmlzQW55ICYmIHRoaXMuc2NoZW1hICYmIHRoaXMuc2NoZW1hLnR5cGUgPT09ICdhcnJheSc7XG5cbiAgICB0aGlzLmlzT2JqZWN0ID0gdGhpcy5zY2hlbWEgJiZcbiAgICAgICh0aGlzLnNjaGVtYS50eXBlID09PSAnb2JqZWN0JyB8fFxuICAgICAgIHRoaXMuc2NoZW1hLnByb3BlcnRpZXMgfHxcbiAgICAgICB0aGlzLnNjaGVtYS5hbnlPZiB8fFxuICAgICAgIHRoaXMuc2NoZW1hLm9uZW9mIHx8XG4gICAgICAgdGhpcy5zY2hlbWEuYWxsT2YpO1xuXG4gICAgLy8gRGV0ZXJtaW5lIGlmIGEgc2NoZW1hIGlzIGEgcHJpbWl0aXZlXG4gICAgdGhpcy5pc1ByaW1pdGl2ZSA9ICF0aGlzLmlzQW55ICYmICF0aGlzLmlzQXJyYXkgJiYgIXRoaXMuaXNPYmplY3Q7XG5cbiAgICAvL1xuICAgIHRoaXMuc2hvd1RvZ2dsZSA9IHRoaXMuc2NoZW1hLmRlc2NyaXB0aW9uIHx8XG4gICAgICB0aGlzLnNjaGVtYS50aXRsZSB8fFxuICAgICAgKHRoaXMuaXNQcmltaXRpdmUgJiYgKFxuICAgICAgICB0aGlzLnNjaGVtYS5taW5pbXVtIHx8XG4gICAgICAgIHRoaXMuc2NoZW1hLm1heGltdW0gfHxcbiAgICAgICAgdGhpcy5zY2hlbWEuZXhjbHVzaXZlTWluaW11bSB8fFxuICAgICAgICB0aGlzLnNjaGVtYS5leGNsdXNpdmVNYXhpbXVtKVxuICAgICAgKTtcblxuICAgIC8vIHBvcHVsYXRlIGlzUmVxdWlyZWQgcHJvcGVydHkgZG93biB0byBwcm9wZXJ0aWVzXG4gICAgaWYgKHRoaXMuc2NoZW1hICYmIEFycmF5LmlzQXJyYXkodGhpcy5zY2hlbWEucmVxdWlyZWQpKSB7XG4gICAgICB0aGlzLnNjaGVtYS5yZXF1aXJlZC5mb3JFYWNoKHJlcXVpcmVkUHJvcGVydHkgPT4ge1xuICAgICAgICBpZiAodHlwZW9mIHRoaXMuc2NoZW1hLnByb3BlcnRpZXNbcmVxdWlyZWRQcm9wZXJ0eV0gPT09ICdvYmplY3QnKSB7XG4gICAgICAgICAgdGhpcy5zY2hlbWEucHJvcGVydGllc1tyZXF1aXJlZFByb3BlcnR5XS5pc1JlcXVpcmVkID0gdHJ1ZTtcbiAgICAgICAgfVxuICAgICAgfSk7XG4gICAgfVxuICB9XG5cbiAgLypcbiAgICogUmV0dXJucyB0aGUgdGVtcGxhdGUgd2l0aCBwb3B1bGF0ZWQgcHJvcGVydGllcy5cbiAgICogVGhpcyB0ZW1wbGF0ZSBkb2VzIG5vdCBoYXZlIHRoZSBjaGlsZHJlblxuICAqL1xuICB0ZW1wbGF0ZSgpIHtcbiAgICBpZiAoIXRoaXMuc2NoZW1hKSB7XG4gICAgICByZXR1cm4gJyc7XG4gICAgfVxuXG4gICAgcmV0dXJuIGBcbiAgICAgIDwhLS0gQW55IC0tPlxuICAgICAgJHtfaWYodGhpcy5pc0FueSlgXG4gICAgICAgIDxkaXYgY2xhc3M9XCJhbnlcIj5cbiAgICAgICAgICAke19pZih0aGlzLnNob3dUb2dnbGUpYFxuICAgICAgICAgICAgPGEgY2xhc3M9XCJ0aXRsZVwiPjxzcGFuIGNsYXNzPVwidG9nZ2xlLWhhbmRsZVwiPjwvc3Bhbj4ke3RoaXMuc2NoZW1hLnRpdGxlIHx8ICcnfSA8L2E+XG4gICAgICAgICAgYH1cblxuICAgICAgICAgIDxzcGFuIGNsYXNzPVwidHlwZSB0eXBlLWFueVwiPiZsdDthbnkmZ3Q7PC9zcGFuPlxuXG4gICAgICAgICAgJHtfaWYodGhpcy5zY2hlbWEuZGVzY3JpcHRpb24gJiYgIXRoaXMuaXNDb2xsYXBzZWQpYFxuICAgICAgICAgICAgPGRpdiBjbGFzcz1cImlubmVyIGRlc2NyaXB0aW9uXCI+JHt0aGlzLnNjaGVtYS5kZXNjcmlwdGlvbn08L2Rpdj5cbiAgICAgICAgICBgfVxuXHRcdCBcblx0XHQgICR7X2lmKHRoaXMuc2NoZW1hLnJlcXVpcmVkICYmICF0aGlzLmlzQ29sbGFwc2VkKWBcbiAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJpbm5lciByZXF1aXJlZFwiPlJlcXVpcmVkOiAke3RoaXMuc2NoZW1hLnJlcXVpcmVkfTwvZGl2PlxuICAgICAgICAgIGB9XG5cdFx0ICAke19pZih0aGlzLnNjaGVtYS5kZWZhdWx0ICYmICF0aGlzLmlzQ29sbGFwc2VkKWBcbiAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJpbm5lciBkZWZhdWx0XCI+RGVmYXVsdDogJHt0aGlzLnNjaGVtYS5kZWZhdWx0fTwvZGl2PlxuICAgICAgICAgIGB9XG5cdFx0ICAgJHtfaWYodGhpcy5zY2hlbWEucGF0dGVybiAmJiAhdGhpcy5pc0NvbGxhcHNlZClgXG4gICAgICAgICAgICA8ZGl2IGNsYXNzPVwiaW5uZXIgcGF0dGVyblwiPlBhdHRlcm46ICR7dGhpcy5zY2hlbWEucGF0dGVybn08L2Rpdj5cbiAgICAgICAgICBgfVxuICAgICAgICA8L2Rpdj5cbiAgICAgIGB9XG5cbiAgICAgIDwhLS0gUHJpbWl0aXZlIC0tPlxuICAgICAgJHtfaWYodGhpcy5pc1ByaW1pdGl2ZSlgXG4gICAgICAgIDxkaXYgY2xhc3M9XCJwcmltaXRpdmVcIj5cbiAgICAgICAgICAke19pZih0aGlzLnNob3dUb2dnbGUpYFxuICAgICAgICAgICAgPGEgY2xhc3M9XCJ0aXRsZVwiPjxzcGFuIGNsYXNzPVwidG9nZ2xlLWhhbmRsZVwiPjwvc3Bhbj4ke3RoaXMuc2NoZW1hLnRpdGxlIHx8ICcnfSA8L2E+XG4gICAgICAgICAgYH1cblxuICAgICAgICAgICAgPHNwYW4gY2xhc3M9XCJ0eXBlXCI+JHt0aGlzLnNjaGVtYS50eXBlfTwvc3Bhbj5cblxuICAgICAgICAgXG5cbiAgICAgICAgICAke19pZighdGhpcy5pc0NvbGxhcHNlZCAmJiB0aGlzLnNjaGVtYS5mb3JtYXQpYFxuICAgICAgICAgICAgPHNwYW4gY2xhc3M9XCJmb3JtYXRcIj4oJHt0aGlzLnNjaGVtYS5mb3JtYXR9KTwvc3Bhbj5cbiAgICAgICAgICBgfVxuXG4gICAgICAgICAgJHtfaWYoIXRoaXMuaXNDb2xsYXBzZWQgJiYgdGhpcy5zY2hlbWEubWluaW11bSlgXG4gICAgICAgICAgICA8c3BhbiBjbGFzcz1cInJhbmdlIG1pbmltdW1cIj5taW5pbXVtOiR7dGhpcy5zY2hlbWEubWluaW11bX08L3NwYW4+XG4gICAgICAgICAgYH1cblxuICAgICAgICAgICR7X2lmKCF0aGlzLmlzQ29sbGFwc2VkICYmIHRoaXMuc2NoZW1hLmV4Y2x1c2l2ZU1pbmltdW0pYFxuICAgICAgICAgICAgPHNwYW4gY2xhc3M9XCJyYW5nZSBleGNsdXNpdmVNaW5pbXVtXCI+KGV4KW1pbmltdW06JHt0aGlzLnNjaGVtYS5leGNsdXNpdmVNaW5pbXVtfTwvc3Bhbj5cbiAgICAgICAgICBgfVxuXG4gICAgICAgICAgJHtfaWYoIXRoaXMuaXNDb2xsYXBzZWQgJiYgdGhpcy5zY2hlbWEubWF4aW11bSlgXG4gICAgICAgICAgICA8c3BhbiBjbGFzcz1cInJhbmdlIG1heGltdW1cIj5tYXhpbXVtOiR7dGhpcy5zY2hlbWEubWF4aW11bX08L3NwYW4+XG4gICAgICAgICAgYH1cblxuICAgICAgICAgICR7X2lmKCF0aGlzLmlzQ29sbGFwc2VkICYmIHRoaXMuc2NoZW1hLmV4Y2x1c2l2ZU1heGltdW0pYFxuICAgICAgICAgICAgPHNwYW4gY2xhc3M9XCJyYW5nZSBleGNsdXNpdmVNYXhpbXVtXCI+KGV4KW1heGltdW06JHt0aGlzLnNjaGVtYS5leGNsdXNpdmVNYXhpbXVtfTwvc3Bhbj5cbiAgICAgICAgICBgfVxuXG4gICAgICAgICAgJHtfaWYoIXRoaXMuaXNDb2xsYXBzZWQgJiYgdGhpcy5zY2hlbWEubWluTGVuZ3RoKWBcbiAgICAgICAgICAgIDxzcGFuIGNsYXNzPVwicmFuZ2UgbWluTGVuZ3RoXCI+bWluTGVuZ3RoOiR7dGhpcy5zY2hlbWEubWluTGVuZ3RofTwvc3Bhbj5cbiAgICAgICAgICBgfVxuXG4gICAgICAgICAgJHtfaWYoIXRoaXMuaXNDb2xsYXBzZWQgJiYgdGhpcy5zY2hlbWEubWF4TGVuZ3RoKWBcbiAgICAgICAgICAgIDxzcGFuIGNsYXNzPVwicmFuZ2UgbWF4TGVuZ3RoXCI+bWF4TGVuZ3RoOiR7dGhpcy5zY2hlbWEubWF4TGVuZ3RofTwvc3Bhbj5cbiAgICAgICAgICBgfVxuXG4gICAgICAgICAgJHtfaWYodGhpcy5zY2hlbWEuZGVzY3JpcHRpb24gJiYgIXRoaXMuaXNDb2xsYXBzZWQpYFxuICAgICAgICAgICAgPGRpdiBjbGFzcz1cImlubmVyIGRlc2NyaXB0aW9uXCI+JHt0aGlzLnNjaGVtYS5kZXNjcmlwdGlvbn08L2Rpdj5cbiAgICAgICAgICBgfVxuXHRcdCAgXG5cdFx0IFxuXHRcdCAgXG5cdFx0ICAgJHtfaWYodGhpcy5zY2hlbWEucmVxdWlyZWQgJiYgIXRoaXMuaXNDb2xsYXBzZWQpYFxuICAgICAgICAgICAgPGRpdiBjbGFzcz1cImlubmVyIHJlcXVpcmVkXCI+UmVxdWlyZWQ8L2Rpdj5cbiAgICAgICAgICBgfVxuXHRcdCAgJHtfaWYodGhpcy5zY2hlbWEuZGVmYXVsdCAmJiAhdGhpcy5pc0NvbGxhcHNlZClgXG4gICAgICAgICAgICA8ZGl2IGNsYXNzPVwiaW5uZXIgZGVmYXVsdFwiPkRlZmF1bHQ6ICR7dGhpcy5zY2hlbWEuZGVmYXVsdH08L2Rpdj5cbiAgICAgICAgICBgfVxuXHRcdCAgICR7X2lmKHRoaXMuc2NoZW1hLnBhdHRlcm4gJiYgIXRoaXMuaXNDb2xsYXBzZWQpYFxuICAgICAgICAgICAgPGRpdiBjbGFzcz1cImlubmVyIHBhdHRlcm5cIj5QYXR0ZXJuOiAke3RoaXMuc2NoZW1hLnBhdHRlcm59PC9kaXY+XG4gICAgICAgICAgYH1cblxuICAgICAgICAgICR7X2lmKCF0aGlzLmlzQ29sbGFwc2VkICYmIHRoaXMuc2NoZW1hLmVudW0pYFxuICAgICAgICAgICAgJHt0aGlzLmVudW0odGhpcy5zY2hlbWEsIHRoaXMuaXNDb2xsYXBzZWQsIHRoaXMub3Blbil9XG4gICAgICAgICAgYH1cblxuICAgICAgICAgICR7X2lmKHRoaXMuc2NoZW1hLmFsbE9mICYmICF0aGlzLmlzQ29sbGFwc2VkKWAke3RoaXMueE9mKHRoaXMuc2NoZW1hLCAnYWxsT2YnKX1gfVxuICAgICAgICAgICR7X2lmKHRoaXMuc2NoZW1hLm9uZU9mICYmICF0aGlzLmlzQ29sbGFwc2VkKWAke3RoaXMueE9mKHRoaXMuc2NoZW1hLCAnb25lT2YnKX1gfVxuICAgICAgICAgICR7X2lmKHRoaXMuc2NoZW1hLmFueU9mICYmICF0aGlzLmlzQ29sbGFwc2VkKWAke3RoaXMueE9mKHRoaXMuc2NoZW1hLCAnYW55T2YnKX1gfVxuICAgICAgICA8L2Rpdj5cbiAgICAgIGB9XG5cblxuICAgICAgPCEtLSBBcnJheSAtLT5cbiAgICAgICR7X2lmKHRoaXMuaXNBcnJheSlgXG4gICAgICAgIDxkaXYgY2xhc3M9XCJhcnJheVwiPlxuICAgICAgICAgIDxhIGNsYXNzPVwidGl0bGVcIj48c3BhbiBjbGFzcz1cInRvZ2dsZS1oYW5kbGVcIj48L3NwYW4+JHt0aGlzLnNjaGVtYS50aXRsZSB8fCAnJ308c3BhbiBjbGFzcz1cIm9wZW5pbmcgYnJhY2tldFwiPls8L3NwYW4+JHtfaWYodGhpcy5pc0NvbGxhcHNlZClgPHNwYW4gY2xhc3M9XCJjbG9zaW5nIGJyYWNrZXRcIj5dPC9zcGFuPmB9PC9hPlxuICAgICAgICAgICR7X2lmKCF0aGlzLmlzQ29sbGFwc2VkICYmICh0aGlzLnNjaGVtYS51bmlxdWVJdGVtcyB8fCB0aGlzLnNjaGVtYS5taW5JdGVtcyB8fCB0aGlzLnNjaGVtYS5tYXhJdGVtcykpYFxuICAgICAgICAgIDxzcGFuPlxuICAgICAgICAgICAgPHNwYW4gdGl0bGU9XCJpdGVtcyByYW5nZVwiPigke3RoaXMuc2NoZW1hLm1pbkl0ZW1zIHx8IDB9Li4ke3RoaXMuc2NoZW1hLm1heEl0ZW1zIHx8ICfiiJ4nfSk8L3NwYW4+XG4gICAgICAgICAgICAke19pZighdGhpcy5pc0NvbGxhcHNlZCAmJiB0aGlzLnNjaGVtYS51bmlxdWVJdGVtcylgPHNwYW4gdGl0bGU9XCJ1bmlxdWVcIiBjbGFzcz1cInVuaXF1ZUl0ZW1zXCI+4pmmPC9zcGFuPmB9XG4gICAgICAgICAgPC9zcGFuPlxuICAgICAgICAgIGB9XG4gICAgICAgICAgPGRpdiBjbGFzcz1cImlubmVyXCI+XG4gICAgICAgICAgICAke19pZighdGhpcy5pc0NvbGxhcHNlZCAmJiB0aGlzLnNjaGVtYS5kZXNjcmlwdGlvbilgXG4gICAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJkZXNjcmlwdGlvblwiPiR7dGhpcy5zY2hlbWEuZGVzY3JpcHRpb259PC9kaXY+XG4gICAgICAgICAgICBgfVxuICAgICAgICAgIDwvZGl2PlxuXG4gICAgICAgICAgJHtfaWYoIXRoaXMuaXNDb2xsYXBzZWQgJiYgdGhpcy5zY2hlbWEuZW51bSlgXG4gICAgICAgICAgICAke3RoaXMuZW51bSh0aGlzLnNjaGVtYSwgdGhpcy5pc0NvbGxhcHNlZCwgdGhpcy5vcGVuKX1cbiAgICAgICAgICBgfVxuXG4gICAgICAgICAgJHtfaWYodGhpcy5zY2hlbWEuYWxsT2YgJiYgIXRoaXMuaXNDb2xsYXBzZWQpYCR7dGhpcy54T2YodGhpcy5zY2hlbWEsICdhbGxPZicpfWB9XG4gICAgICAgICAgJHtfaWYodGhpcy5zY2hlbWEub25lT2YgJiYgIXRoaXMuaXNDb2xsYXBzZWQpYCR7dGhpcy54T2YodGhpcy5zY2hlbWEsICdvbmVPZicpfWB9XG4gICAgICAgICAgJHtfaWYodGhpcy5zY2hlbWEuYW55T2YgJiYgIXRoaXMuaXNDb2xsYXBzZWQpYCR7dGhpcy54T2YodGhpcy5zY2hlbWEsICdhbnlPZicpfWB9XG5cbiAgICAgICAgICAke19pZighdGhpcy5pc0NvbGxhcHNlZClgXG4gICAgICAgICAgPHNwYW4gY2xhc3M9XCJjbG9zaW5nIGJyYWNrZXRcIj5dPC9zcGFuPlxuICAgICAgICAgIGB9XG4gICAgICAgIDwvZGl2PlxuICAgICAgYH1cblxuICAgICAgPCEtLSBPYmplY3QgLS0+XG4gICAgICAke19pZighdGhpcy5pc1ByaW1pdGl2ZSAmJiAhdGhpcy5pc0FycmF5ICYmICF0aGlzLmlzQW55KWBcbiAgICAgICAgPGRpdiBjbGFzcz1cIm9iamVjdFwiPlxuICAgICAgICAgIDxhIGNsYXNzPVwidGl0bGVcIj48c3BhblxuICAgICAgICAgICAgY2xhc3M9XCJ0b2dnbGUtaGFuZGxlXCI+PC9zcGFuPiR7dGhpcy5zY2hlbWEudGl0bGUgfHwgJyd9IDxzcGFuXG4gICAgICAgICAgICBjbGFzcz1cIm9wZW5pbmcgYnJhY2VcIj57PC9zcGFuPiR7X2lmKHRoaXMuaXNDb2xsYXBzZWQpYFxuICAgICAgICAgICAgICA8c3BhbiBjbGFzcz1cImNsb3NpbmcgYnJhY2VcIiBuZy1pZj1cImlzQ29sbGFwc2VkXCI+fTwvc3Bhbj5cbiAgICAgICAgICBgfTwvYT5cblxuICAgICAgICAgIDxkaXYgY2xhc3M9XCJpbm5lclwiPlxuICAgICAgICAgICAgJHtfaWYoIXRoaXMuaXNDb2xsYXBzZWQgJiYgdGhpcy5zY2hlbWEuZGVzY3JpcHRpb24pYFxuICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwiZGVzY3JpcHRpb25cIj4ke3RoaXMuc2NoZW1hLmRlc2NyaXB0aW9ufTwvZGl2PlxuICAgICAgICAgICAgYH1cbiAgICAgICAgICAgIDwhLS0gY2hpbGRyZW4gZ28gaGVyZSAtLT5cblx0XHQgIFxuXHRcdCAgICR7X2lmKHRoaXMuc2NoZW1hLnJlcXVpcmVkICYmICF0aGlzLmlzQ29sbGFwc2VkKWBcbiAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJyZXF1aXJlZFwiPkRlZmF1bHQgRmllbGRzOiAke3RoaXMuc2NoZW1hLnJlcXVpcmVkfTwvZGl2PlxuICAgICAgICAgIGB9XG5cdFx0ICAke19pZih0aGlzLnNjaGVtYS5kZWZhdWx0ICYmICF0aGlzLmlzQ29sbGFwc2VkKWBcbiAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJkZWZhdWx0XCI+RGVmYXVsdDogJHt0aGlzLnNjaGVtYS5kZWZhdWx0fTwvZGl2PlxuICAgICAgICAgIGB9XG5cdFx0ICBcblx0XHRcdCR7X2lmKCF0aGlzLmlzQ29sbGFwc2VkICYmIHRoaXMuc2NoZW1hLnBhdHRlcm4pYFxuICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicGF0dGVyblwiPlBhdHRlcm46ICR7dGhpcy5zY2hlbWEucGF0dGVybn08L2Rpdj5cbiAgICAgICAgICAgIGB9XG4gICAgICAgICAgPC9kaXY+XG5cbiAgICAgICAgICAke19pZighdGhpcy5pc0NvbGxhcHNlZCAmJiB0aGlzLnNjaGVtYS5lbnVtKWBcbiAgICAgICAgICAgICR7dGhpcy5lbnVtKHRoaXMuc2NoZW1hLCB0aGlzLmlzQ29sbGFwc2VkLCB0aGlzLm9wZW4pfVxuICAgICAgICAgIGB9XG5cbiAgICAgICAgICAke19pZih0aGlzLnNjaGVtYS5hbGxPZiAmJiAhdGhpcy5pc0NvbGxhcHNlZClgJHt0aGlzLnhPZih0aGlzLnNjaGVtYSwgJ2FsbE9mJyl9YH1cbiAgICAgICAgICAke19pZih0aGlzLnNjaGVtYS5vbmVPZiAmJiAhdGhpcy5pc0NvbGxhcHNlZClgJHt0aGlzLnhPZih0aGlzLnNjaGVtYSwgJ29uZU9mJyl9YH1cbiAgICAgICAgICAke19pZih0aGlzLnNjaGVtYS5hbnlPZiAmJiAhdGhpcy5pc0NvbGxhcHNlZClgJHt0aGlzLnhPZih0aGlzLnNjaGVtYSwgJ2FueU9mJyl9YH1cblxuICAgICAgICAgICR7X2lmKCF0aGlzLmlzQ29sbGFwc2VkKWBcbiAgICAgICAgICA8c3BhbiBjbGFzcz1cImNsb3NpbmcgYnJhY2VcIj59PC9zcGFuPlxuICAgICAgICAgIGB9XG4gICAgICAgIDwvZGl2PlxuICAgICAgYH1cbmAucmVwbGFjZSgvXFxzKlxcbi9nLCAnXFxuJykucmVwbGFjZSgvKFxcPFxcIVxcLVxcLSkuKy9nLCAnJykudHJpbSgpO1xuICB9XG5cbiAgLypcbiAgICogVGVtcGxhdGUgZm9yIG9uZU9mLCBhbnlPZiBhbmQgYWxsT2ZcbiAgKi9cbiAgeE9mKHNjaGVtYSwgdHlwZSkge1xuICAgIHJldHVybiBgXG4gICAgICA8ZGl2IGNsYXNzPVwiaW5uZXIgJHt0eXBlfVwiPlxuICAgICAgICA8Yj4ke2NvbnZlcnRYT2YodHlwZSl9OjwvYj5cbiAgICAgIDwvZGl2PlxuICAgIGA7XG4gIH1cblxuICAvKlxuICAgKiBUZW1wbGF0ZSBmb3IgZW51bXNcbiAgKi9cbiAgZW51bShzY2hlbWEsIGlzQ29sbGFwc2VkLCBvcGVuKSB7XG4gICAgcmV0dXJuIGBcbiAgICAgICR7X2lmKCFpc0NvbGxhcHNlZCAmJiBzY2hlbWEuZW51bSlgXG4gICAgICAgIDxkaXYgY2xhc3M9XCJpbm5lciBlbnVtc1wiPlxuICAgICAgICAgIDxiPkVudW06PC9iPlxuICAgICAgICA8L2Rpdj5cbiAgICAgIGB9XG4gICAgYDtcbiAgfVxuXG4gIC8qXG4gICAqIFRvZ2dsZXMgdGhlICdjb2xsYXBzZWQnIHN0YXRlXG4gICovXG4gIHRvZ2dsZSgpIHtcbiAgICB0aGlzLmlzQ29sbGFwc2VkID0gIXRoaXMuaXNDb2xsYXBzZWQ7XG4gICAgdGhpcy5yZW5kZXIoKTtcbiAgfVxuXG4gIC8qXG4gICAqIFJlbmRlcnMgdGhlIGVsZW1lbnQgYW5kIHJldHVybnMgaXRcbiAgKi9cbiAgcmVuZGVyKCkge1xuICAgIGlmICghdGhpcy5lbGVtZW50KSB7XG4gICAgICB0aGlzLmVsZW1lbnQgPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50KCdkaXYnKTtcbiAgICAgIHRoaXMuZWxlbWVudC5jbGFzc0xpc3QuYWRkKCdqc29uLXNjaGVtYS12aWV3Jyk7XG4gICAgfVxuXG4gICAgaWYgKHRoaXMuaXNDb2xsYXBzZWQpIHtcbiAgICAgIHRoaXMuZWxlbWVudC5jbGFzc0xpc3QuYWRkKCdjb2xsYXBzZWQnKTtcbiAgICB9IGVsc2Uge1xuICAgICAgdGhpcy5lbGVtZW50LmNsYXNzTGlzdC5yZW1vdmUoJ2NvbGxhcHNlZCcpO1xuICAgIH1cblxuICAgIGlmICh0aGlzLm9wdGlvbnMudGhlbWUpIHtcbiAgICAgIHRoaXMuZWxlbWVudC5jbGFzc0xpc3QuYWRkKGBqc29uLXNjaGVtYS12aWV3LSR7dGhpcy5vcHRpb25zLnRoZW1lfWApO1xuICAgIH1cblxuICAgIHRoaXMuZWxlbWVudC5pbm5lckhUTUwgPSB0aGlzLnRlbXBsYXRlKCk7XG5cbiAgICBpZiAoIXRoaXMuc2NoZW1hKSB7XG4gICAgICByZXR1cm4gdGhpcy5lbGVtZW50O1xuICAgIH1cblxuICAgIGlmICghdGhpcy5pc0NvbGxhcHNlZCkge1xuICAgICAgdGhpcy5hcHBlbmRDaGlsZHJlbih0aGlzLmVsZW1lbnQpO1xuICAgIH1cblxuICAgIC8vIGFkZCBldmVudCBsaXN0ZW5lciBmb3IgdG9nZ2xpbmdcbiAgICBpZiAodGhpcy5lbGVtZW50LnF1ZXJ5U2VsZWN0b3IoJ2EudGl0bGUnKSkge1xuICAgICAgdGhpcy5lbGVtZW50LnF1ZXJ5U2VsZWN0b3IoJ2EudGl0bGUnKS5hZGRFdmVudExpc3RlbmVyKCdjbGljaycsIHRoaXMudG9nZ2xlLmJpbmQodGhpcykpO1xuICAgIH1cbiAgICByZXR1cm4gdGhpcy5lbGVtZW50O1xuICB9XG5cbiAgLypcbiAgICogQXBwZW5kcyBjaGlsZHJlbiB0byBnaXZlbiBlbGVtZW50IGJhc2VkIG9uIGN1cnJlbnQgc2NoZW1hXG4gICovXG4gIGFwcGVuZENoaWxkcmVuKGVsZW1lbnQpIHtcbiAgICBjb25zdCBpbm5lciA9IGVsZW1lbnQucXVlcnlTZWxlY3RvcignLmlubmVyJyk7XG5cbiAgICBpZiAoIWlubmVyKSB7XG4gICAgICByZXR1cm47XG4gICAgfVxuXG4gICAgaWYgKHRoaXMuc2NoZW1hLmVudW0pIHtcbiAgICAgIGNvbnN0IGZvcm1hdHRlciA9IG5ldyBKU09ORm9ybWF0dGVyKHRoaXMuc2NoZW1hLmVudW0sIHRoaXMub3BlbiAtIDEpO1xuICAgICAgY29uc3QgZm9ybWF0dGVyRWwgPSBmb3JtYXR0ZXIucmVuZGVyKCk7XG4gICAgICBmb3JtYXR0ZXJFbC5jbGFzc0xpc3QuYWRkKCdpbm5lcicpO1xuICAgICAgZWxlbWVudC5xdWVyeVNlbGVjdG9yKCcuZW51bXMuaW5uZXInKS5hcHBlbmRDaGlsZChmb3JtYXR0ZXJFbCk7XG5cbiAgICB9XG5cbiAgICBpZiAodGhpcy5pc0FycmF5KSB7XG4gICAgICBjb25zdCB2aWV3ID0gbmV3IEpTT05TY2hlbWFWaWV3KHRoaXMuc2NoZW1hLml0ZW1zLCB0aGlzLm9wZW4gLSAxKVxuICAgICAgaW5uZXIuYXBwZW5kQ2hpbGQodmlldy5yZW5kZXIoKSk7XG4gICAgfVxuXG4gICAgaWYgKHR5cGVvZiB0aGlzLnNjaGVtYS5wcm9wZXJ0aWVzID09PSAnb2JqZWN0Jykge1xuICAgICAgT2JqZWN0LmtleXModGhpcy5zY2hlbWEucHJvcGVydGllcykuZm9yRWFjaChwcm9wZXJ0eU5hbWUgPT4ge1xuICAgICAgICBjb25zdCBwcm9wZXJ0eSA9IHRoaXMuc2NoZW1hLnByb3BlcnRpZXNbcHJvcGVydHlOYW1lXTtcbiAgICAgICAgY29uc3QgdGVtcERpdiA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoJ2RpdicpOztcbiAgICAgICAgdGVtcERpdi5pbm5lckhUTUwgPSBgPGRpdiBjbGFzcz1cInByb3BlcnR5XCI+XG4gICAgICAgICAgPHNwYW4gY2xhc3M9XCJuYW1lXCI+JHtwcm9wZXJ0eU5hbWV9Ojwvc3Bhbj5cbiAgICAgICAgPC9kaXY+YDtcbiAgICAgICAgY29uc3QgdmlldyA9IG5ldyBKU09OU2NoZW1hVmlldyhwcm9wZXJ0eSwgdGhpcy5vcGVuIC0gMSk7XG4gICAgICAgIHRlbXBEaXYucXVlcnlTZWxlY3RvcignLnByb3BlcnR5JykuYXBwZW5kQ2hpbGQodmlldy5yZW5kZXIoKSk7XG5cbiAgICAgICAgaW5uZXIuYXBwZW5kQ2hpbGQodGVtcERpdi5xdWVyeVNlbGVjdG9yKCcucHJvcGVydHknKSk7XG4gICAgICB9KTtcbiAgICB9XG5cbiAgICBpZiAodGhpcy5zY2hlbWEuYWxsT2YpIHsgYXBwZW5kWE9mLmNhbGwodGhpcywgJ2FsbE9mJyk7IH1cbiAgICBpZiAodGhpcy5zY2hlbWEub25lT2YpIHsgYXBwZW5kWE9mLmNhbGwodGhpcywgJ29uZU9mJyk7IH1cbiAgICBpZiAodGhpcy5zY2hlbWEuYW55T2YpIHsgYXBwZW5kWE9mLmNhbGwodGhpcywgJ2FueU9mJyk7IH1cblxuICAgIGZ1bmN0aW9uIGFwcGVuZFhPZih0eXBlKSB7XG4gICAgICBjb25zdCBpbm5lckFsbE9mID0gZWxlbWVudC5xdWVyeVNlbGVjdG9yKGAuaW5uZXIuJHt0eXBlfWApO1xuXG4gICAgICB0aGlzLnNjaGVtYVt0eXBlXS5mb3JFYWNoKHNjaGVtYSA9PiB7XG4gICAgICAgIGNvbnN0IGlubmVyID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgnZGl2Jyk7XG4gICAgICAgIGlubmVyLmNsYXNzTGlzdC5hZGQoJ2lubmVyJyk7XG4gICAgICAgIGNvbnN0IHZpZXcgPSBuZXcgSlNPTlNjaGVtYVZpZXcoc2NoZW1hLCB0aGlzLm9wZW4gLSAxKTtcbiAgICAgICAgaW5uZXIuYXBwZW5kQ2hpbGQodmlldy5yZW5kZXIoKSk7XG4gICAgICAgIGlubmVyQWxsT2YuYXBwZW5kQ2hpbGQoaW5uZXIpO1xuICAgICAgfSk7XG4gICAgfVxuICB9XG59XG4iXX0=
  
  </script>
  <script>
  (function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.$RefParser = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
  /** !
   * JSON Schema $Ref Parser v3.1.2
   *
   * @link https://github.com/BigstickCarpet/json-schema-ref-parser
   * @license MIT
   */
  "use strict";function bundle(e,r){debug("Bundling $ref pointers in %s",e.$refs._root$Ref.path);var t=[];crawl(e,"schema",e.$refs._root$Ref.path+"#","#",t,e.$refs,r),remap(t)}function crawl(e,r,t,f,n,i,a){var o=null===r?e:e[r];if(o&&"object"==typeof o)if($Ref.is$Ref(o))inventory$Ref(e,r,t,f,n,i,a);else{var l=Object.keys(o),u=l.indexOf("definitions");u>0&&l.splice(0,0,l.splice(u,1)[0]),l.forEach(function(e){var r=Pointer.join(t,e),l=Pointer.join(f,e),u=o[e];$Ref.is$Ref(u)?inventory$Ref(o,e,t,l,n,i,a):crawl(o,e,r,l,n,i,a)})}}function inventory$Ref(e,r,t,f,n,i,a){if(!n.some(function(t){return t.parent===e&&t.key===r})){var o=null===r?e:e[r],l=url.resolve(t,o.$ref),u=i._resolve(l,a),h=Pointer.parse(f).length,s=url.stripHash(u.path),$=url.getHash(u.path),c=s!==i._root$Ref.path,p=$Ref.isExtended$Ref(o);n.push({$ref:o,parent:e,key:r,pathFromRoot:f,depth:h,file:s,hash:$,value:u.value,circular:u.circular,extended:p,external:c}),crawl(u.value,null,u.path,f,n,i,a)}}function remap(e){e.sort(function(e,r){return e.file!==r.file?e.file<r.file?-1:1:e.hash!==r.hash?e.hash<r.hash?-1:1:e.circular!==r.circular?e.circular?-1:1:e.extended!==r.extended?e.extended?1:-1:e.depth!==r.depth?e.depth-r.depth:r.pathFromRoot.lastIndexOf("/definitions")-e.pathFromRoot.lastIndexOf("/definitions")});var r,t,f;e.forEach(function(e){debug('Re-mapping $ref pointer "%s" at %s',e.$ref.$ref,e.pathFromRoot),e.external?e.file===r&&e.hash===t?e.$ref.$ref=f:e.file===r&&0===e.hash.indexOf(t+"/")?e.$ref.$ref=Pointer.join(f,Pointer.parse(e.hash)):(r=e.file,t=e.hash,f=e.pathFromRoot,e.$ref=e.parent[e.key]=$Ref.dereference(e.$ref,e.value),e.circular&&(e.$ref.$ref=e.pathFromRoot)):e.$ref.$ref=e.hash,debug("    new value: %s",e.$ref&&e.$ref.$ref?e.$ref.$ref:"[object Object]")})}var $Ref=require("./ref"),Pointer=require("./pointer"),debug=require("./util/debug"),url=require("./util/url");module.exports=bundle;
  
  },{"./pointer":10,"./ref":11,"./util/debug":16,"./util/url":19}],2:[function(require,module,exports){
  "use strict";function dereference(e,r){debug("Dereferencing $ref pointers in %s",e.$refs._root$Ref.path);var c=crawl(e.schema,e.$refs._root$Ref.path,"#",[],e.$refs,r);e.$refs.circular=c.circular,e.schema=c.value}function crawl(e,r,c,u,f,i){var n,a={value:e,circular:!1};return e&&"object"==typeof e&&(u.push(e),$Ref.isAllowed$Ref(e,i)?(n=dereference$Ref(e,r,c,u,f,i),a.circular=n.circular,a.value=n.value):Object.keys(e).forEach(function(l){var o=Pointer.join(r,l),t=Pointer.join(c,l),d=e[l],$=!1;$Ref.isAllowed$Ref(d,i)?(n=dereference$Ref(d,o,t,u,f,i),$=n.circular,e[l]=n.value):-1===u.indexOf(d)?(n=crawl(d,o,t,u,f,i),$=n.circular,e[l]=n.value):$=foundCircularReference(o,f,i),a.circular=a.circular||$}),u.pop()),a}function dereference$Ref(e,r,c,u,f,i){debug('Dereferencing $ref pointer "%s" at %s',e.$ref,r);var n=url.resolve(r,e.$ref),a=f._resolve(n,i),l=a.circular,o=l||-1!==u.indexOf(a.value);o&&foundCircularReference(r,f,i);var t=$Ref.dereference(e,a.value);if(!o){var d=crawl(t,a.path,c,u,f,i);o=d.circular,t=d.value}return o&&!l&&"ignore"===i.dereference.circular&&(t=e),l&&(t.$ref=c),{circular:o,value:t}}function foundCircularReference(e,r,c){if(r.circular=!0,!c.dereference.circular)throw ono.reference("Circular $ref pointer found at %s",e);return!0}var $Ref=require("./ref"),Pointer=require("./pointer"),ono=require("ono"),debug=require("./util/debug"),url=require("./util/url");module.exports=dereference;
  
  },{"./pointer":10,"./ref":11,"./util/debug":16,"./util/url":19,"ono":69}],3:[function(require,module,exports){
  (function (Buffer){
  "use strict";function $RefParser(){this.schema=null,this.$refs=new $Refs}function normalizeArgs(e){var r,t,a,s;return e=Array.prototype.slice.call(e),"function"==typeof e[e.length-1]&&(s=e.pop()),"string"==typeof e[0]?(r=e[0],"object"==typeof e[2]?(t=e[1],a=e[2]):(t=void 0,a=e[1])):(r="",t=e[0],a=e[1]),a instanceof Options||(a=new Options(a)),{path:r,schema:t,options:a,callback:s}}var Promise=require("./util/promise"),Options=require("./options"),$Refs=require("./refs"),parse=require("./parse"),resolveExternal=require("./resolve-external"),bundle=require("./bundle"),dereference=require("./dereference"),url=require("./util/url"),maybe=require("call-me-maybe"),ono=require("ono");module.exports=$RefParser,module.exports.YAML=require("./util/yaml"),$RefParser.parse=function(e,r,t){var a=this,s=new a;return s.parse.apply(s,arguments)},$RefParser.prototype.parse=function(e,r,t){var a,s=normalizeArgs(arguments);if(!s.path&&!s.schema){var n=ono("Expected a file path, URL, or object. Got %s",s.path||s.schema);return maybe(s.callback,Promise.reject(n))}this.schema=null,this.$refs=new $Refs,url.isFileSystemPath(s.path)&&(s.path=url.fromFileSystemPath(s.path)),s.path=url.resolve(url.cwd(),s.path),s.schema&&"object"==typeof s.schema?(this.$refs._add(s.path,s.schema),a=Promise.resolve(s.schema)):a=parse(s.path,this.$refs,s.options);var o=this;return a.then(function(e){if(!e||"object"!=typeof e||Buffer.isBuffer(e))throw ono.syntax('"%s" is not a valid JSON Schema',o.$refs._root$Ref.path||e);return o.schema=e,maybe(s.callback,Promise.resolve(o.schema))})["catch"](function(e){return maybe(s.callback,Promise.reject(e))})},$RefParser.resolve=function(e,r,t){var a=this,s=new a;return s.resolve.apply(s,arguments)},$RefParser.prototype.resolve=function(e,r,t){var a=this,s=normalizeArgs(arguments);return this.parse(s.path,s.schema,s.options).then(function(){return resolveExternal(a,s.options)}).then(function(){return maybe(s.callback,Promise.resolve(a.$refs))})["catch"](function(e){return maybe(s.callback,Promise.reject(e))})},$RefParser.bundle=function(e,r,t){var a=this,s=new a;return s.bundle.apply(s,arguments)},$RefParser.prototype.bundle=function(e,r,t){var a=this,s=normalizeArgs(arguments);return this.resolve(s.path,s.schema,s.options).then(function(){return bundle(a,s.options),maybe(s.callback,Promise.resolve(a.schema))})["catch"](function(e){return maybe(s.callback,Promise.reject(e))})},$RefParser.dereference=function(e,r,t){var a=this,s=new a;return s.dereference.apply(s,arguments)},$RefParser.prototype.dereference=function(e,r,t){var a=this,s=normalizeArgs(arguments);return this.resolve(s.path,s.schema,s.options).then(function(){return dereference(a,s.options),maybe(s.callback,Promise.resolve(a.schema))})["catch"](function(e){return maybe(s.callback,Promise.reject(e))})};
  
  }).call(this,{"isBuffer":require("../node_modules/is-buffer/index.js")})
  
  },{"../node_modules/is-buffer/index.js":36,"./bundle":1,"./dereference":2,"./options":4,"./parse":5,"./refs":12,"./resolve-external":13,"./util/promise":18,"./util/url":19,"./util/yaml":20,"call-me-maybe":27,"ono":69}],4:[function(require,module,exports){
  "use strict";function $RefParserOptions(e){merge(this,$RefParserOptions.defaults),merge(this,e)}function merge(e,r){if(isMergeable(r))for(var s=Object.keys(r),a=0;a<s.length;a++){var t=s[a],i=r[t],o=e[t];isMergeable(i)?e[t]=merge(o||{},i):void 0!==i&&(e[t]=i)}return e}function isMergeable(e){return e&&"object"==typeof e&&!Array.isArray(e)&&!(e instanceof RegExp)&&!(e instanceof Date)}var jsonParser=require("./parsers/json"),yamlParser=require("./parsers/yaml"),textParser=require("./parsers/text"),binaryParser=require("./parsers/binary"),fileResolver=require("./resolvers/file"),httpResolver=require("./resolvers/http"),zschemaValidator=require("./validators/z-schema");module.exports=$RefParserOptions,$RefParserOptions.defaults={parse:{json:jsonParser,yaml:yamlParser,text:textParser,binary:binaryParser},resolve:{file:fileResolver,http:httpResolver,external:!0},dereference:{circular:!0},validate:{zschema:zschemaValidator}};
  
  },{"./parsers/binary":6,"./parsers/json":7,"./parsers/text":8,"./parsers/yaml":9,"./resolvers/file":14,"./resolvers/http":15,"./validators/z-schema":21}],5:[function(require,module,exports){
  (function (Buffer){
  "use strict";function parse(r,e,n){try{r=url.stripHash(r);var t=e._add(r),u={url:r,extension:url.getExtension(r)};return readFile(u,n).then(function(r){return t.pathType=r.plugin.name,u.data=r.result,parseFile(u,n)}).then(function(r){return t.value=r.result,r.result})}catch(i){return Promise.reject(i)}}function readFile(r,e){return new Promise(function(n,t){function u(e){t(!e||e instanceof SyntaxError?ono.syntax('Unable to resolve $ref pointer "%s"',r.url):e)}debug("Reading %s",r.url);var i=plugins.all(e.resolve);i=plugins.filter(i,"canRead",r),plugins.sort(i),plugins.run(i,"read",r).then(n,u)})}function parseFile(r,e){return new Promise(function(n,t){function u(e){!e.plugin.allowEmpty&&isEmpty(e.result)?t(ono.syntax('Error parsing "%s" as %s. \nParsed value is empty',r.url,e.plugin.name)):n(e)}function i(e){e?(e=e instanceof Error?e:new Error(e),t(ono.syntax(e,"Error parsing %s",r.url))):t(ono.syntax("Unable to parse %s",r.url))}debug("Parsing %s",r.url);var s=plugins.all(e.parse),l=plugins.filter(s,"canParse",r),o=l.length>0?l:s;plugins.sort(o),plugins.run(o,"parse",r).then(u,i)})}function isEmpty(r){return void 0===r||"object"==typeof r&&0===Object.keys(r).length||"string"==typeof r&&0===r.trim().length||Buffer.isBuffer(r)&&0===r.length}var ono=require("ono"),debug=require("./util/debug"),url=require("./util/url"),plugins=require("./util/plugins"),Promise=require("./util/promise");module.exports=parse;
  
  }).call(this,{"isBuffer":require("../node_modules/is-buffer/index.js")})
  
  },{"../node_modules/is-buffer/index.js":36,"./util/debug":16,"./util/plugins":17,"./util/promise":18,"./util/url":19,"ono":69}],6:[function(require,module,exports){
  (function (Buffer){
  "use strict";var BINARY_REGEXP=/\.(jpeg|jpg|gif|png|bmp|ico)$/i;module.exports={order:400,allowEmpty:!0,canParse:function(r){return Buffer.isBuffer(r.data)&&BINARY_REGEXP.test(r.url)},parse:function(r){return Buffer.isBuffer(r.data)?r.data:new Buffer(r.data)}};
  
  }).call(this,require("buffer").Buffer)
  
  },{"buffer":25}],7:[function(require,module,exports){
  (function (Buffer){
  "use strict";var Promise=require("../util/promise");module.exports={order:100,allowEmpty:!0,canParse:".json",parse:function(r){return new Promise(function(e,t){var i=r.data;Buffer.isBuffer(i)&&(i=i.toString()),e("string"==typeof i?0===i.trim().length?void 0:JSON.parse(i):i)})}};
  
  }).call(this,{"isBuffer":require("../../node_modules/is-buffer/index.js")})
  
  },{"../../node_modules/is-buffer/index.js":36,"../util/promise":18}],8:[function(require,module,exports){
  (function (Buffer){
  "use strict";var TEXT_REGEXP=/\.(txt|htm|html|md|xml|js|min|map|css|scss|less|svg)$/i;module.exports={order:300,allowEmpty:!0,encoding:"utf8",canParse:function(t){return("string"==typeof t.data||Buffer.isBuffer(t.data))&&TEXT_REGEXP.test(t.url)},parse:function(t){if("string"==typeof t.data)return t.data;if(Buffer.isBuffer(t.data))return t.data.toString(this.encoding);throw new Error("data is not text")}};
  
  }).call(this,{"isBuffer":require("../../node_modules/is-buffer/index.js")})
  
  },{"../../node_modules/is-buffer/index.js":36}],9:[function(require,module,exports){
  (function (Buffer){
  "use strict";var Promise=require("../util/promise"),YAML=require("../util/yaml");module.exports={order:200,allowEmpty:!0,canParse:[".yaml",".yml",".json"],parse:function(r){return new Promise(function(e,t){var i=r.data;Buffer.isBuffer(i)&&(i=i.toString()),e("string"==typeof i?YAML.parse(i):i)})}};
  
  }).call(this,{"isBuffer":require("../../node_modules/is-buffer/index.js")})
  
  },{"../../node_modules/is-buffer/index.js":36,"../util/promise":18,"../util/yaml":20}],10:[function(require,module,exports){
  "use strict";function Pointer(e,r){this.$ref=e,this.path=r,this.value=void 0,this.circular=!1}function resolveIf$Ref(e,r){if($Ref.isAllowed$Ref(e.value,r)){var t=url.resolve(e.path,e.value.$ref);if(t!==e.path){var s=e.$ref.$refs._resolve(t,r);return $Ref.isExtended$Ref(e.value)?e.value=$Ref.dereference(e.value,s.value):(e.$ref=s.$ref,e.path=s.path,e.value=s.value),!0}e.circular=!0}}function setValue(e,r,t){if(!e.value||"object"!=typeof e.value)throw ono.syntax('Error assigning $ref pointer "%s". \nCannot set "%s" of a non-object.',e.path,r);return"-"===r&&Array.isArray(e.value)?e.value.push(t):e.value[r]=t,t}module.exports=Pointer;var $Ref=require("./ref"),url=require("./util/url"),ono=require("ono"),slashes=/\//g,tildes=/~/g,escapedSlash=/~1/g,escapedTilde=/~0/g;Pointer.prototype.resolve=function(e,r){var t=Pointer.parse(this.path);this.value=e;for(var s=0;s<t.length;s++){resolveIf$Ref(this,r)&&(this.path=Pointer.join(this.path,t.slice(s)));var i=t[s];if(void 0===this.value[i])throw ono.syntax('Error resolving $ref pointer "%s". \nToken "%s" does not exist.',this.path,i);this.value=this.value[i]}return resolveIf$Ref(this,r),this},Pointer.prototype.set=function(e,r,t){var s,i=Pointer.parse(this.path);if(0===i.length)return this.value=r,r;this.value=e;for(var a=0;a<i.length-1;a++)resolveIf$Ref(this,t),s=i[a],this.value&&void 0!==this.value[s]?this.value=this.value[s]:this.value=setValue(this,s,{});return resolveIf$Ref(this,t),s=i[i.length-1],setValue(this,s,r),e},Pointer.parse=function(e){var r=url.getHash(e).substr(1);if(!r)return[];r=r.split("/");for(var t=0;t<r.length;t++)r[t]=decodeURI(r[t].replace(escapedSlash,"/").replace(escapedTilde,"~"));if(""!==r[0])throw ono.syntax('Invalid $ref pointer "%s". Pointers must begin with "#/"',r);return r.slice(1)},Pointer.join=function(e,r){-1===e.indexOf("#")&&(e+="#"),r=Array.isArray(r)?r:[r];for(var t=0;t<r.length;t++){var s=r[t];e+="/"+encodeURI(s.replace(tildes,"~0").replace(slashes,"~1"))}return e};
  
  },{"./ref":11,"./util/url":19,"ono":69}],11:[function(require,module,exports){
  "use strict";function $Ref(){this.path=void 0,this.value=void 0,this.$refs=void 0,this.pathType=void 0}module.exports=$Ref;var Pointer=require("./pointer");$Ref.prototype.exists=function(e,t){try{return this.resolve(e,t),!0}catch(r){return!1}},$Ref.prototype.get=function(e,t){return this.resolve(e,t).value},$Ref.prototype.resolve=function(e,t){var r=new Pointer(this,e);return r.resolve(this.value,t)},$Ref.prototype.set=function(e,t){var r=new Pointer(this,e);this.value=r.set(this.value,t)},$Ref.is$Ref=function(e){return e&&"object"==typeof e&&"string"==typeof e.$ref&&e.$ref.length>0},$Ref.isExternal$Ref=function(e){return $Ref.is$Ref(e)&&"#"!==e.$ref[0]},$Ref.isAllowed$Ref=function(e,t){return!$Ref.is$Ref(e)||"#"!==e.$ref[0]&&t&&!t.resolve.external?void 0:!0},$Ref.isExtended$Ref=function(e){return $Ref.is$Ref(e)&&Object.keys(e).length>1},$Ref.dereference=function(e,t){if(t&&"object"==typeof t&&$Ref.isExtended$Ref(e)){var r={};return Object.keys(e).forEach(function(t){"$ref"!==t&&(r[t]=e[t])}),Object.keys(t).forEach(function(e){e in r||(r[e]=t[e])}),r}return t};
  
  },{"./pointer":10}],12:[function(require,module,exports){
  "use strict";function $Refs(){this.circular=!1,this._$refs={},this._root$Ref=null}function getPaths(e,r){var t=Object.keys(e);return r=Array.isArray(r[0])?r[0]:Array.prototype.slice.call(r),r.length>0&&r[0]&&(t=t.filter(function(t){return-1!==r.indexOf(e[t].pathType)})),t.map(function(r){return{encoded:r,decoded:"file"===e[r].pathType?url.toFileSystemPath(r,!0):r}})}var ono=require("ono"),$Ref=require("./ref"),url=require("./util/url");module.exports=$Refs,$Refs.prototype.paths=function(e){var r=getPaths(this._$refs,arguments);return r.map(function(e){return e.decoded})},$Refs.prototype.values=function(e){var r=this._$refs,t=getPaths(r,arguments);return t.reduce(function(e,t){return e[t.decoded]=r[t.encoded].value,e},{})},$Refs.prototype.toJSON=$Refs.prototype.values,$Refs.prototype.exists=function(e,r){try{return this._resolve(e,r),!0}catch(t){return!1}},$Refs.prototype.get=function(e,r){return this._resolve(e,r).value},$Refs.prototype.set=function(e,r){e=url.resolve(this._root$Ref.path,e);var t=url.stripHash(e),o=this._$refs[t];if(!o)throw ono('Error resolving $ref pointer "%s". \n"%s" not found.',e,t);o.set(e,r)},$Refs.prototype._add=function(e,r){var t=url.stripHash(e),o=new $Ref;return o.path=t,o.value=r,o.$refs=this,this._$refs[t]=o,this._root$Ref=this._root$Ref||o,o},$Refs.prototype._resolve=function(e,r){e=url.resolve(this._root$Ref.path,e);var t=url.stripHash(e),o=this._$refs[t];if(!o)throw ono('Error resolving $ref pointer "%s". \n"%s" not found.',e,t);return o.resolve(e,r)},$Refs.prototype._get$Ref=function(e){e=url.resolve(this._root$Ref.path,e);var r=url.stripHash(e);return this._$refs[r]};
  
  },{"./ref":11,"./util/url":19,"ono":69}],13:[function(require,module,exports){
  "use strict";function resolveExternal(e,r){if(!r.resolve.external)return Promise.resolve();try{debug("Resolving $ref pointers in %s",e.$refs._root$Ref.path);var s=crawl(e.schema,e.$refs._root$Ref.path+"#",e.$refs,r);return Promise.all(s)}catch(t){return Promise.reject(t)}}function crawl(e,r,s,t){var o=[];return e&&"object"==typeof e&&($Ref.isExternal$Ref(e)?o.push(resolve$Ref(e,r,s,t)):Object.keys(e).forEach(function(i){var n=Pointer.join(r,i),l=e[i];$Ref.isExternal$Ref(l)?o.push(resolve$Ref(l,n,s,t)):o=o.concat(crawl(l,n,s,t))})),o}function resolve$Ref(e,r,s,t){debug('Resolving $ref pointer "%s" at %s',e.$ref,r);var o=url.resolve(r,e.$ref),i=url.stripHash(o);return e=s._$refs[i],e?Promise.resolve(e.value):parse(o,s,t).then(function(e){debug("Resolving $ref pointers in %s",i);var r=crawl(e,i+"#",s,t);return Promise.all(r)})}var Promise=require("./util/promise"),$Ref=require("./ref"),Pointer=require("./pointer"),parse=require("./parse"),debug=require("./util/debug"),url=require("./util/url");module.exports=resolveExternal;
  
  },{"./parse":5,"./pointer":10,"./ref":11,"./util/debug":16,"./util/promise":18,"./util/url":19}],14:[function(require,module,exports){
  "use strict";var fs=require("fs"),ono=require("ono"),Promise=require("../util/promise"),url=require("../util/url"),debug=require("../util/debug");module.exports={order:100,canRead:function(r){return url.isFileSystemPath(r.url)},read:function(r){return new Promise(function(e,i){var u;try{u=url.toFileSystemPath(r.url)}catch(o){i(ono.uri(o,"Malformed URI: %s",r.url))}debug("Opening file: %s",u);try{fs.readFile(u,function(r,o){r?i(ono(r,'Error opening file "%s"',u)):e(o)})}catch(o){i(ono(o,'Error opening file "%s"',u))}})}};
  
  },{"../util/debug":16,"../util/promise":18,"../util/url":19,"fs":24,"ono":69}],15:[function(require,module,exports){
  (function (process,Buffer){
  "use strict";function download(e,t,o){return new Promise(function(r,n){e=url.parse(e),o=o||[],o.push(e.href),get(e,t).then(function(s){if(s.statusCode>=400)throw ono({status:s.statusCode},"HTTP ERROR %d",s.statusCode);if(s.statusCode>=300)if(o.length>t.redirects)n(ono({status:s.statusCode},"Error downloading %s. \nToo many redirects: \n  %s",o[0],o.join(" \n  ")));else{if(!s.headers.location)throw ono({status:s.statusCode},"HTTP %d redirect with no location header",s.statusCode);debug("HTTP %d redirect %s -> %s",s.statusCode,e.href,s.headers.location);var u=url.resolve(e,s.headers.location);download(u,t,o).then(r,n)}else r(s.body||new Buffer(0))})["catch"](function(t){n(ono(t,"Error downloading",e.href))})})}function get(e,t){return new Promise(function(o,r){debug("GET",e.href);var n="https:"===e.protocol?https:http,s=n.get({hostname:e.hostname,port:e.port,path:e.path,auth:e.auth,headers:t.headers||{},withCredentials:t.withCredentials});"function"==typeof s.setTimeout&&s.setTimeout(t.timeout),s.on("timeout",function(){s.abort()}),s.on("error",r),s.once("response",function(e){e.body=new Buffer(0),e.on("data",function(t){e.body=Buffer.concat([e.body,new Buffer(t)])}),e.on("error",r),e.on("end",function(){o(e)})})})}var http=require("http"),https=require("https"),ono=require("ono"),url=require("../util/url"),debug=require("../util/debug"),Promise=require("../util/promise");module.exports={order:200,headers:null,timeout:5e3,redirects:5,withCredentials:!1,canRead:function(e){return url.isHttp(e.url)},read:function(e){var t=url.parse(e.url);return process.browser&&!t.protocol&&(t.protocol=url.parse(location.href).protocol),download(t,this)}};
  
  }).call(this,require('_process'),require("buffer").Buffer)
  
  },{"../util/debug":16,"../util/promise":18,"../util/url":19,"_process":71,"buffer":25,"http":87,"https":33,"ono":69}],16:[function(require,module,exports){
  "use strict";var debug=require("debug");module.exports=debug("json-schema-ref-parser");
  
  },{"debug":29}],17:[function(require,module,exports){
  "use strict";function getResult(e,r,t,n){var u=e[r];if("function"==typeof u)return u.apply(e,[t,n]);if(!n){if(u instanceof RegExp)return u.test(t.url);if("string"==typeof u)return u===t.extension;if(Array.isArray(u))return-1!==u.indexOf(t.extension)}return u}var Promise=require("./promise"),debug=require("./debug");exports.all=function(e){return Object.keys(e).filter(function(r){return"object"==typeof e[r]}).map(function(r){return e[r].name=r,e[r]})},exports.filter=function(e,r,t){return e.filter(function(e){return!!getResult(e,r,t)})},exports.sort=function(e){return e.forEach(function(e){e.order=e.order||Number.MAX_SAFE_INTEGER}),e.sort(function(e,r){return e.order-r.order})},exports.run=function(e,r,t){var n,u,i=0;return new Promise(function(o,f){function s(){if(n=e[i++],!n)return f(u);try{debug("  %s",n.name);var o=getResult(n,r,t,c);o&&"function"==typeof o.then?o.then(a,p):void 0!==o&&a(o)}catch(s){p(s)}}function c(e,r){e?p(e):a(r)}function a(e){debug("    success"),o({plugin:n,result:e})}function p(e){debug("    %s",e.message||e),u=e,s()}s()})};
  
  },{"./debug":16,"./promise":18}],18:[function(require,module,exports){
  "use strict";module.exports="function"==typeof Promise?Promise:require("es6-promise").Promise;
  
  },{"es6-promise":31}],19:[function(require,module,exports){
  (function (process){
  "use strict";var isWindows=/^win/.test(process.platform),forwardSlashPattern=/\//g,protocolPattern=/^([a-z0-9.+-]+):\/\//i,url=module.exports,urlEncodePatterns=[/\?/g,"%3F",/\#/g,"%23",isWindows?/\\/g:/\//,"/"],urlDecodePatterns=[/\%23/g,"#",/\%24/g,"$",/\%26/g,"&",/\%2C/g,",",/\%40/g,"@"];exports.parse=require("url").parse,exports.resolve=require("url").resolve,exports.cwd=function(){return process.browser?location.href:process.cwd()+"/"},exports.getProtocol=function(r){var e=protocolPattern.exec(r);return e?e[1].toLowerCase():void 0},exports.getExtension=function(r){var e=r.lastIndexOf(".");return e>=0?r.substr(e).toLowerCase():""},exports.getHash=function(r){var e=r.indexOf("#");return e>=0?r.substr(e):"#"},exports.stripHash=function(r){var e=r.indexOf("#");return e>=0&&(r=r.substr(0,e)),r},exports.isHttp=function(r){var e=url.getProtocol(r);return"http"===e||"https"===e?!0:void 0===e?process.browser:!1},exports.isFileSystemPath=function(r){if(process.browser)return!1;var e=url.getProtocol(r);return void 0===e||"file"===e},exports.fromFileSystemPath=function(r){for(var e=0;e<urlEncodePatterns.length;e+=2)r=r.replace(urlEncodePatterns[e],urlEncodePatterns[e+1]);return encodeURI(r)},exports.toFileSystemPath=function(r,e){r=decodeURI(r);for(var t=0;t<urlDecodePatterns.length;t+=2)r=r.replace(urlDecodePatterns[t],urlDecodePatterns[t+1]);var o="file://"===r.substr(0,7).toLowerCase();return o&&(r="/"===r[7]?r.substr(8):r.substr(7),isWindows&&"/"===r[1]&&(r=r[0]+":"+r.substr(1)),e?r="file:///"+r:(o=!1,r=isWindows?r:"/"+r)),isWindows&&!o&&(r=r.replace(forwardSlashPattern,"\\")),r};
  
  }).call(this,require('_process'))
  
  },{"_process":71,"url":93}],20:[function(require,module,exports){
  "use strict";var yaml=require("js-yaml"),ono=require("ono");module.exports={parse:function(r,e){try{return yaml.safeLoad(r)}catch(o){throw o instanceof Error?o:ono(o,o.message)}},stringify:function(r,e,o){try{var t=("string"==typeof o?o.length:o)||2;return yaml.safeDump(r,{indent:t})}catch(n){throw n instanceof Error?n:ono(n,n.message)}}};
  
  },{"js-yaml":38,"ono":69}],21:[function(require,module,exports){
  "use strict";module.exports={order:100,canValidate:function(e){return!!e.resolved},validate:function(e){}};
  
  },{}],22:[function(require,module,exports){
  var lookup="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";!function(t){"use strict";function r(t){var r=t.charCodeAt(0);return r===h||r===u?62:r===c||r===f?63:o>r?-1:o+10>r?r-o+26+26:i+26>r?r-i:A+26>r?r-A+26:void 0}function e(t){function e(t){i[f++]=t}var n,h,c,o,A,i;if(t.length%4>0)throw new Error("Invalid string. Length must be a multiple of 4");var u=t.length;A="="===t.charAt(u-2)?2:"="===t.charAt(u-1)?1:0,i=new a(3*t.length/4-A),c=A>0?t.length-4:t.length;var f=0;for(n=0,h=0;c>n;n+=4,h+=3)o=r(t.charAt(n))<<18|r(t.charAt(n+1))<<12|r(t.charAt(n+2))<<6|r(t.charAt(n+3)),e((16711680&o)>>16),e((65280&o)>>8),e(255&o);return 2===A?(o=r(t.charAt(n))<<2|r(t.charAt(n+1))>>4,e(255&o)):1===A&&(o=r(t.charAt(n))<<10|r(t.charAt(n+1))<<4|r(t.charAt(n+2))>>2,e(o>>8&255),e(255&o)),i}function n(t){function r(t){return lookup.charAt(t)}function e(t){return r(t>>18&63)+r(t>>12&63)+r(t>>6&63)+r(63&t)}var n,a,h,c=t.length%3,o="";for(n=0,h=t.length-c;h>n;n+=3)a=(t[n]<<16)+(t[n+1]<<8)+t[n+2],o+=e(a);switch(c){case 1:a=t[t.length-1],o+=r(a>>2),o+=r(a<<4&63),o+="==";break;case 2:a=(t[t.length-2]<<8)+t[t.length-1],o+=r(a>>10),o+=r(a>>4&63),o+=r(a<<2&63),o+="="}return o}var a="undefined"!=typeof Uint8Array?Uint8Array:Array,h="+".charCodeAt(0),c="/".charCodeAt(0),o="0".charCodeAt(0),A="a".charCodeAt(0),i="A".charCodeAt(0),u="-".charCodeAt(0),f="_".charCodeAt(0);t.toByteArray=e,t.fromByteArray=n}("undefined"==typeof exports?this.base64js={}:exports);
  
  },{}],23:[function(require,module,exports){
  
  },{}],24:[function(require,module,exports){
  
  },{}],25:[function(require,module,exports){
  (function (global){
  /*!
   * The buffer module from node.js, for the browser.
   *
   * @author   Feross Aboukhadijeh <feross@feross.org> <http://feross.org>
   * @license  MIT
   */
  "use strict";function typedArraySupport(){function t(){}try{var e=new Uint8Array(1);return e.foo=function(){return 42},e.constructor=t,42===e.foo()&&e.constructor===t&&"function"==typeof e.subarray&&0===e.subarray(1,1).byteLength}catch(r){return!1}}function kMaxLength(){return Buffer.TYPED_ARRAY_SUPPORT?2147483647:1073741823}function Buffer(t){return this instanceof Buffer?(Buffer.TYPED_ARRAY_SUPPORT||(this.length=0,this.parent=void 0),"number"==typeof t?fromNumber(this,t):"string"==typeof t?fromString(this,t,arguments.length>1?arguments[1]:"utf8"):fromObject(this,t)):arguments.length>1?new Buffer(t,arguments[1]):new Buffer(t)}function fromNumber(t,e){if(t=allocate(t,0>e?0:0|checked(e)),!Buffer.TYPED_ARRAY_SUPPORT)for(var r=0;e>r;r++)t[r]=0;return t}function fromString(t,e,r){"string"==typeof r&&""!==r||(r="utf8");var n=0|byteLength(e,r);return t=allocate(t,n),t.write(e,r),t}function fromObject(t,e){if(Buffer.isBuffer(e))return fromBuffer(t,e);if(isArray(e))return fromArray(t,e);if(null==e)throw new TypeError("must start with number, buffer, array or string");if("undefined"!=typeof ArrayBuffer){if(e.buffer instanceof ArrayBuffer)return fromTypedArray(t,e);if(e instanceof ArrayBuffer)return fromArrayBuffer(t,e)}return e.length?fromArrayLike(t,e):fromJsonObject(t,e)}function fromBuffer(t,e){var r=0|checked(e.length);return t=allocate(t,r),e.copy(t,0,0,r),t}function fromArray(t,e){var r=0|checked(e.length);t=allocate(t,r);for(var n=0;r>n;n+=1)t[n]=255&e[n];return t}function fromTypedArray(t,e){var r=0|checked(e.length);t=allocate(t,r);for(var n=0;r>n;n+=1)t[n]=255&e[n];return t}function fromArrayBuffer(t,e){return Buffer.TYPED_ARRAY_SUPPORT?(e.byteLength,t=Buffer._augment(new Uint8Array(e))):t=fromTypedArray(t,new Uint8Array(e)),t}function fromArrayLike(t,e){var r=0|checked(e.length);t=allocate(t,r);for(var n=0;r>n;n+=1)t[n]=255&e[n];return t}function fromJsonObject(t,e){var r,n=0;"Buffer"===e.type&&isArray(e.data)&&(r=e.data,n=0|checked(r.length)),t=allocate(t,n);for(var f=0;n>f;f+=1)t[f]=255&r[f];return t}function allocate(t,e){Buffer.TYPED_ARRAY_SUPPORT?(t=Buffer._augment(new Uint8Array(e)),t.__proto__=Buffer.prototype):(t.length=e,t._isBuffer=!0);var r=0!==e&&e<=Buffer.poolSize>>>1;return r&&(t.parent=rootParent),t}function checked(t){if(t>=kMaxLength())throw new RangeError("Attempt to allocate Buffer larger than maximum size: 0x"+kMaxLength().toString(16)+" bytes");return 0|t}function SlowBuffer(t,e){if(!(this instanceof SlowBuffer))return new SlowBuffer(t,e);var r=new Buffer(t,e);return delete r.parent,r}function byteLength(t,e){"string"!=typeof t&&(t=""+t);var r=t.length;if(0===r)return 0;for(var n=!1;;)switch(e){case"ascii":case"binary":case"raw":case"raws":return r;case"utf8":case"utf-8":return utf8ToBytes(t).length;case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return 2*r;case"hex":return r>>>1;case"base64":return base64ToBytes(t).length;default:if(n)return utf8ToBytes(t).length;e=(""+e).toLowerCase(),n=!0}}function slowToString(t,e,r){var n=!1;if(e=0|e,r=void 0===r||r===1/0?this.length:0|r,t||(t="utf8"),0>e&&(e=0),r>this.length&&(r=this.length),e>=r)return"";for(;;)switch(t){case"hex":return hexSlice(this,e,r);case"utf8":case"utf-8":return utf8Slice(this,e,r);case"ascii":return asciiSlice(this,e,r);case"binary":return binarySlice(this,e,r);case"base64":return base64Slice(this,e,r);case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return utf16leSlice(this,e,r);default:if(n)throw new TypeError("Unknown encoding: "+t);t=(t+"").toLowerCase(),n=!0}}function hexWrite(t,e,r,n){r=Number(r)||0;var f=t.length-r;n?(n=Number(n),n>f&&(n=f)):n=f;var i=e.length;if(i%2!==0)throw new Error("Invalid hex string");n>i/2&&(n=i/2);for(var o=0;n>o;o++){var u=parseInt(e.substr(2*o,2),16);if(isNaN(u))throw new Error("Invalid hex string");t[r+o]=u}return o}function utf8Write(t,e,r,n){return blitBuffer(utf8ToBytes(e,t.length-r),t,r,n)}function asciiWrite(t,e,r,n){return blitBuffer(asciiToBytes(e),t,r,n)}function binaryWrite(t,e,r,n){return asciiWrite(t,e,r,n)}function base64Write(t,e,r,n){return blitBuffer(base64ToBytes(e),t,r,n)}function ucs2Write(t,e,r,n){return blitBuffer(utf16leToBytes(e,t.length-r),t,r,n)}function base64Slice(t,e,r){return 0===e&&r===t.length?base64.fromByteArray(t):base64.fromByteArray(t.slice(e,r))}function utf8Slice(t,e,r){r=Math.min(t.length,r);for(var n=[],f=e;r>f;){var i=t[f],o=null,u=i>239?4:i>223?3:i>191?2:1;if(r>=f+u){var s,a,h,c;switch(u){case 1:128>i&&(o=i);break;case 2:s=t[f+1],128===(192&s)&&(c=(31&i)<<6|63&s,c>127&&(o=c));break;case 3:s=t[f+1],a=t[f+2],128===(192&s)&&128===(192&a)&&(c=(15&i)<<12|(63&s)<<6|63&a,c>2047&&(55296>c||c>57343)&&(o=c));break;case 4:s=t[f+1],a=t[f+2],h=t[f+3],128===(192&s)&&128===(192&a)&&128===(192&h)&&(c=(15&i)<<18|(63&s)<<12|(63&a)<<6|63&h,c>65535&&1114112>c&&(o=c))}}null===o?(o=65533,u=1):o>65535&&(o-=65536,n.push(o>>>10&1023|55296),o=56320|1023&o),n.push(o),f+=u}return decodeCodePointsArray(n)}function decodeCodePointsArray(t){var e=t.length;if(MAX_ARGUMENTS_LENGTH>=e)return String.fromCharCode.apply(String,t);for(var r="",n=0;e>n;)r+=String.fromCharCode.apply(String,t.slice(n,n+=MAX_ARGUMENTS_LENGTH));return r}function asciiSlice(t,e,r){var n="";r=Math.min(t.length,r);for(var f=e;r>f;f++)n+=String.fromCharCode(127&t[f]);return n}function binarySlice(t,e,r){var n="";r=Math.min(t.length,r);for(var f=e;r>f;f++)n+=String.fromCharCode(t[f]);return n}function hexSlice(t,e,r){var n=t.length;(!e||0>e)&&(e=0),(!r||0>r||r>n)&&(r=n);for(var f="",i=e;r>i;i++)f+=toHex(t[i]);return f}function utf16leSlice(t,e,r){for(var n=t.slice(e,r),f="",i=0;i<n.length;i+=2)f+=String.fromCharCode(n[i]+256*n[i+1]);return f}function checkOffset(t,e,r){if(t%1!==0||0>t)throw new RangeError("offset is not uint");if(t+e>r)throw new RangeError("Trying to access beyond buffer length")}function checkInt(t,e,r,n,f,i){if(!Buffer.isBuffer(t))throw new TypeError("buffer must be a Buffer instance");if(e>f||i>e)throw new RangeError("value is out of bounds");if(r+n>t.length)throw new RangeError("index out of range")}function objectWriteUInt16(t,e,r,n){0>e&&(e=65535+e+1);for(var f=0,i=Math.min(t.length-r,2);i>f;f++)t[r+f]=(e&255<<8*(n?f:1-f))>>>8*(n?f:1-f)}function objectWriteUInt32(t,e,r,n){0>e&&(e=4294967295+e+1);for(var f=0,i=Math.min(t.length-r,4);i>f;f++)t[r+f]=e>>>8*(n?f:3-f)&255}function checkIEEE754(t,e,r,n,f,i){if(e>f||i>e)throw new RangeError("value is out of bounds");if(r+n>t.length)throw new RangeError("index out of range");if(0>r)throw new RangeError("index out of range")}function writeFloat(t,e,r,n,f){return f||checkIEEE754(t,e,r,4,3.4028234663852886e38,-3.4028234663852886e38),ieee754.write(t,e,r,n,23,4),r+4}function writeDouble(t,e,r,n,f){return f||checkIEEE754(t,e,r,8,1.7976931348623157e308,-1.7976931348623157e308),ieee754.write(t,e,r,n,52,8),r+8}function base64clean(t){if(t=stringtrim(t).replace(INVALID_BASE64_RE,""),t.length<2)return"";for(;t.length%4!==0;)t+="=";return t}function stringtrim(t){return t.trim?t.trim():t.replace(/^\s+|\s+$/g,"")}function toHex(t){return 16>t?"0"+t.toString(16):t.toString(16)}function utf8ToBytes(t,e){e=e||1/0;for(var r,n=t.length,f=null,i=[],o=0;n>o;o++){if(r=t.charCodeAt(o),r>55295&&57344>r){if(!f){if(r>56319){(e-=3)>-1&&i.push(239,191,189);continue}if(o+1===n){(e-=3)>-1&&i.push(239,191,189);continue}f=r;continue}if(56320>r){(e-=3)>-1&&i.push(239,191,189),f=r;continue}r=(f-55296<<10|r-56320)+65536}else f&&(e-=3)>-1&&i.push(239,191,189);if(f=null,128>r){if((e-=1)<0)break;i.push(r)}else if(2048>r){if((e-=2)<0)break;i.push(r>>6|192,63&r|128)}else if(65536>r){if((e-=3)<0)break;i.push(r>>12|224,r>>6&63|128,63&r|128)}else{if(!(1114112>r))throw new Error("Invalid code point");if((e-=4)<0)break;i.push(r>>18|240,r>>12&63|128,r>>6&63|128,63&r|128)}}return i}function asciiToBytes(t){for(var e=[],r=0;r<t.length;r++)e.push(255&t.charCodeAt(r));return e}function utf16leToBytes(t,e){for(var r,n,f,i=[],o=0;o<t.length&&!((e-=2)<0);o++)r=t.charCodeAt(o),n=r>>8,f=r%256,i.push(f),i.push(n);return i}function base64ToBytes(t){return base64.toByteArray(base64clean(t))}function blitBuffer(t,e,r,n){for(var f=0;n>f&&!(f+r>=e.length||f>=t.length);f++)e[f+r]=t[f];return f}var base64=require("base64-js"),ieee754=require("ieee754"),isArray=require("isarray");exports.Buffer=Buffer,exports.SlowBuffer=SlowBuffer,exports.INSPECT_MAX_BYTES=50,Buffer.poolSize=8192;var rootParent={};Buffer.TYPED_ARRAY_SUPPORT=void 0!==global.TYPED_ARRAY_SUPPORT?global.TYPED_ARRAY_SUPPORT:typedArraySupport(),Buffer.TYPED_ARRAY_SUPPORT?(Buffer.prototype.__proto__=Uint8Array.prototype,Buffer.__proto__=Uint8Array):(Buffer.prototype.length=void 0,Buffer.prototype.parent=void 0),Buffer.isBuffer=function(t){return!(null==t||!t._isBuffer)},Buffer.compare=function(t,e){if(!Buffer.isBuffer(t)||!Buffer.isBuffer(e))throw new TypeError("Arguments must be Buffers");if(t===e)return 0;for(var r=t.length,n=e.length,f=0,i=Math.min(r,n);i>f&&t[f]===e[f];)++f;return f!==i&&(r=t[f],n=e[f]),n>r?-1:r>n?1:0},Buffer.isEncoding=function(t){switch(String(t).toLowerCase()){case"hex":case"utf8":case"utf-8":case"ascii":case"binary":case"base64":case"raw":case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return!0;default:return!1}},Buffer.concat=function(t,e){if(!isArray(t))throw new TypeError("list argument must be an Array of Buffers.");if(0===t.length)return new Buffer(0);var r;if(void 0===e)for(e=0,r=0;r<t.length;r++)e+=t[r].length;var n=new Buffer(e),f=0;for(r=0;r<t.length;r++){var i=t[r];i.copy(n,f),f+=i.length}return n},Buffer.byteLength=byteLength,Buffer.prototype.toString=function(){var t=0|this.length;return 0===t?"":0===arguments.length?utf8Slice(this,0,t):slowToString.apply(this,arguments)},Buffer.prototype.equals=function(t){if(!Buffer.isBuffer(t))throw new TypeError("Argument must be a Buffer");return this===t?!0:0===Buffer.compare(this,t)},Buffer.prototype.inspect=function(){var t="",e=exports.INSPECT_MAX_BYTES;return this.length>0&&(t=this.toString("hex",0,e).match(/.{2}/g).join(" "),this.length>e&&(t+=" ... ")),"<Buffer "+t+">"},Buffer.prototype.compare=function(t){if(!Buffer.isBuffer(t))throw new TypeError("Argument must be a Buffer");return this===t?0:Buffer.compare(this,t)},Buffer.prototype.indexOf=function(t,e){function r(t,e,r){for(var n=-1,f=0;r+f<t.length;f++)if(t[r+f]===e[-1===n?0:f-n]){if(-1===n&&(n=f),f-n+1===e.length)return r+n}else n=-1;return-1}if(e>2147483647?e=2147483647:-2147483648>e&&(e=-2147483648),e>>=0,0===this.length)return-1;if(e>=this.length)return-1;if(0>e&&(e=Math.max(this.length+e,0)),"string"==typeof t)return 0===t.length?-1:String.prototype.indexOf.call(this,t,e);if(Buffer.isBuffer(t))return r(this,t,e);if("number"==typeof t)return Buffer.TYPED_ARRAY_SUPPORT&&"function"===Uint8Array.prototype.indexOf?Uint8Array.prototype.indexOf.call(this,t,e):r(this,[t],e);throw new TypeError("val must be string, number or Buffer")},Buffer.prototype.get=function(t){return console.log(".get() is deprecated. Access using array indexes instead."),this.readUInt8(t)},Buffer.prototype.set=function(t,e){return console.log(".set() is deprecated. Access using array indexes instead."),this.writeUInt8(t,e)},Buffer.prototype.write=function(t,e,r,n){if(void 0===e)n="utf8",r=this.length,e=0;else if(void 0===r&&"string"==typeof e)n=e,r=this.length,e=0;else if(isFinite(e))e=0|e,isFinite(r)?(r=0|r,void 0===n&&(n="utf8")):(n=r,r=void 0);else{var f=n;n=e,e=0|r,r=f}var i=this.length-e;if((void 0===r||r>i)&&(r=i),t.length>0&&(0>r||0>e)||e>this.length)throw new RangeError("attempt to write outside buffer bounds");n||(n="utf8");for(var o=!1;;)switch(n){case"hex":return hexWrite(this,t,e,r);case"utf8":case"utf-8":return utf8Write(this,t,e,r);case"ascii":return asciiWrite(this,t,e,r);case"binary":return binaryWrite(this,t,e,r);case"base64":return base64Write(this,t,e,r);case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return ucs2Write(this,t,e,r);default:if(o)throw new TypeError("Unknown encoding: "+n);n=(""+n).toLowerCase(),o=!0}},Buffer.prototype.toJSON=function(){return{type:"Buffer",data:Array.prototype.slice.call(this._arr||this,0)}};var MAX_ARGUMENTS_LENGTH=4096;Buffer.prototype.slice=function(t,e){var r=this.length;t=~~t,e=void 0===e?r:~~e,0>t?(t+=r,0>t&&(t=0)):t>r&&(t=r),0>e?(e+=r,0>e&&(e=0)):e>r&&(e=r),t>e&&(e=t);var n;if(Buffer.TYPED_ARRAY_SUPPORT)n=Buffer._augment(this.subarray(t,e));else{var f=e-t;n=new Buffer(f,void 0);for(var i=0;f>i;i++)n[i]=this[i+t]}return n.length&&(n.parent=this.parent||this),n},Buffer.prototype.readUIntLE=function(t,e,r){t=0|t,e=0|e,r||checkOffset(t,e,this.length);for(var n=this[t],f=1,i=0;++i<e&&(f*=256);)n+=this[t+i]*f;return n},Buffer.prototype.readUIntBE=function(t,e,r){t=0|t,e=0|e,r||checkOffset(t,e,this.length);for(var n=this[t+--e],f=1;e>0&&(f*=256);)n+=this[t+--e]*f;return n},Buffer.prototype.readUInt8=function(t,e){return e||checkOffset(t,1,this.length),this[t]},Buffer.prototype.readUInt16LE=function(t,e){return e||checkOffset(t,2,this.length),this[t]|this[t+1]<<8},Buffer.prototype.readUInt16BE=function(t,e){return e||checkOffset(t,2,this.length),this[t]<<8|this[t+1]},Buffer.prototype.readUInt32LE=function(t,e){return e||checkOffset(t,4,this.length),(this[t]|this[t+1]<<8|this[t+2]<<16)+16777216*this[t+3]},Buffer.prototype.readUInt32BE=function(t,e){return e||checkOffset(t,4,this.length),16777216*this[t]+(this[t+1]<<16|this[t+2]<<8|this[t+3])},Buffer.prototype.readIntLE=function(t,e,r){t=0|t,e=0|e,r||checkOffset(t,e,this.length);for(var n=this[t],f=1,i=0;++i<e&&(f*=256);)n+=this[t+i]*f;return f*=128,n>=f&&(n-=Math.pow(2,8*e)),n},Buffer.prototype.readIntBE=function(t,e,r){t=0|t,e=0|e,r||checkOffset(t,e,this.length);for(var n=e,f=1,i=this[t+--n];n>0&&(f*=256);)i+=this[t+--n]*f;return f*=128,i>=f&&(i-=Math.pow(2,8*e)),i},Buffer.prototype.readInt8=function(t,e){return e||checkOffset(t,1,this.length),128&this[t]?-1*(255-this[t]+1):this[t]},Buffer.prototype.readInt16LE=function(t,e){e||checkOffset(t,2,this.length);var r=this[t]|this[t+1]<<8;return 32768&r?4294901760|r:r},Buffer.prototype.readInt16BE=function(t,e){e||checkOffset(t,2,this.length);var r=this[t+1]|this[t]<<8;return 32768&r?4294901760|r:r},Buffer.prototype.readInt32LE=function(t,e){return e||checkOffset(t,4,this.length),this[t]|this[t+1]<<8|this[t+2]<<16|this[t+3]<<24},Buffer.prototype.readInt32BE=function(t,e){return e||checkOffset(t,4,this.length),this[t]<<24|this[t+1]<<16|this[t+2]<<8|this[t+3]},Buffer.prototype.readFloatLE=function(t,e){return e||checkOffset(t,4,this.length),ieee754.read(this,t,!0,23,4)},Buffer.prototype.readFloatBE=function(t,e){return e||checkOffset(t,4,this.length),ieee754.read(this,t,!1,23,4)},Buffer.prototype.readDoubleLE=function(t,e){return e||checkOffset(t,8,this.length),ieee754.read(this,t,!0,52,8)},Buffer.prototype.readDoubleBE=function(t,e){return e||checkOffset(t,8,this.length),ieee754.read(this,t,!1,52,8)},Buffer.prototype.writeUIntLE=function(t,e,r,n){t=+t,e=0|e,r=0|r,n||checkInt(this,t,e,r,Math.pow(2,8*r),0);var f=1,i=0;for(this[e]=255&t;++i<r&&(f*=256);)this[e+i]=t/f&255;return e+r},Buffer.prototype.writeUIntBE=function(t,e,r,n){t=+t,e=0|e,r=0|r,n||checkInt(this,t,e,r,Math.pow(2,8*r),0);var f=r-1,i=1;for(this[e+f]=255&t;--f>=0&&(i*=256);)this[e+f]=t/i&255;return e+r},Buffer.prototype.writeUInt8=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,1,255,0),Buffer.TYPED_ARRAY_SUPPORT||(t=Math.floor(t)),this[e]=255&t,e+1},Buffer.prototype.writeUInt16LE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,2,65535,0),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=255&t,this[e+1]=t>>>8):objectWriteUInt16(this,t,e,!0),e+2},Buffer.prototype.writeUInt16BE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,2,65535,0),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=t>>>8,this[e+1]=255&t):objectWriteUInt16(this,t,e,!1),e+2},Buffer.prototype.writeUInt32LE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,4,4294967295,0),Buffer.TYPED_ARRAY_SUPPORT?(this[e+3]=t>>>24,this[e+2]=t>>>16,this[e+1]=t>>>8,this[e]=255&t):objectWriteUInt32(this,t,e,!0),e+4},Buffer.prototype.writeUInt32BE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,4,4294967295,0),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=t>>>24,this[e+1]=t>>>16,this[e+2]=t>>>8,this[e+3]=255&t):objectWriteUInt32(this,t,e,!1),e+4},Buffer.prototype.writeIntLE=function(t,e,r,n){if(t=+t,e=0|e,!n){var f=Math.pow(2,8*r-1);checkInt(this,t,e,r,f-1,-f)}var i=0,o=1,u=0>t?1:0;for(this[e]=255&t;++i<r&&(o*=256);)this[e+i]=(t/o>>0)-u&255;return e+r},Buffer.prototype.writeIntBE=function(t,e,r,n){if(t=+t,e=0|e,!n){var f=Math.pow(2,8*r-1);checkInt(this,t,e,r,f-1,-f)}var i=r-1,o=1,u=0>t?1:0;for(this[e+i]=255&t;--i>=0&&(o*=256);)this[e+i]=(t/o>>0)-u&255;return e+r},Buffer.prototype.writeInt8=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,1,127,-128),Buffer.TYPED_ARRAY_SUPPORT||(t=Math.floor(t)),0>t&&(t=255+t+1),this[e]=255&t,e+1},Buffer.prototype.writeInt16LE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,2,32767,-32768),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=255&t,this[e+1]=t>>>8):objectWriteUInt16(this,t,e,!0),e+2},Buffer.prototype.writeInt16BE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,2,32767,-32768),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=t>>>8,this[e+1]=255&t):objectWriteUInt16(this,t,e,!1),e+2},Buffer.prototype.writeInt32LE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,4,2147483647,-2147483648),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=255&t,this[e+1]=t>>>8,this[e+2]=t>>>16,this[e+3]=t>>>24):objectWriteUInt32(this,t,e,!0),e+4},Buffer.prototype.writeInt32BE=function(t,e,r){return t=+t,e=0|e,r||checkInt(this,t,e,4,2147483647,-2147483648),0>t&&(t=4294967295+t+1),Buffer.TYPED_ARRAY_SUPPORT?(this[e]=t>>>24,this[e+1]=t>>>16,this[e+2]=t>>>8,this[e+3]=255&t):objectWriteUInt32(this,t,e,!1),e+4},Buffer.prototype.writeFloatLE=function(t,e,r){return writeFloat(this,t,e,!0,r)},Buffer.prototype.writeFloatBE=function(t,e,r){return writeFloat(this,t,e,!1,r)},Buffer.prototype.writeDoubleLE=function(t,e,r){return writeDouble(this,t,e,!0,r)},Buffer.prototype.writeDoubleBE=function(t,e,r){return writeDouble(this,t,e,!1,r)},Buffer.prototype.copy=function(t,e,r,n){if(r||(r=0),n||0===n||(n=this.length),e>=t.length&&(e=t.length),e||(e=0),n>0&&r>n&&(n=r),n===r)return 0;if(0===t.length||0===this.length)return 0;if(0>e)throw new RangeError("targetStart out of bounds");if(0>r||r>=this.length)throw new RangeError("sourceStart out of bounds");if(0>n)throw new RangeError("sourceEnd out of bounds");n>this.length&&(n=this.length),t.length-e<n-r&&(n=t.length-e+r);var f,i=n-r;if(this===t&&e>r&&n>e)for(f=i-1;f>=0;f--)t[f+e]=this[f+r];else if(1e3>i||!Buffer.TYPED_ARRAY_SUPPORT)for(f=0;i>f;f++)t[f+e]=this[f+r];else t._set(this.subarray(r,r+i),e);return i},Buffer.prototype.fill=function(t,e,r){if(t||(t=0),e||(e=0),r||(r=this.length),e>r)throw new RangeError("end < start");if(r!==e&&0!==this.length){if(0>e||e>=this.length)throw new RangeError("start out of bounds");if(0>r||r>this.length)throw new RangeError("end out of bounds");var n;if("number"==typeof t)for(n=e;r>n;n++)this[n]=t;else{var f=utf8ToBytes(t.toString()),i=f.length;for(n=e;r>n;n++)this[n]=f[n%i]}return this}},Buffer.prototype.toArrayBuffer=function(){if("undefined"!=typeof Uint8Array){if(Buffer.TYPED_ARRAY_SUPPORT)return new Buffer(this).buffer;for(var t=new Uint8Array(this.length),e=0,r=t.length;r>e;e+=1)t[e]=this[e];return t.buffer}throw new TypeError("Buffer.toArrayBuffer not supported in this browser")};var BP=Buffer.prototype;Buffer._augment=function(t){return t.constructor=Buffer,t._isBuffer=!0,t._set=t.set,t.get=BP.get,t.set=BP.set,t.write=BP.write,t.toString=BP.toString,t.toLocaleString=BP.toString,t.toJSON=BP.toJSON,t.equals=BP.equals,t.compare=BP.compare,t.indexOf=BP.indexOf,t.copy=BP.copy,t.slice=BP.slice,t.readUIntLE=BP.readUIntLE,t.readUIntBE=BP.readUIntBE,t.readUInt8=BP.readUInt8,t.readUInt16LE=BP.readUInt16LE,t.readUInt16BE=BP.readUInt16BE,t.readUInt32LE=BP.readUInt32LE,t.readUInt32BE=BP.readUInt32BE,t.readIntLE=BP.readIntLE,t.readIntBE=BP.readIntBE,t.readInt8=BP.readInt8,t.readInt16LE=BP.readInt16LE,t.readInt16BE=BP.readInt16BE,t.readInt32LE=BP.readInt32LE,t.readInt32BE=BP.readInt32BE,t.readFloatLE=BP.readFloatLE,t.readFloatBE=BP.readFloatBE,t.readDoubleLE=BP.readDoubleLE,t.readDoubleBE=BP.readDoubleBE,t.writeUInt8=BP.writeUInt8,t.writeUIntLE=BP.writeUIntLE,t.writeUIntBE=BP.writeUIntBE,t.writeUInt16LE=BP.writeUInt16LE,t.writeUInt16BE=BP.writeUInt16BE,t.writeUInt32LE=BP.writeUInt32LE,t.writeUInt32BE=BP.writeUInt32BE,t.writeIntLE=BP.writeIntLE,t.writeIntBE=BP.writeIntBE,t.writeInt8=BP.writeInt8,t.writeInt16LE=BP.writeInt16LE,t.writeInt16BE=BP.writeInt16BE,t.writeInt32LE=BP.writeInt32LE,t.writeInt32BE=BP.writeInt32BE,t.writeFloatLE=BP.writeFloatLE,t.writeFloatBE=BP.writeFloatBE,t.writeDoubleLE=BP.writeDoubleLE,t.writeDoubleBE=BP.writeDoubleBE,t.fill=BP.fill,t.inspect=BP.inspect,t.toArrayBuffer=BP.toArrayBuffer,t};var INVALID_BASE64_RE=/[^+\/0-9A-Za-z-_]/g;
  
  }).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{"base64-js":22,"ieee754":34,"isarray":37}],26:[function(require,module,exports){
  module.exports={100:"Continue",101:"Switching Protocols",102:"Processing",200:"OK",201:"Created",202:"Accepted",203:"Non-Authoritative Information",204:"No Content",205:"Reset Content",206:"Partial Content",207:"Multi-Status",208:"Already Reported",226:"IM Used",300:"Multiple Choices",301:"Moved Permanently",302:"Found",303:"See Other",304:"Not Modified",305:"Use Proxy",307:"Temporary Redirect",308:"Permanent Redirect",400:"Bad Request",401:"Unauthorized",402:"Payment Required",403:"Forbidden",404:"Not Found",405:"Method Not Allowed",406:"Not Acceptable",407:"Proxy Authentication Required",408:"Request Timeout",409:"Conflict",410:"Gone",411:"Length Required",412:"Precondition Failed",413:"Payload Too Large",414:"URI Too Long",415:"Unsupported Media Type",416:"Range Not Satisfiable",417:"Expectation Failed",418:"I'm a teapot",421:"Misdirected Request",422:"Unprocessable Entity",423:"Locked",424:"Failed Dependency",425:"Unordered Collection",426:"Upgrade Required",428:"Precondition Required",429:"Too Many Requests",431:"Request Header Fields Too Large",500:"Internal Server Error",501:"Not Implemented",502:"Bad Gateway",503:"Service Unavailable",504:"Gateway Timeout",505:"HTTP Version Not Supported",506:"Variant Also Negotiates",507:"Insufficient Storage",508:"Loop Detected",509:"Bandwidth Limit Exceeded",510:"Not Extended",511:"Network Authentication Required"};
  
  },{}],27:[function(require,module,exports){
  (function (process,global){
  "use strict";var next=global.process&&process.nextTick||global.setImmediate||function(n){setTimeout(n,0)};module.exports=function(n,t){return n?void t.then(function(t){next(function(){n(null,t)})},function(t){next(function(){n(t)})}):t};
  
  }).call(this,require('_process'),typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{"_process":71}],28:[function(require,module,exports){
  (function (Buffer){
  function isArray(r){return Array.isArray?Array.isArray(r):"[object Array]"===objectToString(r)}function isBoolean(r){return"boolean"==typeof r}function isNull(r){return null===r}function isNullOrUndefined(r){return null==r}function isNumber(r){return"number"==typeof r}function isString(r){return"string"==typeof r}function isSymbol(r){return"symbol"==typeof r}function isUndefined(r){return void 0===r}function isRegExp(r){return"[object RegExp]"===objectToString(r)}function isObject(r){return"object"==typeof r&&null!==r}function isDate(r){return"[object Date]"===objectToString(r)}function isError(r){return"[object Error]"===objectToString(r)||r instanceof Error}function isFunction(r){return"function"==typeof r}function isPrimitive(r){return null===r||"boolean"==typeof r||"number"==typeof r||"string"==typeof r||"symbol"==typeof r||"undefined"==typeof r}function objectToString(r){return Object.prototype.toString.call(r)}exports.isArray=isArray,exports.isBoolean=isBoolean,exports.isNull=isNull,exports.isNullOrUndefined=isNullOrUndefined,exports.isNumber=isNumber,exports.isString=isString,exports.isSymbol=isSymbol,exports.isUndefined=isUndefined,exports.isRegExp=isRegExp,exports.isObject=isObject,exports.isDate=isDate,exports.isError=isError,exports.isFunction=isFunction,exports.isPrimitive=isPrimitive,exports.isBuffer=Buffer.isBuffer;
  
  }).call(this,{"isBuffer":require("../../is-buffer/index.js")})
  
  },{"../../is-buffer/index.js":36}],29:[function(require,module,exports){
  function useColors(){return"WebkitAppearance"in document.documentElement.style||window.console&&(console.firebug||console.exception&&console.table)||navigator.userAgent.toLowerCase().match(/firefox\/(\d+)/)&&parseInt(RegExp.$1,10)>=31}function formatArgs(){var o=arguments,e=this.useColors;if(o[0]=(e?"%c":"")+this.namespace+(e?" %c":" ")+o[0]+(e?"%c ":" ")+"+"+exports.humanize(this.diff),!e)return o;var r="color: "+this.color;o=[o[0],r,"color: inherit"].concat(Array.prototype.slice.call(o,1));var t=0,s=0;return o[0].replace(/%[a-z%]/g,function(o){"%%"!==o&&(t++,"%c"===o&&(s=t))}),o.splice(s,0,r),o}function log(){return"object"==typeof console&&console.log&&Function.prototype.apply.call(console.log,console,arguments)}function save(o){try{null==o?exports.storage.removeItem("debug"):exports.storage.debug=o}catch(e){}}function load(){var o;try{o=exports.storage.debug}catch(e){}return o}function localstorage(){try{return window.localStorage}catch(o){}}exports=module.exports=require("./debug"),exports.log=log,exports.formatArgs=formatArgs,exports.save=save,exports.load=load,exports.useColors=useColors,exports.storage="undefined"!=typeof chrome&&"undefined"!=typeof chrome.storage?chrome.storage.local:localstorage(),exports.colors=["lightseagreen","forestgreen","goldenrod","dodgerblue","darkorchid","crimson"],exports.formatters.j=function(o){return JSON.stringify(o)},exports.enable(load());
  
  },{"./debug":30}],30:[function(require,module,exports){
  function selectColor(){return exports.colors[prevColor++%exports.colors.length]}function debug(e){function r(){}function o(){var e=o,r=+new Date,s=r-(prevTime||r);e.diff=s,e.prev=prevTime,e.curr=r,prevTime=r,null==e.useColors&&(e.useColors=exports.useColors()),null==e.color&&e.useColors&&(e.color=selectColor());var t=Array.prototype.slice.call(arguments);t[0]=exports.coerce(t[0]),"string"!=typeof t[0]&&(t=["%o"].concat(t));var n=0;t[0]=t[0].replace(/%([a-z%])/g,function(r,o){if("%%"===r)return r;n++;var s=exports.formatters[o];if("function"==typeof s){var p=t[n];r=s.call(e,p),t.splice(n,1),n--}return r}),"function"==typeof exports.formatArgs&&(t=exports.formatArgs.apply(e,t));var p=o.log||exports.log||console.log.bind(console);p.apply(e,t)}r.enabled=!1,o.enabled=!0;var s=exports.enabled(e)?o:r;return s.namespace=e,s}function enable(e){exports.save(e);for(var r=(e||"").split(/[\s,]+/),o=r.length,s=0;o>s;s++)r[s]&&(e=r[s].replace(/\*/g,".*?"),"-"===e[0]?exports.skips.push(new RegExp("^"+e.substr(1)+"$")):exports.names.push(new RegExp("^"+e+"$")))}function disable(){exports.enable("")}function enabled(e){var r,o;for(r=0,o=exports.skips.length;o>r;r++)if(exports.skips[r].test(e))return!1;for(r=0,o=exports.names.length;o>r;r++)if(exports.names[r].test(e))return!0;return!1}function coerce(e){return e instanceof Error?e.stack||e.message:e}exports=module.exports=debug,exports.coerce=coerce,exports.disable=disable,exports.enable=enable,exports.enabled=enabled,exports.humanize=require("ms"),exports.names=[],exports.skips=[],exports.formatters={};var prevColor=0,prevTime;
  
  },{"ms":68}],31:[function(require,module,exports){
  (function (process,global){
  /*!
   * @overview es6-promise - a tiny implementation of Promises/A+.
   * @copyright Copyright (c) 2014 Yehuda Katz, Tom Dale, Stefan Penner and contributors (Conversion to ES6 API by Jake Archibald)
   * @license   Licensed under MIT license
   *            See https://raw.githubusercontent.com/jakearchibald/es6-promise/master/LICENSE
   * @version   3.1.2
   */
  (function(){"use strict";function t(t){return"function"==typeof t||"object"==typeof t&&null!==t}function e(t){return"function"==typeof t}function n(t){W=t}function r(t){H=t}function o(){return function(){process.nextTick(a)}}function i(){return function(){U(a)}}function s(){var t=0,e=new Q(a),n=document.createTextNode("");return e.observe(n,{characterData:!0}),function(){n.data=t=++t%2}}function u(){var t=new MessageChannel;return t.port1.onmessage=a,function(){t.port2.postMessage(0)}}function c(){return function(){setTimeout(a,1)}}function a(){for(var t=0;G>t;t+=2){var e=X[t],n=X[t+1];e(n),X[t]=void 0,X[t+1]=void 0}G=0}function f(){try{var t=require,e=t("vertx");return U=e.runOnLoop||e.runOnContext,i()}catch(n){return c()}}function l(t,e){var n=this,r=n._state;if(r===et&&!t||r===nt&&!e)return this;var o=new this.constructor(p),i=n._result;if(r){var s=arguments[r-1];H(function(){C(r,o,s,i)})}else j(n,o,t,e);return o}function h(t){var e=this;if(t&&"object"==typeof t&&t.constructor===e)return t;var n=new e(p);return g(n,t),n}function p(){}function _(){return new TypeError("You cannot resolve a promise with itself")}function v(){return new TypeError("A promises callback cannot return that same promise.")}function d(t){try{return t.then}catch(e){return rt.error=e,rt}}function y(t,e,n,r){try{t.call(e,n,r)}catch(o){return o}}function m(t,e,n){H(function(t){var r=!1,o=y(n,e,function(n){r||(r=!0,e!==n?g(t,n):E(t,n))},function(e){r||(r=!0,S(t,e))},"Settle: "+(t._label||" unknown promise"));!r&&o&&(r=!0,S(t,o))},t)}function w(t,e){e._state===et?E(t,e._result):e._state===nt?S(t,e._result):j(e,void 0,function(e){g(t,e)},function(e){S(t,e)})}function b(t,n,r){n.constructor===t.constructor&&r===Z&&constructor.resolve===$?w(t,n):r===rt?S(t,rt.error):void 0===r?E(t,n):e(r)?m(t,n,r):E(t,n)}function g(e,n){e===n?S(e,_()):t(n)?b(e,n,d(n)):E(e,n)}function A(t){t._onerror&&t._onerror(t._result),T(t)}function E(t,e){t._state===tt&&(t._result=e,t._state=et,0!==t._subscribers.length&&H(T,t))}function S(t,e){t._state===tt&&(t._state=nt,t._result=e,H(A,t))}function j(t,e,n,r){var o=t._subscribers,i=o.length;t._onerror=null,o[i]=e,o[i+et]=n,o[i+nt]=r,0===i&&t._state&&H(T,t)}function T(t){var e=t._subscribers,n=t._state;if(0!==e.length){for(var r,o,i=t._result,s=0;s<e.length;s+=3)r=e[s],o=e[s+n],r?C(n,r,o,i):o(i);t._subscribers.length=0}}function P(){this.error=null}function x(t,e){try{return t(e)}catch(n){return ot.error=n,ot}}function C(t,n,r,o){var i,s,u,c,a=e(r);if(a){if(i=x(r,o),i===ot?(c=!0,s=i.error,i=null):u=!0,n===i)return void S(n,v())}else i=o,u=!0;n._state!==tt||(a&&u?g(n,i):c?S(n,s):t===et?E(n,i):t===nt&&S(n,i))}function M(t,e){try{e(function(e){g(t,e)},function(e){S(t,e)})}catch(n){S(t,n)}}function O(t){return new ft(this,t).promise}function k(t){function e(t){g(o,t)}function n(t){S(o,t)}var r=this,o=new r(p);if(!B(t))return S(o,new TypeError("You must pass an array to race.")),o;for(var i=t.length,s=0;o._state===tt&&i>s;s++)j(r.resolve(t[s]),void 0,e,n);return o}function Y(t){var e=this,n=new e(p);return S(n,t),n}function q(){throw new TypeError("You must pass a resolver function as the first argument to the promise constructor")}function F(){throw new TypeError("Failed to construct 'Promise': Please use the 'new' operator, this object constructor cannot be called as a function.")}function D(t){this._id=ct++,this._state=void 0,this._result=void 0,this._subscribers=[],p!==t&&("function"!=typeof t&&q(),this instanceof D?M(this,t):F())}function K(t,e){this._instanceConstructor=t,this.promise=new t(p),Array.isArray(e)?(this._input=e,this.length=e.length,this._remaining=e.length,this._result=new Array(this.length),0===this.length?E(this.promise,this._result):(this.length=this.length||0,this._enumerate(),0===this._remaining&&E(this.promise,this._result))):S(this.promise,this._validationError())}function L(){var t;if("undefined"!=typeof global)t=global;else if("undefined"!=typeof self)t=self;else try{t=Function("return this")()}catch(e){throw new Error("polyfill failed because global object is unavailable in this environment")}var n=t.Promise;n&&"[object Promise]"===Object.prototype.toString.call(n.resolve())&&!n.cast||(t.Promise=at)}var N;N=Array.isArray?Array.isArray:function(t){return"[object Array]"===Object.prototype.toString.call(t)};var U,W,z,B=N,G=0,H=function(t,e){X[G]=t,X[G+1]=e,G+=2,2===G&&(W?W(a):z())},I="undefined"!=typeof window?window:void 0,J=I||{},Q=J.MutationObserver||J.WebKitMutationObserver,R="undefined"!=typeof process&&"[object process]"==={}.toString.call(process),V="undefined"!=typeof Uint8ClampedArray&&"undefined"!=typeof importScripts&&"undefined"!=typeof MessageChannel,X=new Array(1e3);z=R?o():Q?s():V?u():void 0===I&&"function"==typeof require?f():c();var Z=l,$=h,tt=void 0,et=1,nt=2,rt=new P,ot=new P,it=O,st=k,ut=Y,ct=0,at=D;D.all=it,D.race=st,D.resolve=$,D.reject=ut,D._setScheduler=n,D._setAsap=r,D._asap=H,D.prototype={constructor:D,then:Z,"catch":function(t){return this.then(null,t)}};var ft=K;K.prototype._validationError=function(){return new Error("Array Methods must be provided an Array")},K.prototype._enumerate=function(){for(var t=this.length,e=this._input,n=0;this._state===tt&&t>n;n++)this._eachEntry(e[n],n)},K.prototype._eachEntry=function(t,e){var n=this._instanceConstructor,r=n.resolve;if(r===$){var o=d(t);if(o===Z&&t._state!==tt)this._settledAt(t._state,e,t._result);else if("function"!=typeof o)this._remaining--,this._result[e]=t;else if(n===at){var i=new n(p);b(i,t,o),this._willSettleAt(i,e)}else this._willSettleAt(new n(function(e){e(t)}),e)}else this._willSettleAt(r(t),e)},K.prototype._settledAt=function(t,e,n){var r=this.promise;r._state===tt&&(this._remaining--,t===nt?S(r,n):this._result[e]=n),0===this._remaining&&E(r,this._result)},K.prototype._willSettleAt=function(t,e){var n=this;j(t,void 0,function(t){n._settledAt(et,e,t)},function(t){n._settledAt(nt,e,t)})};var lt=L,ht={Promise:at,polyfill:lt};"function"==typeof define&&define.amd?define(function(){return ht}):"undefined"!=typeof module&&module.exports?module.exports=ht:"undefined"!=typeof this&&(this.ES6Promise=ht),lt()}).call(this);
  
  }).call(this,require('_process'),typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{"_process":71}],32:[function(require,module,exports){
  function EventEmitter(){this._events=this._events||{},this._maxListeners=this._maxListeners||void 0}function isFunction(e){return"function"==typeof e}function isNumber(e){return"number"==typeof e}function isObject(e){return"object"==typeof e&&null!==e}function isUndefined(e){return void 0===e}module.exports=EventEmitter,EventEmitter.EventEmitter=EventEmitter,EventEmitter.prototype._events=void 0,EventEmitter.prototype._maxListeners=void 0,EventEmitter.defaultMaxListeners=10,EventEmitter.prototype.setMaxListeners=function(e){if(!isNumber(e)||0>e||isNaN(e))throw TypeError("n must be a positive number");return this._maxListeners=e,this},EventEmitter.prototype.emit=function(e){var t,i,n,s,r,o;if(this._events||(this._events={}),"error"===e&&(!this._events.error||isObject(this._events.error)&&!this._events.error.length)){if(t=arguments[1],t instanceof Error)throw t;throw TypeError('Uncaught, unspecified "error" event.')}if(i=this._events[e],isUndefined(i))return!1;if(isFunction(i))switch(arguments.length){case 1:i.call(this);break;case 2:i.call(this,arguments[1]);break;case 3:i.call(this,arguments[1],arguments[2]);break;default:s=Array.prototype.slice.call(arguments,1),i.apply(this,s)}else if(isObject(i))for(s=Array.prototype.slice.call(arguments,1),o=i.slice(),n=o.length,r=0;n>r;r++)o[r].apply(this,s);return!0},EventEmitter.prototype.addListener=function(e,t){var i;if(!isFunction(t))throw TypeError("listener must be a function");return this._events||(this._events={}),this._events.newListener&&this.emit("newListener",e,isFunction(t.listener)?t.listener:t),this._events[e]?isObject(this._events[e])?this._events[e].push(t):this._events[e]=[this._events[e],t]:this._events[e]=t,isObject(this._events[e])&&!this._events[e].warned&&(i=isUndefined(this._maxListeners)?EventEmitter.defaultMaxListeners:this._maxListeners,i&&i>0&&this._events[e].length>i&&(this._events[e].warned=!0,console.error("(node) warning: possible EventEmitter memory leak detected. %d listeners added. Use emitter.setMaxListeners() to increase limit.",this._events[e].length),"function"==typeof console.trace&&console.trace())),this},EventEmitter.prototype.on=EventEmitter.prototype.addListener,EventEmitter.prototype.once=function(e,t){function i(){this.removeListener(e,i),n||(n=!0,t.apply(this,arguments))}if(!isFunction(t))throw TypeError("listener must be a function");var n=!1;return i.listener=t,this.on(e,i),this},EventEmitter.prototype.removeListener=function(e,t){var i,n,s,r;if(!isFunction(t))throw TypeError("listener must be a function");if(!this._events||!this._events[e])return this;if(i=this._events[e],s=i.length,n=-1,i===t||isFunction(i.listener)&&i.listener===t)delete this._events[e],this._events.removeListener&&this.emit("removeListener",e,t);else if(isObject(i)){for(r=s;r-- >0;)if(i[r]===t||i[r].listener&&i[r].listener===t){n=r;break}if(0>n)return this;1===i.length?(i.length=0,delete this._events[e]):i.splice(n,1),this._events.removeListener&&this.emit("removeListener",e,t)}return this},EventEmitter.prototype.removeAllListeners=function(e){var t,i;if(!this._events)return this;if(!this._events.removeListener)return 0===arguments.length?this._events={}:this._events[e]&&delete this._events[e],this;if(0===arguments.length){for(t in this._events)"removeListener"!==t&&this.removeAllListeners(t);return this.removeAllListeners("removeListener"),this._events={},this}if(i=this._events[e],isFunction(i))this.removeListener(e,i);else if(i)for(;i.length;)this.removeListener(e,i[i.length-1]);return delete this._events[e],this},EventEmitter.prototype.listeners=function(e){var t;return t=this._events&&this._events[e]?isFunction(this._events[e])?[this._events[e]]:this._events[e].slice():[]},EventEmitter.prototype.listenerCount=function(e){if(this._events){var t=this._events[e];if(isFunction(t))return 1;if(t)return t.length}return 0},EventEmitter.listenerCount=function(e,t){return e.listenerCount(t)};
  
  },{}],33:[function(require,module,exports){
  var http=require("http"),https=module.exports;for(var key in http)http.hasOwnProperty(key)&&(https[key]=http[key]);https.request=function(t,e){return t||(t={}),t.scheme="https",t.protocol="https:",http.request.call(this,t,e)};
  
  },{"http":87}],34:[function(require,module,exports){
  exports.read=function(a,o,t,r,h){var M,p,w=8*h-r-1,f=(1<<w)-1,e=f>>1,i=-7,N=t?h-1:0,n=t?-1:1,s=a[o+N];for(N+=n,M=s&(1<<-i)-1,s>>=-i,i+=w;i>0;M=256*M+a[o+N],N+=n,i-=8);for(p=M&(1<<-i)-1,M>>=-i,i+=r;i>0;p=256*p+a[o+N],N+=n,i-=8);if(0===M)M=1-e;else{if(M===f)return p?NaN:(s?-1:1)*(1/0);p+=Math.pow(2,r),M-=e}return(s?-1:1)*p*Math.pow(2,M-r)},exports.write=function(a,o,t,r,h,M){var p,w,f,e=8*M-h-1,i=(1<<e)-1,N=i>>1,n=23===h?Math.pow(2,-24)-Math.pow(2,-77):0,s=r?0:M-1,u=r?1:-1,l=0>o||0===o&&0>1/o?1:0;for(o=Math.abs(o),isNaN(o)||o===1/0?(w=isNaN(o)?1:0,p=i):(p=Math.floor(Math.log(o)/Math.LN2),o*(f=Math.pow(2,-p))<1&&(p--,f*=2),o+=p+N>=1?n/f:n*Math.pow(2,1-N),o*f>=2&&(p++,f/=2),p+N>=i?(w=0,p=i):p+N>=1?(w=(o*f-1)*Math.pow(2,h),p+=N):(w=o*Math.pow(2,N-1)*Math.pow(2,h),p=0));h>=8;a[t+s]=255&w,s+=u,w/=256,h-=8);for(p=p<<h|w,e+=h;e>0;a[t+s]=255&p,s+=u,p/=256,e-=8);a[t+s-u]|=128*l};
  
  },{}],35:[function(require,module,exports){
  "function"==typeof Object.create?module.exports=function(t,e){t.super_=e,t.prototype=Object.create(e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}})}:module.exports=function(t,e){t.super_=e;var o=function(){};o.prototype=e.prototype,t.prototype=new o,t.prototype.constructor=t};
  
  },{}],36:[function(require,module,exports){
  module.exports=function(r){return!(null==r||!(r._isBuffer||r.constructor&&"function"==typeof r.constructor.isBuffer&&r.constructor.isBuffer(r)))};
  
  },{}],37:[function(require,module,exports){
  var toString={}.toString;module.exports=Array.isArray||function(r){return"[object Array]"==toString.call(r)};
  
  },{}],38:[function(require,module,exports){
  "use strict";var yaml=require("./lib/js-yaml.js");module.exports=yaml;
  
  },{"./lib/js-yaml.js":39}],39:[function(require,module,exports){
  "use strict";function deprecated(e){return function(){throw new Error("Function "+e+" is deprecated and cannot be used.")}}var loader=require("./js-yaml/loader"),dumper=require("./js-yaml/dumper");module.exports.Type=require("./js-yaml/type"),module.exports.Schema=require("./js-yaml/schema"),module.exports.FAILSAFE_SCHEMA=require("./js-yaml/schema/failsafe"),module.exports.JSON_SCHEMA=require("./js-yaml/schema/json"),module.exports.CORE_SCHEMA=require("./js-yaml/schema/core"),module.exports.DEFAULT_SAFE_SCHEMA=require("./js-yaml/schema/default_safe"),module.exports.DEFAULT_FULL_SCHEMA=require("./js-yaml/schema/default_full"),module.exports.load=loader.load,module.exports.loadAll=loader.loadAll,module.exports.safeLoad=loader.safeLoad,module.exports.safeLoadAll=loader.safeLoadAll,module.exports.dump=dumper.dump,module.exports.safeDump=dumper.safeDump,module.exports.YAMLException=require("./js-yaml/exception"),module.exports.MINIMAL_SCHEMA=require("./js-yaml/schema/failsafe"),module.exports.SAFE_SCHEMA=require("./js-yaml/schema/default_safe"),module.exports.DEFAULT_SCHEMA=require("./js-yaml/schema/default_full"),module.exports.scan=deprecated("scan"),module.exports.parse=deprecated("parse"),module.exports.compose=deprecated("compose"),module.exports.addConstructor=deprecated("addConstructor");
  
  },{"./js-yaml/dumper":41,"./js-yaml/exception":42,"./js-yaml/loader":43,"./js-yaml/schema":45,"./js-yaml/schema/core":46,"./js-yaml/schema/default_full":47,"./js-yaml/schema/default_safe":48,"./js-yaml/schema/failsafe":49,"./js-yaml/schema/json":50,"./js-yaml/type":51}],40:[function(require,module,exports){
  "use strict";function isNothing(e){return"undefined"==typeof e||null===e}function isObject(e){return"object"==typeof e&&null!==e}function toArray(e){return Array.isArray(e)?e:isNothing(e)?[]:[e]}function extend(e,t){var r,o,n,i;if(t)for(i=Object.keys(t),r=0,o=i.length;o>r;r+=1)n=i[r],e[n]=t[n];return e}function repeat(e,t){var r,o="";for(r=0;t>r;r+=1)o+=e;return o}function isNegativeZero(e){return 0===e&&Number.NEGATIVE_INFINITY===1/e}module.exports.isNothing=isNothing,module.exports.isObject=isObject,module.exports.toArray=toArray,module.exports.repeat=repeat,module.exports.isNegativeZero=isNegativeZero,module.exports.extend=extend;
  
  },{}],41:[function(require,module,exports){
  "use strict";function compileStyleMap(e,t){var n,i,r,E,o,l,a;if(null===t)return{};for(n={},i=Object.keys(t),r=0,E=i.length;E>r;r+=1)o=i[r],l=String(t[o]),"!!"===o.slice(0,2)&&(o="tag:yaml.org,2002:"+o.slice(2)),a=e.compiledTypeMap[o],a&&_hasOwnProperty.call(a.styleAliases,l)&&(l=a.styleAliases[l]),n[o]=l;return n}function encodeHex(e){var t,n,i;if(t=e.toString(16).toUpperCase(),255>=e)n="x",i=2;else if(65535>=e)n="u",i=4;else{if(!(4294967295>=e))throw new YAMLException("code point within a string may not be greater than 0xFFFFFFFF");n="U",i=8}return"\\"+n+common.repeat("0",i-t.length)+t}function State(e){this.schema=e.schema||DEFAULT_FULL_SCHEMA,this.indent=Math.max(1,e.indent||2),this.skipInvalid=e.skipInvalid||!1,this.flowLevel=common.isNothing(e.flowLevel)?-1:e.flowLevel,this.styleMap=compileStyleMap(this.schema,e.styles||null),this.sortKeys=e.sortKeys||!1,this.lineWidth=e.lineWidth||80,this.noRefs=e.noRefs||!1,this.noCompatMode=e.noCompatMode||!1,this.implicitTypes=this.schema.compiledImplicit,this.explicitTypes=this.schema.compiledExplicit,this.tag=null,this.result="",this.duplicates=[],this.usedDuplicates=null}function indentString(e,t){for(var n,i=common.repeat(" ",t),r=0,E=-1,o="",l=e.length;l>r;)E=e.indexOf("\n",r),-1===E?(n=e.slice(r),r=l):(n=e.slice(r,E+1),r=E+1),n.length&&"\n"!==n&&(o+=i),o+=n;return o}function generateNextLine(e,t){return"\n"+common.repeat(" ",e.indent*t)}function testImplicitResolving(e,t){var n,i,r;for(n=0,i=e.implicitTypes.length;i>n;n+=1)if(r=e.implicitTypes[n],r.resolve(t))return!0;return!1}function isWhitespace(e){return e===CHAR_SPACE||e===CHAR_TAB}function isPrintable(e){return e>=32&&126>=e||e>=161&&55295>=e&&8232!==e&&8233!==e||e>=57344&&65533>=e&&65279!==e||e>=65536&&1114111>=e}function isPlainSafe(e){return isPrintable(e)&&65279!==e&&e!==CHAR_COMMA&&e!==CHAR_LEFT_SQUARE_BRACKET&&e!==CHAR_RIGHT_SQUARE_BRACKET&&e!==CHAR_LEFT_CURLY_BRACKET&&e!==CHAR_RIGHT_CURLY_BRACKET&&e!==CHAR_COLON&&e!==CHAR_SHARP}function isPlainSafeFirst(e){return isPrintable(e)&&65279!==e&&!isWhitespace(e)&&e!==CHAR_MINUS&&e!==CHAR_QUESTION&&e!==CHAR_COLON&&e!==CHAR_COMMA&&e!==CHAR_LEFT_SQUARE_BRACKET&&e!==CHAR_RIGHT_SQUARE_BRACKET&&e!==CHAR_LEFT_CURLY_BRACKET&&e!==CHAR_RIGHT_CURLY_BRACKET&&e!==CHAR_SHARP&&e!==CHAR_AMPERSAND&&e!==CHAR_ASTERISK&&e!==CHAR_EXCLAMATION&&e!==CHAR_VERTICAL_LINE&&e!==CHAR_GREATER_THAN&&e!==CHAR_SINGLE_QUOTE&&e!==CHAR_DOUBLE_QUOTE&&e!==CHAR_PERCENT&&e!==CHAR_COMMERCIAL_AT&&e!==CHAR_GRAVE_ACCENT}function chooseScalarStyle(e,t,n,i,r){var E,o,l=!1,a=!1,s=-1!==i,c=-1,A=isPlainSafeFirst(e.charCodeAt(0))&&!isWhitespace(e.charCodeAt(e.length-1));if(t)for(E=0;E<e.length;E++){if(o=e.charCodeAt(E),!isPrintable(o))return STYLE_DOUBLE;A=A&&isPlainSafe(o)}else{for(E=0;E<e.length;E++){if(o=e.charCodeAt(E),o===CHAR_LINE_FEED)l=!0,s&&(a=a||E-c-1>i&&" "!==e[c+1],c=E);else if(!isPrintable(o))return STYLE_DOUBLE;A=A&&isPlainSafe(o)}a=a||s&&E-c-1>i&&" "!==e[c+1]}return l||a?" "===e[0]&&n>9?STYLE_DOUBLE:a?STYLE_FOLDED:STYLE_LITERAL:A&&!r(e)?STYLE_PLAIN:STYLE_SINGLE}function writeScalar(e,t,n,i){e.dump=function(){function r(t){return testImplicitResolving(e,t)}if(0===t.length)return"''";if(!e.noCompatMode&&-1!==DEPRECATED_BOOLEANS_SYNTAX.indexOf(t))return"'"+t+"'";var E=e.indent*Math.max(1,n),o=-1===e.lineWidth?-1:Math.max(Math.min(e.lineWidth,40),e.lineWidth-E),l=i||e.flowLevel>-1&&n>=e.flowLevel;switch(chooseScalarStyle(t,l,e.indent,o,r)){case STYLE_PLAIN:return t;case STYLE_SINGLE:return"'"+t.replace(/'/g,"''")+"'";case STYLE_LITERAL:return"|"+blockHeader(t,e.indent)+dropEndingNewline(indentString(t,E));case STYLE_FOLDED:return">"+blockHeader(t,e.indent)+dropEndingNewline(indentString(foldString(t,o),E));case STYLE_DOUBLE:return'"'+escapeString(t,o)+'"';default:throw new YAMLException("impossible error: invalid scalar style")}}()}function blockHeader(e,t){var n=" "===e[0]?String(t):"",i="\n"===e[e.length-1],r=i&&("\n"===e[e.length-2]||"\n"===e),E=r?"+":i?"":"-";return n+E+"\n"}function dropEndingNewline(e){return"\n"===e[e.length-1]?e.slice(0,-1):e}function foldString(e,t){for(var n,i,r=/(\n+)([^\n]*)/g,E=function(){var n=e.indexOf("\n");return n=-1!==n?n:e.length,r.lastIndex=n,foldLine(e.slice(0,n),t)}(),o="\n"===e[0]||" "===e[0];i=r.exec(e);){var l=i[1],a=i[2];n=" "===a[0],E+=l+(o||n||""===a?"":"\n")+foldLine(a,t),o=n}return E}function foldLine(e,t){if(""===e||" "===e[0])return e;for(var n,i,r=/ [^ ]/g,E=0,o=0,l=0,a="";n=r.exec(e);)l=n.index,l-E>t&&(i=o>E?o:l,a+="\n"+e.slice(E,i),E=i+1),o=l;return a+="\n",a+=e.length-E>t&&o>E?e.slice(E,o)+"\n"+e.slice(o+1):e.slice(E),a.slice(1)}function escapeString(e){for(var t,n,i="",r=0;r<e.length;r++)t=e.charCodeAt(r),n=ESCAPE_SEQUENCES[t],i+=!n&&isPrintable(t)?e[r]:n||encodeHex(t);return i}function writeFlowSequence(e,t,n){var i,r,E="",o=e.tag;for(i=0,r=n.length;r>i;i+=1)writeNode(e,t,n[i],!1,!1)&&(0!==i&&(E+=", "),E+=e.dump);e.tag=o,e.dump="["+E+"]"}function writeBlockSequence(e,t,n,i){var r,E,o="",l=e.tag;for(r=0,E=n.length;E>r;r+=1)writeNode(e,t+1,n[r],!0,!0)&&(i&&0===r||(o+=generateNextLine(e,t)),o+="- "+e.dump);e.tag=l,e.dump=o||"[]"}function writeFlowMapping(e,t,n){var i,r,E,o,l,a="",s=e.tag,c=Object.keys(n);for(i=0,r=c.length;r>i;i+=1)l="",0!==i&&(l+=", "),E=c[i],o=n[E],writeNode(e,t,E,!1,!1)&&(e.dump.length>1024&&(l+="? "),l+=e.dump+": ",writeNode(e,t,o,!1,!1)&&(l+=e.dump,a+=l));e.tag=s,e.dump="{"+a+"}"}function writeBlockMapping(e,t,n,i){var r,E,o,l,a,s,c="",A=e.tag,u=Object.keys(n);if(e.sortKeys===!0)u.sort();else if("function"==typeof e.sortKeys)u.sort(e.sortKeys);else if(e.sortKeys)throw new YAMLException("sortKeys must be a boolean or a function");for(r=0,E=u.length;E>r;r+=1)s="",i&&0===r||(s+=generateNextLine(e,t)),o=u[r],l=n[o],writeNode(e,t+1,o,!0,!0,!0)&&(a=null!==e.tag&&"?"!==e.tag||e.dump&&e.dump.length>1024,a&&(s+=e.dump&&CHAR_LINE_FEED===e.dump.charCodeAt(0)?"?":"? "),s+=e.dump,a&&(s+=generateNextLine(e,t)),writeNode(e,t+1,l,!0,a)&&(s+=e.dump&&CHAR_LINE_FEED===e.dump.charCodeAt(0)?":":": ",s+=e.dump,c+=s));e.tag=A,e.dump=c||"{}"}function detectType(e,t,n){var i,r,E,o,l,a;for(r=n?e.explicitTypes:e.implicitTypes,E=0,o=r.length;o>E;E+=1)if(l=r[E],(l.instanceOf||l.predicate)&&(!l.instanceOf||"object"==typeof t&&t instanceof l.instanceOf)&&(!l.predicate||l.predicate(t))){if(e.tag=n?l.tag:"?",l.represent){if(a=e.styleMap[l.tag]||l.defaultStyle,"[object Function]"===_toString.call(l.represent))i=l.represent(t,a);else{if(!_hasOwnProperty.call(l.represent,a))throw new YAMLException("!<"+l.tag+'> tag resolver accepts not "'+a+'" style');i=l.represent[a](t,a)}e.dump=i}return!0}return!1}function writeNode(e,t,n,i,r,E){e.tag=null,e.dump=n,detectType(e,n,!1)||detectType(e,n,!0);var o=_toString.call(e.dump);i&&(i=e.flowLevel<0||e.flowLevel>t);var l,a,s="[object Object]"===o||"[object Array]"===o;if(s&&(l=e.duplicates.indexOf(n),a=-1!==l),(null!==e.tag&&"?"!==e.tag||a||2!==e.indent&&t>0)&&(r=!1),a&&e.usedDuplicates[l])e.dump="*ref_"+l;else{if(s&&a&&!e.usedDuplicates[l]&&(e.usedDuplicates[l]=!0),"[object Object]"===o)i&&0!==Object.keys(e.dump).length?(writeBlockMapping(e,t,e.dump,r),a&&(e.dump="&ref_"+l+e.dump)):(writeFlowMapping(e,t,e.dump),a&&(e.dump="&ref_"+l+" "+e.dump));else if("[object Array]"===o)i&&0!==e.dump.length?(writeBlockSequence(e,t,e.dump,r),a&&(e.dump="&ref_"+l+e.dump)):(writeFlowSequence(e,t,e.dump),a&&(e.dump="&ref_"+l+" "+e.dump));else{if("[object String]"!==o){if(e.skipInvalid)return!1;throw new YAMLException("unacceptable kind of an object to dump "+o)}"?"!==e.tag&&writeScalar(e,e.dump,t,E)}null!==e.tag&&"?"!==e.tag&&(e.dump="!<"+e.tag+"> "+e.dump)}return!0}function getDuplicateReferences(e,t){var n,i,r=[],E=[];for(inspectNode(e,r,E),n=0,i=E.length;i>n;n+=1)t.duplicates.push(r[E[n]]);t.usedDuplicates=new Array(i)}function inspectNode(e,t,n){var i,r,E;if(null!==e&&"object"==typeof e)if(r=t.indexOf(e),-1!==r)-1===n.indexOf(r)&&n.push(r);else if(t.push(e),Array.isArray(e))for(r=0,E=e.length;E>r;r+=1)inspectNode(e[r],t,n);else for(i=Object.keys(e),r=0,E=i.length;E>r;r+=1)inspectNode(e[i[r]],t,n)}function dump(e,t){t=t||{};var n=new State(t);return n.noRefs||getDuplicateReferences(e,n),writeNode(n,0,e,!0,!0)?n.dump+"\n":""}function safeDump(e,t){return dump(e,common.extend({schema:DEFAULT_SAFE_SCHEMA},t))}var common=require("./common"),YAMLException=require("./exception"),DEFAULT_FULL_SCHEMA=require("./schema/default_full"),DEFAULT_SAFE_SCHEMA=require("./schema/default_safe"),_toString=Object.prototype.toString,_hasOwnProperty=Object.prototype.hasOwnProperty,CHAR_TAB=9,CHAR_LINE_FEED=10,CHAR_SPACE=32,CHAR_EXCLAMATION=33,CHAR_DOUBLE_QUOTE=34,CHAR_SHARP=35,CHAR_PERCENT=37,CHAR_AMPERSAND=38,CHAR_SINGLE_QUOTE=39,CHAR_ASTERISK=42,CHAR_COMMA=44,CHAR_MINUS=45,CHAR_COLON=58,CHAR_GREATER_THAN=62,CHAR_QUESTION=63,CHAR_COMMERCIAL_AT=64,CHAR_LEFT_SQUARE_BRACKET=91,CHAR_RIGHT_SQUARE_BRACKET=93,CHAR_GRAVE_ACCENT=96,CHAR_LEFT_CURLY_BRACKET=123,CHAR_VERTICAL_LINE=124,CHAR_RIGHT_CURLY_BRACKET=125,ESCAPE_SEQUENCES={};ESCAPE_SEQUENCES[0]="\\0",ESCAPE_SEQUENCES[7]="\\a",ESCAPE_SEQUENCES[8]="\\b",ESCAPE_SEQUENCES[9]="\\t",ESCAPE_SEQUENCES[10]="\\n",ESCAPE_SEQUENCES[11]="\\v",ESCAPE_SEQUENCES[12]="\\f",ESCAPE_SEQUENCES[13]="\\r",ESCAPE_SEQUENCES[27]="\\e",ESCAPE_SEQUENCES[34]='\\"',ESCAPE_SEQUENCES[92]="\\\\",ESCAPE_SEQUENCES[133]="\\N",ESCAPE_SEQUENCES[160]="\\_",ESCAPE_SEQUENCES[8232]="\\L",ESCAPE_SEQUENCES[8233]="\\P";var DEPRECATED_BOOLEANS_SYNTAX=["y","Y","yes","Yes","YES","on","On","ON","n","N","no","No","NO","off","Off","OFF"],STYLE_PLAIN=1,STYLE_SINGLE=2,STYLE_LITERAL=3,STYLE_FOLDED=4,STYLE_DOUBLE=5;module.exports.dump=dump,module.exports.safeDump=safeDump;
  
  },{"./common":40,"./exception":42,"./schema/default_full":47,"./schema/default_safe":48}],42:[function(require,module,exports){
  "use strict";function YAMLException(t,r){Error.call(this),Error.captureStackTrace?Error.captureStackTrace(this,this.constructor):this.stack=(new Error).stack||"",this.name="YAMLException",this.reason=t,this.mark=r,this.message=(this.reason||"(unknown reason)")+(this.mark?" "+this.mark.toString():"")}YAMLException.prototype=Object.create(Error.prototype),YAMLException.prototype.constructor=YAMLException,YAMLException.prototype.toString=function(t){var r=this.name+": ";return r+=this.reason||"(unknown reason)",!t&&this.mark&&(r+=" "+this.mark.toString()),r},module.exports=YAMLException;
  
  },{}],43:[function(require,module,exports){
  "use strict";function is_EOL(e){return 10===e||13===e}function is_WHITE_SPACE(e){return 9===e||32===e}function is_WS_OR_EOL(e){return 9===e||32===e||10===e||13===e}function is_FLOW_INDICATOR(e){return 44===e||91===e||93===e||123===e||125===e}function fromHexCode(e){var t;return e>=48&&57>=e?e-48:(t=32|e,t>=97&&102>=t?t-97+10:-1)}function escapedHexLen(e){return 120===e?2:117===e?4:85===e?8:0}function fromDecimalCode(e){return e>=48&&57>=e?e-48:-1}function simpleEscapeSequence(e){return 48===e?"\x00":97===e?"":98===e?"\b":116===e?"   ":9===e?"   ":110===e?"\n":118===e?"\x0B":102===e?"\f":114===e?"\r":101===e?"":32===e?" ":34===e?'"':47===e?"/":92===e?"\\":78===e?"":95===e?" ":76===e?"\u2028":80===e?"\u2029":""}function charFromCodepoint(e){return 65535>=e?String.fromCharCode(e):String.fromCharCode((e-65536>>10)+55296,(e-65536&1023)+56320)}function State(e,t){this.input=e,this.filename=t.filename||null,this.schema=t.schema||DEFAULT_FULL_SCHEMA,this.onWarning=t.onWarning||null,this.legacy=t.legacy||!1,this.json=t.json||!1,this.listener=t.listener||null,this.implicitTypes=this.schema.compiledImplicit,this.typeMap=this.schema.compiledTypeMap,this.length=e.length,this.position=0,this.line=0,this.lineStart=0,this.lineIndent=0,this.documents=[]}function generateError(e,t){return new YAMLException(t,new Mark(e.filename,e.input,e.position,e.line,e.position-e.lineStart))}function throwError(e,t){throw generateError(e,t)}function throwWarning(e,t){e.onWarning&&e.onWarning.call(null,generateError(e,t))}function captureSegment(e,t,n,i){var o,r,a,s;if(n>t){if(s=e.input.slice(t,n),i)for(o=0,r=s.length;r>o;o+=1)a=s.charCodeAt(o),9===a||a>=32&&1114111>=a||throwError(e,"expected valid JSON character");else PATTERN_NON_PRINTABLE.test(s)&&throwError(e,"the stream contains non-printable characters");e.result+=s}}function mergeMappings(e,t,n,i){var o,r,a,s;for(common.isObject(n)||throwError(e,"cannot merge mappings; the provided source object is unacceptable"),o=Object.keys(n),a=0,s=o.length;s>a;a+=1)r=o[a],_hasOwnProperty.call(t,r)||(t[r]=n[r],i[r]=!0)}function storeMappingPair(e,t,n,i,o,r){var a,s;if(o=String(o),null===t&&(t={}),"tag:yaml.org,2002:merge"===i)if(Array.isArray(r))for(a=0,s=r.length;s>a;a+=1)mergeMappings(e,t,r[a],n);else mergeMappings(e,t,r,n);else e.json||_hasOwnProperty.call(n,o)||!_hasOwnProperty.call(t,o)||throwError(e,"duplicated mapping key"),t[o]=r,delete n[o];return t}function readLineBreak(e){var t;t=e.input.charCodeAt(e.position),10===t?e.position++:13===t?(e.position++,10===e.input.charCodeAt(e.position)&&e.position++):throwError(e,"a line break is expected"),e.line+=1,e.lineStart=e.position}function skipSeparationSpace(e,t,n){for(var i=0,o=e.input.charCodeAt(e.position);0!==o;){for(;is_WHITE_SPACE(o);)o=e.input.charCodeAt(++e.position);if(t&&35===o)do o=e.input.charCodeAt(++e.position);while(10!==o&&13!==o&&0!==o);if(!is_EOL(o))break;for(readLineBreak(e),o=e.input.charCodeAt(e.position),i++,e.lineIndent=0;32===o;)e.lineIndent++,o=e.input.charCodeAt(++e.position)}return-1!==n&&0!==i&&e.lineIndent<n&&throwWarning(e,"deficient indentation"),i}function testDocumentSeparator(e){var t,n=e.position;return t=e.input.charCodeAt(n),(45===t||46===t)&&t===e.input.charCodeAt(n+1)&&t===e.input.charCodeAt(n+2)&&(n+=3,t=e.input.charCodeAt(n),0===t||is_WS_OR_EOL(t))}function writeFoldedLines(e,t){1===t?e.result+=" ":t>1&&(e.result+=common.repeat("\n",t-1))}function readPlainScalar(e,t,n){var i,o,r,a,s,p,c,l,u,d=e.kind,h=e.result;if(u=e.input.charCodeAt(e.position),is_WS_OR_EOL(u)||is_FLOW_INDICATOR(u)||35===u||38===u||42===u||33===u||124===u||62===u||39===u||34===u||37===u||64===u||96===u)return!1;if((63===u||45===u)&&(o=e.input.charCodeAt(e.position+1),is_WS_OR_EOL(o)||n&&is_FLOW_INDICATOR(o)))return!1;for(e.kind="scalar",e.result="",r=a=e.position,s=!1;0!==u;){if(58===u){if(o=e.input.charCodeAt(e.position+1),is_WS_OR_EOL(o)||n&&is_FLOW_INDICATOR(o))break}else if(35===u){if(i=e.input.charCodeAt(e.position-1),is_WS_OR_EOL(i))break}else{if(e.position===e.lineStart&&testDocumentSeparator(e)||n&&is_FLOW_INDICATOR(u))break;if(is_EOL(u)){if(p=e.line,c=e.lineStart,l=e.lineIndent,skipSeparationSpace(e,!1,-1),e.lineIndent>=t){s=!0,u=e.input.charCodeAt(e.position);continue}e.position=a,e.line=p,e.lineStart=c,e.lineIndent=l;break}}s&&(captureSegment(e,r,a,!1),writeFoldedLines(e,e.line-p),r=a=e.position,s=!1),is_WHITE_SPACE(u)||(a=e.position+1),u=e.input.charCodeAt(++e.position)}return captureSegment(e,r,a,!1),e.result?!0:(e.kind=d,e.result=h,!1)}function readSingleQuotedScalar(e,t){var n,i,o;if(n=e.input.charCodeAt(e.position),39!==n)return!1;for(e.kind="scalar",e.result="",e.position++,i=o=e.position;0!==(n=e.input.charCodeAt(e.position));)if(39===n){if(captureSegment(e,i,e.position,!0),n=e.input.charCodeAt(++e.position),39!==n)return!0;i=o=e.position,e.position++}else is_EOL(n)?(captureSegment(e,i,o,!0),writeFoldedLines(e,skipSeparationSpace(e,!1,t)),i=o=e.position):e.position===e.lineStart&&testDocumentSeparator(e)?throwError(e,"unexpected end of the document within a single quoted scalar"):(e.position++,o=e.position);throwError(e,"unexpected end of the stream within a single quoted scalar")}function readDoubleQuotedScalar(e,t){var n,i,o,r,a,s;if(s=e.input.charCodeAt(e.position),34!==s)return!1;for(e.kind="scalar",e.result="",e.position++,n=i=e.position;0!==(s=e.input.charCodeAt(e.position));){if(34===s)return captureSegment(e,n,e.position,!0),e.position++,!0;if(92===s){if(captureSegment(e,n,e.position,!0),s=e.input.charCodeAt(++e.position),is_EOL(s))skipSeparationSpace(e,!1,t);else if(256>s&&simpleEscapeCheck[s])e.result+=simpleEscapeMap[s],e.position++;else if((a=escapedHexLen(s))>0){for(o=a,r=0;o>0;o--)s=e.input.charCodeAt(++e.position),(a=fromHexCode(s))>=0?r=(r<<4)+a:throwError(e,"expected hexadecimal character");e.result+=charFromCodepoint(r),e.position++}else throwError(e,"unknown escape sequence");n=i=e.position}else is_EOL(s)?(captureSegment(e,n,i,!0),writeFoldedLines(e,skipSeparationSpace(e,!1,t)),n=i=e.position):e.position===e.lineStart&&testDocumentSeparator(e)?throwError(e,"unexpected end of the document within a double quoted scalar"):(e.position++,i=e.position)}throwError(e,"unexpected end of the stream within a double quoted scalar")}function readFlowCollection(e,t){var n,i,o,r,a,s,p,c,l,u,d,h=!0,f=e.tag,_=e.anchor,A={};if(d=e.input.charCodeAt(e.position),91===d)r=93,p=!1,i=[];else{if(123!==d)return!1;r=125,p=!0,i={}}for(null!==e.anchor&&(e.anchorMap[e.anchor]=i),d=e.input.charCodeAt(++e.position);0!==d;){if(skipSeparationSpace(e,!0,t),d=e.input.charCodeAt(e.position),d===r)return e.position++,e.tag=f,e.anchor=_,e.kind=p?"mapping":"sequence",e.result=i,!0;h||throwError(e,"missed comma between flow collection entries"),l=c=u=null,a=s=!1,63===d&&(o=e.input.charCodeAt(e.position+1),is_WS_OR_EOL(o)&&(a=s=!0,e.position++,skipSeparationSpace(e,!0,t))),n=e.line,composeNode(e,t,CONTEXT_FLOW_IN,!1,!0),l=e.tag,c=e.result,skipSeparationSpace(e,!0,t),d=e.input.charCodeAt(e.position),!s&&e.line!==n||58!==d||(a=!0,d=e.input.charCodeAt(++e.position),skipSeparationSpace(e,!0,t),composeNode(e,t,CONTEXT_FLOW_IN,!1,!0),u=e.result),p?storeMappingPair(e,i,A,l,c,u):a?i.push(storeMappingPair(e,null,A,l,c,u)):i.push(c),skipSeparationSpace(e,!0,t),d=e.input.charCodeAt(e.position),44===d?(h=!0,d=e.input.charCodeAt(++e.position)):h=!1}throwError(e,"unexpected end of the stream within a flow collection")}function readBlockScalar(e,t){var n,i,o,r,a=CHOMPING_CLIP,s=!1,p=!1,c=t,l=0,u=!1;if(r=e.input.charCodeAt(e.position),124===r)i=!1;else{if(62!==r)return!1;i=!0}for(e.kind="scalar",e.result="";0!==r;)if(r=e.input.charCodeAt(++e.position),43===r||45===r)CHOMPING_CLIP===a?a=43===r?CHOMPING_KEEP:CHOMPING_STRIP:throwError(e,"repeat of a chomping mode identifier");else{if(!((o=fromDecimalCode(r))>=0))break;0===o?throwError(e,"bad explicit indentation width of a block scalar; it cannot be less than one"):p?throwError(e,"repeat of an indentation width identifier"):(c=t+o-1,p=!0)}if(is_WHITE_SPACE(r)){do r=e.input.charCodeAt(++e.position);while(is_WHITE_SPACE(r));if(35===r)do r=e.input.charCodeAt(++e.position);while(!is_EOL(r)&&0!==r)}for(;0!==r;){for(readLineBreak(e),e.lineIndent=0,r=e.input.charCodeAt(e.position);(!p||e.lineIndent<c)&&32===r;)e.lineIndent++,r=e.input.charCodeAt(++e.position);if(!p&&e.lineIndent>c&&(c=e.lineIndent),is_EOL(r))l++;else{if(e.lineIndent<c){a===CHOMPING_KEEP?e.result+=common.repeat("\n",s?1+l:l):a===CHOMPING_CLIP&&s&&(e.result+="\n");break}for(i?is_WHITE_SPACE(r)?(u=!0,e.result+=common.repeat("\n",s?1+l:l)):u?(u=!1,e.result+=common.repeat("\n",l+1)):0===l?s&&(e.result+=" "):e.result+=common.repeat("\n",l):e.result+=common.repeat("\n",s?1+l:l),s=!0,p=!0,l=0,n=e.position;!is_EOL(r)&&0!==r;)r=e.input.charCodeAt(++e.position);captureSegment(e,n,e.position,!1)}}return!0}function readBlockSequence(e,t){var n,i,o,r=e.tag,a=e.anchor,s=[],p=!1;for(null!==e.anchor&&(e.anchorMap[e.anchor]=s),o=e.input.charCodeAt(e.position);0!==o&&45===o&&(i=e.input.charCodeAt(e.position+1),is_WS_OR_EOL(i));)if(p=!0,e.position++,skipSeparationSpace(e,!0,-1)&&e.lineIndent<=t)s.push(null),o=e.input.charCodeAt(e.position);else if(n=e.line,composeNode(e,t,CONTEXT_BLOCK_IN,!1,!0),s.push(e.result),skipSeparationSpace(e,!0,-1),o=e.input.charCodeAt(e.position),(e.line===n||e.lineIndent>t)&&0!==o)throwError(e,"bad indentation of a sequence entry");else if(e.lineIndent<t)break;return p?(e.tag=r,e.anchor=a,e.kind="sequence",e.result=s,!0):!1}function readBlockMapping(e,t,n){var i,o,r,a,s=e.tag,p=e.anchor,c={},l={},u=null,d=null,h=null,f=!1,_=!1;for(null!==e.anchor&&(e.anchorMap[e.anchor]=c),a=e.input.charCodeAt(e.position);0!==a;){if(i=e.input.charCodeAt(e.position+1),r=e.line,63!==a&&58!==a||!is_WS_OR_EOL(i)){if(!composeNode(e,n,CONTEXT_FLOW_OUT,!1,!0))break;if(e.line===r){for(a=e.input.charCodeAt(e.position);is_WHITE_SPACE(a);)a=e.input.charCodeAt(++e.position);if(58===a)a=e.input.charCodeAt(++e.position),is_WS_OR_EOL(a)||throwError(e,"a whitespace character is expected after the key-value separator within a block mapping"),f&&(storeMappingPair(e,c,l,u,d,null),u=d=h=null),_=!0,f=!1,o=!1,u=e.tag,d=e.result;else{if(!_)return e.tag=s,e.anchor=p,!0;throwError(e,"can not read an implicit mapping pair; a colon is missed")}}else{if(!_)return e.tag=s,e.anchor=p,!0;throwError(e,"can not read a block mapping entry; a multiline key may not be an implicit key")}}else 63===a?(f&&(storeMappingPair(e,c,l,u,d,null),u=d=h=null),_=!0,f=!0,o=!0):f?(f=!1,o=!0):throwError(e,"incomplete explicit mapping pair; a key node is missed"),e.position+=1,a=i;if((e.line===r||e.lineIndent>t)&&(composeNode(e,t,CONTEXT_BLOCK_OUT,!0,o)&&(f?d=e.result:h=e.result),f||(storeMappingPair(e,c,l,u,d,h),u=d=h=null),skipSeparationSpace(e,!0,-1),a=e.input.charCodeAt(e.position)),e.lineIndent>t&&0!==a)throwError(e,"bad indentation of a mapping entry");else if(e.lineIndent<t)break}return f&&storeMappingPair(e,c,l,u,d,null),_&&(e.tag=s,e.anchor=p,e.kind="mapping",e.result=c),_}function readTagProperty(e){var t,n,i,o,r=!1,a=!1;if(o=e.input.charCodeAt(e.position),33!==o)return!1;if(null!==e.tag&&throwError(e,"duplication of a tag property"),o=e.input.charCodeAt(++e.position),60===o?(r=!0,o=e.input.charCodeAt(++e.position)):33===o?(a=!0,n="!!",o=e.input.charCodeAt(++e.position)):n="!",t=e.position,r){do o=e.input.charCodeAt(++e.position);while(0!==o&&62!==o);e.position<e.length?(i=e.input.slice(t,e.position),o=e.input.charCodeAt(++e.position)):throwError(e,"unexpected end of the stream within a verbatim tag")}else{for(;0!==o&&!is_WS_OR_EOL(o);)33===o&&(a?throwError(e,"tag suffix cannot contain exclamation marks"):(n=e.input.slice(t-1,e.position+1),PATTERN_TAG_HANDLE.test(n)||throwError(e,"named tag handle cannot contain such characters"),a=!0,t=e.position+1)),o=e.input.charCodeAt(++e.position);i=e.input.slice(t,e.position),PATTERN_FLOW_INDICATORS.test(i)&&throwError(e,"tag suffix cannot contain flow indicator characters")}return i&&!PATTERN_TAG_URI.test(i)&&throwError(e,"tag name cannot contain such characters: "+i),r?e.tag=i:_hasOwnProperty.call(e.tagMap,n)?e.tag=e.tagMap[n]+i:"!"===n?e.tag="!"+i:"!!"===n?e.tag="tag:yaml.org,2002:"+i:throwError(e,'undeclared tag handle "'+n+'"'),!0}function readAnchorProperty(e){var t,n;if(n=e.input.charCodeAt(e.position),38!==n)return!1;for(null!==e.anchor&&throwError(e,"duplication of an anchor property"),n=e.input.charCodeAt(++e.position),t=e.position;0!==n&&!is_WS_OR_EOL(n)&&!is_FLOW_INDICATOR(n);)n=e.input.charCodeAt(++e.position);return e.position===t&&throwError(e,"name of an anchor node must contain at least one character"),e.anchor=e.input.slice(t,e.position),!0}function readAlias(e){var t,n,i;if(i=e.input.charCodeAt(e.position),42!==i)return!1;for(i=e.input.charCodeAt(++e.position),t=e.position;0!==i&&!is_WS_OR_EOL(i)&&!is_FLOW_INDICATOR(i);)i=e.input.charCodeAt(++e.position);return e.position===t&&throwError(e,"name of an alias node must contain at least one character"),n=e.input.slice(t,e.position),e.anchorMap.hasOwnProperty(n)||throwError(e,'unidentified alias "'+n+'"'),e.result=e.anchorMap[n],skipSeparationSpace(e,!0,-1),!0}function composeNode(e,t,n,i,o){var r,a,s,p,c,l,u,d,h=1,f=!1,_=!1;if(null!==e.listener&&e.listener("open",e),e.tag=null,e.anchor=null,e.kind=null,e.result=null,r=a=s=CONTEXT_BLOCK_OUT===n||CONTEXT_BLOCK_IN===n,i&&skipSeparationSpace(e,!0,-1)&&(f=!0,e.lineIndent>t?h=1:e.lineIndent===t?h=0:e.lineIndent<t&&(h=-1)),1===h)for(;readTagProperty(e)||readAnchorProperty(e);)skipSeparationSpace(e,!0,-1)?(f=!0,s=r,e.lineIndent>t?h=1:e.lineIndent===t?h=0:e.lineIndent<t&&(h=-1)):s=!1;if(s&&(s=f||o),1!==h&&CONTEXT_BLOCK_OUT!==n||(u=CONTEXT_FLOW_IN===n||CONTEXT_FLOW_OUT===n?t:t+1,d=e.position-e.lineStart,1===h?s&&(readBlockSequence(e,d)||readBlockMapping(e,d,u))||readFlowCollection(e,u)?_=!0:(a&&readBlockScalar(e,u)||readSingleQuotedScalar(e,u)||readDoubleQuotedScalar(e,u)?_=!0:readAlias(e)?(_=!0,null===e.tag&&null===e.anchor||throwError(e,"alias node should not have any properties")):readPlainScalar(e,u,CONTEXT_FLOW_IN===n)&&(_=!0,null===e.tag&&(e.tag="?")),null!==e.anchor&&(e.anchorMap[e.anchor]=e.result)):0===h&&(_=s&&readBlockSequence(e,d))),null!==e.tag&&"!"!==e.tag)if("?"===e.tag){for(p=0,c=e.implicitTypes.length;c>p;p+=1)if(l=e.implicitTypes[p],l.resolve(e.result)){e.result=l.construct(e.result),e.tag=l.tag,null!==e.anchor&&(e.anchorMap[e.anchor]=e.result);break}}else _hasOwnProperty.call(e.typeMap,e.tag)?(l=e.typeMap[e.tag],null!==e.result&&l.kind!==e.kind&&throwError(e,"unacceptable node kind for !<"+e.tag+'> tag; it should be "'+l.kind+'", not "'+e.kind+'"'),l.resolve(e.result)?(e.result=l.construct(e.result),null!==e.anchor&&(e.anchorMap[e.anchor]=e.result)):throwError(e,"cannot resolve a node with !<"+e.tag+"> explicit tag")):throwError(e,"unknown tag !<"+e.tag+">");return null!==e.listener&&e.listener("close",e),null!==e.tag||null!==e.anchor||_}function readDocument(e){var t,n,i,o,r=e.position,a=!1;for(e.version=null,e.checkLineBreaks=e.legacy,e.tagMap={},e.anchorMap={};0!==(o=e.input.charCodeAt(e.position))&&(skipSeparationSpace(e,!0,-1),o=e.input.charCodeAt(e.position),!(e.lineIndent>0||37!==o));){for(a=!0,o=e.input.charCodeAt(++e.position),t=e.position;0!==o&&!is_WS_OR_EOL(o);)o=e.input.charCodeAt(++e.position);for(n=e.input.slice(t,e.position),i=[],n.length<1&&throwError(e,"directive name must not be less than one character in length");0!==o;){for(;is_WHITE_SPACE(o);)o=e.input.charCodeAt(++e.position);if(35===o){do o=e.input.charCodeAt(++e.position);while(0!==o&&!is_EOL(o));break}if(is_EOL(o))break;for(t=e.position;0!==o&&!is_WS_OR_EOL(o);)o=e.input.charCodeAt(++e.position);i.push(e.input.slice(t,e.position))}0!==o&&readLineBreak(e),_hasOwnProperty.call(directiveHandlers,n)?directiveHandlers[n](e,n,i):throwWarning(e,'unknown document directive "'+n+'"')}return skipSeparationSpace(e,!0,-1),0===e.lineIndent&&45===e.input.charCodeAt(e.position)&&45===e.input.charCodeAt(e.position+1)&&45===e.input.charCodeAt(e.position+2)?(e.position+=3,skipSeparationSpace(e,!0,-1)):a&&throwError(e,"directives end mark is expected"),composeNode(e,e.lineIndent-1,CONTEXT_BLOCK_OUT,!1,!0),skipSeparationSpace(e,!0,-1),e.checkLineBreaks&&PATTERN_NON_ASCII_LINE_BREAKS.test(e.input.slice(r,e.position))&&throwWarning(e,"non-ASCII line breaks are interpreted as content"),e.documents.push(e.result),e.position===e.lineStart&&testDocumentSeparator(e)?void(46===e.input.charCodeAt(e.position)&&(e.position+=3,skipSeparationSpace(e,!0,-1))):void(e.position<e.length-1&&throwError(e,"end of the stream or a document separator is expected"))}function loadDocuments(e,t){e=String(e),t=t||{},0!==e.length&&(10!==e.charCodeAt(e.length-1)&&13!==e.charCodeAt(e.length-1)&&(e+="\n"),65279===e.charCodeAt(0)&&(e=e.slice(1)));var n=new State(e,t);for(n.input+="\x00";32===n.input.charCodeAt(n.position);)n.lineIndent+=1,n.position+=1;for(;n.position<n.length-1;)readDocument(n);return n.documents}function loadAll(e,t,n){var i,o,r=loadDocuments(e,n);for(i=0,o=r.length;o>i;i+=1)t(r[i])}function load(e,t){var n=loadDocuments(e,t);if(0!==n.length){if(1===n.length)return n[0];throw new YAMLException("expected a single document in the stream, but found more")}}function safeLoadAll(e,t,n){loadAll(e,t,common.extend({schema:DEFAULT_SAFE_SCHEMA},n))}function safeLoad(e,t){return load(e,common.extend({schema:DEFAULT_SAFE_SCHEMA},t))}for(var common=require("./common"),YAMLException=require("./exception"),Mark=require("./mark"),DEFAULT_SAFE_SCHEMA=require("./schema/default_safe"),DEFAULT_FULL_SCHEMA=require("./schema/default_full"),_hasOwnProperty=Object.prototype.hasOwnProperty,CONTEXT_FLOW_IN=1,CONTEXT_FLOW_OUT=2,CONTEXT_BLOCK_IN=3,CONTEXT_BLOCK_OUT=4,CHOMPING_CLIP=1,CHOMPING_STRIP=2,CHOMPING_KEEP=3,PATTERN_NON_PRINTABLE=/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F-\x84\x86-\x9F\uFFFE\uFFFF]|[\uD800-\uDBFF](?![\uDC00-\uDFFF])|(?:[^\uD800-\uDBFF]|^)[\uDC00-\uDFFF]/,PATTERN_NON_ASCII_LINE_BREAKS=/[\x85\u2028\u2029]/,PATTERN_FLOW_INDICATORS=/[,\[\]\{\}]/,PATTERN_TAG_HANDLE=/^(?:!|!!|![a-z\-]+!)$/i,PATTERN_TAG_URI=/^(?:!|[^,\[\]\{\}])(?:%[0-9a-f]{2}|[0-9a-z\-#;\/\?:@&=\+\$,_\.!~\*'\(\)\[\]])*$/i,simpleEscapeCheck=new Array(256),simpleEscapeMap=new Array(256),i=0;256>i;i++)simpleEscapeCheck[i]=simpleEscapeSequence(i)?1:0,simpleEscapeMap[i]=simpleEscapeSequence(i);var directiveHandlers={YAML:function(e,t,n){var i,o,r;null!==e.version&&throwError(e,"duplication of %YAML directive"),1!==n.length&&throwError(e,"YAML directive accepts exactly one argument"),i=/^([0-9]+)\.([0-9]+)$/.exec(n[0]),null===i&&throwError(e,"ill-formed argument of the YAML directive"),o=parseInt(i[1],10),r=parseInt(i[2],10),1!==o&&throwError(e,"unacceptable YAML version of the document"),e.version=n[0],e.checkLineBreaks=2>r,1!==r&&2!==r&&throwWarning(e,"unsupported YAML version of the document")},TAG:function(e,t,n){var i,o;2!==n.length&&throwError(e,"TAG directive accepts exactly two arguments"),i=n[0],o=n[1],PATTERN_TAG_HANDLE.test(i)||throwError(e,"ill-formed tag handle (first argument) of the TAG directive"),_hasOwnProperty.call(e.tagMap,i)&&throwError(e,'there is a previously declared suffix for "'+i+'" tag handle'),PATTERN_TAG_URI.test(o)||throwError(e,"ill-formed tag prefix (second argument) of the TAG directive"),e.tagMap[i]=o}};module.exports.loadAll=loadAll,module.exports.load=load,module.exports.safeLoadAll=safeLoadAll,module.exports.safeLoad=safeLoad;
  
  },{"./common":40,"./exception":42,"./mark":44,"./schema/default_full":47,"./schema/default_safe":48}],44:[function(require,module,exports){
  "use strict";function Mark(t,i,n,e,r){this.name=t,this.buffer=i,this.position=n,this.line=e,this.column=r}var common=require("./common");Mark.prototype.getSnippet=function(t,i){var n,e,r,o,s;if(!this.buffer)return null;for(t=t||4,i=i||75,n="",e=this.position;e>0&&-1==="\x00\r\n\u2028\u2029".indexOf(this.buffer.charAt(e-1));)if(e-=1,this.position-e>i/2-1){n=" ... ",e+=5;break}for(r="",o=this.position;o<this.buffer.length&&-1==="\x00\r\n\u2028\u2029".indexOf(this.buffer.charAt(o));)if(o+=1,o-this.position>i/2-1){r=" ... ",o-=5;break}return s=this.buffer.slice(e,o),common.repeat(" ",t)+n+s+r+"\n"+common.repeat(" ",t+this.position-e+n.length)+"^"},Mark.prototype.toString=function(t){var i,n="";return this.name&&(n+='in "'+this.name+'" '),n+="at line "+(this.line+1)+", column "+(this.column+1),t||(i=this.getSnippet(),i&&(n+=":\n"+i)),n},module.exports=Mark;
  
  },{"./common":40}],45:[function(require,module,exports){
  "use strict";function compileList(i,e,t){var c=[];return i.include.forEach(function(i){t=compileList(i,e,t)}),i[e].forEach(function(i){t.forEach(function(e,t){e.tag===i.tag&&c.push(t)}),t.push(i)}),t.filter(function(i,e){return-1===c.indexOf(e)})}function compileMap(){function i(i){c[i.tag]=i}var e,t,c={};for(e=0,t=arguments.length;t>e;e+=1)arguments[e].forEach(i);return c}function Schema(i){this.include=i.include||[],this.implicit=i.implicit||[],this.explicit=i.explicit||[],this.implicit.forEach(function(i){if(i.loadKind&&"scalar"!==i.loadKind)throw new YAMLException("There is a non-scalar type in the implicit list of a schema. Implicit resolving of such types is not supported.")}),this.compiledImplicit=compileList(this,"implicit",[]),this.compiledExplicit=compileList(this,"explicit",[]),this.compiledTypeMap=compileMap(this.compiledImplicit,this.compiledExplicit)}var common=require("./common"),YAMLException=require("./exception"),Type=require("./type");Schema.DEFAULT=null,Schema.create=function(){var i,e;switch(arguments.length){case 1:i=Schema.DEFAULT,e=arguments[0];break;case 2:i=arguments[0],e=arguments[1];break;default:throw new YAMLException("Wrong number of arguments for Schema.create function")}if(i=common.toArray(i),e=common.toArray(e),!i.every(function(i){return i instanceof Schema}))throw new YAMLException("Specified list of super schemas (or a single Schema object) contains a non-Schema object.");if(!e.every(function(i){return i instanceof Type}))throw new YAMLException("Specified list of YAML types (or a single Type object) contains a non-Type object.");return new Schema({include:i,explicit:e})},module.exports=Schema;
  
  },{"./common":40,"./exception":42,"./type":51}],46:[function(require,module,exports){
  "use strict";var Schema=require("../schema");module.exports=new Schema({include:[require("./json")]});
  
  },{"../schema":45,"./json":50}],47:[function(require,module,exports){
  "use strict";var Schema=require("../schema");module.exports=Schema.DEFAULT=new Schema({include:[require("./default_safe")],explicit:[require("../type/js/undefined"),require("../type/js/regexp"),require("../type/js/function")]});
  
  },{"../schema":45,"../type/js/function":56,"../type/js/regexp":57,"../type/js/undefined":58,"./default_safe":48}],48:[function(require,module,exports){
  "use strict";var Schema=require("../schema");module.exports=new Schema({include:[require("./core")],implicit:[require("../type/timestamp"),require("../type/merge")],explicit:[require("../type/binary"),require("../type/omap"),require("../type/pairs"),require("../type/set")]});
  
  },{"../schema":45,"../type/binary":52,"../type/merge":60,"../type/omap":62,"../type/pairs":63,"../type/set":65,"../type/timestamp":67,"./core":46}],49:[function(require,module,exports){
  "use strict";var Schema=require("../schema");module.exports=new Schema({explicit:[require("../type/str"),require("../type/seq"),require("../type/map")]});
  
  },{"../schema":45,"../type/map":59,"../type/seq":64,"../type/str":66}],50:[function(require,module,exports){
  "use strict";var Schema=require("../schema");module.exports=new Schema({include:[require("./failsafe")],implicit:[require("../type/null"),require("../type/bool"),require("../type/int"),require("../type/float")]});
  
  },{"../schema":45,"../type/bool":53,"../type/float":54,"../type/int":55,"../type/null":61,"./failsafe":49}],51:[function(require,module,exports){
  "use strict";function compileStyleAliases(e){var t={};return null!==e&&Object.keys(e).forEach(function(n){e[n].forEach(function(e){t[String(e)]=n})}),t}function Type(e,t){if(t=t||{},Object.keys(t).forEach(function(t){if(-1===TYPE_CONSTRUCTOR_OPTIONS.indexOf(t))throw new YAMLException('Unknown option "'+t+'" is met in definition of "'+e+'" YAML type.')}),this.tag=e,this.kind=t.kind||null,this.resolve=t.resolve||function(){return!0},this.construct=t.construct||function(e){return e},this.instanceOf=t.instanceOf||null,this.predicate=t.predicate||null,this.represent=t.represent||null,this.defaultStyle=t.defaultStyle||null,this.styleAliases=compileStyleAliases(t.styleAliases||null),-1===YAML_NODE_KINDS.indexOf(this.kind))throw new YAMLException('Unknown kind "'+this.kind+'" is specified for "'+e+'" YAML type.')}var YAMLException=require("./exception"),TYPE_CONSTRUCTOR_OPTIONS=["kind","resolve","construct","instanceOf","predicate","represent","defaultStyle","styleAliases"],YAML_NODE_KINDS=["scalar","sequence","mapping"];module.exports=Type;
  
  },{"./exception":42}],52:[function(require,module,exports){
  "use strict";function resolveYamlBinary(r){if(null===r)return!1;var e,n,u=0,t=r.length,a=BASE64_MAP;for(n=0;t>n;n++)if(e=a.indexOf(r.charAt(n)),!(e>64)){if(0>e)return!1;u+=6}return u%8===0}function constructYamlBinary(r){var e,n,u=r.replace(/[\r\n=]/g,""),t=u.length,a=BASE64_MAP,f=0,i=[];for(e=0;t>e;e++)e%4===0&&e&&(i.push(f>>16&255),i.push(f>>8&255),i.push(255&f)),f=f<<6|a.indexOf(u.charAt(e));return n=t%4*6,0===n?(i.push(f>>16&255),i.push(f>>8&255),i.push(255&f)):18===n?(i.push(f>>10&255),i.push(f>>2&255)):12===n&&i.push(f>>4&255),NodeBuffer?new NodeBuffer(i):i}function representYamlBinary(r){var e,n,u="",t=0,a=r.length,f=BASE64_MAP;for(e=0;a>e;e++)e%3===0&&e&&(u+=f[t>>18&63],u+=f[t>>12&63],u+=f[t>>6&63],u+=f[63&t]),t=(t<<8)+r[e];return n=a%3,0===n?(u+=f[t>>18&63],u+=f[t>>12&63],u+=f[t>>6&63],u+=f[63&t]):2===n?(u+=f[t>>10&63],u+=f[t>>4&63],u+=f[t<<2&63],u+=f[64]):1===n&&(u+=f[t>>2&63],u+=f[t<<4&63],u+=f[64],u+=f[64]),u}function isBinary(r){return NodeBuffer&&NodeBuffer.isBuffer(r)}var NodeBuffer;try{var _require=require;NodeBuffer=_require("buffer").Buffer}catch(__){}var Type=require("../type"),BASE64_MAP="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=\n\r";module.exports=new Type("tag:yaml.org,2002:binary",{kind:"scalar",resolve:resolveYamlBinary,construct:constructYamlBinary,predicate:isBinary,represent:representYamlBinary});
  
  },{"../type":51}],53:[function(require,module,exports){
  "use strict";function resolveYamlBoolean(e){if(null===e)return!1;var r=e.length;return 4===r&&("true"===e||"True"===e||"TRUE"===e)||5===r&&("false"===e||"False"===e||"FALSE"===e)}function constructYamlBoolean(e){return"true"===e||"True"===e||"TRUE"===e}function isBoolean(e){return"[object Boolean]"===Object.prototype.toString.call(e)}var Type=require("../type");module.exports=new Type("tag:yaml.org,2002:bool",{kind:"scalar",resolve:resolveYamlBoolean,construct:constructYamlBoolean,predicate:isBoolean,represent:{lowercase:function(e){return e?"true":"false"},uppercase:function(e){return e?"TRUE":"FALSE"},camelcase:function(e){return e?"True":"False"}},defaultStyle:"lowercase"});
  
  },{"../type":51}],54:[function(require,module,exports){
  "use strict";function resolveYamlFloat(e){return null===e?!1:!!YAML_FLOAT_PATTERN.test(e)}function constructYamlFloat(e){var r,t,a,n;return r=e.replace(/_/g,"").toLowerCase(),t="-"===r[0]?-1:1,n=[],"+-".indexOf(r[0])>=0&&(r=r.slice(1)),".inf"===r?1===t?Number.POSITIVE_INFINITY:Number.NEGATIVE_INFINITY:".nan"===r?NaN:r.indexOf(":")>=0?(r.split(":").forEach(function(e){n.unshift(parseFloat(e,10))}),r=0,a=1,n.forEach(function(e){r+=e*a,a*=60}),t*r):t*parseFloat(r,10)}function representYamlFloat(e,r){var t;if(isNaN(e))switch(r){case"lowercase":return".nan";case"uppercase":return".NAN";case"camelcase":return".NaN"}else if(Number.POSITIVE_INFINITY===e)switch(r){case"lowercase":return".inf";case"uppercase":return".INF";case"camelcase":return".Inf"}else if(Number.NEGATIVE_INFINITY===e)switch(r){case"lowercase":return"-.inf";case"uppercase":return"-.INF";case"camelcase":return"-.Inf"}else if(common.isNegativeZero(e))return"-0.0";return t=e.toString(10),SCIENTIFIC_WITHOUT_DOT.test(t)?t.replace("e",".e"):t}function isFloat(e){return"[object Number]"===Object.prototype.toString.call(e)&&(e%1!==0||common.isNegativeZero(e))}var common=require("../common"),Type=require("../type"),YAML_FLOAT_PATTERN=new RegExp("^(?:[-+]?(?:[0-9][0-9_]*)\\.[0-9_]*(?:[eE][-+][0-9]+)?|\\.[0-9_]+(?:[eE][-+][0-9]+)?|[-+]?[0-9][0-9_]*(?::[0-5]?[0-9])+\\.[0-9_]*|[-+]?\\.(?:inf|Inf|INF)|\\.(?:nan|NaN|NAN))$"),SCIENTIFIC_WITHOUT_DOT=/^[-+]?[0-9]+e/;module.exports=new Type("tag:yaml.org,2002:float",{kind:"scalar",resolve:resolveYamlFloat,construct:constructYamlFloat,predicate:isFloat,represent:representYamlFloat,defaultStyle:"lowercase"});
  
  },{"../common":40,"../type":51}],55:[function(require,module,exports){
  "use strict";function isHexCode(e){return e>=48&&57>=e||e>=65&&70>=e||e>=97&&102>=e}function isOctCode(e){return e>=48&&55>=e}function isDecCode(e){return e>=48&&57>=e}function resolveYamlInteger(e){if(null===e)return!1;var r,t=e.length,n=0,i=!1;if(!t)return!1;if(r=e[n],"-"!==r&&"+"!==r||(r=e[++n]),"0"===r){if(n+1===t)return!0;if(r=e[++n],"b"===r){for(n++;t>n;n++)if(r=e[n],"_"!==r){if("0"!==r&&"1"!==r)return!1;i=!0}return i}if("x"===r){for(n++;t>n;n++)if(r=e[n],"_"!==r){if(!isHexCode(e.charCodeAt(n)))return!1;i=!0}return i}for(;t>n;n++)if(r=e[n],"_"!==r){if(!isOctCode(e.charCodeAt(n)))return!1;i=!0}return i}for(;t>n;n++)if(r=e[n],"_"!==r){if(":"===r)break;if(!isDecCode(e.charCodeAt(n)))return!1;i=!0}return i?":"!==r?!0:/^(:[0-5]?[0-9])+$/.test(e.slice(n)):!1}function constructYamlInteger(e){var r,t,n=e,i=1,o=[];return-1!==n.indexOf("_")&&(n=n.replace(/_/g,"")),r=n[0],"-"!==r&&"+"!==r||("-"===r&&(i=-1),n=n.slice(1),r=n[0]),"0"===n?0:"0"===r?"b"===n[1]?i*parseInt(n.slice(2),2):"x"===n[1]?i*parseInt(n,16):i*parseInt(n,8):-1!==n.indexOf(":")?(n.split(":").forEach(function(e){o.unshift(parseInt(e,10))}),n=0,t=1,o.forEach(function(e){n+=e*t,t*=60}),i*n):i*parseInt(n,10)}function isInteger(e){return"[object Number]"===Object.prototype.toString.call(e)&&e%1===0&&!common.isNegativeZero(e)}var common=require("../common"),Type=require("../type");module.exports=new Type("tag:yaml.org,2002:int",{kind:"scalar",resolve:resolveYamlInteger,construct:constructYamlInteger,predicate:isInteger,represent:{binary:function(e){return"0b"+e.toString(2)},octal:function(e){return"0"+e.toString(8)},decimal:function(e){return e.toString(10)},hexadecimal:function(e){return"0x"+e.toString(16).toUpperCase()}},defaultStyle:"decimal",styleAliases:{binary:[2,"bin"],octal:[8,"oct"],decimal:[10,"dec"],hexadecimal:[16,"hex"]}});
  
  },{"../common":40,"../type":51}],56:[function(require,module,exports){
  "use strict";function resolveJavascriptFunction(e){if(null===e)return!1;try{var r="("+e+")",n=esprima.parse(r,{range:!0});return"Program"===n.type&&1===n.body.length&&"ExpressionStatement"===n.body[0].type&&"FunctionExpression"===n.body[0].expression.type}catch(t){return!1}}function constructJavascriptFunction(e){var r,n="("+e+")",t=esprima.parse(n,{range:!0}),o=[];if("Program"!==t.type||1!==t.body.length||"ExpressionStatement"!==t.body[0].type||"FunctionExpression"!==t.body[0].expression.type)throw new Error("Failed to resolve function");return t.body[0].expression.params.forEach(function(e){o.push(e.name)}),r=t.body[0].expression.body.range,new Function(o,n.slice(r[0]+1,r[1]-1))}function representJavascriptFunction(e){return e.toString()}function isFunction(e){return"[object Function]"===Object.prototype.toString.call(e)}var esprima;try{var _require=require;esprima=_require("esprima")}catch(_){"undefined"!=typeof window&&(esprima=window.esprima)}var Type=require("../../type");module.exports=new Type("tag:yaml.org,2002:js/function",{kind:"scalar",resolve:resolveJavascriptFunction,construct:constructJavascriptFunction,predicate:isFunction,represent:representJavascriptFunction});
  
  },{"../../type":51}],57:[function(require,module,exports){
  "use strict";function resolveJavascriptRegExp(e){if(null===e)return!1;if(0===e.length)return!1;var r=e,t=/\/([gim]*)$/.exec(e),n="";if("/"===r[0]){if(t&&(n=t[1]),n.length>3)return!1;if("/"!==r[r.length-n.length-1])return!1}return!0}function constructJavascriptRegExp(e){var r=e,t=/\/([gim]*)$/.exec(e),n="";return"/"===r[0]&&(t&&(n=t[1]),r=r.slice(1,r.length-n.length-1)),new RegExp(r,n)}function representJavascriptRegExp(e){var r="/"+e.source+"/";return e.global&&(r+="g"),e.multiline&&(r+="m"),e.ignoreCase&&(r+="i"),r}function isRegExp(e){return"[object RegExp]"===Object.prototype.toString.call(e)}var Type=require("../../type");module.exports=new Type("tag:yaml.org,2002:js/regexp",{kind:"scalar",resolve:resolveJavascriptRegExp,construct:constructJavascriptRegExp,predicate:isRegExp,represent:representJavascriptRegExp});
  
  },{"../../type":51}],58:[function(require,module,exports){
  "use strict";function resolveJavascriptUndefined(){return!0}function constructJavascriptUndefined(){}function representJavascriptUndefined(){return""}function isUndefined(e){return"undefined"==typeof e}var Type=require("../../type");module.exports=new Type("tag:yaml.org,2002:js/undefined",{kind:"scalar",resolve:resolveJavascriptUndefined,construct:constructJavascriptUndefined,predicate:isUndefined,represent:representJavascriptUndefined});
  
  },{"../../type":51}],59:[function(require,module,exports){
  "use strict";var Type=require("../type");module.exports=new Type("tag:yaml.org,2002:map",{kind:"mapping",construct:function(e){return null!==e?e:{}}});
  
  },{"../type":51}],60:[function(require,module,exports){
  "use strict";function resolveYamlMerge(e){return"<<"===e||null===e}var Type=require("../type");module.exports=new Type("tag:yaml.org,2002:merge",{kind:"scalar",resolve:resolveYamlMerge});
  
  },{"../type":51}],61:[function(require,module,exports){
  "use strict";function resolveYamlNull(l){if(null===l)return!0;var e=l.length;return 1===e&&"~"===l||4===e&&("null"===l||"Null"===l||"NULL"===l)}function constructYamlNull(){return null}function isNull(l){return null===l}var Type=require("../type");module.exports=new Type("tag:yaml.org,2002:null",{kind:"scalar",resolve:resolveYamlNull,construct:constructYamlNull,predicate:isNull,represent:{canonical:function(){return"~"},lowercase:function(){return"null"},uppercase:function(){return"NULL"},camelcase:function(){return"Null"}},defaultStyle:"lowercase"});
  
  },{"../type":51}],62:[function(require,module,exports){
  "use strict";function resolveYamlOmap(r){if(null===r)return!0;var t,e,n,o,u,a=[],l=r;for(t=0,e=l.length;e>t;t+=1){if(n=l[t],u=!1,"[object Object]"!==_toString.call(n))return!1;for(o in n)if(_hasOwnProperty.call(n,o)){if(u)return!1;u=!0}if(!u)return!1;if(-1!==a.indexOf(o))return!1;a.push(o)}return!0}function constructYamlOmap(r){return null!==r?r:[]}var Type=require("../type"),_hasOwnProperty=Object.prototype.hasOwnProperty,_toString=Object.prototype.toString;module.exports=new Type("tag:yaml.org,2002:omap",{kind:"sequence",resolve:resolveYamlOmap,construct:constructYamlOmap});
  
  },{"../type":51}],63:[function(require,module,exports){
  "use strict";function resolveYamlPairs(r){if(null===r)return!0;var e,t,n,l,o,a=r;for(o=new Array(a.length),e=0,t=a.length;t>e;e+=1){if(n=a[e],"[object Object]"!==_toString.call(n))return!1;if(l=Object.keys(n),1!==l.length)return!1;o[e]=[l[0],n[l[0]]]}return!0}function constructYamlPairs(r){if(null===r)return[];var e,t,n,l,o,a=r;for(o=new Array(a.length),e=0,t=a.length;t>e;e+=1)n=a[e],l=Object.keys(n),o[e]=[l[0],n[l[0]]];return o}var Type=require("../type"),_toString=Object.prototype.toString;module.exports=new Type("tag:yaml.org,2002:pairs",{kind:"sequence",resolve:resolveYamlPairs,construct:constructYamlPairs});
  
  },{"../type":51}],64:[function(require,module,exports){
  "use strict";var Type=require("../type");module.exports=new Type("tag:yaml.org,2002:seq",{kind:"sequence",construct:function(e){return null!==e?e:[]}});
  
  },{"../type":51}],65:[function(require,module,exports){
  "use strict";function resolveYamlSet(e){if(null===e)return!0;var r,t=e;for(r in t)if(_hasOwnProperty.call(t,r)&&null!==t[r])return!1;return!0}function constructYamlSet(e){return null!==e?e:{}}var Type=require("../type"),_hasOwnProperty=Object.prototype.hasOwnProperty;module.exports=new Type("tag:yaml.org,2002:set",{kind:"mapping",resolve:resolveYamlSet,construct:constructYamlSet});
  
  },{"../type":51}],66:[function(require,module,exports){
  "use strict";var Type=require("../type");module.exports=new Type("tag:yaml.org,2002:str",{kind:"scalar",construct:function(r){return null!==r?r:""}});
  
  },{"../type":51}],67:[function(require,module,exports){
  "use strict";function resolveYamlTimestamp(e){return null===e?!1:null!==YAML_DATE_REGEXP.exec(e)?!0:null!==YAML_TIMESTAMP_REGEXP.exec(e)}function constructYamlTimestamp(e){var t,r,n,l,a,m,s,T,i,E,u=0,o=null;if(t=YAML_DATE_REGEXP.exec(e),null===t&&(t=YAML_TIMESTAMP_REGEXP.exec(e)),null===t)throw new Error("Date resolve error");if(r=+t[1],n=+t[2]-1,l=+t[3],!t[4])return new Date(Date.UTC(r,n,l));if(a=+t[4],m=+t[5],s=+t[6],t[7]){for(u=t[7].slice(0,3);u.length<3;)u+="0";u=+u}return t[9]&&(T=+t[10],i=+(t[11]||0),o=6e4*(60*T+i),"-"===t[9]&&(o=-o)),E=new Date(Date.UTC(r,n,l,a,m,s,u)),o&&E.setTime(E.getTime()-o),E}function representYamlTimestamp(e){return e.toISOString()}var Type=require("../type"),YAML_DATE_REGEXP=new RegExp("^([0-9][0-9][0-9][0-9])-([0-9][0-9])-([0-9][0-9])$"),YAML_TIMESTAMP_REGEXP=new RegExp("^([0-9][0-9][0-9][0-9])-([0-9][0-9]?)-([0-9][0-9]?)(?:[Tt]|[ \\t]+)([0-9][0-9]?):([0-9][0-9]):([0-9][0-9])(?:\\.([0-9]*))?(?:[ \\t]*(Z|([-+])([0-9][0-9]?)(?::([0-9][0-9]))?))?$");module.exports=new Type("tag:yaml.org,2002:timestamp",{kind:"scalar",resolve:resolveYamlTimestamp,construct:constructYamlTimestamp,instanceOf:Date,represent:representYamlTimestamp});
  
  },{"../type":51}],68:[function(require,module,exports){
  function parse(e){if(e=""+e,!(e.length>1e4)){var a=/^((?:\d+)?\.?\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|years?|yrs?|y)?$/i.exec(e);if(a){var r=parseFloat(a[1]),c=(a[2]||"ms").toLowerCase();switch(c){case"years":case"year":case"yrs":case"yr":case"y":return r*y;case"days":case"day":case"d":return r*d;case"hours":case"hour":case"hrs":case"hr":case"h":return r*h;case"minutes":case"minute":case"mins":case"min":case"m":return r*m;case"seconds":case"second":case"secs":case"sec":case"s":return r*s;case"milliseconds":case"millisecond":case"msecs":case"msec":case"ms":return r}}}}function short(e){return e>=d?Math.round(e/d)+"d":e>=h?Math.round(e/h)+"h":e>=m?Math.round(e/m)+"m":e>=s?Math.round(e/s)+"s":e+"ms"}function long(e){return plural(e,d,"day")||plural(e,h,"hour")||plural(e,m,"minute")||plural(e,s,"second")||e+" ms"}function plural(s,e,a){return e>s?void 0:1.5*e>s?Math.floor(s/e)+" "+a:Math.ceil(s/e)+" "+a+"s"}var s=1e3,m=60*s,h=60*m,d=24*h,y=365.25*d;module.exports=function(s,e){return e=e||{},"string"==typeof s?parse(s):e["long"]?long(s):short(s)};
  
  },{}],69:[function(require,module,exports){
  /**!
   * Ono v2.2.1
   *
   * @link https://github.com/BigstickCarpet/ono
   * @license MIT
   */
  "use strict";function create(e){return function(r,t,o,n){var c,a=module.exports.formatter;"string"==typeof r?(c=a.apply(null,arguments),r=t=void 0):c="string"==typeof t?a.apply(null,slice.call(arguments,1)):a.apply(null,slice.call(arguments,2)),r instanceof Error||(t=r,r=void 0),r&&(c+=(c?" \n":"")+r.message);var i=new e(c);return extendError(i,r),extendToJSON(i),extend(i,t),i}}function extendError(e,r){r&&(extendStack(e,r),extend(e,r,!0))}function extendToJSON(e){e.toJSON=errorToJSON,e.inspect=errorToString}function extend(e,r,t){if(r&&"object"==typeof r)for(var o=Object.keys(r),n=0;n<o.length;n++){var c=o[n];if(!(t&&vendorSpecificErrorProperties.indexOf(c)>=0))try{e[c]=r[c]}catch(a){}}}function errorToJSON(){var e={},r=Object.keys(this);r=r.concat(vendorSpecificErrorProperties);for(var t=0;t<r.length;t++){var o=r[t],n=this[o],c=typeof n;"undefined"!==c&&"function"!==c&&(e[o]=n)}return e}function errorToString(){return JSON.stringify(this,null,2).replace(/\\n/g,"\n")}function extendStack(e,r){if(hasLazyStack(r))extendStackProperty(e,r);else{var t=r.stack;t&&(e.stack+=" \n\n"+r.stack)}}function hasLazyStack(e){if(!supportsLazyStack)return!1;var r=Object.getOwnPropertyDescriptor(e,"stack");return r?"function"==typeof r.get:!1}function extendStackProperty(e,r){var t=Object.getOwnPropertyDescriptor(r,"stack");if(t){var o=Object.getOwnPropertyDescriptor(e,"stack");Object.defineProperty(e,"stack",{get:function(){return o.get.apply(e)+" \n\n"+r.stack},enumerable:!1,configurable:!0})}}var util=require("util"),slice=Array.prototype.slice,vendorSpecificErrorProperties=["name","message","description","number","fileName","lineNumber","columnNumber","sourceURL","line","column","stack"];module.exports=create(Error),module.exports.error=create(Error),module.exports.eval=create(EvalError),module.exports.range=create(RangeError),module.exports.reference=create(ReferenceError),module.exports.syntax=create(SyntaxError),module.exports.type=create(TypeError),module.exports.uri=create(URIError),module.exports.formatter=util.format;var supportsLazyStack=function(){return!(!Object.getOwnPropertyDescriptor||!Object.defineProperty||"undefined"!=typeof navigator&&/Android/.test(navigator.userAgent))}();
  
  },{"util":97}],70:[function(require,module,exports){
  (function (process){
  "use strict";function nextTick(e){for(var s=new Array(arguments.length-1),n=0;n<s.length;)s[n++]=arguments[n];process.nextTick(function(){e.apply(null,s)})}!process.version||0===process.version.indexOf("v0.")||0===process.version.indexOf("v1.")&&0!==process.version.indexOf("v1.8.")?module.exports=nextTick:module.exports=process.nextTick;
  
  }).call(this,require('_process'))
  
  },{"_process":71}],71:[function(require,module,exports){
  function cleanUpNextTick(){draining=!1,currentQueue.length?queue=currentQueue.concat(queue):queueIndex=-1,queue.length&&drainQueue()}function drainQueue(){if(!draining){var e=setTimeout(cleanUpNextTick);draining=!0;for(var n=queue.length;n;){for(currentQueue=queue,queue=[];++queueIndex<n;)currentQueue&&currentQueue[queueIndex].run();queueIndex=-1,n=queue.length}currentQueue=null,draining=!1,clearTimeout(e)}}function Item(e,n){this.fun=e,this.array=n}function noop(){}var process=module.exports={},queue=[],draining=!1,currentQueue,queueIndex=-1;process.nextTick=function(e){var n=new Array(arguments.length-1);if(arguments.length>1)for(var r=1;r<arguments.length;r++)n[r-1]=arguments[r];queue.push(new Item(e,n)),1!==queue.length||draining||setTimeout(drainQueue,0)},Item.prototype.run=function(){this.fun.apply(null,this.array)},process.title="browser",process.browser=!0,process.env={},process.argv=[],process.version="",process.versions={},process.on=noop,process.addListener=noop,process.once=noop,process.off=noop,process.removeListener=noop,process.removeAllListeners=noop,process.emit=noop,process.binding=function(e){throw new Error("process.binding is not supported")},process.cwd=function(){return"/"},process.chdir=function(e){throw new Error("process.chdir is not supported")},process.umask=function(){return 0};
  
  },{}],72:[function(require,module,exports){
  (function (global){
  /*! https://mths.be/punycode v1.4.1 by @mathias */
  !function(e){function o(e){throw new RangeError(T[e])}function n(e,o){for(var n=e.length,r=[];n--;)r[n]=o(e[n]);return r}function r(e,o){var r=e.split("@"),t="";r.length>1&&(t=r[0]+"@",e=r[1]),e=e.replace(S,".");var u=e.split("."),i=n(u,o).join(".");return t+i}function t(e){for(var o,n,r=[],t=0,u=e.length;u>t;)o=e.charCodeAt(t++),o>=55296&&56319>=o&&u>t?(n=e.charCodeAt(t++),56320==(64512&n)?r.push(((1023&o)<<10)+(1023&n)+65536):(r.push(o),t--)):r.push(o);return r}function u(e){return n(e,function(e){var o="";return e>65535&&(e-=65536,o+=P(e>>>10&1023|55296),e=56320|1023&e),o+=P(e)}).join("")}function i(e){return 10>e-48?e-22:26>e-65?e-65:26>e-97?e-97:b}function f(e,o){return e+22+75*(26>e)-((0!=o)<<5)}function c(e,o,n){var r=0;for(e=n?M(e/j):e>>1,e+=M(e/o);e>L*C>>1;r+=b)e=M(e/L);return M(r+(L+1)*e/(e+m))}function l(e){var n,r,t,f,l,s,d,a,p,h,v=[],g=e.length,w=0,m=I,j=A;for(r=e.lastIndexOf(E),0>r&&(r=0),t=0;r>t;++t)e.charCodeAt(t)>=128&&o("not-basic"),v.push(e.charCodeAt(t));for(f=r>0?r+1:0;g>f;){for(l=w,s=1,d=b;f>=g&&o("invalid-input"),a=i(e.charCodeAt(f++)),(a>=b||a>M((x-w)/s))&&o("overflow"),w+=a*s,p=j>=d?y:d>=j+C?C:d-j,!(p>a);d+=b)h=b-p,s>M(x/h)&&o("overflow"),s*=h;n=v.length+1,j=c(w-l,n,0==l),M(w/n)>x-m&&o("overflow"),m+=M(w/n),w%=n,v.splice(w++,0,m)}return u(v)}function s(e){var n,r,u,i,l,s,d,a,p,h,v,g,w,m,j,F=[];for(e=t(e),g=e.length,n=I,r=0,l=A,s=0;g>s;++s)v=e[s],128>v&&F.push(P(v));for(u=i=F.length,i&&F.push(E);g>u;){for(d=x,s=0;g>s;++s)v=e[s],v>=n&&d>v&&(d=v);for(w=u+1,d-n>M((x-r)/w)&&o("overflow"),r+=(d-n)*w,n=d,s=0;g>s;++s)if(v=e[s],n>v&&++r>x&&o("overflow"),v==n){for(a=r,p=b;h=l>=p?y:p>=l+C?C:p-l,!(h>a);p+=b)j=a-h,m=b-h,F.push(P(f(h+j%m,0))),a=M(j/m);F.push(P(f(a,0))),l=c(r,w,u==i),r=0,++u}++r,++n}return F.join("")}function d(e){return r(e,function(e){return F.test(e)?l(e.slice(4).toLowerCase()):e})}function a(e){return r(e,function(e){return O.test(e)?"xn--"+s(e):e})}var p="object"==typeof exports&&exports&&!exports.nodeType&&exports,h="object"==typeof module&&module&&!module.nodeType&&module,v="object"==typeof global&&global;v.global!==v&&v.window!==v&&v.self!==v||(e=v);var g,w,x=2147483647,b=36,y=1,C=26,m=38,j=700,A=72,I=128,E="-",F=/^xn--/,O=/[^\x20-\x7E]/,S=/[\x2E\u3002\uFF0E\uFF61]/g,T={overflow:"Overflow: input needs wider integers to process","not-basic":"Illegal input >= 0x80 (not a basic code point)","invalid-input":"Invalid input"},L=b-y,M=Math.floor,P=String.fromCharCode;if(g={version:"1.4.1",ucs2:{decode:t,encode:u},decode:l,encode:s,toASCII:a,toUnicode:d},"function"==typeof define&&"object"==typeof define.amd&&define.amd)define("punycode",function(){return g});else if(p&&h)if(module.exports==p)h.exports=g;else for(w in g)g.hasOwnProperty(w)&&(p[w]=g[w]);else e.punycode=g}(this);
  
  }).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{}],73:[function(require,module,exports){
  "use strict";function hasOwnProperty(r,e){return Object.prototype.hasOwnProperty.call(r,e)}module.exports=function(r,e,t,n){e=e||"&",t=t||"=";var o={};if("string"!=typeof r||0===r.length)return o;var a=/\+/g;r=r.split(e);var s=1e3;n&&"number"==typeof n.maxKeys&&(s=n.maxKeys);var p=r.length;s>0&&p>s&&(p=s);for(var y=0;p>y;++y){var u,c,i,l,f=r[y].replace(a,"%20"),v=f.indexOf(t);v>=0?(u=f.substr(0,v),c=f.substr(v+1)):(u=f,c=""),i=decodeURIComponent(u),l=decodeURIComponent(c),hasOwnProperty(o,i)?isArray(o[i])?o[i].push(l):o[i]=[o[i],l]:o[i]=l}return o};var isArray=Array.isArray||function(r){return"[object Array]"===Object.prototype.toString.call(r)};
  
  },{}],74:[function(require,module,exports){
  "use strict";function map(r,e){if(r.map)return r.map(e);for(var t=[],n=0;n<r.length;n++)t.push(e(r[n],n));return t}var stringifyPrimitive=function(r){switch(typeof r){case"string":return r;case"boolean":return r?"true":"false";case"number":return isFinite(r)?r:"";default:return""}};module.exports=function(r,e,t,n){return e=e||"&",t=t||"=",null===r&&(r=void 0),"object"==typeof r?map(objectKeys(r),function(n){var i=encodeURIComponent(stringifyPrimitive(n))+t;return isArray(r[n])?map(r[n],function(r){return i+encodeURIComponent(stringifyPrimitive(r))}).join(e):i+encodeURIComponent(stringifyPrimitive(r[n]))}).join(e):n?encodeURIComponent(stringifyPrimitive(n))+t+encodeURIComponent(stringifyPrimitive(r)):""};var isArray=Array.isArray||function(r){return"[object Array]"===Object.prototype.toString.call(r)},objectKeys=Object.keys||function(r){var e=[];for(var t in r)Object.prototype.hasOwnProperty.call(r,t)&&e.push(t);return e};
  
  },{}],75:[function(require,module,exports){
  "use strict";exports.decode=exports.parse=require("./decode"),exports.encode=exports.stringify=require("./encode");
  
  },{"./decode":73,"./encode":74}],76:[function(require,module,exports){
  module.exports=require("./lib/_stream_duplex.js");
  
  },{"./lib/_stream_duplex.js":77}],77:[function(require,module,exports){
  "use strict";function Duplex(e){return this instanceof Duplex?(Readable.call(this,e),Writable.call(this,e),e&&e.readable===!1&&(this.readable=!1),e&&e.writable===!1&&(this.writable=!1),this.allowHalfOpen=!0,e&&e.allowHalfOpen===!1&&(this.allowHalfOpen=!1),void this.once("end",onend)):new Duplex(e)}function onend(){this.allowHalfOpen||this._writableState.ended||processNextTick(onEndNT,this)}function onEndNT(e){e.end()}function forEach(e,t){for(var r=0,i=e.length;i>r;r++)t(e[r],r)}var objectKeys=Object.keys||function(e){var t=[];for(var r in e)t.push(r);return t};module.exports=Duplex;var processNextTick=require("process-nextick-args"),util=require("core-util-is");util.inherits=require("inherits");var Readable=require("./_stream_readable"),Writable=require("./_stream_writable");util.inherits(Duplex,Readable);for(var keys=objectKeys(Writable.prototype),v=0;v<keys.length;v++){var method=keys[v];Duplex.prototype[method]||(Duplex.prototype[method]=Writable.prototype[method])}
  
  },{"./_stream_readable":79,"./_stream_writable":81,"core-util-is":28,"inherits":35,"process-nextick-args":70}],78:[function(require,module,exports){
  "use strict";function PassThrough(r){return this instanceof PassThrough?void Transform.call(this,r):new PassThrough(r)}module.exports=PassThrough;var Transform=require("./_stream_transform"),util=require("core-util-is");util.inherits=require("inherits"),util.inherits(PassThrough,Transform),PassThrough.prototype._transform=function(r,s,i){i(null,r)};
  
  },{"./_stream_transform":80,"core-util-is":28,"inherits":35}],79:[function(require,module,exports){
  (function (process){
  "use strict";function ReadableState(e,t){Duplex=Duplex||require("./_stream_duplex"),e=e||{},this.objectMode=!!e.objectMode,t instanceof Duplex&&(this.objectMode=this.objectMode||!!e.readableObjectMode);var r=e.highWaterMark,n=this.objectMode?16:16384;this.highWaterMark=r||0===r?r:n,this.highWaterMark=~~this.highWaterMark,this.buffer=[],this.length=0,this.pipes=null,this.pipesCount=0,this.flowing=null,this.ended=!1,this.endEmitted=!1,this.reading=!1,this.sync=!0,this.needReadable=!1,this.emittedReadable=!1,this.readableListening=!1,this.resumeScheduled=!1,this.defaultEncoding=e.defaultEncoding||"utf8",this.ranOut=!1,this.awaitDrain=0,this.readingMore=!1,this.decoder=null,this.encoding=null,e.encoding&&(StringDecoder||(StringDecoder=require("string_decoder/").StringDecoder),this.decoder=new StringDecoder(e.encoding),this.encoding=e.encoding)}function Readable(e){return Duplex=Duplex||require("./_stream_duplex"),this instanceof Readable?(this._readableState=new ReadableState(e,this),this.readable=!0,e&&"function"==typeof e.read&&(this._read=e.read),void Stream.call(this)):new Readable(e)}function readableAddChunk(e,t,r,n,a){var i=chunkInvalid(t,r);if(i)e.emit("error",i);else if(null===r)t.reading=!1,onEofChunk(e,t);else if(t.objectMode||r&&r.length>0)if(t.ended&&!a){var d=new Error("stream.push() after EOF");e.emit("error",d)}else if(t.endEmitted&&a){var d=new Error("stream.unshift() after end event");e.emit("error",d)}else{var o;!t.decoder||a||n||(r=t.decoder.write(r),o=!t.objectMode&&0===r.length),a||(t.reading=!1),o||(t.flowing&&0===t.length&&!t.sync?(e.emit("data",r),e.read(0)):(t.length+=t.objectMode?1:r.length,a?t.buffer.unshift(r):t.buffer.push(r),t.needReadable&&emitReadable(e))),maybeReadMore(e,t)}else a||(t.reading=!1);return needMoreData(t)}function needMoreData(e){return!e.ended&&(e.needReadable||e.length<e.highWaterMark||0===e.length)}function computeNewHighWaterMark(e){return e>=MAX_HWM?e=MAX_HWM:(e--,e|=e>>>1,e|=e>>>2,e|=e>>>4,e|=e>>>8,e|=e>>>16,e++),e}function howMuchToRead(e,t){return 0===t.length&&t.ended?0:t.objectMode?0===e?0:1:null===e||isNaN(e)?t.flowing&&t.buffer.length?t.buffer[0].length:t.length:0>=e?0:(e>t.highWaterMark&&(t.highWaterMark=computeNewHighWaterMark(e)),e>t.length?t.ended?t.length:(t.needReadable=!0,0):e)}function chunkInvalid(e,t){var r=null;return Buffer.isBuffer(t)||"string"==typeof t||null===t||void 0===t||e.objectMode||(r=new TypeError("Invalid non-string/buffer chunk")),r}function onEofChunk(e,t){if(!t.ended){if(t.decoder){var r=t.decoder.end();r&&r.length&&(t.buffer.push(r),t.length+=t.objectMode?1:r.length)}t.ended=!0,emitReadable(e)}}function emitReadable(e){var t=e._readableState;t.needReadable=!1,t.emittedReadable||(debug("emitReadable",t.flowing),t.emittedReadable=!0,t.sync?processNextTick(emitReadable_,e):emitReadable_(e))}function emitReadable_(e){debug("emit readable"),e.emit("readable"),flow(e)}function maybeReadMore(e,t){t.readingMore||(t.readingMore=!0,processNextTick(maybeReadMore_,e,t))}function maybeReadMore_(e,t){for(var r=t.length;!t.reading&&!t.flowing&&!t.ended&&t.length<t.highWaterMark&&(debug("maybeReadMore read 0"),e.read(0),r!==t.length);)r=t.length;t.readingMore=!1}function pipeOnDrain(e){return function(){var t=e._readableState;debug("pipeOnDrain",t.awaitDrain),t.awaitDrain&&t.awaitDrain--,0===t.awaitDrain&&EElistenerCount(e,"data")&&(t.flowing=!0,flow(e))}}function nReadingNextTick(e){debug("readable nexttick read 0"),e.read(0)}function resume(e,t){t.resumeScheduled||(t.resumeScheduled=!0,processNextTick(resume_,e,t))}function resume_(e,t){t.reading||(debug("resume read 0"),e.read(0)),t.resumeScheduled=!1,e.emit("resume"),flow(e),t.flowing&&!t.reading&&e.read(0)}function flow(e){var t=e._readableState;if(debug("flow",t.flowing),t.flowing)do var r=e.read();while(null!==r&&t.flowing)}function fromList(e,t){var r,n=t.buffer,a=t.length,i=!!t.decoder,d=!!t.objectMode;if(0===n.length)return null;if(0===a)r=null;else if(d)r=n.shift();else if(!e||e>=a)r=i?n.join(""):1===n.length?n[0]:Buffer.concat(n,a),n.length=0;else if(e<n[0].length){var o=n[0];r=o.slice(0,e),n[0]=o.slice(e)}else if(e===n[0].length)r=n.shift();else{r=i?"":new Buffer(e);for(var l=0,u=0,s=n.length;s>u&&e>l;u++){var o=n[0],h=Math.min(e-l,o.length);i?r+=o.slice(0,h):o.copy(r,l,0,h),h<o.length?n[0]=o.slice(h):n.shift(),l+=h}}return r}function endReadable(e){var t=e._readableState;if(t.length>0)throw new Error("endReadable called on non-empty stream");t.endEmitted||(t.ended=!0,processNextTick(endReadableNT,t,e))}function endReadableNT(e,t){e.endEmitted||0!==e.length||(e.endEmitted=!0,t.readable=!1,t.emit("end"))}function forEach(e,t){for(var r=0,n=e.length;n>r;r++)t(e[r],r)}function indexOf(e,t){for(var r=0,n=e.length;n>r;r++)if(e[r]===t)return r;return-1}module.exports=Readable;var processNextTick=require("process-nextick-args"),isArray=require("isarray"),Buffer=require("buffer").Buffer;Readable.ReadableState=ReadableState;var EE=require("events"),EElistenerCount=function(e,t){return e.listeners(t).length},Stream;!function(){try{Stream=require("stream")}catch(e){}finally{Stream||(Stream=require("events").EventEmitter)}}();var Buffer=require("buffer").Buffer,util=require("core-util-is");util.inherits=require("inherits");var debugUtil=require("util"),debug=void 0;debug=debugUtil&&debugUtil.debuglog?debugUtil.debuglog("stream"):function(){};var StringDecoder;util.inherits(Readable,Stream);var Duplex,Duplex;Readable.prototype.push=function(e,t){var r=this._readableState;return r.objectMode||"string"!=typeof e||(t=t||r.defaultEncoding,t!==r.encoding&&(e=new Buffer(e,t),t="")),readableAddChunk(this,r,e,t,!1)},Readable.prototype.unshift=function(e){var t=this._readableState;return readableAddChunk(this,t,e,"",!0)},Readable.prototype.isPaused=function(){return this._readableState.flowing===!1},Readable.prototype.setEncoding=function(e){return StringDecoder||(StringDecoder=require("string_decoder/").StringDecoder),this._readableState.decoder=new StringDecoder(e),this._readableState.encoding=e,this};var MAX_HWM=8388608;Readable.prototype.read=function(e){debug("read",e);var t=this._readableState,r=e;if(("number"!=typeof e||e>0)&&(t.emittedReadable=!1),0===e&&t.needReadable&&(t.length>=t.highWaterMark||t.ended))return debug("read: emitReadable",t.length,t.ended),0===t.length&&t.ended?endReadable(this):emitReadable(this),null;if(e=howMuchToRead(e,t),0===e&&t.ended)return 0===t.length&&endReadable(this),null;var n=t.needReadable;debug("need readable",n),(0===t.length||t.length-e<t.highWaterMark)&&(n=!0,debug("length less than watermark",n)),(t.ended||t.reading)&&(n=!1,debug("reading or ended",n)),n&&(debug("do read"),t.reading=!0,t.sync=!0,0===t.length&&(t.needReadable=!0),this._read(t.highWaterMark),t.sync=!1),n&&!t.reading&&(e=howMuchToRead(r,t));var a;return a=e>0?fromList(e,t):null,null===a&&(t.needReadable=!0,e=0),t.length-=e,0!==t.length||t.ended||(t.needReadable=!0),r!==e&&t.ended&&0===t.length&&endReadable(this),null!==a&&this.emit("data",a),a},Readable.prototype._read=function(e){this.emit("error",new Error("not implemented"))},Readable.prototype.pipe=function(e,t){function r(e){debug("onunpipe"),e===s&&a()}function n(){debug("onend"),e.end()}function a(){debug("cleanup"),e.removeListener("close",o),e.removeListener("finish",l),e.removeListener("drain",c),e.removeListener("error",d),e.removeListener("unpipe",r),s.removeListener("end",n),s.removeListener("end",a),s.removeListener("data",i),b=!0,!h.awaitDrain||e._writableState&&!e._writableState.needDrain||c()}function i(t){debug("ondata");var r=e.write(t);!1===r&&(1!==h.pipesCount||h.pipes[0]!==e||1!==s.listenerCount("data")||b||(debug("false write response, pause",s._readableState.awaitDrain),s._readableState.awaitDrain++),s.pause())}function d(t){debug("onerror",t),u(),e.removeListener("error",d),0===EElistenerCount(e,"error")&&e.emit("error",t)}function o(){e.removeListener("finish",l),u()}function l(){debug("onfinish"),e.removeListener("close",o),u()}function u(){debug("unpipe"),s.unpipe(e)}var s=this,h=this._readableState;switch(h.pipesCount){case 0:h.pipes=e;break;case 1:h.pipes=[h.pipes,e];break;default:h.pipes.push(e)}h.pipesCount+=1,debug("pipe count=%d opts=%j",h.pipesCount,t);var f=(!t||t.end!==!1)&&e!==process.stdout&&e!==process.stderr,p=f?n:a;h.endEmitted?processNextTick(p):s.once("end",p),e.on("unpipe",r);var c=pipeOnDrain(s);e.on("drain",c);var b=!1;return s.on("data",i),e._events&&e._events.error?isArray(e._events.error)?e._events.error.unshift(d):e._events.error=[d,e._events.error]:e.on("error",d),e.once("close",o),e.once("finish",l),e.emit("pipe",s),h.flowing||(debug("pipe resume"),s.resume()),e},Readable.prototype.unpipe=function(e){var t=this._readableState;if(0===t.pipesCount)return this;if(1===t.pipesCount)return e&&e!==t.pipes?this:(e||(e=t.pipes),t.pipes=null,t.pipesCount=0,t.flowing=!1,e&&e.emit("unpipe",this),this);if(!e){var r=t.pipes,n=t.pipesCount;t.pipes=null,t.pipesCount=0,t.flowing=!1;for(var a=0;n>a;a++)r[a].emit("unpipe",this);return this}var i=indexOf(t.pipes,e);return-1===i?this:(t.pipes.splice(i,1),t.pipesCount-=1,1===t.pipesCount&&(t.pipes=t.pipes[0]),e.emit("unpipe",this),this)},Readable.prototype.on=function(e,t){var r=Stream.prototype.on.call(this,e,t);if("data"===e&&!1!==this._readableState.flowing&&this.resume(),"readable"===e&&!this._readableState.endEmitted){var n=this._readableState;n.readableListening||(n.readableListening=!0,n.emittedReadable=!1,n.needReadable=!0,n.reading?n.length&&emitReadable(this,n):processNextTick(nReadingNextTick,this))}return r},Readable.prototype.addListener=Readable.prototype.on,Readable.prototype.resume=function(){var e=this._readableState;return e.flowing||(debug("resume"),e.flowing=!0,resume(this,e)),this},Readable.prototype.pause=function(){return debug("call pause flowing=%j",this._readableState.flowing),!1!==this._readableState.flowing&&(debug("pause"),this._readableState.flowing=!1,this.emit("pause")),this},Readable.prototype.wrap=function(e){var t=this._readableState,r=!1,n=this;e.on("end",function(){if(debug("wrapped end"),t.decoder&&!t.ended){var e=t.decoder.end();e&&e.length&&n.push(e)}n.push(null)}),e.on("data",function(a){if(debug("wrapped data"),t.decoder&&(a=t.decoder.write(a)),(!t.objectMode||null!==a&&void 0!==a)&&(t.objectMode||a&&a.length)){var i=n.push(a);i||(r=!0,e.pause())}});for(var a in e)void 0===this[a]&&"function"==typeof e[a]&&(this[a]=function(t){return function(){return e[t].apply(e,arguments)}}(a));var i=["error","close","destroy","pause","resume"];return forEach(i,function(t){e.on(t,n.emit.bind(n,t))}),n._read=function(t){debug("wrapped _read",t),r&&(r=!1,e.resume())},n},Readable._fromList=fromList;
  
  }).call(this,require('_process'))
  
  },{"./_stream_duplex":77,"_process":71,"buffer":25,"core-util-is":28,"events":32,"inherits":35,"isarray":37,"process-nextick-args":70,"stream":86,"string_decoder/":91,"util":23}],80:[function(require,module,exports){
  "use strict";function TransformState(r){this.afterTransform=function(t,n){return afterTransform(r,t,n)},this.needTransform=!1,this.transforming=!1,this.writecb=null,this.writechunk=null,this.writeencoding=null}function afterTransform(r,t,n){var e=r._transformState;e.transforming=!1;var i=e.writecb;if(!i)return r.emit("error",new Error("no writecb in Transform class"));e.writechunk=null,e.writecb=null,null!==n&&void 0!==n&&r.push(n),i(t);var a=r._readableState;a.reading=!1,(a.needReadable||a.length<a.highWaterMark)&&r._read(a.highWaterMark)}function Transform(r){if(!(this instanceof Transform))return new Transform(r);Duplex.call(this,r),this._transformState=new TransformState(this);var t=this;this._readableState.needReadable=!0,this._readableState.sync=!1,r&&("function"==typeof r.transform&&(this._transform=r.transform),"function"==typeof r.flush&&(this._flush=r.flush)),this.once("prefinish",function(){"function"==typeof this._flush?this._flush(function(r){done(t,r)}):done(t)})}function done(r,t){if(t)return r.emit("error",t);var n=r._writableState,e=r._transformState;if(n.length)throw new Error("calling transform done when ws.length != 0");if(e.transforming)throw new Error("calling transform done when still transforming");return r.push(null)}module.exports=Transform;var Duplex=require("./_stream_duplex"),util=require("core-util-is");util.inherits=require("inherits"),util.inherits(Transform,Duplex),Transform.prototype.push=function(r,t){return this._transformState.needTransform=!1,Duplex.prototype.push.call(this,r,t)},Transform.prototype._transform=function(r,t,n){throw new Error("not implemented")},Transform.prototype._write=function(r,t,n){var e=this._transformState;if(e.writecb=n,e.writechunk=r,e.writeencoding=t,!e.transforming){var i=this._readableState;(e.needTransform||i.needReadable||i.length<i.highWaterMark)&&this._read(i.highWaterMark)}},Transform.prototype._read=function(r){var t=this._transformState;null!==t.writechunk&&t.writecb&&!t.transforming?(t.transforming=!0,this._transform(t.writechunk,t.writeencoding,t.afterTransform)):t.needTransform=!0};
  
  },{"./_stream_duplex":77,"core-util-is":28,"inherits":35}],81:[function(require,module,exports){
  (function (process){
  "use strict";function nop(){}function WriteReq(e,t,r){this.chunk=e,this.encoding=t,this.callback=r,this.next=null}function WritableState(e,t){Duplex=Duplex||require("./_stream_duplex"),e=e||{},this.objectMode=!!e.objectMode,t instanceof Duplex&&(this.objectMode=this.objectMode||!!e.writableObjectMode);var r=e.highWaterMark,i=this.objectMode?16:16384;this.highWaterMark=r||0===r?r:i,this.highWaterMark=~~this.highWaterMark,this.needDrain=!1,this.ending=!1,this.ended=!1,this.finished=!1;var n=e.decodeStrings===!1;this.decodeStrings=!n,this.defaultEncoding=e.defaultEncoding||"utf8",this.length=0,this.writing=!1,this.corked=0,this.sync=!0,this.bufferProcessing=!1,this.onwrite=function(e){onwrite(t,e)},this.writecb=null,this.writelen=0,this.bufferedRequest=null,this.lastBufferedRequest=null,this.pendingcb=0,this.prefinished=!1,this.errorEmitted=!1,this.bufferedRequestCount=0,this.corkedRequestsFree=new CorkedRequest(this),this.corkedRequestsFree.next=new CorkedRequest(this)}function Writable(e){return Duplex=Duplex||require("./_stream_duplex"),this instanceof Writable||this instanceof Duplex?(this._writableState=new WritableState(e,this),this.writable=!0,e&&("function"==typeof e.write&&(this._write=e.write),"function"==typeof e.writev&&(this._writev=e.writev)),void Stream.call(this)):new Writable(e)}function writeAfterEnd(e,t){var r=new Error("write after end");e.emit("error",r),processNextTick(t,r)}function validChunk(e,t,r,i){var n=!0;if(!Buffer.isBuffer(r)&&"string"!=typeof r&&null!==r&&void 0!==r&&!t.objectMode){var s=new TypeError("Invalid non-string/buffer chunk");e.emit("error",s),processNextTick(i,s),n=!1}return n}function decodeChunk(e,t,r){return e.objectMode||e.decodeStrings===!1||"string"!=typeof t||(t=new Buffer(t,r)),t}function writeOrBuffer(e,t,r,i,n){r=decodeChunk(t,r,i),Buffer.isBuffer(r)&&(i="buffer");var s=t.objectMode?1:r.length;t.length+=s;var f=t.length<t.highWaterMark;if(f||(t.needDrain=!0),t.writing||t.corked){var u=t.lastBufferedRequest;t.lastBufferedRequest=new WriteReq(r,i,n),u?u.next=t.lastBufferedRequest:t.bufferedRequest=t.lastBufferedRequest,t.bufferedRequestCount+=1}else doWrite(e,t,!1,s,r,i,n);return f}function doWrite(e,t,r,i,n,s,f){t.writelen=i,t.writecb=f,t.writing=!0,t.sync=!0,r?e._writev(n,t.onwrite):e._write(n,s,t.onwrite),t.sync=!1}function onwriteError(e,t,r,i,n){--t.pendingcb,r?processNextTick(n,i):n(i),e._writableState.errorEmitted=!0,e.emit("error",i)}function onwriteStateUpdate(e){e.writing=!1,e.writecb=null,e.length-=e.writelen,e.writelen=0}function onwrite(e,t){var r=e._writableState,i=r.sync,n=r.writecb;if(onwriteStateUpdate(r),t)onwriteError(e,r,i,t,n);else{var s=needFinish(r);s||r.corked||r.bufferProcessing||!r.bufferedRequest||clearBuffer(e,r),i?asyncWrite(afterWrite,e,r,s,n):afterWrite(e,r,s,n)}}function afterWrite(e,t,r,i){r||onwriteDrain(e,t),t.pendingcb--,i(),finishMaybe(e,t)}function onwriteDrain(e,t){0===t.length&&t.needDrain&&(t.needDrain=!1,e.emit("drain"))}function clearBuffer(e,t){t.bufferProcessing=!0;var r=t.bufferedRequest;if(e._writev&&r&&r.next){var i=t.bufferedRequestCount,n=new Array(i),s=t.corkedRequestsFree;s.entry=r;for(var f=0;r;)n[f]=r,r=r.next,f+=1;doWrite(e,t,!0,t.length,n,"",s.finish),t.pendingcb++,t.lastBufferedRequest=null,t.corkedRequestsFree=s.next,s.next=null}else{for(;r;){var u=r.chunk,o=r.encoding,a=r.callback,c=t.objectMode?1:u.length;if(doWrite(e,t,!1,c,u,o,a),r=r.next,t.writing)break}null===r&&(t.lastBufferedRequest=null)}t.bufferedRequestCount=0,t.bufferedRequest=r,t.bufferProcessing=!1}function needFinish(e){return e.ending&&0===e.length&&null===e.bufferedRequest&&!e.finished&&!e.writing}function prefinish(e,t){t.prefinished||(t.prefinished=!0,e.emit("prefinish"))}function finishMaybe(e,t){var r=needFinish(t);return r&&(0===t.pendingcb?(prefinish(e,t),t.finished=!0,e.emit("finish")):prefinish(e,t)),r}function endWritable(e,t,r){t.ending=!0,finishMaybe(e,t),r&&(t.finished?processNextTick(r):e.once("finish",r)),t.ended=!0,e.writable=!1}function CorkedRequest(e){var t=this;this.next=null,this.entry=null,this.finish=function(r){var i=t.entry;for(t.entry=null;i;){var n=i.callback;e.pendingcb--,n(r),i=i.next}e.corkedRequestsFree?e.corkedRequestsFree.next=t:e.corkedRequestsFree=t}}module.exports=Writable;var processNextTick=require("process-nextick-args"),asyncWrite=!process.browser&&["v0.10","v0.9."].indexOf(process.version.slice(0,5))>-1?setImmediate:processNextTick,Buffer=require("buffer").Buffer;Writable.WritableState=WritableState;var util=require("core-util-is");util.inherits=require("inherits");var internalUtil={deprecate:require("util-deprecate")},Stream;!function(){try{Stream=require("stream")}catch(e){}finally{Stream||(Stream=require("events").EventEmitter)}}();var Buffer=require("buffer").Buffer;util.inherits(Writable,Stream);var Duplex;WritableState.prototype.getBuffer=function(){for(var e=this.bufferedRequest,t=[];e;)t.push(e),e=e.next;return t},function(){try{Object.defineProperty(WritableState.prototype,"buffer",{get:internalUtil.deprecate(function(){return this.getBuffer()},"_writableState.buffer is deprecated. Use _writableState.getBuffer instead.")})}catch(e){}}();var Duplex;Writable.prototype.pipe=function(){this.emit("error",new Error("Cannot pipe. Not readable."))},Writable.prototype.write=function(e,t,r){var i=this._writableState,n=!1;return"function"==typeof t&&(r=t,t=null),Buffer.isBuffer(e)?t="buffer":t||(t=i.defaultEncoding),"function"!=typeof r&&(r=nop),i.ended?writeAfterEnd(this,r):validChunk(this,i,e,r)&&(i.pendingcb++,n=writeOrBuffer(this,i,e,t,r)),n},Writable.prototype.cork=function(){var e=this._writableState;e.corked++},Writable.prototype.uncork=function(){var e=this._writableState;e.corked&&(e.corked--,e.writing||e.corked||e.finished||e.bufferProcessing||!e.bufferedRequest||clearBuffer(this,e))},Writable.prototype.setDefaultEncoding=function(e){if("string"==typeof e&&(e=e.toLowerCase()),!(["hex","utf8","utf-8","ascii","binary","base64","ucs2","ucs-2","utf16le","utf-16le","raw"].indexOf((e+"").toLowerCase())>-1))throw new TypeError("Unknown encoding: "+e);this._writableState.defaultEncoding=e},Writable.prototype._write=function(e,t,r){r(new Error("not implemented"))},Writable.prototype._writev=null,Writable.prototype.end=function(e,t,r){var i=this._writableState;"function"==typeof e?(r=e,e=null,t=null):"function"==typeof t&&(r=t,t=null),null!==e&&void 0!==e&&this.write(e,t),i.corked&&(i.corked=1,this.uncork()),i.ending||i.finished||endWritable(this,i,r)};
  
  }).call(this,require('_process'))
  
  },{"./_stream_duplex":77,"_process":71,"buffer":25,"core-util-is":28,"events":32,"inherits":35,"process-nextick-args":70,"stream":86,"util-deprecate":95}],82:[function(require,module,exports){
  module.exports=require("./lib/_stream_passthrough.js");
  
  },{"./lib/_stream_passthrough.js":78}],83:[function(require,module,exports){
  var Stream=function(){try{return require("stream")}catch(r){}}();exports=module.exports=require("./lib/_stream_readable.js"),exports.Stream=Stream||exports,exports.Readable=exports,exports.Writable=require("./lib/_stream_writable.js"),exports.Duplex=require("./lib/_stream_duplex.js"),exports.Transform=require("./lib/_stream_transform.js"),exports.PassThrough=require("./lib/_stream_passthrough.js");
  
  },{"./lib/_stream_duplex.js":77,"./lib/_stream_passthrough.js":78,"./lib/_stream_readable.js":79,"./lib/_stream_transform.js":80,"./lib/_stream_writable.js":81,"stream":86}],84:[function(require,module,exports){
  module.exports=require("./lib/_stream_transform.js");
  
  },{"./lib/_stream_transform.js":80}],85:[function(require,module,exports){
  module.exports=require("./lib/_stream_writable.js");
  
  },{"./lib/_stream_writable.js":81}],86:[function(require,module,exports){
  function Stream(){EE.call(this)}module.exports=Stream;var EE=require("events").EventEmitter,inherits=require("inherits");inherits(Stream,EE),Stream.Readable=require("readable-stream/readable.js"),Stream.Writable=require("readable-stream/writable.js"),Stream.Duplex=require("readable-stream/duplex.js"),Stream.Transform=require("readable-stream/transform.js"),Stream.PassThrough=require("readable-stream/passthrough.js"),Stream.Stream=Stream,Stream.prototype.pipe=function(e,r){function t(r){e.writable&&!1===e.write(r)&&m.pause&&m.pause()}function n(){m.readable&&m.resume&&m.resume()}function a(){u||(u=!0,e.end())}function o(){u||(u=!0,"function"==typeof e.destroy&&e.destroy())}function i(e){if(s(),0===EE.listenerCount(this,"error"))throw e}function s(){m.removeListener("data",t),e.removeListener("drain",n),m.removeListener("end",a),m.removeListener("close",o),m.removeListener("error",i),e.removeListener("error",i),m.removeListener("end",s),m.removeListener("close",s),e.removeListener("close",s)}var m=this;m.on("data",t),e.on("drain",n),e._isStdio||r&&r.end===!1||(m.on("end",a),m.on("close",o));var u=!1;return m.on("error",i),e.on("error",i),m.on("end",s),m.on("close",s),e.on("close",s),e.emit("pipe",m),e};
  
  },{"events":32,"inherits":35,"readable-stream/duplex.js":76,"readable-stream/passthrough.js":82,"readable-stream/readable.js":83,"readable-stream/transform.js":84,"readable-stream/writable.js":85}],87:[function(require,module,exports){
  (function (global){
  var ClientRequest=require("./lib/request"),extend=require("xtend"),statusCodes=require("builtin-status-codes"),url=require("url"),http=exports;http.request=function(t,e){t="string"==typeof t?url.parse(t):extend(t);var r=-1===global.location.protocol.search(/^https?:$/)?"http:":"",s=t.protocol||r,o=t.hostname||t.host,n=t.port,u=t.path||"/";o&&-1!==o.indexOf(":")&&(o="["+o+"]"),t.url=(o?s+"//"+o:"")+(n?":"+n:"")+u,t.method=(t.method||"GET").toUpperCase(),t.headers=t.headers||{};var C=new ClientRequest(t);return e&&C.on("response",e),C},http.get=function(t,e){var r=http.request(t,e);return r.end(),r},http.Agent=function(){},http.Agent.defaultMaxSockets=4,http.STATUS_CODES=statusCodes,http.METHODS=["CHECKOUT","CONNECT","COPY","DELETE","GET","HEAD","LOCK","M-SEARCH","MERGE","MKACTIVITY","MKCOL","MOVE","NOTIFY","OPTIONS","PATCH","POST","PROPFIND","PROPPATCH","PURGE","PUT","REPORT","SEARCH","SUBSCRIBE","TRACE","UNLOCK","UNSUBSCRIBE"];
  
  }).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{"./lib/request":89,"builtin-status-codes":26,"url":93,"xtend":98}],88:[function(require,module,exports){
  (function (global){
  function checkTypeSupport(e){try{return xhr.responseType=e,xhr.responseType===e}catch(r){}return!1}function isFunction(e){return"function"==typeof e}exports.fetch=isFunction(global.fetch)&&isFunction(global.ReadableByteStream),exports.blobConstructor=!1;try{new Blob([new ArrayBuffer(1)]),exports.blobConstructor=!0}catch(e){}var xhr=new global.XMLHttpRequest;xhr.open("GET",global.location.host?"/":"https://example.com");var haveArrayBuffer="undefined"!=typeof global.ArrayBuffer,haveSlice=haveArrayBuffer&&isFunction(global.ArrayBuffer.prototype.slice);exports.arraybuffer=haveArrayBuffer&&checkTypeSupport("arraybuffer"),exports.msstream=!exports.fetch&&haveSlice&&checkTypeSupport("ms-stream"),exports.mozchunkedarraybuffer=!exports.fetch&&haveArrayBuffer&&checkTypeSupport("moz-chunked-arraybuffer"),exports.overrideMimeType=isFunction(xhr.overrideMimeType),exports.vbArray=isFunction(global.VBArray),xhr=null;
  
  }).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{}],89:[function(require,module,exports){
  (function (process,global,Buffer){
  function decideMode(e){return capability.fetch?"fetch":capability.mozchunkedarraybuffer?"moz-chunked-arraybuffer":capability.msstream?"ms-stream":capability.arraybuffer&&e?"arraybuffer":capability.vbArray&&e?"text:vbarray":"text"}function statusValid(e){try{var t=e.status;return null!==t&&0!==t}catch(r){return!1}}var capability=require("./capability"),inherits=require("inherits"),response=require("./response"),stream=require("stream"),toArrayBuffer=require("to-arraybuffer"),IncomingMessage=response.IncomingMessage,rStates=response.readyStates,ClientRequest=module.exports=function(e){var t=this;stream.Writable.call(t),t._opts=e,t._body=[],t._headers={},e.auth&&t.setHeader("Authorization","Basic "+new Buffer(e.auth).toString("base64")),Object.keys(e.headers).forEach(function(r){t.setHeader(r,e.headers[r])});var r;if("prefer-streaming"===e.mode)r=!1;else if("allow-wrong-content-type"===e.mode)r=!capability.overrideMimeType;else{if(e.mode&&"default"!==e.mode&&"prefer-fast"!==e.mode)throw new Error("Invalid value for opts.mode");r=!0}t._mode=decideMode(r),t.on("finish",function(){t._onFinish()})};inherits(ClientRequest,stream.Writable),ClientRequest.prototype.setHeader=function(e,t){var r=this,o=e.toLowerCase();-1===unsafeHeaders.indexOf(o)&&(r._headers[o]={name:e,value:t})},ClientRequest.prototype.getHeader=function(e){var t=this;return t._headers[e.toLowerCase()].value},ClientRequest.prototype.removeHeader=function(e){var t=this;delete t._headers[e.toLowerCase()]},ClientRequest.prototype._onFinish=function(){var e=this;if(!e._destroyed){var t,r=e._opts,o=e._headers;if("POST"!==r.method&&"PUT"!==r.method&&"PATCH"!==r.method||(t=capability.blobConstructor?new global.Blob(e._body.map(function(e){return toArrayBuffer(e)}),{type:(o["content-type"]||{}).value||""}):Buffer.concat(e._body).toString()),"fetch"===e._mode){var n=Object.keys(o).map(function(e){return[o[e].name,o[e].value]});global.fetch(e._opts.url,{method:e._opts.method,headers:n,body:t,mode:"cors",credentials:r.withCredentials?"include":"same-origin"}).then(function(t){e._fetchResponse=t,e._connect()},function(t){e.emit("error",t)})}else{var s=e._xhr=new global.XMLHttpRequest;try{s.open(e._opts.method,e._opts.url,!0)}catch(i){return void process.nextTick(function(){e.emit("error",i)})}"responseType"in s&&(s.responseType=e._mode.split(":")[0]),"withCredentials"in s&&(s.withCredentials=!!r.withCredentials),"text"===e._mode&&"overrideMimeType"in s&&s.overrideMimeType("text/plain; charset=x-user-defined"),Object.keys(o).forEach(function(e){s.setRequestHeader(o[e].name,o[e].value)}),e._response=null,s.onreadystatechange=function(){switch(s.readyState){case rStates.LOADING:case rStates.DONE:e._onXHRProgress()}},"moz-chunked-arraybuffer"===e._mode&&(s.onprogress=function(){e._onXHRProgress()}),s.onerror=function(){e._destroyed||e.emit("error",new Error("XHR error"))};try{s.send(t)}catch(i){return void process.nextTick(function(){e.emit("error",i)})}}}},ClientRequest.prototype._onXHRProgress=function(){var e=this;statusValid(e._xhr)&&!e._destroyed&&(e._response||e._connect(),e._response._onXHRProgress())},ClientRequest.prototype._connect=function(){var e=this;e._destroyed||(e._response=new IncomingMessage(e._xhr,e._fetchResponse,e._mode),e.emit("response",e._response))},ClientRequest.prototype._write=function(e,t,r){var o=this;o._body.push(e),r()},ClientRequest.prototype.abort=ClientRequest.prototype.destroy=function(){var e=this;e._destroyed=!0,e._response&&(e._response._destroyed=!0),e._xhr&&e._xhr.abort()},ClientRequest.prototype.end=function(e,t,r){var o=this;"function"==typeof e&&(r=e,e=void 0),stream.Writable.prototype.end.call(o,e,t,r)},ClientRequest.prototype.flushHeaders=function(){},ClientRequest.prototype.setTimeout=function(){},ClientRequest.prototype.setNoDelay=function(){},ClientRequest.prototype.setSocketKeepAlive=function(){};var unsafeHeaders=["accept-charset","accept-encoding","access-control-request-headers","access-control-request-method","connection","content-length","cookie","cookie2","date","dnt","expect","host","keep-alive","origin","referer","te","trailer","transfer-encoding","upgrade","user-agent","via"];
  
  }).call(this,require('_process'),typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {},require("buffer").Buffer)
  
  },{"./capability":88,"./response":90,"_process":71,"buffer":25,"inherits":35,"stream":86,"to-arraybuffer":92}],90:[function(require,module,exports){
  (function (process,global,Buffer){
  var capability=require("./capability"),inherits=require("inherits"),stream=require("stream"),rStates=exports.readyStates={UNSENT:0,OPENED:1,HEADERS_RECEIVED:2,LOADING:3,DONE:4},IncomingMessage=exports.IncomingMessage=function(e,r,s){function a(){u.read().then(function(e){if(!t._destroyed){if(e.done)return void t.push(null);t.push(new Buffer(e.value)),a()}})}var t=this;if(stream.Readable.call(t),t._mode=s,t.headers={},t.rawHeaders=[],t.trailers={},t.rawTrailers=[],t.on("end",function(){process.nextTick(function(){t.emit("close")})}),"fetch"===s){t._fetchResponse=r,t.statusCode=r.status,t.statusMessage=r.statusText;for(var n,o,i=r.headers[Symbol.iterator]();n=(o=i.next()).value,!o.done;)t.headers[n[0].toLowerCase()]=n[1],t.rawHeaders.push(n[0],n[1]);var u=r.body.getReader();a()}else{t._xhr=e,t._pos=0,t.statusCode=e.status,t.statusMessage=e.statusText;var h=e.getAllResponseHeaders().split(/\r?\n/);if(h.forEach(function(e){var r=e.match(/^([^:]+):\s*(.*)/);if(r){var s=r[1].toLowerCase();"set-cookie"===s?(void 0===t.headers[s]&&(t.headers[s]=[]),t.headers[s].push(r[2])):void 0!==t.headers[s]?t.headers[s]+=", "+r[2]:t.headers[s]=r[2],t.rawHeaders.push(r[1],r[2])}}),t._charset="x-user-defined",!capability.overrideMimeType){var d=t.rawHeaders["mime-type"];if(d){var f=d.match(/;\s*charset=([^;])(;|$)/);f&&(t._charset=f[1].toLowerCase())}t._charset||(t._charset="utf-8")}}};inherits(IncomingMessage,stream.Readable),IncomingMessage.prototype._read=function(){},IncomingMessage.prototype._onXHRProgress=function(){var e=this,r=e._xhr,s=null;switch(e._mode){case"text:vbarray":if(r.readyState!==rStates.DONE)break;try{s=new global.VBArray(r.responseBody).toArray()}catch(a){}if(null!==s){e.push(new Buffer(s));break}case"text":try{s=r.responseText}catch(a){e._mode="text:vbarray";break}if(s.length>e._pos){var t=s.substr(e._pos);if("x-user-defined"===e._charset){for(var n=new Buffer(t.length),o=0;o<t.length;o++)n[o]=255&t.charCodeAt(o);e.push(n)}else e.push(t,e._charset);e._pos=s.length}break;case"arraybuffer":if(r.readyState!==rStates.DONE)break;s=r.response,e.push(new Buffer(new Uint8Array(s)));break;case"moz-chunked-arraybuffer":if(s=r.response,r.readyState!==rStates.LOADING||!s)break;e.push(new Buffer(new Uint8Array(s)));break;case"ms-stream":if(s=r.response,r.readyState!==rStates.LOADING)break;var i=new global.MSStreamReader;i.onprogress=function(){i.result.byteLength>e._pos&&(e.push(new Buffer(new Uint8Array(i.result.slice(e._pos)))),e._pos=i.result.byteLength)},i.onload=function(){e.push(null)},i.readAsArrayBuffer(s)}e._xhr.readyState===rStates.DONE&&"ms-stream"!==e._mode&&e.push(null)};
  
  }).call(this,require('_process'),typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {},require("buffer").Buffer)
  
  },{"./capability":88,"_process":71,"buffer":25,"inherits":35,"stream":86}],91:[function(require,module,exports){
  function assertEncoding(e){if(e&&!isBufferEncoding(e))throw new Error("Unknown encoding: "+e)}function passThroughWrite(e){return e.toString(this.encoding)}function utf16DetectIncompleteChar(e){this.charReceived=e.length%2,this.charLength=this.charReceived?2:0}function base64DetectIncompleteChar(e){this.charReceived=e.length%3,this.charLength=this.charReceived?3:0}var Buffer=require("buffer").Buffer,isBufferEncoding=Buffer.isEncoding||function(e){switch(e&&e.toLowerCase()){case"hex":case"utf8":case"utf-8":case"ascii":case"binary":case"base64":case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":case"raw":return!0;default:return!1}},StringDecoder=exports.StringDecoder=function(e){switch(this.encoding=(e||"utf8").toLowerCase().replace(/[-_]/,""),assertEncoding(e),this.encoding){case"utf8":this.surrogateSize=3;break;case"ucs2":case"utf16le":this.surrogateSize=2,this.detectIncompleteChar=utf16DetectIncompleteChar;break;case"base64":this.surrogateSize=3,this.detectIncompleteChar=base64DetectIncompleteChar;break;default:return void(this.write=passThroughWrite)}this.charBuffer=new Buffer(6),this.charReceived=0,this.charLength=0};StringDecoder.prototype.write=function(e){for(var t="";this.charLength;){var r=e.length>=this.charLength-this.charReceived?this.charLength-this.charReceived:e.length;if(e.copy(this.charBuffer,this.charReceived,0,r),this.charReceived+=r,this.charReceived<this.charLength)return"";e=e.slice(r,e.length),t=this.charBuffer.slice(0,this.charLength).toString(this.encoding);var h=t.charCodeAt(t.length-1);if(!(h>=55296&&56319>=h)){if(this.charReceived=this.charLength=0,0===e.length)return t;break}this.charLength+=this.surrogateSize,t=""}this.detectIncompleteChar(e);var i=e.length;this.charLength&&(e.copy(this.charBuffer,0,e.length-this.charReceived,i),i-=this.charReceived),t+=e.toString(this.encoding,0,i);var i=t.length-1,h=t.charCodeAt(i);if(h>=55296&&56319>=h){var c=this.surrogateSize;return this.charLength+=c,this.charReceived+=c,this.charBuffer.copy(this.charBuffer,c,0,c),e.copy(this.charBuffer,0,0,c),t.substring(0,i)}return t},StringDecoder.prototype.detectIncompleteChar=function(e){for(var t=e.length>=3?3:e.length;t>0;t--){var r=e[e.length-t];if(1==t&&r>>5==6){this.charLength=2;break}if(2>=t&&r>>4==14){this.charLength=3;break}if(3>=t&&r>>3==30){this.charLength=4;break}}this.charReceived=t},StringDecoder.prototype.end=function(e){var t="";if(e&&e.length&&(t=this.write(e)),this.charReceived){var r=this.charReceived,h=this.charBuffer,i=this.encoding;t+=h.slice(0,r).toString(i)}return t};
  
  },{"buffer":25}],92:[function(require,module,exports){
  var Buffer=require("buffer").Buffer;module.exports=function(e){if(e instanceof Uint8Array){if(0===e.byteOffset&&e.byteLength===e.buffer.byteLength)return e.buffer;if("function"==typeof e.buffer.slice)return e.buffer.slice(e.byteOffset,e.byteOffset+e.byteLength)}if(Buffer.isBuffer(e)){for(var f=new Uint8Array(e.length),r=e.length,t=0;r>t;t++)f[t]=e[t];return f.buffer}throw new Error("Argument must be a Buffer")};
  
  },{"buffer":25}],93:[function(require,module,exports){
  "use strict";function Url(){this.protocol=null,this.slashes=null,this.auth=null,this.host=null,this.port=null,this.hostname=null,this.hash=null,this.search=null,this.query=null,this.pathname=null,this.path=null,this.href=null}function urlParse(t,s,e){if(t&&util.isObject(t)&&t instanceof Url)return t;var h=new Url;return h.parse(t,s,e),h}function urlFormat(t){return util.isString(t)&&(t=urlParse(t)),t instanceof Url?t.format():Url.prototype.format.call(t)}function urlResolve(t,s){return urlParse(t,!1,!0).resolve(s)}function urlResolveObject(t,s){return t?urlParse(t,!1,!0).resolveObject(s):s}var punycode=require("punycode"),util=require("./util");exports.parse=urlParse,exports.resolve=urlResolve,exports.resolveObject=urlResolveObject,exports.format=urlFormat,exports.Url=Url;var protocolPattern=/^([a-z0-9.+-]+:)/i,portPattern=/:[0-9]*$/,simplePathPattern=/^(\/\/?(?!\/)[^\?\s]*)(\?[^\s]*)?$/,delims=["<",">",'"',"`"," ","\r","\n","    "],unwise=["{","}","|","\\","^","`"].concat(delims),autoEscape=["'"].concat(unwise),nonHostChars=["%","/","?",";","#"].concat(autoEscape),hostEndingChars=["/","?","#"],hostnameMaxLen=255,hostnamePartPattern=/^[+a-z0-9A-Z_-]{0,63}$/,hostnamePartStart=/^([+a-z0-9A-Z_-]{0,63})(.*)$/,unsafeProtocol={javascript:!0,"javascript:":!0},hostlessProtocol={javascript:!0,"javascript:":!0},slashedProtocol={http:!0,https:!0,ftp:!0,gopher:!0,file:!0,"http:":!0,"https:":!0,"ftp:":!0,"gopher:":!0,"file:":!0},querystring=require("querystring");Url.prototype.parse=function(t,s,e){if(!util.isString(t))throw new TypeError("Parameter 'url' must be a string, not "+typeof t);var h=t.indexOf("?"),r=-1!==h&&h<t.indexOf("#")?"?":"#",a=t.split(r),o=/\\/g;a[0]=a[0].replace(o,"/"),t=a.join(r);var n=t;if(n=n.trim(),!e&&1===t.split("#").length){var i=simplePathPattern.exec(n);if(i)return this.path=n,this.href=n,this.pathname=i[1],i[2]?(this.search=i[2],s?this.query=querystring.parse(this.search.substr(1)):this.query=this.search.substr(1)):s&&(this.search="",this.query={}),this}var l=protocolPattern.exec(n);if(l){l=l[0];var u=l.toLowerCase();this.protocol=u,n=n.substr(l.length)}if(e||l||n.match(/^\/\/[^@\/]+@[^@\/]+/)){var p="//"===n.substr(0,2);!p||l&&hostlessProtocol[l]||(n=n.substr(2),this.slashes=!0)}if(!hostlessProtocol[l]&&(p||l&&!slashedProtocol[l])){for(var c=-1,f=0;f<hostEndingChars.length;f++){var m=n.indexOf(hostEndingChars[f]);-1!==m&&(-1===c||c>m)&&(c=m)}var v,g;g=-1===c?n.lastIndexOf("@"):n.lastIndexOf("@",c),-1!==g&&(v=n.slice(0,g),n=n.slice(g+1),this.auth=decodeURIComponent(v)),c=-1;for(var f=0;f<nonHostChars.length;f++){var m=n.indexOf(nonHostChars[f]);-1!==m&&(-1===c||c>m)&&(c=m)}-1===c&&(c=n.length),this.host=n.slice(0,c),n=n.slice(c),this.parseHost(),this.hostname=this.hostname||"";var y="["===this.hostname[0]&&"]"===this.hostname[this.hostname.length-1];if(!y)for(var P=this.hostname.split(/\./),f=0,d=P.length;d>f;f++){var q=P[f];if(q&&!q.match(hostnamePartPattern)){for(var b="",O=0,j=q.length;j>O;O++)b+=q.charCodeAt(O)>127?"x":q[O];if(!b.match(hostnamePartPattern)){var x=P.slice(0,f),U=P.slice(f+1),C=q.match(hostnamePartStart);C&&(x.push(C[1]),U.unshift(C[2])),U.length&&(n="/"+U.join(".")+n),this.hostname=x.join(".");break}}}this.hostname.length>hostnameMaxLen?this.hostname="":this.hostname=this.hostname.toLowerCase(),y||(this.hostname=punycode.toASCII(this.hostname));var A=this.port?":"+this.port:"",w=this.hostname||"";this.host=w+A,this.href+=this.host,y&&(this.hostname=this.hostname.substr(1,this.hostname.length-2),"/"!==n[0]&&(n="/"+n))}if(!unsafeProtocol[u])for(var f=0,d=autoEscape.length;d>f;f++){var E=autoEscape[f];if(-1!==n.indexOf(E)){var I=encodeURIComponent(E);I===E&&(I=escape(E)),n=n.split(E).join(I)}}var R=n.indexOf("#");-1!==R&&(this.hash=n.substr(R),n=n.slice(0,R));var S=n.indexOf("?");if(-1!==S?(this.search=n.substr(S),this.query=n.substr(S+1),s&&(this.query=querystring.parse(this.query)),n=n.slice(0,S)):s&&(this.search="",this.query={}),n&&(this.pathname=n),slashedProtocol[u]&&this.hostname&&!this.pathname&&(this.pathname="/"),this.pathname||this.search){var A=this.pathname||"",k=this.search||"";this.path=A+k}return this.href=this.format(),this},Url.prototype.format=function(){var t=this.auth||"";t&&(t=encodeURIComponent(t),t=t.replace(/%3A/i,":"),t+="@");var s=this.protocol||"",e=this.pathname||"",h=this.hash||"",r=!1,a="";this.host?r=t+this.host:this.hostname&&(r=t+(-1===this.hostname.indexOf(":")?this.hostname:"["+this.hostname+"]"),this.port&&(r+=":"+this.port)),this.query&&util.isObject(this.query)&&Object.keys(this.query).length&&(a=querystring.stringify(this.query));var o=this.search||a&&"?"+a||"";return s&&":"!==s.substr(-1)&&(s+=":"),this.slashes||(!s||slashedProtocol[s])&&r!==!1?(r="//"+(r||""),e&&"/"!==e.charAt(0)&&(e="/"+e)):r||(r=""),h&&"#"!==h.charAt(0)&&(h="#"+h),o&&"?"!==o.charAt(0)&&(o="?"+o),e=e.replace(/[?#]/g,function(t){return encodeURIComponent(t)}),o=o.replace("#","%23"),s+r+e+o+h},Url.prototype.resolve=function(t){return this.resolveObject(urlParse(t,!1,!0)).format()},Url.prototype.resolveObject=function(t){if(util.isString(t)){var s=new Url;s.parse(t,!1,!0),t=s}for(var e=new Url,h=Object.keys(this),r=0;r<h.length;r++){var a=h[r];e[a]=this[a]}if(e.hash=t.hash,""===t.href)return e.href=e.format(),e;if(t.slashes&&!t.protocol){for(var o=Object.keys(t),n=0;n<o.length;n++){var i=o[n];"protocol"!==i&&(e[i]=t[i])}return slashedProtocol[e.protocol]&&e.hostname&&!e.pathname&&(e.path=e.pathname="/"),e.href=e.format(),e}if(t.protocol&&t.protocol!==e.protocol){if(!slashedProtocol[t.protocol]){for(var l=Object.keys(t),u=0;u<l.length;u++){var p=l[u];e[p]=t[p]}return e.href=e.format(),e}if(e.protocol=t.protocol,t.host||hostlessProtocol[t.protocol])e.pathname=t.pathname;else{for(var c=(t.pathname||"").split("/");c.length&&!(t.host=c.shift()););t.host||(t.host=""),t.hostname||(t.hostname=""),""!==c[0]&&c.unshift(""),c.length<2&&c.unshift(""),e.pathname=c.join("/")}if(e.search=t.search,e.query=t.query,e.host=t.host||"",e.auth=t.auth,e.hostname=t.hostname||t.host,e.port=t.port,e.pathname||e.search){var f=e.pathname||"",m=e.search||"";e.path=f+m}return e.slashes=e.slashes||t.slashes,e.href=e.format(),e}var v=e.pathname&&"/"===e.pathname.charAt(0),g=t.host||t.pathname&&"/"===t.pathname.charAt(0),y=g||v||e.host&&t.pathname,P=y,d=e.pathname&&e.pathname.split("/")||[],c=t.pathname&&t.pathname.split("/")||[],q=e.protocol&&!slashedProtocol[e.protocol];if(q&&(e.hostname="",e.port=null,e.host&&(""===d[0]?d[0]=e.host:d.unshift(e.host)),e.host="",t.protocol&&(t.hostname=null,t.port=null,t.host&&(""===c[0]?c[0]=t.host:c.unshift(t.host)),t.host=null),y=y&&(""===c[0]||""===d[0])),g)e.host=t.host||""===t.host?t.host:e.host,e.hostname=t.hostname||""===t.hostname?t.hostname:e.hostname,e.search=t.search,e.query=t.query,d=c;else if(c.length)d||(d=[]),d.pop(),d=d.concat(c),e.search=t.search,e.query=t.query;else if(!util.isNullOrUndefined(t.search)){if(q){e.hostname=e.host=d.shift();var b=e.host&&e.host.indexOf("@")>0?e.host.split("@"):!1;b&&(e.auth=b.shift(),e.host=e.hostname=b.shift())}return e.search=t.search,e.query=t.query,util.isNull(e.pathname)&&util.isNull(e.search)||(e.path=(e.pathname?e.pathname:"")+(e.search?e.search:"")),e.href=e.format(),e}if(!d.length)return e.pathname=null,e.search?e.path="/"+e.search:e.path=null,e.href=e.format(),e;for(var O=d.slice(-1)[0],j=(e.host||t.host||d.length>1)&&("."===O||".."===O)||""===O,x=0,U=d.length;U>=0;U--)O=d[U],"."===O?d.splice(U,1):".."===O?(d.splice(U,1),x++):x&&(d.splice(U,1),x--);if(!y&&!P)for(;x--;x)d.unshift("..");!y||""===d[0]||d[0]&&"/"===d[0].charAt(0)||d.unshift(""),j&&"/"!==d.join("/").substr(-1)&&d.push("");var C=""===d[0]||d[0]&&"/"===d[0].charAt(0);if(q){e.hostname=e.host=C?"":d.length?d.shift():"";var b=e.host&&e.host.indexOf("@")>0?e.host.split("@"):!1;b&&(e.auth=b.shift(),e.host=e.hostname=b.shift())}return y=y||e.host&&d.length,y&&!C&&d.unshift(""),d.length?e.pathname=d.join("/"):(e.pathname=null,e.path=null),util.isNull(e.pathname)&&util.isNull(e.search)||(e.path=(e.pathname?e.pathname:"")+(e.search?e.search:"")),e.auth=t.auth||e.auth,e.slashes=e.slashes||t.slashes,e.href=e.format(),e},Url.prototype.parseHost=function(){var t=this.host,s=portPattern.exec(t);s&&(s=s[0],":"!==s&&(this.port=s.substr(1)),t=t.substr(0,t.length-s.length)),t&&(this.hostname=t)};
  
  },{"./util":94,"punycode":72,"querystring":75}],94:[function(require,module,exports){
  "use strict";module.exports={isString:function(n){return"string"==typeof n},isObject:function(n){return"object"==typeof n&&null!==n},isNull:function(n){return null===n},isNullOrUndefined:function(n){return null==n}};
  
  },{}],95:[function(require,module,exports){
  (function (global){
  function deprecate(r,e){function o(){if(!t){if(config("throwDeprecation"))throw new Error(e);config("traceDeprecation")?console.trace(e):console.warn(e),t=!0}return r.apply(this,arguments)}if(config("noDeprecation"))return r;var t=!1;return o}function config(r){try{if(!global.localStorage)return!1}catch(e){return!1}var o=global.localStorage[r];return null==o?!1:"true"===String(o).toLowerCase()}module.exports=deprecate;
  
  }).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{}],96:[function(require,module,exports){
  module.exports=function(o){return o&&"object"==typeof o&&"function"==typeof o.copy&&"function"==typeof o.fill&&"function"==typeof o.readUInt8};
  
  },{}],97:[function(require,module,exports){
  (function (process,global){
  function inspect(e,r){var t={seen:[],stylize:stylizeNoColor};return arguments.length>=3&&(t.depth=arguments[2]),arguments.length>=4&&(t.colors=arguments[3]),isBoolean(r)?t.showHidden=r:r&&exports._extend(t,r),isUndefined(t.showHidden)&&(t.showHidden=!1),isUndefined(t.depth)&&(t.depth=2),isUndefined(t.colors)&&(t.colors=!1),isUndefined(t.customInspect)&&(t.customInspect=!0),t.colors&&(t.stylize=stylizeWithColor),formatValue(t,e,t.depth)}function stylizeWithColor(e,r){var t=inspect.styles[r];return t?"["+inspect.colors[t][0]+"m"+e+"["+inspect.colors[t][1]+"m":e}function stylizeNoColor(e,r){return e}function arrayToHash(e){var r={};return e.forEach(function(e,t){r[e]=!0}),r}function formatValue(e,r,t){if(e.customInspect&&r&&isFunction(r.inspect)&&r.inspect!==exports.inspect&&(!r.constructor||r.constructor.prototype!==r)){var n=r.inspect(t,e);return isString(n)||(n=formatValue(e,n,t)),n}var i=formatPrimitive(e,r);if(i)return i;var o=Object.keys(r),s=arrayToHash(o);if(e.showHidden&&(o=Object.getOwnPropertyNames(r)),isError(r)&&(o.indexOf("message")>=0||o.indexOf("description")>=0))return formatError(r);if(0===o.length){if(isFunction(r)){var u=r.name?": "+r.name:"";return e.stylize("[Function"+u+"]","special")}if(isRegExp(r))return e.stylize(RegExp.prototype.toString.call(r),"regexp");if(isDate(r))return e.stylize(Date.prototype.toString.call(r),"date");if(isError(r))return formatError(r)}var c="",a=!1,l=["{","}"];if(isArray(r)&&(a=!0,l=["[","]"]),isFunction(r)){var p=r.name?": "+r.name:"";c=" [Function"+p+"]"}if(isRegExp(r)&&(c=" "+RegExp.prototype.toString.call(r)),isDate(r)&&(c=" "+Date.prototype.toUTCString.call(r)),isError(r)&&(c=" "+formatError(r)),0===o.length&&(!a||0==r.length))return l[0]+c+l[1];if(0>t)return isRegExp(r)?e.stylize(RegExp.prototype.toString.call(r),"regexp"):e.stylize("[Object]","special");e.seen.push(r);var f;return f=a?formatArray(e,r,t,s,o):o.map(function(n){return formatProperty(e,r,t,s,n,a)}),e.seen.pop(),reduceToSingleString(f,c,l)}function formatPrimitive(e,r){if(isUndefined(r))return e.stylize("undefined","undefined");if(isString(r)){var t="'"+JSON.stringify(r).replace(/^"|"$/g,"").replace(/'/g,"\\'").replace(/\\"/g,'"')+"'";return e.stylize(t,"string")}return isNumber(r)?e.stylize(""+r,"number"):isBoolean(r)?e.stylize(""+r,"boolean"):isNull(r)?e.stylize("null","null"):void 0}function formatError(e){return"["+Error.prototype.toString.call(e)+"]"}function formatArray(e,r,t,n,i){for(var o=[],s=0,u=r.length;u>s;++s)hasOwnProperty(r,String(s))?o.push(formatProperty(e,r,t,n,String(s),!0)):o.push("");return i.forEach(function(i){i.match(/^\d+$/)||o.push(formatProperty(e,r,t,n,i,!0))}),o}function formatProperty(e,r,t,n,i,o){var s,u,c;if(c=Object.getOwnPropertyDescriptor(r,i)||{value:r[i]},c.get?u=c.set?e.stylize("[Getter/Setter]","special"):e.stylize("[Getter]","special"):c.set&&(u=e.stylize("[Setter]","special")),hasOwnProperty(n,i)||(s="["+i+"]"),u||(e.seen.indexOf(c.value)<0?(u=isNull(t)?formatValue(e,c.value,null):formatValue(e,c.value,t-1),u.indexOf("\n")>-1&&(u=o?u.split("\n").map(function(e){return"  "+e}).join("\n").substr(2):"\n"+u.split("\n").map(function(e){return"   "+e}).join("\n"))):u=e.stylize("[Circular]","special")),isUndefined(s)){if(o&&i.match(/^\d+$/))return u;s=JSON.stringify(""+i),s.match(/^"([a-zA-Z_][a-zA-Z_0-9]*)"$/)?(s=s.substr(1,s.length-2),s=e.stylize(s,"name")):(s=s.replace(/'/g,"\\'").replace(/\\"/g,'"').replace(/(^"|"$)/g,"'"),s=e.stylize(s,"string"))}return s+": "+u}function reduceToSingleString(e,r,t){var n=0,i=e.reduce(function(e,r){return n++,r.indexOf("\n")>=0&&n++,e+r.replace(/\u001b\[\d\d?m/g,"").length+1},0);return i>60?t[0]+(""===r?"":r+"\n ")+" "+e.join(",\n  ")+" "+t[1]:t[0]+r+" "+e.join(", ")+" "+t[1]}function isArray(e){return Array.isArray(e)}function isBoolean(e){return"boolean"==typeof e}function isNull(e){return null===e}function isNullOrUndefined(e){return null==e}function isNumber(e){return"number"==typeof e}function isString(e){return"string"==typeof e}function isSymbol(e){return"symbol"==typeof e}function isUndefined(e){return void 0===e}function isRegExp(e){return isObject(e)&&"[object RegExp]"===objectToString(e)}function isObject(e){return"object"==typeof e&&null!==e}function isDate(e){return isObject(e)&&"[object Date]"===objectToString(e)}function isError(e){return isObject(e)&&("[object Error]"===objectToString(e)||e instanceof Error)}function isFunction(e){return"function"==typeof e}function isPrimitive(e){return null===e||"boolean"==typeof e||"number"==typeof e||"string"==typeof e||"symbol"==typeof e||"undefined"==typeof e}function objectToString(e){return Object.prototype.toString.call(e)}function pad(e){return 10>e?"0"+e.toString(10):e.toString(10)}function timestamp(){var e=new Date,r=[pad(e.getHours()),pad(e.getMinutes()),pad(e.getSeconds())].join(":");return[e.getDate(),months[e.getMonth()],r].join(" ")}function hasOwnProperty(e,r){return Object.prototype.hasOwnProperty.call(e,r)}var formatRegExp=/%[sdj%]/g;exports.format=function(e){if(!isString(e)){for(var r=[],t=0;t<arguments.length;t++)r.push(inspect(arguments[t]));return r.join(" ")}for(var t=1,n=arguments,i=n.length,o=String(e).replace(formatRegExp,function(e){if("%%"===e)return"%";if(t>=i)return e;switch(e){case"%s":return String(n[t++]);case"%d":return Number(n[t++]);case"%j":try{return JSON.stringify(n[t++])}catch(r){return"[Circular]"}default:return e}}),s=n[t];i>t;s=n[++t])o+=isNull(s)||!isObject(s)?" "+s:" "+inspect(s);return o},exports.deprecate=function(e,r){function t(){if(!n){if(process.throwDeprecation)throw new Error(r);process.traceDeprecation?console.trace(r):console.error(r),n=!0}return e.apply(this,arguments)}if(isUndefined(global.process))return function(){return exports.deprecate(e,r).apply(this,arguments)};if(process.noDeprecation===!0)return e;var n=!1;return t};var debugs={},debugEnviron;exports.debuglog=function(e){if(isUndefined(debugEnviron)&&(debugEnviron=process.env.NODE_DEBUG||""),e=e.toUpperCase(),!debugs[e])if(new RegExp("\\b"+e+"\\b","i").test(debugEnviron)){var r=process.pid;debugs[e]=function(){var t=exports.format.apply(exports,arguments);console.error("%s %d: %s",e,r,t)}}else debugs[e]=function(){};return debugs[e]},exports.inspect=inspect,inspect.colors={bold:[1,22],italic:[3,23],underline:[4,24],inverse:[7,27],white:[37,39],grey:[90,39],black:[30,39],blue:[34,39],cyan:[36,39],green:[32,39],magenta:[35,39],red:[31,39],yellow:[33,39]},inspect.styles={special:"cyan",number:"yellow","boolean":"yellow",undefined:"grey","null":"bold",string:"green",date:"magenta",regexp:"red"},exports.isArray=isArray,exports.isBoolean=isBoolean,exports.isNull=isNull,exports.isNullOrUndefined=isNullOrUndefined,exports.isNumber=isNumber,exports.isString=isString,exports.isSymbol=isSymbol,exports.isUndefined=isUndefined,exports.isRegExp=isRegExp,exports.isObject=isObject,exports.isDate=isDate,exports.isError=isError,exports.isFunction=isFunction,exports.isPrimitive=isPrimitive,exports.isBuffer=require("./support/isBuffer");var months=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];exports.log=function(){console.log("%s - %s",timestamp(),exports.format.apply(exports,arguments))},exports.inherits=require("inherits"),exports._extend=function(e,r){if(!r||!isObject(r))return e;for(var t=Object.keys(r),n=t.length;n--;)e[t[n]]=r[t[n]];return e};
  
  }).call(this,require('_process'),typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
  
  },{"./support/isBuffer":96,"_process":71,"inherits":35}],98:[function(require,module,exports){
  function extend(){for(var r={},e=0;e<arguments.length;e++){var t=arguments[e];for(var n in t)hasOwnProperty.call(t,n)&&(r[n]=t[n])}return r}module.exports=extend;var hasOwnProperty=Object.prototype.hasOwnProperty;
  
  },{}]},{},[3])(3)
  });
  </script>
  <script>
  // https://github.com/isaacs/json-stringify-safe v5.0.1
  function stringify(obj, replacer, spaces, cycleReplacer) {
    return JSON.stringify(obj, serializer(replacer, cycleReplacer), spaces)
  }
  
  function serializer(replacer, cycleReplacer) {
    var stack = [], keys = []
  
    if (cycleReplacer == null) cycleReplacer = function(key, value) {
      if (stack[0] === value) return "[Circular ~]"
      return "[Circular ~." + keys.slice(0, stack.indexOf(value)).join(".") + "]"
    }
  
    return function(key, value) {
      if (stack.length > 0) {
        var thisPos = stack.indexOf(this)
        ~thisPos ? stack.splice(thisPos + 1) : stack.push(this)
        ~thisPos ? keys.splice(thisPos, Infinity, key) : keys.push(key)
        if (~stack.indexOf(value)) value = cycleReplacer.call(this, key, value)
      }
      else stack.push(value)
  
      return replacer == null ? value : replacer.call(this, key, value)
    }
  }
  </script>
  <script>
  /* Web Font Loader v1.6.24 - (c) Adobe Systems, Google. License: Apache 2.0 */
  (function(){function aa(a,b,d){return a.call.apply(a.bind,arguments)}function ba(a,b,d){if(!a)throw Error();if(2<arguments.length){var c=Array.prototype.slice.call(arguments,2);return function(){var d=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(d,c);return a.apply(b,d)}}return function(){return a.apply(b,arguments)}}function p(a,b,d){p=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?aa:ba;return p.apply(null,arguments)}var q=Date.now||function(){return+new Date};function ca(a,b){this.a=a;this.m=b||a;this.c=this.m.document}var da=!!window.FontFace;function t(a,b,d,c){b=a.c.createElement(b);if(d)for(var e in d)d.hasOwnProperty(e)&&("style"==e?b.style.cssText=d[e]:b.setAttribute(e,d[e]));c&&b.appendChild(a.c.createTextNode(c));return b}function u(a,b,d){a=a.c.getElementsByTagName(b)[0];a||(a=document.documentElement);a.insertBefore(d,a.lastChild)}function v(a){a.parentNode&&a.parentNode.removeChild(a)}
  function w(a,b,d){b=b||[];d=d||[];for(var c=a.className.split(/\s+/),e=0;e<b.length;e+=1){for(var f=!1,g=0;g<c.length;g+=1)if(b[e]===c[g]){f=!0;break}f||c.push(b[e])}b=[];for(e=0;e<c.length;e+=1){f=!1;for(g=0;g<d.length;g+=1)if(c[e]===d[g]){f=!0;break}f||b.push(c[e])}a.className=b.join(" ").replace(/\s+/g," ").replace(/^\s+|\s+$/,"")}function y(a,b){for(var d=a.className.split(/\s+/),c=0,e=d.length;c<e;c++)if(d[c]==b)return!0;return!1}
  function z(a){if("string"===typeof a.f)return a.f;var b=a.m.location.protocol;"about:"==b&&(b=a.a.location.protocol);return"https:"==b?"https:":"http:"}function ea(a){return a.m.location.hostname||a.a.location.hostname}
  function A(a,b,d){function c(){k&&e&&f&&(k(g),k=null)}b=t(a,"link",{rel:"stylesheet",href:b,media:"all"});var e=!1,f=!0,g=null,k=d||null;da?(b.onload=function(){e=!0;c()},b.onerror=function(){e=!0;g=Error("Stylesheet failed to load");c()}):setTimeout(function(){e=!0;c()},0);u(a,"head",b)}
  function B(a,b,d,c){var e=a.c.getElementsByTagName("head")[0];if(e){var f=t(a,"script",{src:b}),g=!1;f.onload=f.onreadystatechange=function(){g||this.readyState&&"loaded"!=this.readyState&&"complete"!=this.readyState||(g=!0,d&&d(null),f.onload=f.onreadystatechange=null,"HEAD"==f.parentNode.tagName&&e.removeChild(f))};e.appendChild(f);setTimeout(function(){g||(g=!0,d&&d(Error("Script load timeout")))},c||5E3);return f}return null};function C(){this.a=0;this.c=null}function D(a){a.a++;return function(){a.a--;E(a)}}function F(a,b){a.c=b;E(a)}function E(a){0==a.a&&a.c&&(a.c(),a.c=null)};function G(a){this.a=a||"-"}G.prototype.c=function(a){for(var b=[],d=0;d<arguments.length;d++)b.push(arguments[d].replace(/[\W_]+/g,"").toLowerCase());return b.join(this.a)};function H(a,b){this.c=a;this.f=4;this.a="n";var d=(b||"n4").match(/^([nio])([1-9])$/i);d&&(this.a=d[1],this.f=parseInt(d[2],10))}function fa(a){return I(a)+" "+(a.f+"00")+" 300px "+J(a.c)}function J(a){var b=[];a=a.split(/,\s*/);for(var d=0;d<a.length;d++){var c=a[d].replace(/['"]/g,"");-1!=c.indexOf(" ")||/^\d/.test(c)?b.push("'"+c+"'"):b.push(c)}return b.join(",")}function K(a){return a.a+a.f}function I(a){var b="normal";"o"===a.a?b="oblique":"i"===a.a&&(b="italic");return b}
  function ga(a){var b=4,d="n",c=null;a&&((c=a.match(/(normal|oblique|italic)/i))&&c[1]&&(d=c[1].substr(0,1).toLowerCase()),(c=a.match(/([1-9]00|normal|bold)/i))&&c[1]&&(/bold/i.test(c[1])?b=7:/[1-9]00/.test(c[1])&&(b=parseInt(c[1].substr(0,1),10))));return d+b};function ha(a,b){this.c=a;this.f=a.m.document.documentElement;this.h=b;this.a=new G("-");this.j=!1!==b.events;this.g=!1!==b.classes}function ia(a){a.g&&w(a.f,[a.a.c("wf","loading")]);L(a,"loading")}function M(a){if(a.g){var b=y(a.f,a.a.c("wf","active")),d=[],c=[a.a.c("wf","loading")];b||d.push(a.a.c("wf","inactive"));w(a.f,d,c)}L(a,"inactive")}function L(a,b,d){if(a.j&&a.h[b])if(d)a.h[b](d.c,K(d));else a.h[b]()};function ja(){this.c={}}function ka(a,b,d){var c=[],e;for(e in b)if(b.hasOwnProperty(e)){var f=a.c[e];f&&c.push(f(b[e],d))}return c};function N(a,b){this.c=a;this.f=b;this.a=t(this.c,"span",{"aria-hidden":"true"},this.f)}function O(a){u(a.c,"body",a.a)}function P(a){return"display:block;position:absolute;top:-9999px;left:-9999px;font-size:300px;width:auto;height:auto;line-height:normal;margin:0;padding:0;font-variant:normal;white-space:nowrap;font-family:"+J(a.c)+";"+("font-style:"+I(a)+";font-weight:"+(a.f+"00")+";")};function Q(a,b,d,c,e,f){this.g=a;this.j=b;this.a=c;this.c=d;this.f=e||3E3;this.h=f||void 0}Q.prototype.start=function(){var a=this.c.m.document,b=this,d=q(),c=new Promise(function(c,e){function k(){q()-d>=b.f?e():a.fonts.load(fa(b.a),b.h).then(function(a){1<=a.length?c():setTimeout(k,25)},function(){e()})}k()}),e=new Promise(function(a,c){setTimeout(c,b.f)});Promise.race([e,c]).then(function(){b.g(b.a)},function(){b.j(b.a)})};function R(a,b,d,c,e,f,g){this.v=a;this.B=b;this.c=d;this.a=c;this.s=g||"BESbswy";this.f={};this.w=e||3E3;this.u=f||null;this.o=this.j=this.h=this.g=null;this.g=new N(this.c,this.s);this.h=new N(this.c,this.s);this.j=new N(this.c,this.s);this.o=new N(this.c,this.s);a=new H(this.a.c+",serif",K(this.a));a=P(a);this.g.a.style.cssText=a;a=new H(this.a.c+",sans-serif",K(this.a));a=P(a);this.h.a.style.cssText=a;a=new H("serif",K(this.a));a=P(a);this.j.a.style.cssText=a;a=new H("sans-serif",K(this.a));a=
  P(a);this.o.a.style.cssText=a;O(this.g);O(this.h);O(this.j);O(this.o)}var S={D:"serif",C:"sans-serif"},T=null;function U(){if(null===T){var a=/AppleWebKit\/([0-9]+)(?:\.([0-9]+))/.exec(window.navigator.userAgent);T=!!a&&(536>parseInt(a[1],10)||536===parseInt(a[1],10)&&11>=parseInt(a[2],10))}return T}R.prototype.start=function(){this.f.serif=this.j.a.offsetWidth;this.f["sans-serif"]=this.o.a.offsetWidth;this.A=q();la(this)};
  function ma(a,b,d){for(var c in S)if(S.hasOwnProperty(c)&&b===a.f[S[c]]&&d===a.f[S[c]])return!0;return!1}function la(a){var b=a.g.a.offsetWidth,d=a.h.a.offsetWidth,c;(c=b===a.f.serif&&d===a.f["sans-serif"])||(c=U()&&ma(a,b,d));c?q()-a.A>=a.w?U()&&ma(a,b,d)&&(null===a.u||a.u.hasOwnProperty(a.a.c))?V(a,a.v):V(a,a.B):na(a):V(a,a.v)}function na(a){setTimeout(p(function(){la(this)},a),50)}function V(a,b){setTimeout(p(function(){v(this.g.a);v(this.h.a);v(this.j.a);v(this.o.a);b(this.a)},a),0)};function W(a,b,d){this.c=a;this.a=b;this.f=0;this.o=this.j=!1;this.s=d}var X=null;W.prototype.g=function(a){var b=this.a;b.g&&w(b.f,[b.a.c("wf",a.c,K(a).toString(),"active")],[b.a.c("wf",a.c,K(a).toString(),"loading"),b.a.c("wf",a.c,K(a).toString(),"inactive")]);L(b,"fontactive",a);this.o=!0;oa(this)};
  W.prototype.h=function(a){var b=this.a;if(b.g){var d=y(b.f,b.a.c("wf",a.c,K(a).toString(),"active")),c=[],e=[b.a.c("wf",a.c,K(a).toString(),"loading")];d||c.push(b.a.c("wf",a.c,K(a).toString(),"inactive"));w(b.f,c,e)}L(b,"fontinactive",a);oa(this)};function oa(a){0==--a.f&&a.j&&(a.o?(a=a.a,a.g&&w(a.f,[a.a.c("wf","active")],[a.a.c("wf","loading"),a.a.c("wf","inactive")]),L(a,"active")):M(a.a))};function pa(a){this.j=a;this.a=new ja;this.h=0;this.f=this.g=!0}pa.prototype.load=function(a){this.c=new ca(this.j,a.context||this.j);this.g=!1!==a.events;this.f=!1!==a.classes;qa(this,new ha(this.c,a),a)};
  function ra(a,b,d,c,e){var f=0==--a.h;(a.f||a.g)&&setTimeout(function(){var a=e||null,k=c||null||{};if(0===d.length&&f)M(b.a);else{b.f+=d.length;f&&(b.j=f);var h,m=[];for(h=0;h<d.length;h++){var l=d[h],n=k[l.c],r=b.a,x=l;r.g&&w(r.f,[r.a.c("wf",x.c,K(x).toString(),"loading")]);L(r,"fontloading",x);r=null;null===X&&(X=window.FontFace?(x=/Gecko.*Firefox\/(\d+)/.exec(window.navigator.userAgent))?42<parseInt(x[1],10):!0:!1);X?r=new Q(p(b.g,b),p(b.h,b),b.c,l,b.s,n):r=new R(p(b.g,b),p(b.h,b),b.c,l,b.s,a,
  n);m.push(r)}for(h=0;h<m.length;h++)m[h].start()}},0)}function qa(a,b,d){var c=[],e=d.timeout;ia(b);var c=ka(a.a,d,a.c),f=new W(a.c,b,e);a.h=c.length;b=0;for(d=c.length;b<d;b++)c[b].load(function(b,c,d){ra(a,f,b,c,d)})};function sa(a,b){this.c=a;this.a=b}function ta(a,b,d){var c=z(a.c);a=(a.a.api||"fast.fonts.net/jsapi").replace(/^.*http(s?):(\/\/)?/,"");return c+"//"+a+"/"+b+".js"+(d?"?v="+d:"")}
  sa.prototype.load=function(a){function b(){if(e["__mti_fntLst"+d]){var c=e["__mti_fntLst"+d](),g=[],k;if(c)for(var h=0;h<c.length;h++){var m=c[h].fontfamily;void 0!=c[h].fontStyle&&void 0!=c[h].fontWeight?(k=c[h].fontStyle+c[h].fontWeight,g.push(new H(m,k))):g.push(new H(m))}a(g)}else setTimeout(function(){b()},50)}var d=this.a.projectId,c=this.a.version;if(d){var e=this.c.m;B(this.c,ta(this,d,c),function(c){c?a([]):b()}).id="__MonotypeAPIScript__"+d}else a([])};function ua(a,b){this.c=a;this.a=b}ua.prototype.load=function(a){var b,d,c=this.a.urls||[],e=this.a.families||[],f=this.a.testStrings||{},g=new C;b=0;for(d=c.length;b<d;b++)A(this.c,c[b],D(g));var k=[];b=0;for(d=e.length;b<d;b++)if(c=e[b].split(":"),c[1])for(var h=c[1].split(","),m=0;m<h.length;m+=1)k.push(new H(c[0],h[m]));else k.push(new H(c[0]));F(g,function(){a(k,f)})};function va(a,b,d){a?this.c=a:this.c=b+wa;this.a=[];this.f=[];this.g=d||""}var wa="//fonts.googleapis.com/css";function xa(a,b){for(var d=b.length,c=0;c<d;c++){var e=b[c].split(":");3==e.length&&a.f.push(e.pop());var f="";2==e.length&&""!=e[1]&&(f=":");a.a.push(e.join(f))}}
  function ya(a){if(0==a.a.length)throw Error("No fonts to load!");if(-1!=a.c.indexOf("kit="))return a.c;for(var b=a.a.length,d=[],c=0;c<b;c++)d.push(a.a[c].replace(/ /g,"+"));b=a.c+"?family="+d.join("%7C");0<a.f.length&&(b+="&subset="+a.f.join(","));0<a.g.length&&(b+="&text="+encodeURIComponent(a.g));return b};function za(a){this.f=a;this.a=[];this.c={}}
  var Aa={latin:"BESbswy",cyrillic:"\u0439\u044f\u0416",greek:"\u03b1\u03b2\u03a3",khmer:"\u1780\u1781\u1782",Hanuman:"\u1780\u1781\u1782"},Ba={thin:"1",extralight:"2","extra-light":"2",ultralight:"2","ultra-light":"2",light:"3",regular:"4",book:"4",medium:"5","semi-bold":"6",semibold:"6","demi-bold":"6",demibold:"6",bold:"7","extra-bold":"8",extrabold:"8","ultra-bold":"8",ultrabold:"8",black:"9",heavy:"9",l:"3",r:"4",b:"7"},Ca={i:"i",italic:"i",n:"n",normal:"n"},Da=/^(thin|(?:(?:extra|ultra)-?)?light|regular|book|medium|(?:(?:semi|demi|extra|ultra)-?)?bold|black|heavy|l|r|b|[1-9]00)?(n|i|normal|italic)?$/;
  function Ea(a){for(var b=a.f.length,d=0;d<b;d++){var c=a.f[d].split(":"),e=c[0].replace(/\+/g," "),f=["n4"];if(2<=c.length){var g;var k=c[1];g=[];if(k)for(var k=k.split(","),h=k.length,m=0;m<h;m++){var l;l=k[m];if(l.match(/^[\w-]+$/)){var n=Da.exec(l.toLowerCase());if(null==n)l="";else{l=n[2];l=null==l||""==l?"n":Ca[l];n=n[1];if(null==n||""==n)n="4";else var r=Ba[n],n=r?r:isNaN(n)?"4":n.substr(0,1);l=[l,n].join("")}}else l="";l&&g.push(l)}0<g.length&&(f=g);3==c.length&&(c=c[2],g=[],c=c?c.split(","):
  g,0<c.length&&(c=Aa[c[0]])&&(a.c[e]=c))}a.c[e]||(c=Aa[e])&&(a.c[e]=c);for(c=0;c<f.length;c+=1)a.a.push(new H(e,f[c]))}};function Fa(a,b){this.c=a;this.a=b}var Ga={Arimo:!0,Cousine:!0,Tinos:!0};Fa.prototype.load=function(a){var b=new C,d=this.c,c=new va(this.a.api,z(d),this.a.text),e=this.a.families;xa(c,e);var f=new za(e);Ea(f);A(d,ya(c),D(b));F(b,function(){a(f.a,f.c,Ga)})};function Ha(a,b){this.c=a;this.a=b}Ha.prototype.load=function(a){var b=this.a.id,d=this.c.m;b?B(this.c,(this.a.api||"https://use.typekit.net")+"/"+b+".js",function(b){if(b)a([]);else if(d.Typekit&&d.Typekit.config&&d.Typekit.config.fn){b=d.Typekit.config.fn;for(var e=[],f=0;f<b.length;f+=2)for(var g=b[f],k=b[f+1],h=0;h<k.length;h++)e.push(new H(g,k[h]));try{d.Typekit.load({events:!1,classes:!1,async:!0})}catch(m){}a(e)}},2E3):a([])};function Ia(a,b){this.c=a;this.f=b;this.a=[]}Ia.prototype.load=function(a){var b=this.f.id,d=this.c.m,c=this;b?(d.__webfontfontdeckmodule__||(d.__webfontfontdeckmodule__={}),d.__webfontfontdeckmodule__[b]=function(b,d){for(var g=0,k=d.fonts.length;g<k;++g){var h=d.fonts[g];c.a.push(new H(h.name,ga("font-weight:"+h.weight+";font-style:"+h.style)))}a(c.a)},B(this.c,z(this.c)+(this.f.api||"//f.fontdeck.com/s/css/js/")+ea(this.c)+"/"+b+".js",function(b){b&&a([])})):a([])};var Y=new pa(window);Y.a.c.custom=function(a,b){return new ua(b,a)};Y.a.c.fontdeck=function(a,b){return new Ia(b,a)};Y.a.c.monotype=function(a,b){return new sa(b,a)};Y.a.c.typekit=function(a,b){return new Ha(b,a)};Y.a.c.google=function(a,b){return new Fa(b,a)};var Z={load:p(Y.load,Y)};"function"===typeof define&&define.amd?define(function(){return Z}):"undefined"!==typeof module&&module.exports?module.exports=Z:(window.WebFont=Z,window.WebFontConfig&&Y.load(window.WebFontConfig));}());
  </script>
  <script>
    var schemaWrapper = {};
    schemaWrapper.components = {};
    schemaWrapper.components.schemas = Object.assign({}, defs);
    defsParser = new $RefParser();
    defsParser.dereference(schemaWrapper).catch(function(err) {
      console.log(err);
    });
  </script>
  <script>
  $(document).ready(function () {
    $('.nav-tabs-examples').find('a:first').tab('show');
    $(this).scrollspy({ target: '#scrollingNav', offset: 18 });
  });
  </script>
</body>
</html>
