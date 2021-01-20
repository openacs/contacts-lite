
set column(1) list_name
set column(2)  rank
set column(3)  company
set column(4)  address1
set column(5)  address2
set column(6)  city
set column(7)  state
set column(8)  zip
set column(9)  country
set column(10) phone
set column(11) first_name
set column(12) mi
set column(13) last_name

set column_count 13


append csv_string "\"rownum\",\"list_name\",\"rank\",\"company\",\"address1\",\"address2\",\"city\",\"state\",\"zip\",\"country\",\"phone\",\"first_name\",\"mi\",\"last_name\""

append csv_string "\n"

db_foreach csv_download "
  select rownum,
    $column(1) col1,
    $column(2) col2,
    $column(3) col3,
    $column(4) col4,
    $column(5) col5,
    $column(6) col6,
    $column(7) col7,
    $column(8) col8,
    $column(9) col9,
    $column(10) col10,
    $column(11) col11,
    $column(12) col12,
    $column(13) col13
  from contacts_raw
" {

  append csv_string "\"$rownum\""
  set col_index 1
  while { $col_index <= $column_count } {
      regsub -all {[\n\r\f]} [set col$col_index] " " datum
      append csv_string ",\"$datum\""
      incr col_index
  }
  append csv_string "\n"


}

ns_return 200 text/plain $csv_string
