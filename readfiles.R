# indlæs filer

json_files <- list.files(path = "data/", full.names = T)
json_files <- json_files[!grepl("template.json", json_files)]
labdata <- json_files %>% 
  map_dfr(fromJSON) %>% 
  add_rownames()
saveRDS(labdata, file = "labdata.rds")
