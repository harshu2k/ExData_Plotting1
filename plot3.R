# Get the source file for loading data
source('Load_data.R')

plot3 <- function(Data_plot=NULL) {
    # Load the data into a temp variable
    if (is.null(Data_plot)) {
        Data_plot <- load_data()
    }
    
    # Open up a graphics device
    png("plot3.png", width=480, height=480, units = 'px')
    
    # Plot graph as per requirement
    plot(Data_plot$Date.Time, Data_plot$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(Data_plot$Date.Time, Data_plot$Sub_metering_2, col="red")
    lines(Data_plot$Date.Time, Data_plot$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"), lty=1, lwd=2,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Close the graphics device
    dev.off()
    
    # Provide the destination where the plot has been saved
    cat("Plot3.png has been saved in", getwd())
}