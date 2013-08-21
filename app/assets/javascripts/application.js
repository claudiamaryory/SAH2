// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require autocomplete-rails
//= require lazybox
//= require jquery.remotipart
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {
  
  //$('a#show_solicitud_servicio_link').lazybox({closeImg: true});
  
  $('a[rel*=lazybox]').lazybox({close: true, modal: true, opacity: 0.7, klass: 'lazybox', speed: 200,closeImg: true});
  //$.lazybox.settings = {cancelClass: "button green", submitClass: 'button red', closeImg: false, niceClose: false}
  $.rails.allowAction = $.lazybox.confirm;

//configurar el datepicker para elegir con mayor facilidad el año y el mes de la fecha


// aquí debemos configurar todos los campos de autocompletado que requiramos en la aplicación
$('#cliente_barrio_nombre').bind('railsAutocomplete.select', function(event, data){
$("#barrio_id").attr("value",data.item.id);



});
});


