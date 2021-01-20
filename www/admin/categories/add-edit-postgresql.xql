<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="new_category">      
      <querytext>
    select contact_category__new (
             null,
            :category_name,
            :user_id,       
            :peeraddr,      
            :package_id     
        );
      </querytext>
</fullquery>

 
</queryset>
