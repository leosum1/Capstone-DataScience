ne The Coursera Data Science Specialization Capstone project from Johns Hopkins University (JHU) allows students to create a usable public data product that can show their skills to potential employers. Projects are drawn from real-world problems and are conducted with industry, government, and academic partners. For this capstone, JHU is partnering with SwiftKey (http://swiftkey.com/en/) to apply data science in the area of natural language processing (NLP).

The objective of this project is to build a working predictive text model. The data we will be using is from a corpus called HC Corpora (www.corpora.heliohost.org). A corpus is body of text, usually containing a large number of sentences. 
[1] The readme file at http://www.corpora.heliohost.org/aboutcorpus.html contains the details on the available corpora.

We first need to familiarize with Natural Language Processing, Text Mining, and the associated tools in R. Here are some helpful resources:

https://en.wikipedia.org/wiki/Natural_language_processing

https://www.jstatsoft.org/article/view/v025i05
o
https://cran.r-project.org/web/views/NaturalLanguageProcessing.html

This repository contains the following files and folders:

1. README.md: This readme.
2. Task1.R: Creates the data objects from cleaned source files.
3. Task2.R: Exploratory Data Analysis
4. Task3.R: Modeling
4. Task4.R: Prediction
5. Task5.R:
6. Data directory
7. Milestone.Rmd: Report also available at http://rpubs.com/leosum1/231042
8. PredictNextWord directory: 
A Shiny App https://leosum.shinyapps.io/PredictNextWord/ and a presentation http://rpubs.com/leosum1/PredictNextWord


## Loading and cleaning the data [Task0/Task1]
Task0:
- Obtaining the data: In order to process the data in R (http://www.r-project.org/), we first needed to load the necessary packages. Then we downloaded the source data from http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip. For this project, we only used the English (United States) data even though other language files were available, including German, Finnish, and Russian. The English data was derived from three Internet sources: blogs, twitters, and news files.

Task1:
- Tokenization: We identify, sample and clean the corpus from punctuation, numbers... so we remove:

   *Capital letters*,

   *Unknown characters*,
   
   *Numbers*,
   
   *Special characters*, 
   
   *Extra spaces*.
   
   *Punctuation except dot and single quotes*
   
- Profanity: We remove profanity and other words we do not want to predict.

## Exploratory Data Analysis and Modeling [Task2/Task3]
Task2:
- Explore: We understand the distribution and relationship between the words, tokens, and phrases in the text. We perform a thorough exploratory analysis of the data, understanding the distribution of words and relationship between the words in the corpora. 
Understand frequencies of words and word pairs - build figures and tables to understand variation in the frequencies of words and word pairs in the data.

Task3:
- Build basic n-gram model using the exploratory analysis we just performed in Task2
- Build a model to handle unseen n-grams as a combination of words that does not appear in the corpora.

At this time in the project we report what have been done via a Milestone Rpub document. 

## Prediction Model [Task4/Task5]
Task4:
- Build the predictive model based on the previous data modeling steps done in Task3.

Task5:
- Explore new models and data to improve the predictive model, the ouput of Task4.
- Use timing software to evaluate the computational complexity of the model. 
- Evaluate the new prediction model on both accuracy and efficiency. 
- Evaluate the model accuracy using different metrics like perplexity, accuracy at the first word, second word, and third word.

## Data Product [Task6/Task7]
This is the final step of the project and everything from this point is located in the PredictNextWord directory.

Task6:
- Create a data product to show off the prediction algorithm via a Shiny app that accepts an n-gram and predicts the next word.

Task7:
- A 5 slided deck promoting the product using RStudio Presenter
