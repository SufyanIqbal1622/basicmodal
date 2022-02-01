// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "Jquery"


$('#products').on('DOMSubtreeModified', function(e){
  $('.modal').modal('hide');
});
