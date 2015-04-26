Visualizing Global Population Development Over Time
========================================================
width: 960
height: 700
font-family: 'SegoeUI'
author: sgatzeme
date: 26 April 2015

Developing Data Products Course Project Presentation

7 billion and still counting...
========================================================
left: 40% 

![undata](unstats-figure/undata.png)

<small>
There are approximately 7 billion people on earth. How do you get to this result? 
Via statistical extrapolation and census data.

Whereas we have learned a lot about the former during the data science specialization, the latter is a process, which all governments attempt to get a glimpse of their population characteristics.

The United Nations Statistics Division collects from all the National Statistical Offices several population censuses’ datasets. The data are collected via the Demographic Yearbook census questionnaires.
</small>

Wouldn't it be nice...
========================================================

<small>
... to have a shiny application, which is able to visualize the population development for all countries in the world by several characteristics, such as country, sex and area? This is what the __unstats__ app is doing:

1. Source data.R: This file contains the above mentioned preprocessing steps and is responsible for the dataset
2. Select a country: You may select one or multiple countries in order to see the output plot of the population count
3. determine date range: Select your admired date range
4. select sex and area: Check the variable attributes as you like and see the output plot getting updated

The resulting plot will show you the population development of your selected countries over a period of 66 years
</small>

unstats UI
========================================================
![unstats](unstats-figure/unstats.png)
<small>
- Check out the app --> [here](http://sgatzeme.shinyapps.io/unstats)
- Link to my github repository [here](https://github.com/sgatzeme/Dev_Dat_Prod)
</small>

Dataset Summary
========================================================

```
   Country               Year          Area               Sex            Population_Count
 Length:11608       Min.   :1948   Length:11608       Length:11608       Min.   :  0     
 Class :character   1st Qu.:1982   Class :character   Class :character   1st Qu.:  1     
 Mode  :character   Median :1996   Mode  :character   Mode  :character   Median :  2     
                    Mean   :1993                                         Mean   :  7     
                    3rd Qu.:2005                                         3rd Qu.:  5     
                    Max.   :2014                                         Max.   :428     
```
<small>
Source: [UNData website](http://unstats.un.org/unsd/demographic/products/dyb/dybcensusdata.htm)
</small>
