
library(jsonlite)
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)


##code adapted from Heather Geiger

#setwd("C:/Users/kevin/Documents/GitHub/TAD_2021/R lessons/")


NYTIMES_KEY <- ("TGHzpf8HPbRLb9eSN9PHFUtGg3TLf5og")

term <- "facebook"
begin_date <- "20200101"
end_date <- "20200401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2020 <- vector("list",length=5)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame() 
  pages_2020[[i+1]] <- nytSearch 
  Sys.sleep(10) #I was getting errors more often when I waited only 1 second between calls. 5 seconds seems to work better.
}
facebook_2020_articles <- rbind_pages(pages_2020)



term <- "facebook"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=5)

for(i in 0:5){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
facebook_2021_articles <- rbind_pages(pages_2021)





#####in-class practice: 


### save the results of two different queries from the date range jan 1 2021 - APril 1 2021
term <- "coffee"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=5)

for(i in 0:5){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
coffee_2021_articles <- rbind_pages(pages_2021)

term <- "tea"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=5)

for(i in 0:5){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
tea_2021_articles <- rbind_pages(pages_2021)


### calculate the proportion of the headlines from each search term assigned to a given section name
table(coffee_2021_articles$response.docs.section_name)
table(tea_2021_articles$response.docs.section_name)

## create a combined dfm with the text of all of the lead paragraphs
coffee_dfm <- dfm(coffee_2021_articles$response.docs.lead_paragraph, stem = TRUE, remove_punct = TRUE, remove = stopwords("english"))
tea_dfm <- dfm(tea_2021_articles$response.docs.lead_paragraph, stem = TRUE, remove_punct = TRUE, remove = stopwords("english"))

## calculate the average Flesch Reading Ease score (hint: use code from descriptive_2.R) for the lead paragraphs from each search term. Which is higher?
coffee <- textstat_readability(coffee_2021_articles$response.docs.lead_paragraph)
tea <- textstat_readability(tea_2021_articles$response.docs.lead_paragraph)
mean(coffee$Flesch)
mean(tea$Flesch)
