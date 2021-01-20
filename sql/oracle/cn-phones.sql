-- @cvs-id: $Id$

create table cn_phone_types (
    phone_type_id                  integer
                                   constraint cn_phone_types_id_pk
                                     primary key,
    description                    varchar2 (40)
                                   constraint cn_phone_types_desc_nn
                                     not null
);


create table cn_phone_numbers
(
    phone_number_id                  integer
                                     constraint cn_phone_number_id_pk
                                       primary key
                                     constraint cn_phone_number_id_fk
                                       references acs_objects (object_id),
    phone_number                     varchar2 (40)
                                     constraint cn_phone_numbers_phone_num_nn
                                       not null,
    best_contact_time                varchar2 (40),
    contact_id                       integer
                                     constraint cn_phone_numbers_cntct_id_fk
                                       references contacts(contact_id),
    phone_type_id                    integer
                                     constraint cn_phone_numbers_phontyp_id_fk
                                       references cn_phone_types(phone_type_id)
);

-- plsql
@@phones-plsql.sql
