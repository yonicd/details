library(magick)
library(bunny)

hex_canvas <- image_canvas_hex(border_color="#000000", border_size = 2, 
                               fill_color = "#FFFFFF")
hex_border <- image_canvas_hexborder(border_color="#000000", border_size = 3)

img_hex <- hex_canvas %>%
  magick::image_annotate("<", size=450, gravity = "center", 
                         font = "Fira Code", color = "#000000",
                         location = '-675-50')%>%
  magick::image_annotate(">", size=450, gravity = "center", 
                         font = "Fira Code", color = "#000000",
                         location = '+675-50')%>%
  magick::image_annotate("details", size=450, gravity = "center", 
                         font = "Black Jack", color = "#0d4448")%>%
  bunny::image_compose(hex_border, gravity = "center", operator = "Over")
  

img_hex %>%
  magick::image_scale("200x200")%>%
  magick::image_write(here::here("input", "logo.png"), density = 600)

img_hex %>%
  magick::image_scale("100x100")%>%
  magick::image_write(here::here("input", "pkgdown.png"), density = 600)

img_hex%>%
magick::image_scale("1200x1200") %>%
magick::image_write(here::here("input", "hex.png"), density = 600)


img_hex_gh <- img_hex %>%
  image_scale("400x400")

gh_logo <- bunny::github %>%
  image_scale("50x50")

gh <- image_canvas_ghcard() %>%
  image_compose(img_hex_gh, gravity = "East", offset = "+40+0") %>%
  image_annotate("Saying More With Less", gravity = "West", location = "+50-30",
                 color="#0d4448", size=60, font="Aller", weight = 700) %>%
  image_compose(gh_logo, gravity="West", offset = "+50+40") %>%
  image_annotate("yonicd/details", gravity="West", location="+110+45",
                 size=50, font="Ubuntu Mono") %>%
  image_border_ghcard("#ede6f2")

gh %>%
  image_write(here::here("input", "details_ghcard.png"))
