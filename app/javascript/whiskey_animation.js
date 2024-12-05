document.addEventListener('turbo:load', function() {
 const whiskeysData = document.querySelectorAll('.whiskey-data');

  for (let i = 0; i < whiskeysData.length; i++) {

    const keyframes = {
      opacity: [0, 1],
      rotate: ['x 90deg', 0],
    };

    const options = {
      duration: 1000,
      delay: i * 500,
      fill: 'forwards',
    };

    whiskeysData[i].animate(keyframes, options);
  };
});
