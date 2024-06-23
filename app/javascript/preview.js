document.addEventListener("DOMContentLoaded", function() {

  
  const whiskeyForm = document.getElementById("new_whiskey") || document.getElementById("edit_whiskey");

  if (!whiskeyForm) return;

  const previewList = document.querySelector(".image-container #previews");
  const fileField = document.querySelector('input[type="file"][name="whiskey[image]"]');

  if (previewList && previewList.innerHTML.trim() !== "") {
    // 既に画像が表示されている場合の処理
    previewList.style.display = "block";
  }

  fileField.addEventListener("change", function(e) {
    const alreadyPreview = document.querySelector(".preview");
    if (alreadyPreview) {
      alreadyPreview.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement("div");
    previewWrapper.setAttribute("class", "preview");

    const previewImage = document.createElement("img");
    previewImage.setAttribute("class", "preview-image");
    previewImage.setAttribute("src", blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
    previewList.style.display = "block";
  });
});
