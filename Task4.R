library(dplyr)

#setwd(".")
#source('Task3.R')


# Back off algorithm
cleanText <- function(inString) {
  badwords <- "data/badwords.txt"
  my_stop_words <- readLines(badwords)
  my_stop_words_text <- paste(my_stop_words, collapse=" ")
  incorp <- iconv(inString, from = "UTF-8", to = "latin1")
  incorp <- gsub("(.)\1{3,}", " ", incorp)
  incorpc <- Corpus(VectorSource(incorp))
  incorpc <- tm_map(incorpc, removePunctuation)
  incorpc <- tm_map(incorpc, removeNumbers)
  incorpc <- tm_map(incorpc, stripWhitespace)
  incorpc <- tm_map(incorpc, content_transformer(tolower))
  incorpc <- tm_map(incorpc, removeWords, my_stop_words_text)
  incorpc <- tm_map(incorpc, PlainTextDocument)
  return(incorpc$content[[1]][[1]])
}

predict1 <- function(inString) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=0, max=0))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort1[grepl(paste0("^"), dfAll1gsort1$Terms),]
  return(prediction[1:3])
}

predict2 <- function(inString) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=1, max=1))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort2[grepl(paste0("^",lastngram[1]," "), dfAll1gsort2$Terms),]
  if(nrow(prediction) == 0) { return(predict2(inString))  }
  return(prediction[1:3])
}

predict3 <- function(inString) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=2, max=2))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort3[grepl(paste0("^",lastngram[1]," ",lastngram[2]," "), dfAll1gsort3$Terms),]
  if(nrow(prediction) == 0) { return(predict2(inString)) }
  return(prediction[1:3])
}

predict4 <- function(inString) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=3, max=3))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort4[grepl(paste0("^",lastngram[1]," ",lastngram[2]," ",lastngram[3]," "), dfAll1gsort4$Terms),]
  if(nrow(prediction) == 0) { return(predict3(inString)) }
  return(prediction[1:3])
}

predict5 <- function(inString) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=4, max=4))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort5[grepl(paste0("^",lastngram[1]," ",lastngram[2]," ",lastngram[3]," ",lastngram[4]," "), dfAll1gsort5$Terms),]
  if(nrow(prediction) == 0) { return(predict4(inString)) }
  return(prediction[1:3])
}

predict <- function(String) {
  clean <- cleanText(String)
  inStringLength <- length(unlist(strsplit(clean, " ")))
  if(inStringLength == 0) {
    return(predict1(clean))
  }
  
  if(inStringLength == 1) {
    return(predict2(clean))
  }
  
  
  if(inStringLength == 2) {
    return(predict3(clean))
  }
  
  
  if(inStringLength == 3) {
    return(predict4(clean))
  }
  
  if(inStringLength > 3) {
    return(predict5(clean))
  }
  
}


