document.addEventListener('turbo:load', function() {
  // 評価項目に共通のRaty設定を適用
  $('.cocktail-star-rating').each(function() {
    var category = $(this).data('category'); // data-category属性からカテゴリ名を取得
    var score = $(this).data('score');

    $(this).raty({
      score: score,
      scoreName: category,
      hints:{
              'aroma': ['良くない', '少し悪い', '普通', '良い', 'とても良い'],
              'flavor': ['薄い', 'やや薄い', '普通', '良い', 'とても良い'],
              'appearance': ['悪い', '少し悪い', '普通', 'キレイ', '非常にキレイ'],
              'mouthfeel': ['悪い', '微妙', '普通', '良い', '最高'],
              'finish': ['良くない', '微妙', '普通', '良い', '最高']
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
