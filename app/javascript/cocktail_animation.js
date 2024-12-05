document.addEventListener("turbo:load", function() {
  const cocktailsData = document.querySelectorAll('.cocktail-data');
  
  for (let i = 0; i < cocktailsData.length; i++) {

   const keyframes = {
      opacity: [0, 1],
      rotate: ['x 90deg', 0],
    };

   const options = {
      duration: 1000,
      delay: i * 500,
      fill: 'forwards',
    };

    cocktailsData[i].animate(keyframes, options);
  };
});
