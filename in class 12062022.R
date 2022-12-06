#meghna - 12062022

data(BostonHousing)
dim(BostonHousing)
head(BostonHousing)
sttr(BostonHousing)

# separate into training and testing
index <- sample(nrow(BostonHousing), nrow(BostonHousing) * 0.7, replace = FALSE)
Dtrain <- Boston Housing[index,]
Dtest <- BostonHousing [-index,]

X_train <- Dtrain %>%
    select(-chas) %>%
    select(-medv) %>%
    scale()
apply(Dtrain %>%
          select(-chas) %>%
          select(-medv), 2, mean)
apply(x_train, 2, mean)
apply(x_train, 2, sd)

Y_train <- Dtrain %>%
    select(-chas) %>%
    select(-medv) %>%
    scale()
apply(Dtrain %>%
          select(-chas) %>%
          select(-medv), 2, mean)
apply(y_train, 2, mean)
apply(y_train, 2, sd)


x_test <- Dtest %>%
    select(-chas) %>%
    select(-medv) %>%
    scale()

y_test <- Dtest %>%
    select(-chas) %>%
    select(-medv) %>%
    scale()

# Model ----
model <- keras_model_sequential()
model %>%
    layer_dense(units = 30, activation = "relu") %>%
    layer_dropout(rate = 0.25) %>%
    layer_dense(units = 30, activation = "relu") %>%
    layer_dense(units = 1, activation = "linear")

model %>% compile(
    loss = "mean_squared_error", # https: //keras.io/api/losses/
    # optimizer = "adam"
    optimizer = optimizer_adam(learning_rate = 0.001, decay = 0)
)

history = model %>%
    fit(x = X_train, y = y_train,
        validation_split = 0.1,
        epochs = 50, batch_size = 20)

pred <- predict(model, X_test)$predictions # predictions
e <- y_test - pred
# RMSE
sqrt(mean(e^2))
#MAE
mean(abs(e))

# RF ----
library(ranger)
mrf <- ranger(medv ~., data = X_train)

#| NN transfer learning ----

base_model <- application_resnet50(
    include_top = FALSE,
    weights = "imagenet",
    input_tensor = NULL,
    input_shape = dim(train_x) [-1],
    pooling = "avg",
    classes = 2
)
