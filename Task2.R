library("wordcloud")
library("ggplot2")
library("RWeka")
library("RColorBrewer")

#setwd(".")
#source('Task1.R')

# Exploratory Analysis without stopwords

# Create Document Term Matrix
#dtm_all <- DocumentTermMatrix(corpusAllClean)
#dtm_all_base <- DocumentTermMatrix(basecorpusAllClean)

# Frequency
#frequencyWords <- sort(colSums(as.matrix(dtm_all)), decreasing=TRUE) 
#set.seed(100)   
#wordcloud(names(frequencyWords), frequencyWords, max.words=50, rot.per=0.2, colors=brewer.pal(8, "Dark2")) 
#top10 <- head(frequencyWords, 10)
#top10Words <- data.frame(word=names(top10), freq=top10) 
#ggplot(top10Words, aes(word, freq)) + geom_bar(stat="identity",fill="#bafa00") + ggtitle("Top 10 word frequency") + xlab("Word") + ylab("Fequency") + labs(colour = "Cylinders") 

#rm(top10Words, top10, frequencyWords)

# NGrams Token
createDTM <- function(corpus, gram){
  dtm <- DocumentTermMatrix(corpus, control = list(tokenize = gram))
}
# Creating Gram functions
OneGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
BiGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
TriGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
QuadGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
CinGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 5, max = 5))
# Get 1-gram, 2-grams and 3-grams data sets for news, blogs, twitter and global data
#dtmTwitter1g <- createDTM(corpusTwitterClean, OneGramTokenizer)
#dtmTwitter2g <- createDTM(corpusTwitterClean, BiGramTokenizer)
#dtmTwitter3g <- createDTM(corpusTwitterClean, TriGramTokenizer)
#dtmNews1g <- createDTM(corpusNewsClean, OneGramTokenizer)
#dtmNews2g <- createDTM(corpusNewsClean, BiGramTokenizer)
#dtmNews3g <- createDTM(corpusNewsClean, TriGramTokenizer)
#dtmBlogs1g <- createDTM(corpusBlogsClean, OneGramTokenizer)
#dtmBlogs2g <- createDTM(corpusBlogsClean, BiGramTokenizer)
#dtmBlogs3g <- createDTM(corpusBlogsClean, TriGramTokenizer)
gc()
dtmAll1g <- createDTM(corpusAllClean, OneGramTokenizer)
dtmAll2g <- createDTM(corpusAllClean, BiGramTokenizer)
dtmAll3g <- createDTM(corpusAllClean, TriGramTokenizer)
dtmAll4g <- createDTM(corpusAllClean, QuadGramTokenizer)
dtmAll5g <- createDTM(corpusAllClean, CinGramTokenizer)
rm(OneGramTokenizer, BiGramTokenizer, TriGramTokenizer, QuadGramTokenizer, CinGramTokenizer, createDTM)
#getFreqTerms <- function(dtm, frequency){
  # Remove low frequency terms
#  freqTerms <- findFreqTerms(dtm, frequency)
#  freq <- colSums(as.matrix(dtm[, freqTerms]))
  
  #Create data frame with frequent terms
#  df <- data.frame(word=names(freq), freq=freq)
#  dfOrder <- df[order(df$freq, decreasing = TRUE), ]
#  dfOrder
#}

#freqTwitter1g <- getFreqTerms(dtmTwitter1g, 20)
#freqNews1g <- getFreqTerms(dtmNews1g, 10)
#freqBlogs1g <- getFreqTerms(dtmBlogs1g, 10)
#freqAll1g <- getFreqTerms(dtmAll1g, 500)

#freqTwitter2g <- getFreqTerms(dtmTwitter2g, 10)
#freqNews2g <- getFreqTerms(dtmNews2g, 5)
#freqBlogs2g <- getFreqTerms(dtmBlogs2g, 5)
#freqAll2g <- getFreqTerms(dtmAll2g, 250)

#freqTwitter3g <- getFreqTerms(dtmTwitter3g, 5)
#freqNews3g <- getFreqTerms(dtmNews3g, 3)
#freqBlogs3g <- getFreqTerms(dtmBlogs3g, 3)
#freqAll3g <- getFreqTerms(dtmAll3g, 50)

#rm(dtmAll1g, dtmAll2g, dtmAll3g)

#Plot histograms of the n-gram data sets.
#plotFreqTerms <- function(wfOrder, numberTerms){
#  p <- ggplot(wfOrder[1:numberTerms, ], aes(word, freq, fill=freq))
#  p <- p + geom_bar(stat='identity')
#  p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
#  p
#}

#plotFreqTerms(freqTwitter1g, 20)
#plotFreqTerms(freqNews1g, 20)
#plotFreqTerms(freqBlogs1g, 20)
#plotFreqTerms(freqAll1g, 20)
#plotFreqTerms(freqTwitter2g, 20)
#plotFreqTerms(freqNews2g, 20)
#plotFreqTerms(freqBlogs2g, 20)
#plotFreqTerms(freqAll2g, 20)

#plotFreqTerms(freqTwitter3g, 20)
#plotFreqTerms(freqNews3g, 20)
#plotFreqTerms(freqBlogs3g, 20)
#plotFreqTerms(freqAll3g, 20)

#rm(freqAll1g, freqAll2g, freqAll3g)