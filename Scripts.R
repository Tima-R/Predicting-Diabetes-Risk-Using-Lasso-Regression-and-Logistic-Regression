
# Load Data
# Load the necessary library and data
library(MASS)
data <- Pima.tr  # Training set from MASS package
head(data)


#data_preprocessing
# Check for missing values
sum(is.na(data))

# Display a summary of the data
summary(data)


# eda
library(ggplot2)

# Visualizing the relationship between glucose and diabetes
ggplot(data, aes(x = glu, y = type)) +
  geom_boxplot() +
  labs(title = "Glucose Levels vs. Diabetes Outcome")


#logistic_regression
# Build the logistic regression model (Generalized Linear Models)
model <- glm(type ~ ., data = data, family = binomial)
# A logistic regression used for binary outcomes, as logistic regression is a type of binomial model

# Summarize the model
summary(model)

# Model Evaluation
# Predict on the test set (use Pima.te for testing)
test_data <- Pima.te
predictions <- predict(model, newdata = test_data, type = "response")
predicted_class <- ifelse(predictions > 0.5, "Yes", "No")

# Confusion matrix
confusion_matrix <- table(Predicted = predicted_class, Actual = test_data$type)

# Calculate accuracy
accuracy <- mean(predicted_class == test_data$type)
accuracy

# Extract values from the confusion matrix
TN <- confusion_matrix["No", "No"]    # True Negatives
TP <- confusion_matrix["Yes", "Yes"]  # True Positives
FP <- confusion_matrix["Yes", "No"]   # False Positives
FN <- confusion_matrix["No", "Yes"]   # False Negatives

# Calculate metrics
precision <- TP / (TP + FP)
recall <- TP / (TP + FN)
f1_score <- 2 * (precision * recall) / (precision + recall)
specificity <- TN / (TN + FP)

# Print metrics
cat("Precision:", round(precision, 4), "\n")
cat("Recall:", round(recall, 4), "\n")
cat("F1 Score:", round(f1_score, 4), "\n")
cat("Specificity:", round(specificity, 4), "\n")


#lasso_regression
install.packages("glmnet")

library(glmnet)

# Prepare data for glmnet (needs matrix input)
x <- as.matrix(data[, -ncol(data)])
y <- as.numeric(data$type == "Yes")

# Applying Lasso Regression (alpha = 1)
model_lasso <- cv.glmnet(x, y, alpha = 1, family = "binomial")

# Plot the cross-validation results
plot(model_lasso)


# Plot predicted vs actual values
predicted_prob <- predict(model, newdata = test_data, type = "response")
ggplot(test_data, aes(x = predicted_prob, y = as.numeric(test_data$type == "Yes"))) +
  geom_point() +
  geom_abline(color = "red") +
  labs(title = "Predicted Probability vs Actual Outcome")
