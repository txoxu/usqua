$(document).on('turbo:load', function() {
  var loader = $('.loader-wrap');

  // アニメーションを停止してから非表示にする
  loader.stop(true).fadeOut();

  // ページの読み込みが完了してなくても2秒後にアニメーションを非表示にする
  setTimeout(function(){
    loader.stop(true).fadeOut();
  }, 1000);


});
