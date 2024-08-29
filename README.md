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

# 5. Model Evaluation
The results from the prediction on the test set, as summarized in the confusion matrix, indicate that the model has an accuracy of approximately 80.12%. This means that the model correctly classified 80.12% of the instances in the test set. Specifically, it accurately predicted 200 negative cases (True Negatives) and 66 positive cases (True Positives), while it incorrectly predicted 23 negative cases as positive (False Positives) and 43 positive cases as negative (False Negatives). This performance suggests that the model is generally effective at distinguishing between positive and negative cases, but there is still a notable rate of misclassification, particularly in failing to identify positive cases (False Negatives).

The model achieved an accuracy of 80.12%, with a precision of 74.16%, recall of 60.55%, F1 score of 66.67%, and specificity of 89.69%. It correctly identified most cases but had some misclassification, particularly in missing positive cases.

# 6. Model Interpretation
The coefficients from the logistic regression model provide insight into how each predictor variable influences the likelihood of a positive outcome, such as a diabetes diagnosis. The intercept of -9.773 suggests the baseline log-odds of a positive outcome when all predictor variables are at zero. Each coefficient represents the change in log-odds for a one-unit increase in the corresponding predictor, assuming all other variables remain constant. For example, the coefficient for glu (glucose level) is 0.103, indicating that higher glucose levels are associated with an increased likelihood of a positive outcome. Conversely, the coefficients for skin (skinfold thickness) and bp (blood pressure) are slightly negative (-0.0019 and -0.0048, respectively), suggesting that increases in these variables are associated with a slight decrease in the likelihood of a positive outcome. Notably, the ped (diabetes pedigree function) has a strong positive coefficient of 1.820, indicating a significant association with a higher risk of a positive outcome. This analysis highlights the relative importance of each variable in predicting the outcome.

# 7. Model Refinement with Regularization**
Lasso regression was used for model refinement because it adds regularization, which helps prevent overfitting by penalizing less important features and potentially shrinking their coefficients to zero. This not only improves the model's generalization to new data but also simplifies the model by selecting only the most relevant predictors, making it more interpretable.

![image](https://github.com/user-attachments/assets/e6fa9228-2612-4f11-8b3f-97132b02a178)

The plot shows the results of Lasso regression with cross-validation, illustrating how the binomial deviance changes with different values of the regularization parameter, λ. The vertical dashed lines mark the λ values that minimize the deviance and the most regularized model within one standard error of this minimum. The plot helps in selecting the optimal λ that balances model accuracy and complexity, ensuring the model remains effective while potentially reducing the number of predictors used.

In the plot, the optimized λ (lambda) is indicated by the leftmost vertical dashed line. This line corresponds to the lambda value that minimizes the binomial deviance during cross-validation. This value is considered the best in terms of balancing the model's accuracy and its ability to generalize to new data. The second vertical dashed line (on the right) represents the largest lambda value within one standard error of the minimum, offering a more regularized and simpler model if needed.

# 8. Reporting
# Plot predicted vs actual values
This graph is used to visually assess how well the model's predicted probabilities match the actual outcomes, helping to identify if the model is making confident and accurate predictions or if there are misclassifications.

![image](https://github.com/user-attachments/assets/c0f2003e-85c9-429b-80bd-7138fcdf1222)

The "Predicted Probability vs Actual Outcome" graph shows that the model generally performs well, with most points close to the diagonal red line, indicating correct predictions. Positive cases (Y = 1) are mostly predicted with high probabilities, and negative cases (Y = 0) are predicted with low probabilities. This suggests the model effectively distinguishes between positive and negative outcomes. However, points that deviate from the diagonal line indicate some misclassifications, where the predicted probability did not match the actual outcome.

# 9. Overall Conclusion
This project aimed to predict diabetes risk using a combination of logistic regression and Lasso regression techniques. The initial logistic regression model provided a solid foundation with an accuracy of 80.12%, effectively distinguishing between positive and negative cases. However, further evaluation using precision, recall, F1 score, and specificity revealed areas for improvement, particularly in reducing false negatives.

To refine the model, Lasso regression was employed, which helped in feature selection by penalizing less important variables, leading to a simpler and more interpretable model. The cross-validation results demonstrated the effectiveness of regularization, identifying an optimal lambda value that balanced model accuracy with simplicity.

The model's performance was visualized through various plots, including the predicted probability vs. actual outcome graph, which confirmed that the model was generally well-calibrated, with confident predictions for most cases. However, some misclassifications were noted, highlighting areas for potential improvement.

In summary, the project successfully demonstrated the application of logistic and Lasso regression in predicting diabetes risk. While the model performed well, there is room for further refinement, such as exploring more advanced modeling techniques, fine-tuning the decision threshold, or incorporating additional features to enhance predictive accuracy and reduce misclassification.



























