CREATE OR REPLACE VIEW addresses AS
    SELECT t.resourceinstanceid,
       t.tiledata::json -> n.nodeid::text -> 'address' as address,
       c.config::json -> 'icon' as icon,
       st_transform(
           st_setsrid(st_point(
               (t.tiledata::json -> n.nodeid::text -> 'x')::text::float,
               (t.tiledata::json -> n.nodeid::text -> 'y')::text::float
           ),4326),
           900913
      )::geometry(Geometry,900913) AS geom,
      ROW_NUMBER () OVER () as gid
      FROM tiles t
    	LEFT JOIN nodes n ON t.nodegroupid = n.nodegroupid
        LEFT JOIN cards c ON t.nodegroupid = c.nodegroupid
     WHERE (( SELECT count(*) AS count
    		  FROM jsonb_object_keys(t.tiledata) jsonb_object_keys(jsonb_object_keys)
    		 WHERE (jsonb_object_keys.jsonb_object_keys IN ( SELECT n_1.nodeid::text AS nodeid
    				  FROM nodes n_1
    				 WHERE n_1.datatype = 'address'::text)))) > 0 AND n.datatype = 'address'::text;
