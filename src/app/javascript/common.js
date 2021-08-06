var currentWidth = window.innerWidth;
var spWidth = 500;

/*--------------------------------------------------------------------------*
 *  footerFixed.js
 *  MIT-style license.
 *  2007 Kazuma Nishihata [to-R]
 *  http://blog.webcreativepark.net
 *--------------------------------------------------------------------------*/
new function () { var d = "footer"; function a() { var g = document.getElementsByTagName("body")[0].clientHeight; document.getElementById(d).style.top = "0px"; var h = document.getElementById(d).offsetTop; var e = document.getElementById(d).offsetHeight; if (window.innerHeight) { var f = window.innerHeight } else { if (document.documentElement && document.documentElement.clientHeight != 0) { var f = document.documentElement.clientHeight } } if (h + e < f) { document.getElementById(d).style.position = "relative"; document.getElementById(d).style.top = (f - e - h - 1) + "px" } } function b(h) { var i = document.createElement("div"); var g = document.createTextNode("S"); i.appendChild(g); i.style.visibility = "hidden"; i.style.position = "absolute"; i.style.top = "0"; document.body.appendChild(i); var f = i.offsetHeight; function j() { if (f != i.offsetHeight) { h(); f = i.offsetHeight } } setInterval(j, 1000) } function c(i, g, f) { try { i.addEventListener(g, f, false) } catch (h) { i.attachEvent("on" + g, f) } } c(window, "load", a); c(window, "load", function () { b(a) }); c(window, "resize", a) };

