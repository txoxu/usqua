document.addEventListener('turbo:load', function() {
  // 評価項目に共通のRaty設定を適用
  $('.whiskey-star-rating').each(function() {
    var category = $(this).data('category'); // data-category属性からカテゴリ名を取得
    var score = $(this).data('score');

    $(this).raty({
      score: score,
      scoreName: category,
      hints: {
        'aroma': ['良くない', '少し悪い', '普通', '良い', 'とても良い'],
        'flavor': ['薄い', 'やや薄い', '普通', '良い', 'とても良い'],
        'balance': ['バランスが悪い', '少しバランスが悪い', 'バランスが取れている', '良いバランス', '完璧なバランス'],
        'body': ['薄い', '軽い', '中程度', '濃い', '非常に濃い'],
        'finish': ['短い', 'やや短い', '普通', '長い', '非常に長い']
      }[category], // 各カテゴリに対して異なるヒントを指定
      cancelHint: 'リセット',
      cancelButton: true,
      half: true,
      halfShow: true,
      cancelOn: 'https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/images/cancel-on.png',
      cancelOff: 'https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/images/cancel-off.png',
      starOn: 'https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/images/star-on.png',
      starHalf: 'https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/images/star-half.png',
      starOff: 'https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/images/star-off.png',
      click: function(score) {
        $('#' + category + '-value').val(score || 0);  // 選択した値をhidden_fieldに設定
      }
    });
  });
});
