document.addEventListener('turbo:load', function() {
//監視対象が範囲に入ったら動作
const showMypage = (entries) => {
  const keyframes = {
    opacity: [0, 1],
    translate: ['600px 0', 0],
  };
  entries.forEach(entry => {
    if (entry.isIntersecting) {
    entry.target.animate(keyframes, 600); // 監視対象ごとにアニメーションを適用
    }
  });
};

//オプション設定
const options = {
  threshold: 0.1
};

//監視ロボットの設定
const mypageObserver =  new IntersectionObserver(showMypage, options);

//監視するように指示
mypageObserver.observe(document.querySelector('#mypage'));
mypageObserver.observe(document.querySelector('#new-whiskey'));
mypageObserver.observe(document.querySelector('#index-cocktail'));
mypageObserver.observe(document.querySelector('#distillery'));
});
