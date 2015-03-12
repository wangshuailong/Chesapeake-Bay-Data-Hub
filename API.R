
library(XML)

chesapeakebay_data <- function(x, y, z){
     if (is.numeric(c(x, y)) == FALSE){
          cat ('Please set your data correctly.')
     } else{
     variable <- c(z)
     df <- data.frame()
     basic_url <- 'http://api.chesapeakebay.net/getWQWaterQuality.svc/HUCS8/ALL/ALL/false/'
     time_period <- paste(x, y, sep = '/')
     full_url <- paste(basic_url, time_period, sep = '')
     cbdata_doc <- xmlParse(full_url)
     for (var in variable){
          path_link = paste('//', var, sep = '')
          var_value <- xpathSApply(cbdata_doc, 
                                   path = path_link,
                                   fun = 'xmlValue')
          if (ncol(df) < 1){
               df <- data.frame(var_value)
          } else {
               df <- data.frame(df, var_value)
          }
     }
     return (df)
     }
}

variable <- c('EVENT_ID', 'SOURCE', 'PROJECT', 'STATION', 
              'SAMPLE_DATE', 'SAMPLE_TIME', 'DEPTH', 'LAYER',
              'SAMPLE_TYPE', 'SAMPLE_ID', 'PARAMETER', 
              'QUALIFIER', 'VALUE', 'UNIT', 'METHOD', 'LAB',
              'HUC8', 'CATALOGING_UNIT_DESCRIPTION', 'DETAILS', 
              'TOTAL_DEPTH', 'UPPER_PYCNOCLINE', 
              'LOWER_PYCNOCLINE', 'LAT', 'LONG')


chesapeakebay_data(10011984, 11011984, c('STATION', 'PARAMETER'))

chesapeakebay_data(10011984, 'x', c('STATION', 'PARAMETER'))

head(cb)
tail(cb)
str(cb)

     variable <- c(y)
     for (variable in y){
          path_link <- paste('//', variable, sep = '')
          var_value <- xmlSAplly(cbdata_doc,
                                 path = path_link,
                                 fun = 'xmlValue')
          if (ncol(cbdata) < 1){
               cbdata <- data.frame(var_value)
          } 
          if (ncol(cbdata) > 1){
               cbdata <- data.frame(cbdata, var_value)
          }
          return (cbdata)
     }
}



?as.data.frame

basic_test <- 'http://api.chesapeakebay.net/getWQWaterQuality.svc/HUCS8/ALL/ALL/false/10011984/11011984'
basic_test_doc <- xmlParse(basic_test)
che <- function(x){
        v <- c(x)
        for ( i in v){
                path_link <- paste0('//', i)
                che_info <- xpathSApply(basic_test_doc,
                                        path = path_link,
                                        fun = 'xmlValue')
                df <- data.frame(df, che_info)
                
        }
        return (df)
}

che1 <- che(c('STATION', 'PARAMETER'))
head(che1)
class(che1)

class(station_info)
df <- data.frame(station_info)
class(df)

class(basic_test_doc)

event_id <- xpathSApply(basic_test_doc,
                            path = '//PROBLEM',
                            fun = 'xmlValue')
head(event_id)

df <- data.frame(df, event_id)
class(df)
head(df)
length(station_info)


chesapeakebay_data <- function(year){
     basic_url <- 'http://api.chesapeakebay.net/getWQWaterQuality.svc/HUCS8/ALL/ALL/false/'
     start_time <- paste('0101', year, sep = '')
     end_time <- paste('1231', year, sep = '')
     time_period <- paste(start_time, end_time, sep = '/')
     full_url <- paste(basic_url, time_period, sep = '')
     return (full_url)
}

url_2 <- chesapeakebay_data(1984)

url_2_doc <- xmlParse(url_2)

station_info <- xpathSApply(url_2_doc,
                            path = '//STATION',
                            fun = 'xmlValue')
length(station_info)


variable <- c('EVENT_ID', 'SOURCE', 'PROJECT', 'STATION', 
              'SAMPLE_DATE', 'SAMPLE_TIME', 'DEPTH', 'LAYER',
              'SAMPLE_TYPE', 'SAMPLE_ID', 'PARAMETER', 
              'QUALIFIER', 'VALUE', 'UNIT', 'METHOD', 'LAB',
              'HUC8', 'CATALOGING_UNIT_DESCRIPTION', 'DETAILS', 
              'TOTAL_DEPTH', 'UPPER_PYCNOCLINE', 
              'LOWER_PYCNOCLINE', 'LAT', 'LONG')











