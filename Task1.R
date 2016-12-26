library("tm")
library("data.table")
library("RCurl")
library("SnowballC")
library("stringi")

setwd(".")

# Get Data
unzipped_dir <- "../Coursera-SwiftKey/final/en_US/"
unzipped_twitter_file <- paste(unzipped_dir, "en_US.twitter.txt", sep = "")
unzipped_news_file <- paste(unzipped_dir, "en_US.news.txt", sep = "")
unzipped_blogs_file <- paste(unzipped_dir, "en_US.blogs.txt", sep = "")
if (!file.exists(unzipped_blogs_file) |
    !file.exists(unzipped_twitter_file) |
    !file.exists(unzipped_news_file)) {
   zipfile <- "../Coursera-SwiftKey.zip"
   if (!file.exists(zipfile)) {
      url <- download.file("http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip", 
             destfile = zipfile, mode = "wb")
    }
  unzip(zipfile, exdir = "../Coursera-SwiftKey")
  rm(zipfile)
}

# Pointers to different files, directory and Open connections
p_dir <- file.path("..","Coursera-SWiftkey", "final", "en_US")
p_twitter <- file.path("..","Coursera-SWiftkey", "final", "en_US", "en_US.twitter.txt")
p_news <- file.path("..","Coursera-SWiftkey", "final", "en_US", "en_US.news.txt")
p_blogs <- file.path("..","Coursera-SWiftkey", "final", "en_US", "en_US.blogs.txt")
badwords <- "data/badwords.txt"
#con_twitter <- file(p_twitter, open = "rb")
#con_news <- file(p_news, open = "rb")
#con_blogs <- file(p_blogs, open = "rb")

rm(unzipped_dir, unzipped_twitter_file, unzipped_blogs_file, unzipped_news_file) 

# Get badwords
if (!file.exists(badwords)) {
  url <- "https://raw.githubusercontent.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/en"
  bad_word <- getURL(url)
  bad_word <- readLines(textConnection(bad_word))
  writeLines(bad_word, "data/badwords.txt")
}

# Size of each files
file.info(p_twitter)$size / 1024^2
file.info(p_news)$size / 1024^2
file.info(p_blogs)$size / 1024^2
#twitter <- readLines(con_twitter, warn = F)
#news <- readLines(con_news,encoding= "UTF-8", warn = F)
#blogs <- readLines(con_blogs,encoding= "UTF-8", warn = F)
documents <- Corpus(DirSource(p_dir))
inspect(documents)
#corpusAll <- paste(twitter, news, blogs)
#close(con_twitter)
#close(con_news)
#close(con_blogs)

# Basic analysis of each file
documentCount <- function(doc) {
  c(length(doc), sum(stri_count(doc, regex='\\S+')), sum(nchar(doc)))
}
documentSummary <- function(docs) {
  summaryTable <- data.frame()
  rowNames <-c()
  for (i in seq(docs)) {
    summaryTable <- rbind(summaryTable, documentCount(docs[[i]]$content))
    rowNames <- c(rowNames, docs[[i]]$meta$id)
  }
  row.names(summaryTable) <- rowNames
  names(summaryTable) <- c("Lines", "Words", "Chars")
  summaryTable
}
print(documentSummary(documents))
#length(twitter)
#length(news)
#length(blogs)

# Sampling due to resources contraint, we will train only with 10%
set.seed(100)
#getSampledData <- function(data, samplePercent){
#  sampleSize <- floor(length(data) * samplePercent / 100)
#  dataIndex <- sample(c(1:length(data)), size = sampleSize)
#  sampledData <- data[dataIndex]
#  sampledData
#}
#r_twitter <- getSampledData(twitter, 0.5)
#r_news <- getSampledData(news, 0.5)
#r_blogs <- getSampledData(blogs, 0.5)
sampleRatio <- 0.06
r_all <- documents
for(i in seq(r_all)) {
  r_all[[i]]$content <- sample(r_all[[i]]$content, length(r_all[[i]]$content) * sampleRatio )
}
inspect(r_all)

#rm(twitter, news, blogs, documents, sampleRatio)  
rm(documents, sampleRatio)  

# Create Corpus
#getCorpus <- function(data){
#  corpus <- Corpus(VectorSource(data))
#  corpus
#}
# Clean the corpus and tokenize
my_stop_words <- readLines(badwords)
my_stop_words_text <- paste(my_stop_words, collapse=" ")
#basecleanCorpus <- function(corpus){
#  corpus <- tm_map(corpus, removePunctuation) # Remove punctuation
#  corpus <- tm_map(corpus, removeNumbers) # Removing numbers  
#  corpus <- tm_map(corpus, tolower) # Convert to Lower Case
#  corpus <- tm_map(corpus, removeWords, my_stop_words_text) # Remove bad words
#  corpus <- tm_map(corpus, stripWhitespace) # Eliminating Extra Whitespace
#  corpus <- tm_map(corpus, PlainTextDocument)
#  corpus
#}
#cleanCorpus <- function(corpus){
#  corpus <- tm_map(corpus, removePunctuation) # Remove punctuation
#  corpus <- tm_map(corpus, removeNumbers) # Removing numbers  
#  corpus <- tm_map(corpus, tolower) # Convert to Lower Case
#  corpus <- tm_map(corpus, removeWords, my_stop_words_text) # Remove bad words
#  corpus <- tm_map(corpus, removeWords, stopwords("english")) # Remove stopwords
#  corpus <- tm_map(corpus, stemDocument) # Stemming
#  corpus <- tm_map(corpus, stripWhitespace) # Eliminating Extra Whitespace
#  corpus <- tm_map(corpus, PlainTextDocument)
#  corpus
#}
#corpusTwitter <- getCorpus(r_twitter)
#corpusNews <- getCorpus(r_news)
#corpusBlogs <- getCorpus(r_blogs)
#corpusAll <- getCorpus(r_all)
#corpusTwitterClean <- cleanCorpus(corpusTwitter)
#corpusNewsClean <- cleanCorpus(corpusNews)
#corpusBlogsClean <- cleanCorpus(corpusBlogs)
#basecorpusAllClean <- basecleanCorpus(r_all)
#inspect(basecorpusAllClean)
#corpusAllClean <- tm_map(corpusAllClean, removeWords, my_stop_words_text) 
#basecorpusAllClean <- tm_map(basecorpusAllClean, removeWords, my_stop_words_text)
#corpusAllClean <- basecleanCorpus(r_all)
corpusAllClean <- tm_map(r_all, content_transformer(removePunctuation))
corpusAllClean <- tm_map(corpusAllClean, content_transformer(removeNumbers))
corpusAllClean <- tm_map(corpusAllClean, stripWhitespace)
corpusAllClean <- tm_map(corpusAllClean, tolower)
corpusAllClean <- tm_map(corpusAllClean, removeWords, my_stop_words_text)
corpusAllClean <- tm_map(corpusAllClean, PlainTextDocument)
inspect(corpusAllClean)
#corpusAllClean <- tm_map(corpusAllClean, removeWords, stopwords("english")) # Remove stopwords
#corpusAllClean <- tm_map(corpusAllClean, stemDocument) # Stemming

# Cleanup unecessary variables at this point
#rm(corpusTwitter, corpusNews, corpusBlogs)
rm(badwords, my_stop_words, my_stop_words_text)
rm(p_dir, p_twitter, p_news, p_blogs)
#rm(r_twitter, r_news, r_blogs, r_all)
rm(i, r_all, documentCount, documentSummary)