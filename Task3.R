library("Matrix")
library("stringr")

#setwd(".")
#source('Task2.R')

# Return Data Frame for each n-grams for prediction use 
df_ngram<-function (dtm) {
  df_ngram <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)
  df_ngram <- as.data.frame(df_ngram)
  df_ngram <- subset(df_ngram,  df_ngram> 1)
  df_ngram$terms <- row.names(df_ngram)
  row.names(df_ngram) <- NULL
  df_ngram$probability<-df_ngram$df_ngram/sum(df_ngram$df_ngram)
  colnames(df_ngram) <- c("Count","Terms", "Probability")
  df_ngram_final<-subset(df_ngram, select=c("Terms","Count","Probability"))
  df_ngram_final$Terms <- gsub("(.)\1{3,}", " ", df_ngram_final$Terms)
  df_ngram_final$Terms <- iconv(df_ngram_final$Terms, from = "UTF-8", to = "latin1")
  df_ngram_final <- na.omit(df_ngram_final)
  df_ngram_final
}

dfAll1gsort1 <- df_ngram(dtmAll1g)
dfAll1gsort2 <- df_ngram(dtmAll2g)
dfAll1gsort3 <- df_ngram(dtmAll3g)
dfAll1gsort4 <- df_ngram(dtmAll4g)
dfAll1gsort5 <- df_ngram(dtmAll5g)
gc()


#predict_bigram<- function(input) {
#  input1<-tolower(input)
#  input2<-str_replace_all(input1, pattern="[[:punct:]]","")
#  input3<-str_replace_all(input2, pattern="\\s+", " ")
#  input_clean<-removeNumbers(input3) 
#  clean_tail<-tail(unlist(strsplit(input_clean, " ")), 1)
#  start_with_term<-paste("^",clean_tail,sep="")
#  find<-dfAll1gsort2[grep(start_with_term, dfAll1gsort2$Terms),]
#  merge<-NULL
#  for (i in 1: nrow(find)) {
#    find$Terms<-as.character(find$Terms)
#    find_mat<-matrix(unlist(strsplit(find$Terms, " ")), ncol=2, byrow=TRUE)
#    find_vector<-find_mat[,2]
#    find2<-dfAll1gsort1[grep(paste("^", find_vector[i], sep=""), dfAll1gsort1$Terms),]
#    find2<-data.frame(find2)
#    run_prob<-data.frame("Terms"=find2[1], "Probability"=find[i,3]/find2[3])
#    merge<-rbind(merge, data.frame(run_prob))
#  }
#  high_prob<-merge[order(-merge$Probability),]
#  possible_term<-as.character(high_prob$Terms)
#  rm(input, input1, input2, input3, input_clean, clean_tail, start_with_term)
#  return(find$Terms[1])
#}

# Let's give it a try

#predict_bigram("first")
#predict_bigram("last")


#predict_trigram<- function(input) {
#  input1<-tolower(input)
#  input2<-str_replace_all(input1, pattern="[[:punct:]]","")
#  input3<-str_replace_all(input2, pattern="\\s+", " ")
#  input_clean<-removeNumbers(input3) 
#  clean_tail<-tail(unlist(strsplit(input_clean, " ")), 2)
#  last_two_term<-tail(clean_tail,2)
#  clean_term<-paste(last_two_term[1],last_two_term[2],sep=" ")
#  start_with_term<-paste("^",clean_term,sep="")
#  find<-dfAll1gsort3[grep(start_with_term, dfAll1gsort3$Terms),]
#  merge<-NULL
  #  for (i in 1: nrow(find)) {
  #    find$Terms<-as.character(find$Terms)
  #    find_mat<-matrix(unlist(strsplit(find$Terms, " ")), ncol=2, byrow=TRUE)
  #    find_vector<-find_mat[,2]
  #    find2<-dfAll1gsort1[grep(paste("^", find_vector[i], sep=""), dfAll1gsort1$Terms),]
  #    find2<-data.frame(find2)
  #    run_prob<-data.frame("Terms"=find2[1], "Probability"=find[i,3]/find2[3])
  #    merge<-rbind(merge, data.frame(run_prob))
  #  }
  #  high_prob<-merge[order(-merge$Probability),]
  #  possible_term<-as.character(high_prob$Terms)
#  return(find$Terms[1])
#}

