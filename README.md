Indtil videre ikke så mange, men om lidt udelukkende fra vores
kursussystem.

    TEST_SECRET <- Sys.getenv("TEST_SECRET")
    print(TEST_SECRET)

    ## [1] ""

    json_files <- list.files(path = "data/", full.names = T)

første forsøg på et kort!

    json_files %>% map_dfr(fromJSON) %>% 
      select(name, coordinates) %>% 
      unnest(c(name, coordinates)) %>% 
      unnest(c(lat, lon)) %>% 
      mutate(lat = lat + .01,
             lng = lon + 0.01) %>% 
      select(lat, lng) %>% 
      leaflet() %>% 
      addTiles() %>% 
      addMarkers()

<div id="htmlwidget-30bc5c2db8511b54969f" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-30bc5c2db8511b54969f">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[[57.01,57.01],[11.01,11.01],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},null,null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[57.01,57.01],"lng":[11.01,11.01]}},"evals":[],"jsHooks":[]}</script>
