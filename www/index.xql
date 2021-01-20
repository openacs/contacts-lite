<?xml version="1.0"?>
<queryset>

<fullquery name="retrieved_contacts">      
      <querytext>
      select count(*)
      from contacts c, acs_objects o
      where c.contact_id = o.object_id
      ${search_clause}
      ${starts_with_clause}
      </querytext>
</fullquery>

 
</queryset>
