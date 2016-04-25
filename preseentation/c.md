
========================================================
author: Unai Zorrilla Castro
date: 25/4/2016 
autosize: true

MTCars Prediction
========================================================

Presentation about Shiny app for get MPG prediction based on MTCars dataset. <https://unaizc.shinyapps.io/CourseraDataProduct/>.


Data
========================================================

MTCars Shiny app is created using the 'datasets' library and mtcars data, a sample of this data is showed here:


```r
library(datasets)
data("mtcars")

head(mtcars,10)
```

```
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```


Model
========================================================
The model to be used include data for Horse Power, Weight and Transmission mode.


```

Call:
lm(formula = mpg ~ hp + wt + am, data = mtcars)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.4221 -1.7924 -0.3788  1.2249  5.5317 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 34.002875   2.642659  12.867 2.82e-13 ***
hp          -0.037479   0.009605  -3.902 0.000546 ***
wt          -2.878575   0.904971  -3.181 0.003574 ** 
am           2.083710   1.376420   1.514 0.141268    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 2.538 on 28 degrees of freedom
Multiple R-squared:  0.8399,	Adjusted R-squared:  0.8227 
F-statistic: 48.96 on 3 and 28 DF,  p-value: 2.908e-11
```


Predictions
========================================================

The app show predictions for this model using 3 text box on the slider panel and get result of prection on the main panel

