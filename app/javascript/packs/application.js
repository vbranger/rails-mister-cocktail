// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap';
import { initSortable } from '../components/doses'
import { initTypeJs } from '../components/banner'
import Typed from 'typed.js';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  // [...]
  initSortable();
  initTypeJs();
});


var options = {
  strings: ["Guess the name of these cocktails^2000", "Hover on it to display solution^2000"],
  // ['<i>First</i> sentence.', '&amp; a second sentence.'],
  typeSpeed: 40,
  loop: true,
  loopCount: Infinity
};

var typed = new Typed('#banner-typed-text', options);