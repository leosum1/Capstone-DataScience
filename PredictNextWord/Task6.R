library(dplyr)
library("tm")
library("data.table")
library("RCurl")
library("SnowballC")
library("stringi")
library("Matrix")
library("stringr")


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

predict1 <- function(inString, y) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=0, max=0))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort1[grepl(paste0("^"), dfAll1gsort1$Terms),]
  w <- word(prediction$Terms[1:y],-1)
  return(w)
}

predict2 <- function(inString, y) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=1, max=1))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort2[grepl(paste0("^",lastngram[1]," "), dfAll1gsort2$Terms),]
  if(nrow(prediction) == 0) { return(predict2(inString, y))  }
  w <- word(prediction$Terms[1:y],-1)
  return(w)
}

predict3 <- function(inString, y) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=2, max=2))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort3[grepl(paste0("^",lastngram[1]," ",lastngram[2]," "), dfAll1gsort3$Terms),]
  if(nrow(prediction) == 0) { return(predict2(inString, y)) }
  w <- word(prediction$Terms[1:y],-1)
  return(w)
}

predict4 <- function(inString, y) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=3, max=3))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort4[grepl(paste0("^",lastngram[1]," ",lastngram[2]," ",lastngram[3]," "), dfAll1gsort4$Terms),]
  if(nrow(prediction) == 0) { return(predict3(inString, y)) }
  w <- word(prediction$Terms[1:y],-1)
  return(w)
}

predict5 <- function(inString, y) {
  kevTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=4, max=4))
  ngrams <- kevTokenizer(inString)
  lastngram <- unlist(strsplit(ngrams[length(ngrams)], " "))
  prediction <- dfAll1gsort5[grepl(paste0("^",lastngram[1]," ",lastngram[2]," ",lastngram[3]," ",lastngram[4]," "), dfAll1gsort5$Terms),]
  if(nrow(prediction) == 0) { return(predict4(inString, y)) }
  w <- word(prediction$Terms[1:y],-1)
  return(w)
}

predict <- function(String, y) {
  clean <- cleanText(String)
  num <- y
  inStringLength <- length(unlist(strsplit(clean, " ")))
  if(inStringLength == 0) {
    return(predict1(clean, num))
  }
  
  if(inStringLength == 1) {
    return(predict2(clean, num))
  }
  
  
  if(inStringLength == 2) {
    return(predict3(clean, num))
  }
  
  
  if(inStringLength == 3) {
    return(predict4(clean, num))
  }
  
  if(inStringLength > 3) {
    return(predict5(clean, num))
  }
  
}
