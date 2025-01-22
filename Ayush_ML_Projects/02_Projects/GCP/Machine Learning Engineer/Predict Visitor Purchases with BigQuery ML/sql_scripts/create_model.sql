-- Create or replace a binary logistic regression model to predict transactions
-- The model predicts whether a visitor will make a transaction based on the features in the training data.

CREATE OR REPLACE MODEL `bqml_lab.sample_model`
OPTIONS(
  model_type = 'logistic_reg' -- Specify the model type as logistic regression (binary classification)
) AS
-- Use the previously created training dataset
SELECT *
FROM `bqml_lab.training_data`;
