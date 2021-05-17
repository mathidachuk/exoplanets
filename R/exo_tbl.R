exo_tbl <- function(tbl_name, head = 6) {
  exoplanets(
    table = tbl_name,
    limit = head,
    quiet = TRUE
  ) %>%
    structure(
      exo_tag = "exo_tbl",
      exo_tbl_name = tbl_name,
      exo_cols = NULL,
      exo_filters = NULL,
      head = head
    )
}

exo_select <- function(exo_tbl, ...) {
  exo_tbl %>%
    select(...) %>%
    structure(
      exo_cols = ellipsis_to_vector(...)
    )
}

exo_filter <- function(exo_tbl, ...) {
  attr <- attributes(exo_tbl)
  exoplanets(
    table = attr$exo_tbl_name,
    columns = attr$exo_cols,
    filters = ellipsis_to_vector(...),
    limit = attr$head,
    quiet = TRUE
  ) %>%
    structure(
      exo_tag = attr$exo_tag,
      exo_tbl_name = attr$exo_tbl_name,
      exo_cols = attr$exo_cols,
      exo_filters = ellipsis_to_vector(...),
      head = attr$head
    )
}

collect <- function(exo_tbl) {
  attr <- attributes(exo_tbl)
  print(attr$exo_tbl_name)
  exoplanets(
    table = attr$exo_tbl_name,
    columns = attr$exo_cols,
    filters = attr$exo_filters,
    limit = Inf,
    quiet = FALSE
  )
}
