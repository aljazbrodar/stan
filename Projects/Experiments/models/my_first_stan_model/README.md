
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

Plots and Visualizations: 

Scatter Plot: Sea Ice Extent Over Time (Northern Hemisphere)
![first_img](https://github.com/aljazbrodar/stan/assets/67840350/84bb7e13-15cc-4ec4-9954-0720894582b5)

Stan linear model fits
![image](https://github.com/aljazbrodar/stan/assets/67840350/f2e9d8f8-80b7-4a49-aea1-fce4a877c701)

Experimenting with priors
![image](https://github.com/aljazbrodar/stan/assets/67840350/a81c37ca-e532-458a-830b-00d39195078a)

Parameter summaries
![image](https://github.com/aljazbrodar/stan/assets/67840350/882e406b-b8c4-4ebb-8f95-2a5792ce5602)

Trace plots of the different chains of the Stan model
![image](https://github.com/aljazbrodar/stan/assets/67840350/e8145e39-4333-4a12-b7fe-bf51d9b78ed3)

Posterior histograms
![image](https://github.com/aljazbrodar/stan/assets/67840350/3b0ea53f-544d-4acf-86b3-40ea3b6c6c36)

Parameter estimates
![image](https://github.com/aljazbrodar/stan/assets/67840350/55084eca-b664-4972-b3b1-c81783a6e9aa)

