package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Color;

import java.sql.Timestamp;

public class ColorDAO extends AbstractDAO<Color> {

    public ColorDAO() {
        super("colors");
    }

    public int insertColor(Color pp) {
        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into colors (`name`,`key`,created_at,updated_at)" +
                        " values(:t.name,:t.key,:t.created_at,:t.updated_at)",
                pp);
    }

    public void deleteColor(Color c) {
        delete("delete from colors  where id =:t.id "
                , c);

    }

    public void updateColor(Color c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update colors set `name` = :t.name,`key`=:t.key,updated_at = :t.updated_at where id = :t.id", c);


    }
}
