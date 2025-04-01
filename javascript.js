document.addEventListener('DOMContentLoaded', function() {
  // Target the footer element in Reveal.js
  var footer = document.querySelector('.reveal .footer');
  
  // Check if the footer exists and then modify its font size and padding
  if (footer) {
    footer.style.fontSize = '10px';  // Set your desired font size
    footer.style.padding = '5px';    // Adjust the padding if needed
  }
});