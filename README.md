###Intro
This is the repo where I stored the work for the Getting and Cleaning Data project on 
wereable technology data.

To summarize some important data:

* The experiments were carried out with a group of 30 volunteers with ages 19-48 years.

* Each participante performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

* 70% of the participants were selected for generating the training data and 30% the test data.

__Citation:__ Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

---

###Raw data info
The data for this project comes from [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Information on the raw data files:

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features. Features are normalized and bounded within [-1,1].   Each feature vector is a row on the text file.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

I'm not using the Inertial Signals, as stated in the forum thread David's project FAQ.

---

###run_analysis.R script info

This are some directions from my notes/comments during the realization of the exercise:

0. Step 0 
      * Read the separate data files.
      * Changed the names of the columns to 'activity' and 'participant' in the YTrain/Test
            pieces and the Subject separate files of data.
      * Examined the structure of each data file, to find dim() and see what goes
            with what.
      * Read the features and activity labels data files.
      

1. Assignment 1: Merge training and test sets to create single data set
      * Put together training data with cbind (participant IDs, variables and activity)
            check dimensions to see if they seem correct.
      * Put together test data with cbind again (same kind)
      * Created a full dataset by adding the rows of the test data and training data together.
      * Now FullData has a lot of unnamed variables, that I wanted to fill with the names contained in features.txt. To do that, I assign the values of a vector I created with the
      contents of features.txt to the variable names in FullData that are neither 'participant' nor 'activity'.
      
      
2. Assigmnet 2: Extract only the variables that have something to do with the mean and
      standard deviation for each measurement.
      * I did a subset of the columns with 'mean' or 'std' in the variable names.

3. Assignment 3: Use real activity names to replace the codes in FullData
      * I replaced each 1 to 6 value (previously converted to character) to its label as appears in the previously loaded activity data file. It is kind of an ugly way, but
      It was the first I thinked of...


4. Assignment 4: Change column variable names to make them more descriptive.
      * Naming conventions: I used [this article](http://www.lunduniversity.lu.se/lup/publication/3492317) by Rasmus Bååth (2012) to get some info on the state of naming conventions.
      * Changes I made to variable names:
            * Change initial f to 'freq' and t to 'time' because I think they are easier to spot that way.
            
            * Drop the '()' that appear at the end of mean and std strings, because I think they do not add useful information to the variable name.
            
            * Erase some 'Body' strings that seemed to be duplicated. 
            
            * Make variable names underscore separated, because I think some spacing
            between characters makes the names more readable.

            * Lowercase, because once you have each abreviation separated by underscore,
            you do not need capital letters.

5. Assingment 5: Create tidy data set with the average of each variable for each activity and participant.
      * Tried to do some cleaning, and then the write.table to get the .txt file.
