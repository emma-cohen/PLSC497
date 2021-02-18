# Descriptive practice


#1. Write two sentences. Save each as a separate object in R. 

require(quanteda)
sent1 <- "I like to eat ice cream when I am hungry."
sent2 <- "I do not like doing the dishes when I am tired."

#2. Combine them into a corpus
txt <-c(sent1, sent2)
corpus_txt<-corpus(txt)
corpus_txt

#3. Make this corpus into a dfm with all pre-processing options at their defaults.
dfm_txt <- dfm(corpus_txt)
dfm_txt

#4. Now save a second dfm, this time with stopwords removed.
dfm_txt2 <- dfm(corpus_txt, remove=stopwords("english"))
dfm_txt2

#5. Calculate the TTR for each of these dfms (use textstat_lexdiv). Which is higher?
textstat_lexdiv(dfm_txt)
textstat_lexdiv(dfm_txt2)

#6. Calculate the Manhattan distance between the two sentences you've constructed (by hand!)
