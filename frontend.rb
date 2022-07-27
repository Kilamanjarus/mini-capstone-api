require "http"
require "tty-table"
all_data = HTTP.get("http://localhost:3000/all_products").parse(:json)
p all_data
