# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  for elem in document.getElementsByClassName("accordion")
    do (elem) ->
      elem.onclick = `function(){
          /* Toggle between adding and removing the "active" class,
           to highlight the button that controls the panel */
          this.classList.toggle("active");

          /* Toggle between hiding and showing the active panel */
          var panel = this.nextElementSibling;
          panel.style.display = (panel.style.display === "block") ? "none" : "block";

      }`;

$(document).ready(ready)
$(document).on("turbolinks:load", ready);