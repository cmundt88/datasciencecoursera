## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ">UCI Website.</a>

The data is made up of several files which collects data from wearable technology
(Samsung Galaxy S) for 30 subjects doing 6 activities.  The assignment is to
demonstrate the ability to combine files, apply descriptive labels, and summarize 
the data by way of Subject and Activity.

## The following files will be used by my code:

activity_labels.txt  --  used to provide a descriptive translation of the codes
features.txt  --  used to provide data labels
X_test.txt  --  the measured data for the test group of subjects
y_test.txt  --  an activity code for each data measurement for the test data
subject_test.txt  --  the test subject for each data measurement
X_train.txt  --  the measured data for the training group of subjects
y_train.txt  --  an activity code for each data measurement for the training data
subject_train.txt  --  the training subject for each data measurement

The code reads all files into tables and then combines like data sets with a 
row bind.  X data sets, y data sets, and subject information.  The code then 
uses a grepl to subset the data to just the mean and standard deviation data. 
Next is the adding of activity and subject information by way of column binding. 
The last step is to create the final, clean dataset by using the group_by 
function to group by the Subject and the Activity and then the summarize_each 
to provide the mean for each column.  Finally the code writes to a csv.

An explanation of variables used can be found in the CodeBook.