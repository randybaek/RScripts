# Title: R Margins, single figure example
# Date: 2008-02-04
# Project: CFL R graphics

rm(list = ls())    # clear objects
graphics.off() 		# close graphics windows 

# Generate data
seq <- c( 23 ,1014, 5013, 10021, 50035,  100181) 
par <- c(12, 515, 1565,  2515, 12531 , 25076) 
g_range <- range(0, seq, par)

# Plot the data

# - Specify the layout parameters before any plotting
#   If you don't specify them before any plotting, the
#   results will be inconsistent and misaligned.
#
# - oma stands for 'Outer Margin Area', or the total margin space that is outside
#   of the standard plotting region (see graph)
#
# - The vector is ordered, the first value corresponding to the bottom. The entire
#   array is c(bottom, left, top, right)
#
# - All of the alternatives are:
#	- oma: Specify width of margins in number of lines
# 	- omi: Specify width of margins in inches
#	- omd: Specify width of margins in 'device coordinates'
#		- Device coordinates place (0,0) in the upper left and (1,1) in the
#		  lower right corner

par(oma=c(3,8,3,3))  # all sides have 3 lines of space
#par(omi=c(1,1,1,1)) # alternative, uncomment this and comment the previous line to try

# - The mar command represents the figure margins. The vector is in the same ordering of
#   the oma commands.
# 
# - The default size is c(5,4,4,2) + 0.1, (equivalent to c(5.1,4.1,4.1,2.1)). 
#
# - The axes tick marks will go in the first line of the left and bottom with the axis
#   label going in the second line.
#
# - The title will fit in the third line on the top of the graph. 
#
# - All of the alternatives are:
#	- mar: Specify the margins of the figure in number of lines
#	- mai: Specify the margins of the figure in number of inches

par(mar=c(5,4,4,2) + 0.1) 
#par(mai=c(2,1.5,1.5,.5)) # alternative, uncomment this and comment the previous line

# Plot
plot(seq, type="o", col="blue" , ylim=g_range, axes=FALSE, ann=FALSE) # type="n" hides the points

axis(1, at=1:6, lab=c("1", "100", "500", "1000", "5000", "10000"))
axis(2, las=1, at=20000*0:g_range[2])

# Place text in the plot and color everything plot-related red

box("plot", col="black")

lines(par, type="o", pch=22, lty=2, col="red")
#title(ylab= "Execution time (ms)", col.lab=rgb(0,0.5,0), side=2, line=4)


# Place text in the margins and label the margins, all in green
mtext("Parallel vs. Sequantial", side=3, line=2, cex=2, col="Black")

# Label the outer margin area and color it blue
# Note the 'outer=TRUE' command moves us from the figure margins to the outer
# margins.
mtext("Execution time (ms)", side=2, line=2, adj=0.5, cex=1, col=rgb(0,0.5,0), outer=TRUE)

title(xlab= "Input N", col.lab=rgb(0,0.5,0))

legend(1, g_range[2], c("Sequantial","Parallel"), cex=0.8, 
       col=c("blue","red"), pch=21:22, lty=1:2);

# Further reading:
# http://cran.r-project.org/doc/manuals/R-intro.html#Multiple-figure-environment
