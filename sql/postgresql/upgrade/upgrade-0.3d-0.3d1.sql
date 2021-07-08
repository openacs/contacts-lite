SELECT define_function_args('cn_address__del','address_id');

CREATE OR REPLACE FUNCTION cn_address__del (
   p_address_id integer
)  RETURNS integer AS $$
DECLARE 
 v_return cn_addresses.address_id%TYPE := 0;  
BEGIN 
   delete from acs_permissions 
     where object_id = p_address_id; 

   delete from cn_addresses 
     where address_id = p_address_id;

   raise NOTICE 'Deleting cn_address...';

   return v_return;

END;
$$ language plpgsql;

