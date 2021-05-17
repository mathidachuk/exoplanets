# https://stackoverflow.com/questions/23702882/r-convert-multiple-function-arguments-to-string-vector
ellipsis_to_vector <- function(...) {
  # Convert to a list, but with the variables still as an expression
  args_as_expression <- substitute(list(...))
  # Deparse each item in the expression, turning it into a char vector
  # Why the [-1]? Because the first element in the list expression is "list"! :-)
  args_as_char_vector <- sapply(args_as_expression, deparse)[-1]
  args_as_char_vector
}
