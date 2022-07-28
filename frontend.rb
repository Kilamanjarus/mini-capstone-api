require "http"
require "tty-table"
# all_data = HTTP.get("http://localhost:3000/all_products").parse(:json)
# p all_data
tabletest = TTY::Table.new(["I don't know", "where these go"], [["so it is time", "to put on a show"], ["and add one here", "to make it like the demo"]])
tabletest.render(:ascii)

table = TTY::Table.new(["header1", "header2"], [["a1", "a2"], ["b1", "b2"]])
table.render(:basic)
