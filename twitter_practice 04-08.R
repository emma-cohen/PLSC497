##### R Task


## Pick your favorite celebrity who has a Twitter account. 
#Nick Jonas

## find the most recent tweet the celebrity liked
nick_favs <- get_favorites("nickjonas", n = 1)
#Get your questions in for @nickjonas who'll be answering some of them in an hour! https://t.co/SMAGbvkpfO

##Download their 500 most recent tweets. 
#Calculate which one got the most ``likes"
nick_tweets <- get_timelines("nickjonas", n = 500)
nick_mostliked <- which.max(nick_tweets$favorite_count)
#I've been to the year 3000 not much has changed, except everyone was wearing a mask.

### Create a DFM from the text of these tweets
library(quanteda)
nick_tweets_text <- nick_tweets$text
nick_tweets_dfm <- corpus(nick_tweets_text)
nick_tweets_dfm <- tokens(nick_tweets_dfm,remove_punct = TRUE)
nick_tweets_dfm <- dfm(nick_tweets_dfm,remove=stopwords("english"))

### After removing stopwords, what word did the celebrity tweet most often?
topfeatures(nick_tweets_dfm,1)
# "#teamnick"