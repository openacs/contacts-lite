-- @cvs-id: $Id$

create function inline_0 () 
returns integer as '  
begin 
    PERFORM acs_object_type__create_type (  
  ''cn_address'', -- object_type  
  ''Address'', -- pretty_name 
  ''Addresses'', -- pretty_plural 
  ''acs_object'',   -- supertype 
  ''cn_addresses'', -- table_name 
  ''address_id'', -- id_column 
  null, -- package_name 
  ''f'', -- abstract_p 
  null, -- type_extension_table 
  null -- name_method 
  ); 

     return 0;  
end;' language 'plpgsql'; 

select inline_0 (); 
 
drop function inline_0 ();

create or replace function cn_address__new (integer,integer, integer, varchar, varchar, varchar, varchar,varchar,
        integer,varchar, integer) 
returns integer as ' 
declare 
  p_address_id alias for $1;
  p_address_type_id alias for $2; -- default 
  p_contact_id alias for $3; -- default 
  p_delivery_address alias for $4; -- default 
  p_municipality alias for $5; -- default null
  p_postal_code alias for $6; -- default null
  p_region alias for $7; -- default null 
  p_country_code alias for $8;
  p_creation_user alias for $9; 
  p_creation_ip alias for $10;
  p_context_id alias for $11;
  v_address_id cn_addresses.address_id%TYPE; 
begin 
  v_address_id := acs_object__new (  
    p_address_id,  
    ''cn_address'', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into cn_addresses 
    (address_id, address_type_id, contact_id, delivery_address, municipality, postal_code, region,country_code) 
  values
    (v_address_id, p_address_type_id, p_contact_id, p_delivery_address, p_municipality, 
     p_postal_code, p_region, p_country_code);

  PERFORM acs_permission__grant_permission (
     v_address_id,
     p_creation_user,
     ''admin''
  );

  return v_address_id;

end;' language 'plpgsql';

create or replace function cn_address__new (integer, integer, varchar, varchar, varchar, varchar,varchar,
        integer,varchar, integer) 
returns integer as ' 
declare 
  p_address_type_id alias for $1; -- default 
  p_contact_id alias for $2; -- default 
  p_delivery_address alias for $3; -- default 
  p_municipality alias for $4; -- default null
  p_postal_code alias for $5; -- default null
  p_region alias for $6; -- default null 
  p_country_code alias for $7;
  p_creation_user alias for $8; 
  p_creation_ip alias for $9;
  p_context_id alias for $10;

  v_address_id cn_addresses.address_id%TYPE; 
begin 
  v_address_id := acs_object__new (  
    null,  
    ''cn_address'', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into cn_addresses 
    (address_id, address_type_id, contact_id, delivery_address, municipality, postal_code, region,country_code) 
  values
    (v_address_id, p_address_type_id, p_contact_id, p_delivery_address, p_municipality, 
     p_postal_code, p_region, p_country_code);

  PERFORM acs_permission__grant_permission (
     v_address_id,
     p_creation_user,
     ''admin''
  );

  return v_address_id;

end;' language 'plpgsql';

create or replace  function cn_address__del (integer) 
returns integer as ' 
declare 
 p_address_id    alias for $1; 
 v_return integer := 0;  
begin 
   delete from acs_permissions 
     where object_id = p_address_id; 

   delete from cn_addresses 
     where address_id = p_address_id;

   raise NOTICE ''Deleting cn_address...'';

   return v_return;

end;' language 'plpgsql';

create or replace function cn_address__set (integer, integer, integer, varchar, varchar, varchar, varchar,varchar)   
returns integer as ' 
declare 
  p_address_id alias for $1; -- default 
  p_address_type_id alias for $2; -- default 
  p_contact_id alias for $3; -- default 
  p_delivery_address alias for $4; -- default 
  p_municipality alias for $5; -- default null
  p_postal_code alias for $6; -- default null
  p_region alias for $7; -- default null 
  p_country_code alias for $8;
  v_return integer := 0; 
begin  

  if p_address_type_id is not null
  then
   update cn_addresses set address_type_id = p_address_type_id
    where address_id = p_address_id;
  end if;

  if p_contact_id is not null
  then
   update cn_addresses set contact_id = p_contact_id
    where address_id = p_address_id;
  end if;

  if p_delivery_address is not null
  then
   update cn_addresses set delivery_address = p_delivery_address
    where address_id = p_address_id;
  end if;

  if p_municipality is not null
  then
   update cn_addresses set municipality = p_municipality
    where address_id = p_address_id;
  end if;

  if p_postal_code is not null
  then
   update cn_addresses set postal_code = p_postal_code
    where address_id = p_address_id;
  end if;

  if p_region is not null
  then
   update cn_addresses set region = p_region
    where address_id = p_address_id;
  end if;

  if p_country_code is not null
  then
   update cn_addresses set country_code = p_country_code
    where address_id = p_address_id;
  end if;

  return v_return;
end;' language 'plpgsql';



