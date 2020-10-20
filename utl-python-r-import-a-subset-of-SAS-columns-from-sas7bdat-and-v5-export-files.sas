Python R import a subset of SAS columns from sas7bdat and v5 export files;                                                       
                                                                                                                                 
   Two Techniques                                                                                                                
        a. sas7bdat import (preferred does not read in the unneeded columns?)                                                    
        b. v5 export                                                                                                             
           Parfait                                                                                                               
           https://stackoverflow.com/users/1422451/parfait                                                                       
        c. Python pyreadstat                                                                                                     
                                                                                                                                 
GitHub                                                                                                                           
https://tinyurl.com/y3agnamk                                                                                                     
https://github.com/rogerjdeangelis/utl-python-r-import-a-subset-of-SAS-columns-from-sas7bdat-and-v5-export-files                 
                                                                                                                                 
StackOverflow                                                                                                                    
https://tinyurl.com/y2kd8cvz                                                                                                     
https://stackoverflow.com/questions/64392739/keep-only-specific-variables-while-importing-a-sas-export-file-into-r-using-sasx    
                                                                                                                                 
/*                   _                                                                                                           
(_)_ __  _ __  _   _| |_                                                                                                         
| | `_ \| `_ \| | | | __|                                                                                                        
| | | | | |_) | |_| | |_                                                                                                         
|_|_| |_| .__/ \__,_|\__|                                                                                                        
        |_|             _____ _         _       _                                                                                
  __ _     ___  __ _ __|___  | |__   __| | __ _| |_                                                                              
 / _` |   / __|/ _` / __| / /| `_ \ / _` |/ _` | __|                                                                             
| (_| |_  \__ \ (_| \__ \/ / | |_) | (_| | (_| | |_                                                                              
 \__,_(_) |___/\__,_|___/_/  |_.__/ \__,_|\__,_|\__|                                                                             
*/                                                                                                                               
                                                                                                                                 
options validvarname=upcase;                                                                                                     
libname sd1 "d:/sd1";                                                                                                            
data sd1.have;                                                                                                                   
  set sashelp.class(obs=3);                                                                                                      
run;quit;                                                                                                                        
                                                                                                                                 
SD1.HAVE total obs=19                                                                                                            
                                                                                                                                 
  NAME       SEX    AGE    HEIGHT    WEIGHT                                                                                      
                                                                                                                                 
  Joyce       F      11     51.3       50.5                                                                                      
  Louise      F      12     56.3       77.0                                                                                      
  Alice       F      13     56.5       84.0                                                                                      
 ...                                                                                                                             
/*              ____                               _                                                                             
| |__    __   _| ___|    _____  ___ __   ___  _ __| |_                                                                           
| `_ \   \ \ / /___ \   / _ \ \/ / `_ \ / _ \| `__| __|                                                                          
| |_) |   \ V / ___) | |  __/>  <| |_) | (_) | |  | |_                                                                           
|_.__(_)   \_/ |____/   \___/_/\_\ .__/ \___/|_|   \__|                                                                          
                                 |_|                                                                                             
*/                                                                                                                               
                                                                                                                                 
libname xpt xport "d:/xpt/have.xpt";                                                                                             
proc copy in=sd1 out=xpt;                                                                                                        
 select have;                                                                                                                    
run;quit;                                                                                                                        
                                                                                                                                 
/*           _               _                                                                                                   
  ___  _   _| |_ _ __  _   _| |_                                                                                                 
 / _ \| | | | __| `_ \| | | | __|                                                                                                
| (_) | |_| | |_| |_) | |_| | |_                                                                                                 
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                
 ____           |_|                                                                                                              
|  _ \                                                                                                                           
| |_) |                                                                                                                          
|  _ <                                                                                                                           
|_| \_\                                                                                                                          
                                                                                                                                 
*/                                                                                                                               
                                                                                                                                 
tibble [3 x 3] (S3: tbl_df/tbl/data.frame)                                                                                       
 $ NAME: chr [1:3] "Joyce" "Louise" "Alice"                                                                                      
 $ SEX : chr [1:3] "F" "F" "F"                                                                                                   
 $ AGE : num [1:3] 11 12 13                                                                                                      
 - attr(*, "label")= chr "HAVE"                                                                                                  
                                                                                                                                 
                                                                                                                                 
# A tibble: 3 x 3                                                                                                                
  NAME   SEX     AGE                                                                                                             
  <chr>  <chr> <dbl>                                                                                                             
1 Joyce  F        11                                                                                                             
2 Louise F        12                                                                                                             
3 Alice  F        13                                                                                                             
                                                                                                                                 
/*           _   _                                                                                                               
 _ __  _   _| |_| |__   ___  _ __                                                                                                
| `_ \| | | | __| `_ \ / _ \| `_ \                                                                                               
| |_) | |_| | |_| | | | (_) | | | |                                                                                              
| .__/ \__, |\__|_| |_|\___/|_| |_|                                                                                              
|_|    |___/                                                                                                                     
*/                                                                                                                               
                                                                                                                                 
