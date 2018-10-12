create or replace view addresses as
    select t.resourceinstanceid::text,
        t.tiledata::json -> n.nodeid::text -> 'address' as address,
        c.config::json -> 'icon' as icon,
        st_transform(
            st_setsrid(
                st_point(
                    (t.tiledata::json -> n.nodeid::text -> 'x')::text::float,
                    (t.tiledata::json -> n.nodeid::text -> 'y')::text::float
                ),
                4326
            ),
            900913
        )::geometry(geometry,900913) as __geometry__,
        row_number () over () as __id__
    from tiles t
        left join nodes n on t.nodegroupid = n.nodegroupid
        left join cards c on t.nodegroupid = c.nodegroupid
    where (
        select count(*) as count
        from jsonb_object_keys(t.tiledata) jsonb_object_keys(jsonb_object_keys)
        where (
            jsonb_object_keys.jsonb_object_keys in (
                select n_1.nodeid::text as nodeid
                from nodes n_1
                where n_1.datatype = 'address'::text
            )
        )
    ) > 0 and n.datatype = 'address'::text;
