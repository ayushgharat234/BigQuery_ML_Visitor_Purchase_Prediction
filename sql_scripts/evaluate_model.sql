-- Evaluate the performance of the logistic regression model
-- The evaluation provides metrics like accuracy, precision, recall, F1 score, log loss, etc., depending on the model type.

SELECT
  * -- Retrieve all available evaluation metrics for the model
FROM
  ML.EVALUATE(MODEL `bqml_lab.sample_model`);