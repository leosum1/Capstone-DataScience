The Coursera Data Science Specialization Capstone project from Johns Hopkins University (JHU) allows students to create a usable public data product that can show their skills to potential employers. Projects are drawn from real-world problems and are conducted with industry, government, and academic partners. For this capstone, JHU is partnering with SwiftKey (http://swiftkey.com/en/) to apply data science in the area of natural language processing (NLP).

The objective of this project is to build a working predictive text model. The data we will be using is from a corpus called HC Corpora (www.corpora.heliohost.org). A corpus is body of text, usually containing a large number of sentences. 
[1] The readme file at http://www.corpora.heliohost.org/aboutcorpus.html contains the details on the available corpora.

We first need to familiarize with Natural Language Processing, Text Mining, and the associated tools in R. Here are some helpful resources:
https://en.wikipedia.org/wiki/Natural_language_processing
https://www.jstatsoft.org/article/view/v025i05
https://cran.r-project.org/web/views/NaturalLanguageProcessing.html

This repository contains the following files and folders:

1. README.md: This readme.
2. Task1.R: Creates the data objects from cleaned source files.
3. Task2.R: Exploratory Data Analysis
4. Task3.R: Modeling
5. data directory

This Readme explains how we're loading, cleaning, tokenzising, removing profanity and sampling the data. 
Next it explains our initial exploratory analysis and our goals for the eventual predictive text application and algorithm. 
We also explains the major features of the data we have identified and briefly summarizes our plans for creating the prediction algorithm and a Shiny (http://shiny.rstudio.com/) application.

## Loading and cleaning the data [Task0/Task1]
Task0
- Obtaining the data: In order to process the data in R (http://www.r-project.org/), we first needed to load the necessary packages. Then we downloaded the source data from http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip. For this project, we only used the English (United States) data even though other language files were available, including German, Finnish, and Russian. The English data was derived from three Internet sources: blogs, twitters, and news files. 
Task1:
- Tokenization: We identify, sample and clean the corpus from punctuation, numbers... so we remove:
   *Capital letters*,
   *Unknown characters*,
   *Numbers*,
   *Special characters*, 
   *Extra spaces*.
   *Punctuation except dot and single quotes*,
identifying appropriate tokens such as words, punctuation, and numbers. Writing a function that takes a file as input and returns a tokenized version of it.
- Profanity: We remove profanity and other words you do not want to predict.

## Exploratory Data Analysis and Modeling - Task2/Task3
Task2
- Explore: We understand the distribution and relationship between the words, tokens, and phrases in the text. We perform a thorough exploratory analysis of the data, understanding the distribution of words and relationship between the words in the corpora. 
Understand frequencies of words and word pairs - build figures and tables to understand variation in the frequencies of words and word pairs in the data.

Questions to consider
Some words are more frequent than others - what are the distributions of word frequencies? 
What are the frequencies of 2-grams and 3-grams in the dataset? 
How many unique words do you need in a frequency sorted dictionary to cover 50% of all word instances in the language? 90%? 
How do you evaluate how many of the words come from foreign languages? 
Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller number of words in the dictionary to cover the same number of phrases? 
