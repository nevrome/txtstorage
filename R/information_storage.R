#' @export
store_info <- function(name, value, path) {
  create_storage_if_not_exists(path)
  storage <- read_storage(path)
  if (any(storage$name == name)) { 
    storage$value[storage$name == name] <- value 
  } else {
    storage <- rbind(storage, data.frame(name, value))
  }
  write.csv(storage, file = path, row.names = F)
}

#' @export
read_info <- function(name, path) {
  storage <- read_storage(path)
  return(storage$value[storage$name == name])
}

read_storage <- function(path) {
  read.csv(path, stringsAsFactors = F)
}

# file system interaction
create_storage <- function(path) {
  write.csv(
    data.frame(name = character(), value = character(), stringsAsFactors = F), 
    file = path,
    row.names = F
  )
}
check_if_storage_exists <- function(path) file.exists(path)
create_storage_if_not_exists <- function(path) if (!check_if_storage_exists(path)) create_storage(path)
