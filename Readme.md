## Readme for Course Project Data Cleaning

Welcome and thanks for taking the time to evaluate my solution. 

You will find two addional files in this directory:

* Codebook.md - explains the variables that are used in the final output
* run_analysis.R - contains the actual script for the production of the tidy dataset

The instructions on Coursera were sometimes ambiguous, so I will quickly outline how 
I cam up with my solution.

The working directory should be set to work on any computer, however if you run 
into problems, you can change the directory on the second line of the code.

1. The different files were loaded into the script and combined to form one large dataset (2-28)
2. The column names were taken from the file features.txt
3. Only the values for mean and standard deviation were chosen as mentioned in the instructions
4. The large dataset was combined with the file containing the coding for activities in order
   to show them with descriptive values (walking, sittin, etc.) (33-34)
5. In the last step only means were extracted to a new dataset. This was then merged and
   edited with dcast so that you receive a table with means for every activity, 
   subject and measurement

Thanks again for evaluating!
