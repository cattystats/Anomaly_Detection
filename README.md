# Anomaly Detection With Time Series
Tidy anomaly detection with [Google Trends](https://trends.google.com) data -- anomaly detection using [tidyverse](https://www.tidyverse.org/packages/) package: [anomalize](https://github.com/business-science/anomalize) 

Follow along at [2018 DC R](https://rstats.ai/agenda/) - view [video here](https://www.youtube.com/watch?v=5nfe835TVcY) and [supplementary slides here](https://github.com/cattystats/Anomaly_Detection/blob/master/2018-DC-R-Slides_CZ.pdf)

![slides](https://raw.githubusercontent.com/cattystats/Anomaly_Detection/master/figures/anomaly.gif)

---
### Explore different anomaly detection algorithms:

Use STL + IQR to detect 2018 [trending news stories](https://www.thecut.com/2018/10/pete-davidson-and-ariana-grandes-engagement-a-timeline.html) 
![Pete](https://raw.githubusercontent.com/cattystats/Anomaly_Detection/master/figures/anomalize_pete_davidson.png)

Use [Twitter's AnomalyDetection](https://github.com/twitter/AnomalyDetection) method to analyze seasonal data (the tidy way)
![Anomaly Detection](https://raw.githubusercontent.com/cattystats/Anomaly_Detection/master/figures/anomalize_us_vote.png)

---
Data frame generated using Google Trends package, [gtrendsR](https://github.com/PMassicotte/gtrendsR)
![Google Trends](https://raw.githubusercontent.com/cattystats/Anomaly_Detection/master/figures/google_trends_vote.png)

---
### Quick Start Guide

Download and [install R from CRAN](https://cran.r-project.org/), as well as the [RStudio IDE](https://www.rstudio.com/products/rstudio/download/)
