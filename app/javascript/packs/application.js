require("channels")
require('@lottiefiles/lottie-player')
require("@rails/activestorage").start()
require("@rails/ujs").start()
require("turbolinks").start()

// External imports
import 'bootstrap';
import 'controllers';
import AOS from 'aos';
import { previewImage } from '../plugins/preview_image';
import { initFilter } from '../plugins/init_filter';

// Turbolinks load
document.addEventListener("turbolinks:load", function() {
  initFilter();
  AOS.init();
});



/*document.addEventListener('DOMContentLoaded', function() {
  AOS.init({
    startEvent: 'turbolinks:load' // if you are using turbolinks
  });
});
window.addEventListener('load', AOS.refresh)*/

