#Mixing Objects: Coercion
a <- c("a","b")
c(TRUE,1)
c("a",TRUE)

#explicit coercion
x <- 0:6
class(x)
as.logical(x)
class(x)
as.comp
as.complex(x)

#####################################################################
########################      DATA TYPES     ########################
#####################################################################

#---------List---------#
# List are 2-D object i.e. a vector type in terms of dimenstion
# which can store objects of different types
# Elements of list have double bracket

x <- list(1,"a",TRUE,1+4i)
x[[1]]



#---------Factors---------#
# represent categorical data
# Unordered or Ordered data
# these are treated specially by modelling function
x <- factor(c("yes","no","yes","yes"))
x

?table(x) # this gives a frequency table of factor x

#underneath factors are represented as integers by R :
unclass(x)
# so a "no" is being treated as 1 and "yes" is being treated as 2

# changing the baseline level, simply means that you can setup the order in 
# which R consider a level as level 1 and so on
x <- factor(c("yes","no","yes","yes"),levels = c("yes","no"))
x

#---------Missing Values---------#
# Denoted as either (1) NaN: undefined mathematical operation (2) NA: everything else
# is.na() OR is.nan() tests whether the argument in NA or NaN
# NA can have classes such as integer NA
# NaN can be NA, not vice-versa
x <- c(1,2,3,5,NA,2,0)
is.na(x) # checks where the missing values are

#---------Name Attribute---------#
# every object can have names given to it, e.g. elements in a vector, in a matrix, in a data frame
m<- matrix(1:4,nrow=2,ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d"))
m


#---------Data Frame---------#
# data.frame read.table() read.csv() : can be used to create dataframe
# read.matrix() will coerce the data frame


#####################################################################
########################     READING DATA    ########################
#####################################################################
# read.table read.csv : reading tabular data
# readLines : reading lines from a text data
# source : for reading R source code files
# load unserialized : reading binary data

# -----------
# read.table
# read.csv is identical to read.table except separator being comma and header=TRUE
# -----------
# very powerful, you can specify classes of columns, comment characters, 
# separators, header, number of rows, number of first few lines to ignore

# For big data: Supply the colClasses. To get this for a large number of column of data:
# read in few lines"
initial <- read.table("NameofTheFile.txt",nrows=10)
# find the classes
classes <- sapply(initial, class)
# supply this info while reading full table
t <- read.table("NameofTheFile.txt", colClasses = classes)
#

#---------Textual Data Format---------#
# dput(), dget() AND dump(), source()
# these basically unroll the data into a textual format that can be
# saved to a R file from which you can easily recover the data

t <- c(1,2,3,5,NA,2,0)
dput(t, file="temp.R")
# to recreate this R file with data we do:
dget("temp.R")
# dump can be used on multiple R object. NOTE: dput() can be used only on 1 R object



#####################################################################
########################     Interface to the Outer World    ########
#####################################################################

# url : reads webpage into R

con <- url("http://www.testSite.com","r")
x <- readLines(con)



#####################################################################
########################     Subsetting    ##########################
#####################################################################
x <- c("1","2",NA,"d","0",NA)
y <- c("p",NA,"d",NA,"q",NA)
x[complete.cases(x,y)]
y[complete.cases(x,y)]
# complete.cases(x,y) -> Checks the non missing position COMBO in the two vectors
# you can directly apply this to a data frame as well


#####################################################################
#########################   Loop Functions   ########################
#####################################################################

# lapply : Loop over objects and apply a function on all those objects
# sapply : 
# apply
# tapply
# mapply

# split : used in conjunctin with lapply, this splits a given object 
#         in pieces and then does "lapply" on each of those pieces

### lapply ###
# lapply always returns a list

x <- list(a = 1:4, b=runif(8),c=c(1,2,3,4,5,6,7,8,9,10))
lapply(x,mean)


a <- list(1:4)
lapply(b,runif) # this will generate a list containing 1, 2, 3 and 4 random variables

# You have to generally write a function for performing a lapply as 

x <- list(a="hithere", b="nothithere")
lapply(x,function(t) is.character(t))

### sapply ###
# simplifies lapply result
# for example if the function result in a single number then it will creare a vector


### apply ###

p <- matrix(rnorm(100),10,10)
apply(p, 1, mean) # preserves the 1st i.e. row dimension and takes a mean across all columns
apply(p, 2, mean) # preserves the 2nd i.e. column dimension; collapse rows


### mapply ###

# Example: vectorize a function that doesn't allow for vectors

mapply(noise, 1:5, 1:5, 1)


### tapply ###
# applies function on pieces of vector (this is identified by factor variables)


### split function ###
# split is same as tapply without applying the function


#####################################################################
#########################     SIMULATION    #########################
#####################################################################

# sample function takes randomly from a given set











