magick::image_read("media/simpsons.png") |>
  magick::image_resize(geometry = "1280x640") |>
  magick::image_write(path = "media/social-media-card.png")