/*! npm.im/object-fit-images 3.2.4 */
var objectFitImages = function () { "use strict"; function t(t, e) { return "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='" + t + "' height='" + e + "'%3E%3C/svg%3E" } function e(t) { if (t.srcset && !p && window.picturefill) { var e = window.picturefill._; t[e.ns] && t[e.ns].evaled || e.fillImg(t, { reselect: !0 }), t[e.ns].curSrc || (t[e.ns].supported = !1, e.fillImg(t, { reselect: !0 })), t.currentSrc = t[e.ns].curSrc || t.src } } function i(t) { for (var e, i = getComputedStyle(t).fontFamily, r = {}; null !== (e = u.exec(i));)r[e[1]] = e[2]; return r } function r(e, i, r) { var n = t(i || 1, r || 0); b.call(e, "src") !== n && h.call(e, "src", n) } function n(t, e) { t.naturalWidth ? e(t) : setTimeout(n, 100, t, e) } function c(t) { var c = i(t), o = t[l]; if (c["object-fit"] = c["object-fit"] || "fill", !o.img) { if ("fill" === c["object-fit"]) return; if (!o.skipTest && f && !c["object-position"]) return } if (!o.img) { o.img = new Image(t.width, t.height), o.img.srcset = b.call(t, "data-ofi-srcset") || t.srcset, o.img.src = b.call(t, "data-ofi-src") || t.src, h.call(t, "data-ofi-src", t.src), t.srcset && h.call(t, "data-ofi-srcset", t.srcset), r(t, t.naturalWidth || t.width, t.naturalHeight || t.height), t.srcset && (t.srcset = ""); try { s(t) } catch (t) { window.console && console.warn("https://bit.ly/ofi-old-browser") } } e(o.img), t.style.backgroundImage = 'url("' + (o.img.currentSrc || o.img.src).replace(/"/g, '\\"') + '")', t.style.backgroundPosition = c["object-position"] || "center", t.style.backgroundRepeat = "no-repeat", t.style.backgroundOrigin = "content-box", /scale-down/.test(c["object-fit"]) ? n(o.img, function () { o.img.naturalWidth > t.width || o.img.naturalHeight > t.height ? t.style.backgroundSize = "contain" : t.style.backgroundSize = "auto" }) : t.style.backgroundSize = c["object-fit"].replace("none", "auto").replace("fill", "100% 100%"), n(o.img, function (e) { r(t, e.naturalWidth, e.naturalHeight) }) } function s(t) { var e = { get: function (e) { return t[l].img[e ? e : "src"] }, set: function (e, i) { return t[l].img[i ? i : "src"] = e, h.call(t, "data-ofi-" + i, e), c(t), e } }; Object.defineProperty(t, "src", e), Object.defineProperty(t, "currentSrc", { get: function () { return e.get("currentSrc") } }), Object.defineProperty(t, "srcset", { get: function () { return e.get("srcset") }, set: function (t) { return e.set(t, "srcset") } }) } function o() { function t(t, e) { return t[l] && t[l].img && ("src" === e || "srcset" === e) ? t[l].img : t } d || (HTMLImageElement.prototype.getAttribute = function (e) { return b.call(t(this, e), e) }, HTMLImageElement.prototype.setAttribute = function (e, i) { return h.call(t(this, e), e, String(i)) }) } function a(t, e) { var i = !y && !t; if (e = e || {}, t = t || "img", d && !e.skipTest || !m) return !1; "img" === t ? t = document.getElementsByTagName("img") : "string" == typeof t ? t = document.querySelectorAll(t) : "length" in t || (t = [t]); for (var r = 0; r < t.length; r++)t[r][l] = t[r][l] || { skipTest: e.skipTest }, c(t[r]); i && (document.body.addEventListener("load", function (t) { "IMG" === t.target.tagName && a(t.target, { skipTest: e.skipTest }) }, !0), y = !0, t = "img"), e.watchMQ && window.addEventListener("resize", a.bind(null, t, { skipTest: e.skipTest })) } var l = "fregante:object-fit-images", u = /(object-fit|object-position)\s*:\s*([-.\w\s%]+)/g, g = "undefined" == typeof Image ? { style: { "object-position": 1 } } : new Image, f = "object-fit" in g.style, d = "object-position" in g.style, m = "background-size" in g.style, p = "string" == typeof g.currentSrc, b = g.getAttribute, h = g.setAttribute, y = !1; return a.supportsObjectFit = f, a.supportsObjectPosition = d, o(), a }();

window.addEventListener('load', function () {
  objectFitImages();
});

//Viewport
var baseW = 950;
$(function () { updateMetaViewport(); });
function updateMetaViewport() {
  var viewportContent;
  var w = window.outerWidth;
  var cw = document.documentElement.clientWidth;
  if (!w) {
    w = cw;
  }
  if (w > spWidth) {
    viewportContent = "width=" + baseW;
  } else {
    viewportContent = "width=device-width,initial-scale=1.0,minimum-scale=1.0";
  }
  document.querySelector("meta[name='viewport']").setAttribute("content", viewportContent);
  pcspImg();
}


/*resize*/
window.addEventListener("resize", function () {
  if (currentWidth == window.innerWidth) {
    return;
  }
  currentWidth = window.innerWidth;
  updateMetaViewport();
  pcspImg();
});
window.addEventListener("orientationchange", function () {
  if (currentWidth == window.innerWidth) {
    return;
  }
  currentWidth = window.innerWidth;
  updateMetaViewport();
  pcspImg();
});



//Animate.css用
$(window).on('load scroll', function () {
  var elem = $('.animated');
  elem.each(function () {
    var isAnimate = $(this).data('animate');
    var elemOffset = $(this).offset().top;
    var elemHeight = $(this).height();
    var scrollPos = $(window).scrollTop();
    var wh = $(window).height();

    var aniAnchor = wh / 6;
    var dataAnchor = $(this).attr('data-animate-anchor');
    if (dataAnchor == 0) {
      var aniAnchor = 0;
    } else if (dataAnchor && $.isNumeric(dataAnchor)) {
      var aniAnchor = wh / dataAnchor;
    }

    if (dataAnchor == 'bottom') {
      if (elemOffset + elemHeight < wh + scrollPos) {
        if (isAnimate) { $(this).addClass(isAnimate); }
        $(this).addClass('move');
      }
    } else {
      if (scrollPos > elemOffset - wh + aniAnchor) {
        if (isAnimate) { $(this).addClass(isAnimate); }
        $(this).addClass('move');
      }
    }
  });
});

$(function () {

  //ハンバーガーメニュー起動用
  $('#menu_btn').click(function () {
    $(this).toggleClass('active');
    $('#drawer').toggleClass('active');
  });

});