# Let's give it a try

#predict_trigram("first and")
#predict_trigram("last for")


#predict_quadgram<- function(input) {
#  input1<-tolower(input)
#  input2<-str_replace_all(input1, pattern="[[:punct:]]","")
#  input3<-str_replace_all(input2, pattern="\\s+", " ")
#  input_clean<-removeNumbers(input3) 
#  clean_tail<-tail(unlist(strsplit(input_clean, " ")), 3)
#  last_three_term<-tail(clean_tail,3)
#  clean_term<-paste(last_three_term[1],last_three_term[2],last_three_term[3],sep=" ")
#  start_with_term<-paste("^",clean_tail,sep="")
#  find<-dfAll1gsort4[grep(start_with_term, dfAll1gsort4$Terms),]
#  merge<-NULL
  #  for (i in 1: nrow(find)) {
  #    find$Terms<-as.character(find$Terms)
  #    find_mat<-matrix(unlist(strsplit(find$Terms, " ")), ncol=2, byrow=TRUE)
  #    find_vector<-find_mat[,2]
  #    find2<-dfAll1gsort1[grep(paste("^", find_vector[i], sep=""), dfAll1gsort1$Terms),]
  #    find2<-data.frame(find2)
  #    run_prob<-data.frame("Terms"=find2[1], "Probability"=find[i,3]/find2[3])
  #    merge<-rbind(merge, data.frame(run_prob))
  #  }
  #  high_prob<-merge[order(-merge$Probability),]
  #  possible_term<-as.character(high_prob$Terms)
#  return(find$Terms[1])
#}

# Let's give it a try

#predict_quadgram("first and last")
#predict_quadgram("last for the")






#dtm <- DocumentTermMatrix(corpusAllClean, control = list(tokenize = gram))

#x <- sparseMatrix(i=dtm_all$i, j=dtm_all$j, x=dtm_all$v)
#dtm_frame <- data.frame(Terms = dtm_all$dimnames$Terms, Blogs = x[, 1], News = x[, 2], Twitter = x[, 3])
#dtm_frame$Total <- dtm_frame$Blogs + dtm_frame$News + dtm_frame$Twitter
#dtm_frame <- dtm_frame[order(dtm_frame$Total, decreasing = T),]
#rm(dtm_all, x)

#x <- sparseMatrix(i=dtm_all_base$i, j=dtm_all_base$j, x=dtm_all_base$v)
#dtm_frame_base <- data.frame(Terms = dtm_all_base$dimnames$Terms, Blogs = x[, 1], News = x[, 2], Twitter = x[, 3])
#dtm_frame_base$Total <- dtm_frame_base$Blogs + dtm_frame_base$News + dtm_frame_base$Twitter
#dtm_frame_base <- dtm_frame_base[order(dtm_frame_base$Total, decreasing = T),]
#rm(dtm_all_base, x)
#gc()

#getCoverage <- function (dtm, coverage)
#{
#  frequency <- 0
#  requiredFrequency <- coverage * sum(dtm$Total)
  # it is assumed that tdm is already sorted by decreasing order
#  for (i in 1:nrow(dtm))
#  {
#    if (frequency >= requiredFrequency)
#    {
#      return (i)
#    }
#    frequency <- frequency + dtm[i, "Total"]
#  }
  
  # this could happen only due to a bug in the code above
  # in all normal cases this line should never being executed
#  return (nrow(tdm))
#}
#getCoverage(dtm_frame, 0.5)
#getCoverage(dtm_frame, 0.9)
#x <- seq(0.1, 0.9, by = 0.1)
#y <- c()
#for(i in x)
#{
#  y[i*10] <- getCoverage(dtm_frame, i)
#}

#qplot(x, y, geom = c("line"), xlab="Coverage", ylab="Number of words", main="Number of words required to cover language")
#rm(x, y, i)


# Coverage on base with no stemming, badwords and stopwords
#getCoverage(dtm_frame_base, 0.5)
#getCoverage(dtm_frame_base, 0.9)
#x <- seq(0.1, 0.9, by = 0.1)
#y <- c()
#for(i in x)
#{
#  y[i*10] <- getCoverage(dtm_frame_base, i)
#}

#qplot(x, y, geom = c("line"), xlab="Coverage", ylab="Number of words", main="Number of words required to cover language")
#rm(x, y, i)
