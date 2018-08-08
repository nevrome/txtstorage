#' store
#'
#' Store a named value in a storage file. The storage file is created if it does not exist.
#'
#' @param name Character or number. Name of value.
#' @param value Character or number. Value
#' @param path Character. Path to storage file.
#'
#' @export
store <- function(name, value, path) {
  create_storage_if_not_exists(path)
  storage <- read_storage(path)
  if (any(storage$name == name)) { 
    storage$value[storage$name == name] <- value 
  } else {
    storage <- rbind(storage, data.frame(name, value))
  }
  utils::write.csv(storage, file = path, row.names = F)
}

#' read
#' 
#' Read info from the storage file.
#'
#' @param name Character or number. Name of value.
#' @param path Character. Path to storage file.
#'
#' @return Character.
#' 
#' @export
read <- function(name, path) {
  storage <- read_storage(path)
  return(storage$value[storage$name == name])
}

##### file system interaction ####
create_storage <- function(path) {
  utils::write.csv(
    data.frame(name = character(), value = character(), stringsAsFactors = F), 
    file = path,
    row.names = F
  )
  message(paste0("Created a new storage file at: ", path))
}
check_if_storage_exists <- function(path) file.exists(path)
create_storage_if_not_exists <- function(path) if (!check_if_storage_exists(path)) create_storage(path)
read_storage <- function(path) utils::read.csv(path, stringsAsFactors = F)
