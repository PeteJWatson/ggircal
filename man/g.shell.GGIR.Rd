\name{g.shell.GGIR}
\alias{g.shell.GGIR}
\title{
Shell function for analysing an accelerometer dataset.
}
\description{
This function is designed to help users operate all steps of the
analysis. It helps to generate and structure milestone data, 
produces user-friendly reports. The function acts as a shell with
calls to \link{g.part1}, \link{g.part2}, \link{g.part3} and
\link{g.part4}. Please see these specific functions for clarification
on optional input arguments.
}
\usage{
g.shell.GGIR(mode=c(1,2),datadir=c(),outputdir=c(),studyname=c(),f0=1,f1=0, 
do.report=c(2),overwrite=FALSE,visualreport=FALSE,viewingwindow=1,...)
}
\arguments{
  \item{mode}{
  Specify which of the four parts need to be run, e.g. mode = 1 makes
  that \link{g.part1} is run. Default setting, mode = c(1,2), makes
  that both part1 and part2 are ran. Note that if mode = c(1,3) then
  the code will also set do.anglez = TRUE in order to enable sleep
  detection. If you run part 1 and 3 seperatedly then you need to 
  remember to set argument do.anglez to TRUE when running part1.
  }
  \item{datadir}{
  Directory where the accelerometer files are stored or list, e.g. 
  "C:/mydata" of accelerometer filenames and directories, e.g. 
  c("C:/mydata/myfile1.bin","C:/mydata/myfile2.bin").
  }
  \item{outputdir}{
  Directory where the output needs to be stored. Note that this 
  function will attempt to create folders in this directory and uses
  those folder to keep output
  }
    \item{studyname}{
  If the datadir is a folder then the study will be given the name of the
  data directory. If datadir is a list of filenames then the studyname as specified
  by this input argument will be used as name for the study
  }  
  \item{f0}{
   File index to start with (default = 1). Index refers to the filenames sorted
   in increasing order
  }
  \item{f1}{
   File index to finish with (defaults to number of files available)
  }
  \item{overwrite}{
  Do you want to overwrite analysis for which milestone data exists? 
  If overwrite=FALSE then milestone data from a previous analysis will 
  be used if available and visual reports will not be created again.
  }
   \item{do.report}{
  For which parts to generate a summary spreadsheet: 2 and/or 4. Default is c(2).
  A report will be generated based on the available milestone data. When creating 
  milestone data with multiple machines it is advisable to turn the report
  generation off when generating the milestone data, value = c(),
  and then to merge the milestone data and turn report generation back
  on while setting overwrite to FALSE.  
  }
  \item{visualreport}{
  If TRUE then generate visual report based on combined output from part 2
  and 4. This is in beta-version at the moment.
  }
  \item{viewingwindow}{
  Centre the day as displayed around noon (value = 1) or around midnight (value = 2)
  }
  \item{...}{
   Any input argument needed for functions g.part1, g.part2, g.part3
   or g.part4. See respective function documentation for further clarification.
  }  
}
\value{
 The function provides no values, it only ensures that other functions are called
 and that their output is stored.
}
\examples{
\dontrun{
mode= c(1,2,3,4)
datadir= "C:/myfolder/mydata"
outputdir= "C:/myresults"
studyname="test"
f0 = 1 
f1 = 2
g.shell.GGIR(#-------------------------------
             # General parameters
             #-------------------------------
             mode=mode, 
             datadir=datadir, 
             outputdir=outputdir, 
             studyname=studyname, 
             f0=f0, 
             f1=f1,
             overwrite = FALSE, 
             do.imp=TRUE,
             idloc=1, 
             print.filename=FALSE,
             storefolderstructure = FALSE,
             #-------------------------------
             # Part 1 parameters:
             #-------------------------------
             windowsizes = c(5,900,3600),
             do.cal=TRUE, 
             do.enmo = TRUE,
             do.anglez=TRUE,
             chunksize=1,
             printsummary=TRUE,
             #-------------------------------
             # Part 2 parameters:
             #-------------------------------
             strategy = 1,
             ndayswindow=7,
             hrs.del.start = 1,
             hrs.del.end = 1, 
             maxdur = 9,
             includedaycrit = 16, 
             L5M5window = c(0,24),
             M5L5res = 10,
             winhr = c(5,10),
             qlevels = c(c(1380/1440),c(1410/1440)),
             qwindow=c(0,24), 
             ilevels = c(seq(0,400,by=50),8000), 
             mvpathreshold =c(100,120),
             #-------------------------------
             # Part 3 parameters:
             #-------------------------------
             timethreshold= c(5,10),
             anglethreshold=5,
             ignorenonwear = TRUE,
             #-------------------------------
             # Part 4 parameters:
             #-------------------------------
             excludefirstlast = FALSE,
             includenightcrit = 16,
             def.noc.sleep = c(),
             loglocation= "D:/sleeplog.csv",
             outliers.only = FALSE,
             criterror = 4,
             relyonsleeplog = FALSE,
             sleeplogidnum = TRUE,
             colid=1, 
             coln1=2, 
             do.visual = TRUE,
             nnights = 9,
             #-------------------------------
             # Part 5 parameters:
             #-------------------------------
             # Key functions: Merging physical activity with sleep analyses
             threshold.lig = c(30,40,50),
             threshold.mod = c(100,120),
             threshold.vig = c(400,500),
             excludefirstlast = FALSE,
             boutcriter = 0.8,
             boutcriter.in = 0.9,
             boutcriter.lig = 0.8,
             boutcriter.mvpa = 0.8,
             boutdur.in = c(10,20,30),
             boutdur.lig = c(1,5,10),
             boutdur.mvpa = c(1,5,10),
             timewindow = c("WW"),
             #-----------------------------------
             # Report generation
             #-------------------------------
             do.report=c(2,4,5))
}
}
\author{
  Vincent T van Hees <vincentvanhees@gmail.com>
}
\references{
\itemize{
\item van Hees VT, Gorzelniak L, Dean Leon EC, Eder M, Pias M, et al. (2013) Separating
Movement and Gravity Components in an Acceleration Signal and Implications for the
Assessment of Human Daily Physical Activity. PLoS ONE 8(4): e61691.
doi:10.1371/journal.pone.0061691
\item van Hees VT, Fang Z, Langford J, Assah F, Mohammad A, da Silva IC, Trenell MI, 
White T, Wareham NJ, Brage S. Auto-calibration of accelerometer data for
free-living physical activity assessment using local gravity and temperature: 
an evaluation on four continents. J Appl Physiol (1985). 2014 Aug 7
\item van Hees VT, Sabia S, et al. (2015) A novel, open access method to
assess sleep duration using a wrist-worn accelerometer, PLoS ONE, November 2015
}
}
