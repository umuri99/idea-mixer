//Viewport
var spWidth = 500;
var baseW = 1100;
var currentWidth = window.innerWidth;
$(function () { updateMetaViewport(); });
function updateMetaViewport() {
  var viewportContent;
  var w = window.outerWidth;
  var cw = document.documentElement.clientWidth;
  if (!w) {
    w = cw;
  }
  if (w > spWidth) {
    viewportContent = "width=" + baseW + ",minimum-scale=1.0,maximum-scale=1, user-scalable=no";
  } else {
    viewportContent = "width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1, user-scalable=no";
  }
  document.querySelector("meta[name='viewport']").setAttribute("content", viewportContent);
}

/*resize*/
window.addEventListener("resize", function () {
  if (currentWidth == window.innerWidth) {
    return;
  }
  currentWidth = window.innerWidth;
  updateMetaViewport();
});
window.addEventListener("orientationchange", function () {
  if (currentWidth == window.innerWidth) {
    return;
  }
  currentWidth = window.innerWidth;
  updateMetaViewport();
});


//turbolinks用イベントリスナー
document.addEventListener("turbolinks:load", function () {

  //タブレット表示をPC画面ベースでサイズを合わせる
  updateMetaViewport();

  //ハンバーガーメニュー起動用
  $('#menu_btn').click(function () {
    $(this).toggleClass('active');
    $('#drawer').toggleClass('active');
  });

});

/*--------------------------------------------------------------------------*
 *
 *  footerFixed.js
 *
 *  MIT-style license.
 *
 *  2007 Kazuma Nishihata [to-R]
 *  http://blog.webcreativepark.net
 *
 *--------------------------------------------------------------------------*/

new function () {

  var footerId = "footer";
  //メイン
  function footerFixed() {
    //ドキュメントの高さ
    var dh = document.getElementsByTagName("body")[0].clientHeight;
    //フッターのtopからの位置
    document.getElementById(footerId).style.top = "0px";
    var ft = document.getElementById(footerId).offsetTop;
    //フッターの高さ
    var fh = document.getElementById(footerId).offsetHeight;
    //ウィンドウの高さ
    if (window.innerHeight) {
      var wh = window.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight != 0) {
      var wh = document.documentElement.clientHeight;
    }
    if (ft + fh < wh) {
      document.getElementById(footerId).style.position = "relative";
      document.getElementById(footerId).style.top = (wh - fh - ft - 1) + "px";
    }
  }

  //文字サイズ
  function checkFontSize(func) {

    //判定要素の追加
    var e = document.createElement("div");
    var s = document.createTextNode("S");
    e.appendChild(s);
    e.style.visibility = "hidden"
    e.style.position = "absolute"
    e.style.top = "0"
    document.body.appendChild(e);
    var defHeight = e.offsetHeight;

    //判定関数
    function checkBoxSize() {
      if (defHeight != e.offsetHeight) {
        func();
        defHeight = e.offsetHeight;
      }
    }
    setInterval(checkBoxSize, 1000)
  }

  //イベントリスナー
  function addEvent(elm, listener, fn) {
    try {
      elm.addEventListener(listener, fn, false);
    } catch (e) {
      elm.attachEvent("on" + listener, fn);
    }
  }
  document.addEventListener("turbolinks:load", function () {
    footerFixed();
    checkFontSize(footerFixed);
  });
  addEvent(window, "resize", footerFixed);

}
