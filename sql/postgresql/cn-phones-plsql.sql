-- @cvs-id: $Id$

select acs_object_type__drop_type('cn_phone_number', TRUE);

create function inline_0 () 
returns integer as '  
begin 
    PERFORM acs_object_type__create_type (  
  ''cn_phone_number'', -- object_type  
  ''Phone Number'', -- pretty_name 
  ''Phone Numbers'', -- pretty_plural 
  ''acs_object'',   -- supertype 
  ''cn_phone_numbers'', -- table_name 
  ''phone_number_id'', -- id_column 
  ''cn_phone_number'', -- package_name 
  ''f'', -- abstract_p 
  null, -- type_extension_table 
  null -- name_method 
  ); 
     return 0;  
end;' language 'plpgsql'; 

select inline_0 (); 
 
drop function inline_0 ();


create or replace function cn_phone_number__new (integer, varchar, integer, integer,varchar,integer,varchar,integer) 
returns integer as ' 
declare 
  p_contact_id alias for $1; -- default 
  p_phone_number alias for $2; -- default 
  p_phone_number_id alias for $3; -- default 
  p_phone_type_id alias for $4; -- default  
  p_best_contact_time alias for $5;
  p_creation_user alias for $6;
  p_creation_ip alias for $7;
  p_context_id alias for $8;
  v_phone_number_id cn_phone_numbers.phone_number_id%TYPE; 
begin 
  v_phone_number_id := acs_object__new (  
    null,  
    ''cn_phone_number'', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into cn_phone_numbers 
    (contact_id, phone_number, phone_number_id, phone_type_id,best_contact_time) 
  values
    (p_contact_id, p_phone_number, v_phone_number_id, p_phone_type_id, p_best_contact_time);
  
  PERFORM acs_permission__grant_permission (
     v_phone_number_id,
     p_creation_user,
     ''admin''
  );

  return v_phone_number_id;

end;' language 'plpgsql';


create or replace function cn_phone_number__del (integer) 
returns integer as ' 
declare 
 p_phone_number_id    alias for $1; 
 v_return integer := 0;  
begin 

   delete from acs_permissions 
     where object_id = p_phone_number_id; 

   delete from cn_phone_numbers 
     where phone_number_id = p_phone_number_id;

   raise NOTICE ''Deleting cn_phone_number...'';

   return v_return;

end;' language 'plpgsql';

  
create or replace function cn_phone_number__set (integer, varchar, integer, integer, varchar)   
returns integer as ' 
declare 
  p_contact_id alias for $1; -- default 
  p_phone_number alias for $2; -- default 
  p_phone_number_id alias for $3; -- default 
  p_phone_type_id alias for $4; -- default  
  p_best_contact_time alias for $5;
  v_return integer := 0; 
begin  

  if p_contact_id is not null
  then
   update cn_phone_numbers set contact_id = p_contact_id
    where phone_number_id = p_phone_number_id;
  end if;

  if p_phone_number is not null
  then
   update cn_phone_numbers set phone_number = p_phone_number
    where phone_number_id = p_phone_number_id;
  end if;

  if p_phone_type_id is not null
  then
   update cn_phone_numbers set phone_type_id = p_phone_type_id
    where phone_number_id = p_phone_number_id;
  end if;

  if p_best_contact_time is not null
  then
   update cn_phone_numbers set best_contact_time = p_best_contact_time
    where phone_number_id = p_phone_number_id;
  end if;

  return v_return;
end;' language 'plpgsql';
