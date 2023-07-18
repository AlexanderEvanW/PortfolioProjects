# 🏦 Analyzing and Predicting Bank Customer Churn

![churn](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/059ae2c9-3721-43a4-b618-4cfc2da3195f)

The complete project can be viewed at [this notebook.](https://github.com/AlexanderEvanW/PortfolioProjects/blob/main/Bank%20Customer%20Churn/Bank%20Customer%20Churn.ipynb)

## 🔎 Objective
In this project, we will explore the 'Bank Customer Churn' dataset to analyze customer churn and extract valuable information. This information will help the bank improve its customer retention strategies. Afterward, we will attempt to build a model for predicting customer churn.

Customer churn refers to the occurrence when customers discontinue their relationship with a company or stop using its products or services. Understanding the factors that contribute to churn is crucial for businesses to retain customers and maintain long-term profitability. As we know, it is much more expensive to sign in a new client than keeping an existing one. It is advantageous for banks to know what leads a client towards the decision to leave the company. Churn prevention allows companies to develop loyalty programs and retention campaigns to keep as many customers as possible.

## 🔨 Tools
Python is used in this project, and the following is a list of the main libraries I used:
- Pandas: Used for data manipulation and analysis. It provides efficient data structures and functions to work with structured data, such as tables or spreadsheets.
- NumPy: Used for numerical computations in Python.
- Matplotlib: Used for data visualization.
- Seaborn: Used for data visualization.
- Scikit-learn: Provides a wide range of tools and algorithms for various machine learning tasks.

## 🔢 Dataset
The dataset is available online on [Kaggle](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn).

**Data Dictionary:**

RowNumber: The unique identifier for each record in the dataset. <br>
CustomerId: Randomly generated values assigned to each customer. <br>
Surname: The last name of the customer. <br>
CreditScore: A measure of the customer's creditworthiness.. <br>
Geography: The customer's location. <br>
Gender: The customer's gender. <br>
Age: The customer's age. <br>
Tenure: The number of years the customer has been a client of the bank, indicating loyalty. <br>
Balance: The amount of money in the customer's account. <br>
NumOfProducts: The number of products the customer has purchased through the bank. <br>
HasCrCard: Indicates whether the customer has a credit card. <br>
IsActiveMember: Indicates whether the customer is an active member. <br>
EstimatedSalary: The estimated salary of the customer, which, similar to balance. <br>
Exited: Indicates whether the customer has left the bank or not, indicating whether a customer has churned (1) or not (0). <br>
Complain: Indicates whether the customer has made a complaint or not. <br>
SatisfactionScore: The score provided by the customer for the resolution of their complaint. <br>
CardType: The type of card held by the customer. <br>
Points Earned: The points earned by the customer for using their credit card. <br>

## 🏢 Workflow

**Basic Data Exploration**

In this step, we explore the data to gain an understanding of its characteristics. We seek to answer questions such as:
- How many data do we have?
- Are there any null values in the dataset?
- Are there any unused features that should be dropped?
- What are the mean, median, maximum, and minimum values of certain features?
- What does our dependent variable look like?
- How many categorical and numerical features do we have?

**Data Preprocessing and Feature Engineering**

In this step, we ensure that the data is prepared for analysis and model building. Here are some of the tasks we perform:
- Checking for duplicates.
- Handling outliers.
- Combining preprocessing steps into a pipeline. The pipeline consists of the following steps:
  - Splitting the dataframe into X for the features and y for the target variable.
  - Separating the numerical and categorical columns and identifying the remaining columns that won't go through the pipeline because they are already encoded.
  - Creating transformers to scale the numerical columns and applying one-hot encoding and ordinal encoding for the categorical columns.
  - Combining the transformers and columns into a 'preprocessor.'
  - Finally, fitting and applying the 'preprocessor' to X to obtain the preprocessed features, X_preprocessed.
- Splitting the preprocessed data into training and test sets.
- Handling an imbalanced dataset.

**Exploratory Data Analysis**

In this step, we aim to delve deeper and answer questions such as:
- What is the distribution of categorical and numerical features?
- Are there any churn patterns based on these features?
- What does the feature correlation look like?

**Model Building**

In this step, we build models and then compare the performance of multiple machine learning models using cross-validation while evaluating them on a test set. We tried using the basic parameters, performed a grid search to find the best parameter values, and created new features to find the best performance model.

## 📃 Conclusion

In conclusion, this project aimed to predict bank customer churn. The project workflow started with basic data exploration, followed by data preprocessing, feature engineering, and the creation of a pipeline to preprocess the data. Exploratory data analysis was conducted to understand the distribution of categorical and numerical features, examine churn patterns based on these features, and analyze feature correlations using a correlation matrix. Next, a machine learning model was built to predict customer churn, leveraging the processed data and engineered features. The initial model's performance was evaluated, and efforts were made to further improve its accuracy and predictive power. Additional feature engineering was performed to create new features and try to enhance the model's performance.

Through this project, valuable insights were gained into the factors contributing to customer churn in the banking industry. The combination of data exploration, preprocessing, feature engineering, and machine learning modeling allowed for the development of a predictive model that can assist in identifying customers at risk of churning.







