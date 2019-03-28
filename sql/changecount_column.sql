alter table blocks add column changecount bigint not null default 0;

create index CONCURRENTLY blocks_changecount_index on blocks(changecount);

create or replace function on_blocks_change_count() returns trigger as
$BODY$
BEGIN
    NEW.changecount = OLD.changecount + 1;
    return NEW;
END;
$BODY$
LANGUAGE plpgsql;

create trigger blocks_update_changecount
 before update
 on blocks
 for each row
 execute procedure on_blocks_change_count();
