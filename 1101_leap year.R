
# if else
temp = -50

if (temp < 0) {
    print("It's freezing!")
    if (temp < 32) {
        print("And kids don't go to school")
    }
} else {
    print("It's not freezing.")
}

x = 50
checkweather <- function(x, verbose = FALSE) {
    # x is temperature, degrees C
    # verbose is logical value, indicating to print results
    if (FALSE) {
        x = 5
    }
    xf <- 32 + 1.8*x
    print(paste0("In Farenheit it is ", xf, "."))
    if (x < 0) {
        if (verbose) {
        print("It's freezing!")
        }
        if (x < 32) {
          if (verbose) {
            print("And kids don't go to school")
          }
      }
    } else {
        if (verbose) {
            print("It's not freezing.")
        }
    }
    return(xf)
}

tempF = checkweather(55)
checkweather()

10 %% 3
x = 9

is.leap <- function(year)
is.leap = function(year) {
if((year %% 4) = 0) {
  if((year %% 100) == 0) {
    if((year %% 400) == 0) {
      print(paste(y, "is a leap year"))
    } else {
      print(paste(y, "is not a leap year"))
    }
  } else {
    print(paste(y, "is a leap year"))
  }
} else {
  print(paste(y, "is not a leap year"))
}
}
