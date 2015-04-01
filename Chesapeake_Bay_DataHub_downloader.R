##########################

# The website of the Chesapeake Bay Data Hub changed recently.
# Downloading data from the web is very convenient.
# And this script may expire anytime.

###################################


# Project name: Chesapeake Bay Data Hub Downloaded
# Author: Shuailong WANG
# Contact email: oopswangsl@gmail.com
# Date: 04/01/2015
# Working Plantform: Ubuntu 14.04 LTS
# R Version: R 3.1.3 on RStudio (0.98.1103)


# This script can be used to download data from Chesapeake Bay 
# Data Hub : http://www.chesapeakebay.net/data
# Now only data in 'HYDROLOGIC UNIT (HUC8)' under 'Current Water 
# Quality Database(1984-present)' can be accessed by this script.

# XML package is required.
# install.packages('XML') if necessary
require(XML)

# Time period and parameters are optional.
# The time period should be less than 4 years once.

# Hereafter is the script

# First, read the source of the page, which contains data.
getDataDoc <- function(start_time, end_time, parameter){
     basic_url <- 'http://api.chesapeakebay.net/getWQWaterQuality.svc/HUCS8/ALL/ALL/false/'
     # The time period should be less than 5 years
     # The format should be mm/dd/yyyy
     time_period <- paste(start_time, end_time, sep = '/')
     full_url <- paste(basic_url, time_period, sep = '')
     data_doc <- xmlParse(full_url)
     return (data_doc)
}

# Get the correct path to obtain the data
getPath <- function(start_time, end_time, parameter){
     items = c()
     # The optional parameters are listed at the end of the this cript
     parameters = c(parameter)
     for (par in parameters){
          path_link <- paste('//', par, sep = '')
          items = c(items, path_link) 
     }
     return (items)
}

getData <- function(start_time, end_time, parameter){
     data_doc <- getDataDoc(start_time, end_time, parameter)
     path_links <- getPath(start_time, end_time, parameter)
     df <- data.frame()
     for (path_link in path_links){
          var <- xpathSApply(data_doc,
                           path = path_link,
                           fun = 'xmlValue')
          if (ncol(df) >= 1) {
               df <- data.frame(df, var)
          } else {
               # if(ncol(df) >= 1) {
               df <- data.frame(var) 
          }
          
     }
     return (df)
}

# The optional parameters include:
# 'EVENT_ID', 'SOURCE', 'PROJECT', 'STATION', 'SAMPLE_DATE', 
# 'SAMPLE_TIME', 'DEPTH', 'LAYER', 'SAMPLE_TYPE', 'SAMPLE_ID', 
# 'PARAMETER', 'QUALIFIER', 'VALUE', 'UNIT', 'METHOD', 'LAB',
# 'HUC8', 'CATALOGING_UNIT_DESCRIPTION', 'DETAILS', 'TOTAL_DEPTH', 
# 'UPPER_PYCNOCLINE', 'LOWER_PYCNOCLINE', 'LAT', 'LONG'

# EXAMPLE
# for example, if you want to download data on water quality during
# 1986-01-01 and 1987-01-01. The parameters include 'STATION', 
# 'SAMPLE_DATE', 'SAMPLE_TIME', 'DEPTH', 'LAYER', 'SAMPLE_ID', 
# 'PARAMETER', 'VALUE', 'UNIT'

# You can excute:

data <- getData('01011986', '01011987', 
                c('STATION', 'SAMPLE_DATE', 'SAMPLE_TIME', 'DEPTH',
                  'LAYER',  'SAMPLE_ID', 'PARAMETER', 'VALUE', 
                  'UNIT'))


# Or first choose parameter, and save them in a 
parameter <- c('STATION', 'SAMPLE_DATE', 'SAMPLE_TIME', 'DEPTH',
               'LAYER',  'SAMPLE_ID', 'PARAMETER', 'VALUE', 'UNIT')
# Then excute:
data <- getData('01011986', '02011986', parameter)

# End