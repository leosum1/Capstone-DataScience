# Capstone Data Science

The Coursera Data Science Specialization Capstone project from Johns Hopkins University (JHU) allows students to create a usable public data product that can show their skills to potential employers. Projects are drawn from real-world problems and are conducted with industry, government, and academic partners. For this capstone, JHU is partnering with SwiftKey (http://swiftkey.com/en/) to apply data science in the area of natural language processing (NLP).

The objective of this project is to build a working predictive text model. The data we will be using is from a corpus called HC Corpora (www.corpora.heliohost.org). A corpus is body of text, usually containing a large number of sentences. 
[1] The readme file at http://www.corpora.heliohost.org/aboutcorpus.html contains the details on the available corpora.

This report explains how we're loading, cleaning, tokenzising, removing profanity and sampling the data. Next it explains our initial exploratory analysis and our goals for the eventual predictive text application and algorithm. We also explains the major features of the data we have identified and briefly summarizes our plans for creating the prediction algorithm and a Shiny (http://shiny.rstudio.com/) application.

## Loading and cleaning the data
In order to process the data in R (http://www.r-project.org/), we first needed to load the necessary packages. Then we downloaded the source data from http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip. For this project, we only used the English (United States) data even though other language files were available, including German, Finnish, and Russian.
The English data was derived from three Internet sources: blogs, twitters, and news files. We read in and processed each file separately. 
To make the data more useful, we removed extraneous information including:
  Special characters, 
  Capital letters, 
  Hyphenatin in prefixes such as un- and in-,
  Single quotes in contractions like don't,
  All non-alphabetic characters except periods,
  Periods other than at the end of sentences, and
  Extraneous spaces.
To aid in subsequent analysis, we then split the lines into sentences.
