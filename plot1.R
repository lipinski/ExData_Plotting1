# Loading dataset
df = read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE)

# Replacing missing values with NA
df[df == "?"] <- NA

# Changing date column to date objectt
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

# Selecting intresting subset
df_sub = subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# Opening divice
png("plot1.png")

# Ploting histogram of Global Active Power
with(df_sub, hist(
  as.numeric(Global_active_power), 
  breaks = 24, 
  col = "red",
  main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
))

# Closing divice
dev.off()