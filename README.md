# Predictive Modeling and Analysis of Pima Indians Diabetes Using Regression Techniques in R:

# Introduction
The objective of this project was to develop a predictive model to identify individuals at risk of diabetes using clinical features such as glucose levels, blood pressure, and BMI. The project explores different machine learning techniques, including logistic regression and Lasso regression, to build and evaluate models.

# 1. Loading the  Dataset
The dataset used in this project is the Pima Indians Diabetes Database, which contains 768 observations and 8 clinical features. The target variable is a binary outcome indicating the presence or absence of diabetes.

# 2. Data Preprocessing
The dataset was first checked for missing values, and it was confirmed that there were none, ensuring the data was complete and ready for analysis. A summary of the dataset was then generated to provide key statistics for each variable, such as mean, median, and range. This helped in understanding the data distribution and ensuring it was suitable for modeling without any immediate need for additional cleaning or transformation.

# 3. Exploratory Data Analysis (EDA)
Glucose levels are a crucial indicator of diabetes, making them a primary focus in exploratory data analysis (EDA). Given their direct correlation with diabetes, analyzing glucose first helps quickly reveal patterns, such as higher levels in diabetic individuals. Starting with this well-known predictor provides a strong foundation for further analysis and hypothesis testing, ensuring the dataset aligns with established medical knowledge.

![image](https://github.com/user-attachments/assets/3b3245a4-d32a-4f8c-b7a2-09c41d735bde)

The boxplot shows that individuals with diabetes generally have higher glucose levels than those without, with the median and interquartile range (IQR) for the diabetic group positioned at higher glucose levels. There's more variability in glucose levels among diabetics, as indicated by longer whiskers. The clear separation between the two groups reinforces that glucose is a strong indicator of diabetes, supporting its use as a key predictor in diabetes-related modeling.

The overlap in glucose levels between diabetic and non-diabetic individuals indicates that glucose alone isn't a definitive predictor of diabetes. This suggests the need for a multivariate approach, incorporating other factors like BMI, age, and insulin levels, to improve prediction accuracy and reduce potential misclassification.

# 4. Model Selection: Logistic Regression
Logistic regression was chosen for its simplicity, interpretability, and effectiveness in handling binary classification tasks, making it ideal for predicting the presence or absence of diabetes in this dataset.

![Logistic Regression](https://github.com/user-attachments/assets/cd377411-3c4a-4741-b57f-b352f0510a9c)

The logistic regression analysis results show:

Significant Predictors: Glucose level and pedigree function are significant predictors of the outcome variable. Glucose level has a very strong effect (p < 0.001), and pedigree function is also significant (p < 0.01). Marginally Significant Predictors: BMI and age are marginally significant, with p-values close to 0.05. Insignificant Predictors: Blood pressure and skin thickness do not significantly predict the outcome (p > 0.05). Model Fit: The model improves the fit compared to a baseline model with no predictors, as indicated by a decrease in deviance from the null model to the residual model. The AIC value is 194.39, which is used for model comparison. In summary, glucose level and pedigree function are key predictors, while BMI and age show some potential, and blood pressure and skin thickness do not significantly impact the outcome.






















