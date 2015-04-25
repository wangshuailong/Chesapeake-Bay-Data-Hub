###~~Chesapeake Bay DataHub Downloader~~#

#### ~~Access Chesapeake Bay Data Hub by R~~ 
<br/>
#### OOPS!
#### The website of Chesapeake Bay for downloading the data had been changed. There is no time period limitation now, and it's very convient to choose parameters.
#### Download data from its [DataHub](http://www.chesapeakebay.net/data) directly.

<br/>
####~~Description~~
~~This script can be used to download data from Chesapeake Bay  Data Hub under the branch HYDROLOGIC UNIT (HUC8) of Quality Database(1984-present): [Chesapeake Bay DataaHub](http://www.chesapeakebay.net/data)~~
<br/>
Project name: Chesapeake Bay Data Hub Downloaded  
Author: Shuailong WANG
Contact email: oopswangsl@gmail.com
Date: 04/01/2015
Working Plantform: Ubuntu 14.04 LTS
R Version: R 3.1.3 on RStudio (0.98.1103)


<br/>
#### Require packages: XML
install.packages('XML')  
library(XML)


<br/>
#### Example
First choose parameters, and save them in a vector.

> parameter <- c('STATION', 'SAMPLE_DATE', 'SAMPLE_TIME', 'DEPTH',
 'LAYER',  'SAMPLE_ID', 'PARAMETER', 'VALUE', 'UNIT')  

Then choose time period (Less than 5 years) and use the defined function:
> data <- getData('01011986', '02011986', parameter)
  



