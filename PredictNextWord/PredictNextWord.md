<style>
.main {
    color: black;
    background: #E8E8E8;
    position: fixed;
    width:100%;
}
</style>

Data Science Capstone - Next Word Prediction App
========================================================
author: leosum
date: 31-12-2016
autosize: true
css: www/bootstrap.css


About the App
========================================================

<https://leosum.shinyapps.io/PredictNextWord/>

## Description:  
* Predicts the __single next word with the highest probability__  
* Help of trained Corpus __20% news, tweets and blogs__ text  
* __ENGLISH__ words only  

## How it Works:  
* Choose __how__  __many__ prediction words you want to see  
* Type in a phrase or word into the __input text__ box  
* Click the **SUBMIT** button to get the next predict word(s)  
* The result will be shown in a __text box__ and a __plot__


The Algorithm and Approaches 
========================================================

## Prediction Model Algorithm:  
* __5-Grams Model with Simple Back-Off Algorithm__  
* Back-off from 5-gram to the next lower n-gram if no match  
* If no match at all, return the highest frequency unigram  

## Approaches:
* Low Complexity model and algorithm
* An acceptable Prediction Accuracy
* Very fast response time (1-2 seconds)


The Procedure
========================================================
## Clean:
* Low Complexity model and algorithm

## Dataset:
* Low Complexity model and algorithm

## API:


The Result
========================================================

## Accuracy:

## Performance:
