<?xml version="1.0"?>
<queryset>

<fullquery name="contact_info">      
      <querytext>
      
    select 
       c.given_name || ' ' || c.family_name as pretty_name,
       c.company_name,contact_id
    from contacts c
    where contact_id = :contact_id

      </querytext>
</fullquery>

 
</queryset>
