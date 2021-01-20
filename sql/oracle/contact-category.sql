-- @cvs-id: $Id$

CREATE TABLE contact_categories
(
    category_id                      integer
                                     constraint contact_categories_id_pk
				       primary key
                                     constraint contact_categories_fk
                                       references acs_objects(object_id),
    category_name                    varchar2 (40)
                                     constraint contact_categories_name_nn
                                       not null
);

-- plsql

create or replace package contact_category
is
    function new (
        category_id                     in contact_categories.category_id%TYPE default null,
        category_name                   in contact_categories.category_name%TYPE,
        object_type                     in acs_objects.object_type%TYPE default 'acs_object',
        creation_date                   in acs_objects.creation_date%TYPE default sysdate,
        creation_user                   in acs_objects.creation_user%TYPE default null,
        creation_ip                     in acs_objects.creation_ip%TYPE default null,
        context_id                      in acs_objects.context_id%TYPE default null
    ) return contact_categories.category_id%TYPE;
    --
    procedure delete (
        category_id in contact_categories.category_id%TYPE
    );
end contact_category;
/
show errors

create or replace package body contact_category
is
    function new (
        category_id                     in contact_categories.category_id%TYPE default null,
        category_name                   in contact_categories.category_name%TYPE,
        object_type                     in acs_objects.object_type%TYPE default 'acs_object',
        creation_date                   in acs_objects.creation_date%TYPE default sysdate,
        creation_user                   in acs_objects.creation_user%TYPE default null,
        creation_ip                     in acs_objects.creation_ip%TYPE default null,
        context_id                      in acs_objects.context_id%TYPE default null
    ) return contact_categories.category_id%TYPE
    is
        v_category_id contact_categories.category_id%TYPE;
    begin
        v_category_Id := acs_object.new (
            object_id => category_id,
            object_type => object_type,
            creation_date => creation_date,
            creation_user => creation_user,
            creation_ip => creation_ip,
            context_id => context_id
        );
        --
        insert into contact_categories (
          category_id, category_name
        ) values (
          v_category_id, category_name
        );
        --
        return v_category_id;
    end;
    --
    procedure delete (
        category_id in contact_categories.category_id%TYPE
    )
    is
    begin
      delete from contact_categories
      where category_id = contact_category.delete.category_id;
    end;
    --
end contact_category;
/
show errors


