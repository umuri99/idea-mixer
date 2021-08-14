//スマホやタブレットの２本指以上の操作を禁止
document.addEventListener('touchstart', event => {
  if (event.touches.length > 1) {
    event.preventDefault();
  }
}, true);

//スマホやタブレットのダブルタップイベントを禁止する
let lastTouch = 0;
document.addEventListener('touchend', event => {
  const now = window.performance.now();
  if (now - lastTouch <= 500) {
    event.preventDefault();
  }
  lastTouch = now;
}, true);

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
