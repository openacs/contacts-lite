-- @cvs-id: $Id$	

create function inline_0 () 
returns integer as '  
begin 
    PERFORM acs_object_type__create_type (  
  ''contact'', -- object_type  
  ''Contact'', -- pretty_name 
  ''Contacts'', -- pretty_plural 
  ''acs_object'',   -- supertype 
  ''contacts'', -- table_name 
  ''contact_id'', -- id_column 
  null, -- package_name 
  ''f'', -- abstract_p 
  null, -- type_extension_table 
  null -- name_method 
  ); 

     return 0;  
end;' language 'plpgsql'; 

select inline_0 (); 

drop function inline_0 ();

create function contact__new (varchar, varchar, varchar, varchar, varchar, 
    varchar, varchar, varchar, integer, integer, text, varchar, varchar, integer,varchar,integer,integer) 
returns integer as ' 
declare 
  p_affix alias for $1; -- default 
  p_given_name alias for $2; -- default 
  p_family_name alias for $3; -- default 
  p_middle_name alias for $4; -- default 
  p_suffix alias for $5; -- default 
  p_formatted_name alias for $6; -- default 
  p_preferred_given_name alias for $7; -- default 
  p_company_name alias for $8; -- default 
  p_company_type_id alias for $9; -- default 
  p_category_id alias for $10; -- default 
  p_notes alias for $11; -- default 
  p_email alias for $12;
  p_title alias for $13;
  p_creation_user alias for $14;
  p_creation_ip alias for $15;
  p_context_id alias for $16;
  p_contact_id alias for $17;
  v_contact_id contacts.contact_id%TYPE; 
begin 
  v_contact_id := acs_object__new (  
    p_contact_id,  
    ''contact'', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into contacts 
    (affix, given_name, family_name, 
     middle_name, suffix, formatted_name, 
     preferred_given_name, company_name, company_type_id, 
     category_id, notes,email,title,  contact_id) 
  values
    (p_affix, p_given_name, p_family_name, 
     p_middle_name, p_suffix, p_formatted_name, 
     p_preferred_given_name, p_company_name, p_company_type_id, 
     p_category_id, p_notes, p_email, p_title, v_contact_id);

  PERFORM acs_permission__grant_permission (
     v_contact_id,
     p_creation_user,
     ''admin''
  );

  return v_contact_id;

end;' language 'plpgsql';

-- need for non-complete import
create or replace function contact__new (varchar, varchar, varchar, varchar, 
    varchar, integer, integer,varchar, integer,varchar,integer) 
returns integer as ' 
declare 
  p_given_name alias for $1; -- default 
  p_family_name alias for $2; -- default 
  p_middle_name alias for $3; -- default 
  p_formatted_name alias for $4; -- default 
  p_company_name alias for $5; -- default 
  p_company_type_id alias for $6; -- default 
  p_category_id alias for $7; -- default 
  p_email alias for $8;
  p_creation_user alias for $9;
  p_creation_ip alias for $10;
  p_context_id alias for $11;

  v_contact_id contacts.contact_id%TYPE; 
  v_formatted_name contacts.formatted_name%TYPE;
begin 
        if p_formatted_name is null 
        then
          v_formatted_name := p_given_name || '' '' || p_family_name;
        else
          v_formatted_name := p_formatted_name;
        end if;  

  v_contact_id := acs_object__new (  
    null,  
    ''contact'', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into contacts 
    (given_name, family_name, middle_name, formatted_name, 
     preferred_given_name, company_name, company_type_id,email, category_id, contact_id) 
  values
    (p_given_name, p_family_name, p_middle_name,p_given_name || '' '' || p_family_name, 
     p_given_name, p_company_name, p_company_type_id, p_email,p_category_id, v_contact_id);


  PERFORM acs_permission__grant_permission (
     v_contact_id,
     p_creation_user,
     ''admin''
  );

  return v_contact_id;

end;' language 'plpgsql';

create or replace function contact__new (varchar, varchar, varchar, varchar, 
    varchar, integer, integer,varchar, integer,varchar,integer,integer) 
returns integer as ' 
declare 
  p_given_name alias for $1; -- default 
  p_family_name alias for $2; -- default 
  p_middle_name alias for $3; -- default 
  p_formatted_name alias for $4; -- default 
  p_company_name alias for $5; -- default 
  p_company_type_id alias for $6; -- default 
  p_category_id alias for $7; -- default 
  p_email alias for $8;
  p_creation_user alias for $9;
  p_creation_ip alias for $10;
  p_context_id alias for $11;
  p_contact_id alias for $12;

  v_contact_id contacts.contact_id%TYPE; 
  v_formatted_name contacts.formatted_name%TYPE;
begin 
        if p_formatted_name is null 
        then
          v_formatted_name := p_given_name || '' '' || p_family_name;
        else
          v_formatted_name := p_formatted_name;
        end if;  

  v_contact_id := acs_object__new (  
    p_contact_id,  
    ''contact'', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into contacts 
    (given_name, family_name, middle_name, formatted_name, 
     preferred_given_name, company_name, company_type_id,email, category_id, contact_id) 
  values
    (p_given_name, p_family_name, p_middle_name,p_given_name || '' '' || p_family_name, 
     p_given_name, p_company_name, p_company_type_id, p_email,p_category_id, v_contact_id);


  PERFORM acs_permission__grant_permission (
     v_contact_id,
     p_creation_user,
     ''admin''
  );

  return v_contact_id;

end;' language 'plpgsql';


create or replace function contact__del (integer) 
returns integer as ' 
declare 
 p_contact_id    alias for $1; 
 v_return integer := 0;  
begin 

   delete from acs_permissions 
     where object_id = p_contact_id; 

   delete from contacts 
     where contact_id = p_contact_id;

   raise NOTICE ''Deleting contact...'';

   return v_return;

end;' language 'plpgsql';

create or replace function contact__set (varchar, varchar, varchar, varchar, varchar, 
    varchar, varchar, varchar, integer, integer, text, varchar, varchar, integer) 
returns integer as ' 
declare 
  p_affix alias for $1; -- default 
  p_given_name alias for $2; -- default 
  p_family_name alias for $3; -- default 
  p_middle_name alias for $4; -- default 
  p_suffix alias for $5; -- default 
  p_formatted_name alias for $6; -- default 
  p_preferred_given_name alias for $7; -- default 
  p_company_name alias for $8; -- default 
  p_company_type_id alias for $9; -- default 
  p_category_id alias for $10; -- default 
  p_notes alias for $11; -- default 
  p_email alias for $12;
  p_title alias for $13;
  p_contact_id alias for $14; -- default  
  v_return integer := 0; 
begin 

  update contacts
  set family_name          = p_family_name,
      given_name           = p_given_name,
      middle_name          = p_middle_name,
      formatted_name       = p_formatted_name,
      preferred_given_name = p_preferred_given_name,
      affix                = p_affix,
      title                = p_title,
      suffix               = p_suffix,
      email                = p_email,
      company_name         = p_company_name,
      company_type_id      = p_company_type_id,
      category_id          = p_category_id,
      notes                = p_notes
  where contact_id = p_contact_id;

  raise NOTICE ''Updating Contacts'';

  return v_return;

end;' language 'plpgsql';

