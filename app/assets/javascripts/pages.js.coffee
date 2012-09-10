# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

client_id = ''

fetch_instagram_images = () ->
   instagram_server = "https://api.instagram.com/v1/media/popular"
   $.getJSON instagram_server+ '?client_id='+client_id+'&callback=?', (data) -> render_images_on_page(data)

render_images_on_page = (data) ->
  console.log(['success',data, data.data.length])
  #$('#instagram-popular-feed').text = data
  #(console.log(elem.images.thumbnail.url) for elem in data.data)
  images = ($('<img class="popular-photo" src="'+elem.images.thumbnail.url+'"/>') for elem in data.data)
  $('#popular-feed').append(images)
  

# 

$ ->
  fetch_instagram_images()