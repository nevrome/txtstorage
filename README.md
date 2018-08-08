txtstorage
----------

R package that provides a very simple string and number storage system. I needed one for my thesis, so this package is mostly for personal use.

Installation
------------

```{r}
devtools::install_github("nevrome/txtstorage")
```

Usage
-----

```{r}
storage_file <- "teststorage.txt"

important_number <- 3
important_string <- "I like cheese."

txtstorage::store("Important number", important_number, storage_file)
txtstorage::store("Important string", important_string, storage_file)

new_important_number <- 4

txtstorage::store("Important number", new_important_number, storage_file)

txtstorage::read("Important number", storage_file)
```

Licence
-------

rdoxygen is released under the [GNU General Public Licence, version 2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html). Comments and feedback are welcome, as are code contributions.
