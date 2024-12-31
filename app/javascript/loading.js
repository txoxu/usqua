$(document).on('turbo:load', function() {
  var loader = $('.loader-wrap');

  // アニメーションを停止してから非表示にする
  loader.stop(true).fadeOut();

  $('form').on('submit', function(event) {
    loader.stop(true).fadeIn();  // ローディングアニメーションを表示
  });

  // AJAXリクエストの完了時にローディングアニメーションを非表示にする
  $('form').on('ajax:success', function(event, data, status, xhr) {
    loader.stop(true).fadeOut();  // 成功時に非表示
  });

  $('form').on('ajax:error', function(event, xhr, status, error) {
    loader.stop(true).fadeOut();  // エラー時にも非表示
    var errors = xhr.responseJSON.errors;
  });

  // ページの読み込みが完了してなくても2秒後にアニメーションを非表示にする
  setTimeout(function(){
    loader.stop(true).fadeOut();
  }, 1000);
});