<class 'pandas.core.frame.DataFrame'>                                                                                            
RangeIndex: 3 entries, 0 to 2                                                                                                    
Data columns (total 3 columns):                                                                                                  
 #   Column  Non-Null Count  Dtype                                                                                               
---  ------  --------------  -----                                                                                               
 0   NAME    3 non-null      object                                                                                              
 1   SEX     3 non-null      object                                                                                              
 2   AGE     3 non-null      float64                                                                                             
dtypes: float64(1), object(2)                                                                                                    
memory usage: 200.0+ bytes                                                                                                       
                                                                                                                                 
     NAME SEX   AGE                                                                                                              
0   Joyce   F  11.0                                                                                                              
1  Louise   F  12.0                                                                                                              
2   Alice   F  13.0                                                                                                              
                                                                                                                                 
/*         _       _   _                                                                                                         
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                         
/ __|/ _ \| | | | | __| |/ _ \| `_ \/ __|                                                                                        
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                        
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                        
                        _____ _         _       _                                                                                
  __ _     ___  __ _ __|___  | |__   __| | __ _| |_                                                                              
 / _` |   / __|/ _` / __| / /| `_ \ / _` |/ _` | __|                                                                             
| (_| |_  \__ \ (_| \__ \/ / | |_) | (_| | (_| | |_                                                                              
 \__,_(_) |___/\__,_|___/_/  |_.__/ \__,_|\__,_|\__|                                                                             
                                                                                                                                 
*/                                                                                                                               
                                                                                                                                 
* create sas dataset;                                                                                                            
options validvarname=upcase;                                                                                                     
libname sd1 "d:/sd1";                                                                                                            
data sd1.have;                                                                                                                   
  set sashelp.class(obs=3);                                                                                                      
run;quit;                                                                                                                        
                                                                                                                                 
* convert to dataframe;                                                                                                          
%utl_submit_r64('                                                                                                                
library(haven);                                                                                                                  
have<-read_sas("d:/sd1/have.sas7bdat",col_select=c("NAME","SEX","AGE"));                                                         
str(have);                                                                                                                       
have;                                                                                                                            
');                                                                                                                              
                                                                                                                                 
/*              ____                               _                                                                             
| |__    __   _| ___|    _____  ___ __   ___  _ __| |_                                                                           
| `_ \   \ \ / /___ \   / _ \ \/ / `_ \ / _ \| `__| __|                                                                          
| |_) |   \ V / ___) | |  __/>  <| |_) | (_) | |  | |_                                                                           
|_.__(_)   \_/ |____/   \___/_/\_\ .__/ \___/|_|   \__|                                                                          
                                 |_|                                                                                             
*/                                                                                                                               
                                                                                                                                 
* create sas dataset;                                                                                                            
options validvarname=upcase;                                                                                                     
libname sd1 "d:/sd1";                                                                                                            
data sd1.have;                                                                                                                   
  set sashelp.class(obs=3);                                                                                                      
run;quit;                                                                                                                        
                                                                                                                                 
* convert sas datset to V5 export file;                                                                                          
libname xpt xport "d:/xpt/have.xpt";                                                                                             
proc copy in=sd1 out=xpt;                                                                                                        
 select have;                                                                                                                    
run;quit;                                                                                                                        
                                                                                                                                 
* import Note lapply is needed to convert factors to character strings.;                                                         
* The converting factors is not needed in R version 4. R changed the default stringFactor default;                               
%utl_submit_r64('                                                                                                                
library(SASxport);                                                                                                               
have<-read.xport("d:/xpt/have.xpt")[c("NAME","SEX","AGE")];                                                                      
have[] <- lapply(have, function(x) if(is.factor(x)) as.character(x) else x);                                                     
str(have);                                                                                                                       
have;                                                                                                                            
');                                                                                                                              
                                                                                                                                 
/*                    _   _                                                                                                      
  ___     _ __  _   _| |_| |__   ___  _ __                                                                                       
 / __|   | `_ \| | | | __| `_ \ / _ \| `_ \                                                                                      
| (__ _  | |_) | |_| | |_| | | | (_) | | | |                                                                                     
 \___(_) | .__/ \__, |\__|_| |_|\___/|_| |_|                                                                                     
         |_|    |___/                                                                                                            
*/                                                                                                                               
                                                                                                                                 
* create input;                                                                                                                  
options validvarname=upcase;                                                                                                     
libname sd1 "d:/sd1";                                                                                                            
data sd1.have;                                                                                                                   
  set sashelp.class(obs=3);                                                                                                      
run;quit;                                                                                                                        
                                                                                                                                 
* convert to oanda dataframe;                                                                                                    
%utl_submit_py64_38('                                                                                                            
import pyreadstat;                                                                                                               
cols = ["NAME","SEX","AGE"];                                                                                                     
have, meta = pyreadstat.read_sas7bdat("d:/sd1/have.sas7bdat", usecols=cols);                                                     
have.info();                                                                                                                     
print(have);                                                                                                                     
');                                                                                                                              
                                                                                                                                 
                                                                                                                                 
