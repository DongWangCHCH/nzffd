library(data.table)
old=fread("Non-migratory_Freshwater_Fish_Distribution_old.csv")
new=fread("Non-migratory_Freshwater_Fish_Distribution_new.csv")
newsp=merge(old, new, by="Location_number")
names(newsp)
newsp2=newsp[, c("Location_number",        
"spciesNameDong",      "OBJECTID.y",          "Species.y",          
"Vernacular.y",        "Catchment.y",         "Location_Gazetted.y", "Location_DOC_name.y",
 "DOC_Region.y",        "DOC_District.y",      "Regional_Council.y",  "District_Council.y", 
"Status.y" ,           "Spatial_order.y",     "Updated.y" ,          "Perimeter.y" ,       
 "SHAPE_Length.y",      "SHAPE_Area.y" )]

library(dplyr)

newsp3=newsp2 %>% 
  rename_at(.vars = vars(ends_with(".y")),
            .funs = funs(sub("[.]y$", "", .)))

write.csv(newsp3,"Non-migratory_Freshwater_Fish_Distribution.csv",row.names =F)
