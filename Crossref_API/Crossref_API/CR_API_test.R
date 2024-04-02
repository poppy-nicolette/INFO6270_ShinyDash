library(rcrossref) 
library(htmltools)
library(magrittr)
library(purrr)
library(DT) 
library(tidyr)
library(dplyr)

inputDOI = "10.1007/s11192-012-0662-4"
cr_result <- cr_works(dois = inputDOI) %>% 
  pluck("data")
cr_result %>%
  datatable(cr_result)

#https://ciakovx.github.io/rcrossref.html#Unnesting_list_columns

# just authors
authors <- cr_result %>%
  dplyr::select(author, doi, issn) %>%
  tidyr::unnest(author, .drop = TRUE)

datatable(authors)

references <- cr_result %>%
  dplyr::select(reference, doi)%>%
  tidyr::unnest(reference,.drop=FALSE)

datatable(references)

licenses <- cr_result %>%
  dplyr::select(license, doi)%>%
  tidyr::unnest(license, .drop = FALSE)
datatable(licenses)

