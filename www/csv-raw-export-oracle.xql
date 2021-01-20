<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="csv_download">      
      <querytext>
      
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

      </querytext>
</fullquery>

 
</queryset>
