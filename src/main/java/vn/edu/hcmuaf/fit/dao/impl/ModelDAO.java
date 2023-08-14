package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ModelDAO extends AbstractDAO<Model> {

    public ModelDAO() {
        super("models");

    }

    public List<Model> list(int[] s) {
        List<Model> rs = new ArrayList<>();

        for (int i : s
        ) {
            rs.add(get(" and id = " + i, Model.class, null).get());
        }
        return rs;

    }

    public int insertModel(Model pp) {

        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into models (`name`,created_at,updated_at, img, brandId)" +
                        " values(:t.name,:t.created_at,:t.updated_at, :t.img, :t.brandId)",
                pp);
    }

    public void deleteModel(Model c) {
        delete("delete from models  where id = :t.id", c);
    }


    public void updateModel(Model c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update models set `name` = :t.name,updated_at = :t.updated_at, img = :t.img, brandId = :t.brandId where id = :t.id", c);
    }
}
