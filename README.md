# Getting and Cleaning Data Project

This repo contains project code for `Getting and Cleaning Data` course given
by John Hopkins university on Coursera.

## Script

The script contains a function `run.analysis()` that performs the
actual job:

 * Reads train and test data sets and merges them.
 * Extracts only the measurements on the mean and standard deviation for each measurement.
 * Uses descriptive activity names to name the activities in the data set.
 * Appropriately labels the data set with descriptive names.
 * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This second dataset is stored in 'tidy_dataset.txt'

If you've a Samsung data available in the current directory, just run:

```r
source('./run_analysis.R')
run_analysis() # invoke the actual function
```

Otherwise, you can use `download_data()` function provided in the script.
The function will download the data archive and extract it.
After that you can run `run_analysis()`. The full code:

```r
source('./run_analysis.R')
download_data() # download samsung data and unzip it
run_analysis() # invoke the actual function
```

If you don't want to use `download_data()`, you should download the samsung data
manually, unzip it in the current directory and then run:

```r
source('./run_analysis.R')
run_analysis() # invoke the actual function
```

*Note*: In all the examples above, I assume that the script file
`run_analysis.R` resides in the current working directory. If it does not,
you should provide the correct path to the file to source it.
