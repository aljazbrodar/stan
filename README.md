Sea Ice Extent Modeling Project

This project involves modeling sea ice extent over time using data from: https://nsidc.org/home (The National Snow and Ice Data Center (NSIDC) at the University of Colorado Boulder)
The whole project was inspired by this tutorial: https://ourcodingclub.github.io/tutorials/stan-intro/

Required Libraries:
install.packages("rstan")
install.packages("gdata")
install.packages("bayesplot")

Project Structure
Data:
The data used for this project is stored in the file 'seaice.csv'. This dataset contains information about sea ice extent measurements over several years.

Code Files:
script.R: Main script that performs data loading, exploration, and Bayesian modeling.

model.stan, model2.stan, model2_GQ.stan: Stan code containing the Bayesian model used for sea ice extent estimation.

![first_img](https://github.com/aljazbrodar/stan/assets/67840350/84bb7e13-15cc-4ec4-9954-0720894582b5)
