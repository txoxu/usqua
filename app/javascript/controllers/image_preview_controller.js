// app/javascript/controllers/image_preview_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview"];

  connect() {
    if (!this.hasInputTarget || !this.hasPreviewTarget) return;

    this.inputTarget.addEventListener('change', this.previewImage.bind(this));
  }

  previewImage(event) {
    const file = event.target.files[0];
    if (!file) return;

    // Remove existing preview if any
    if (this.hasPreviewTarget) {
      this.previewTarget.innerHTML = '';
    }

    // Create URL for the selected file
    const blob = window.URL.createObjectURL(file);

    // Create an img element and set its src to the blob URL
    const img = document.createElement('img');
    img.setAttribute('src', blob);
    img.setAttribute('class', 'preview-image');

    // Append the img element to the preview target
    this.previewTarget.appendChild(img);
  }
}
