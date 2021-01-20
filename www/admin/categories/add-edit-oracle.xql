<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="new_category">      
      <querytext>
      
      declare
        id integer;
      begin
        id := contact_category.new (
        category_name => :category_name,
        creation_user => :user_id,
        creation_ip => :peeraddr,
        context_id => :package_id
        );

        acs_permission.grant_permission(
          object_id  => id,
          grantee_id => :user_id,
          privilege  => 'write'
        );

        acs_permission.grant_permission (
          object_id  => id,
          grantee_id => :user_id,
          privilege  => 'delete'
        );
      end;
    
      </querytext>
</fullquery>

 
</queryset>
