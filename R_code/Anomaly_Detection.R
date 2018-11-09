# create df using google trends data - you can also import a csv or connect to a database

#install.packages("gtrendsR")
#install.packages("tidyverse")
#install.packages("anomalize")
library(gtrendsR)
library(tidyverse)
library(anomalize)

#create df with google trends data
google_trends_df = gtrends(
  c("movers"), #keywords -- start with one
  gprop = "web", #choose: web, news, images, froogle, youtube
  geo = c("US"), #only pull results for US
  time = "2004-01-01 2018-11-08")[[1]] #timeframe

#visualize with ggplot (optional but useful if you're choosing between keywords)
ggplot(data=google_trends_df, 
       aes(x=date, y=hits, group=keyword, col=keyword)) +
  geom_line() + 
  theme_bw() +
  labs(title = "Google Trends Data", 
       subtitle="United States search volume", 
       x="Time", y="Relative Interest")

#prepare data
google_trends_df_tbl = google_trends_df %>%
  mutate(date=lubridate::ymd(date)) %>%
  tbl_df()

#anomalize! explore different methods for decomposition and anomaly detection
#choose the method that is best suited for the data you're analyzing
#twitter + gesd is generally better for highly seasonal data
#stl + iqr if seasonality is not a major factor
#adjust the trend period using domain knowledge about your data

# STL + IQR Anomaly Detection
google_trends_df_tbl %>%   
  time_decompose(hits, method = "stl"
                 , trend = "1 month"
  ) %>%
  anomalize(remainder, method = "iqr") %>%
  time_recompose() %>%
  # Anomaly Visualization
  plot_anomalies(time_recomposed = TRUE) +
  labs(title = "Google Trends Data - STL + IQR Method",x="Time",y="Relative Interest", subtitle = "United States search volume for 'Movers' between Jan'04-Nov'18"
  )

# Twitter + IQR Anomaly Detection
google_trends_df_tbl %>%   
  time_decompose(hits, method = "twitter"
                 , trend = "1 month"
  ) %>%
  anomalize(remainder, method = "iqr") %>%
  time_recompose() %>%
  # Anomaly Visualization
  plot_anomalies(time_recomposed = TRUE) +
  labs(title = "Google Trends Data - Twitter + IQR Method",x="Time",y="Relative Interest", subtitle = "United States search volume for 'Movers' between Jan'04-Nov'18"
  )

# Twitter and GESD
google_trends_df_tbl %>%   
  time_decompose(hits, method = "twitter",trend = "1 month") %>%
  anomalize(remainder, method = "gesd") %>%
  time_recompose() %>%
  # Anomaly Visualization
  plot_anomalies(time_recomposed = TRUE) +
  labs(title = "Google Trends Data - Twitter + GESD Method",x="Time",y="Relative Interest", subtitle = "United States search volume for 'Movers' between Jan'04-Nov'18"
  )

# look at how anomaly detection algorithm works
google_trends_df_tbl %>% 
  time_decompose(hits, method = "stl", 
                 frequency = "auto", trend = "auto") %>%
  anomalize(remainder, method = "gesd", alpha = 0.04, max_anoms = 0.2) %>%
  plot_anomaly_decomposition() 
