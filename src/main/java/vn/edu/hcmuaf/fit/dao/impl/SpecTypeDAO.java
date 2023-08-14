package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.SpecType;

import java.sql.Timestamp;

public class SpecTypeDAO extends AbstractDAO<SpecType> {
    public SpecTypeDAO() {
        super("spec_types");
    }

    public int insertSpecType(SpecType pp) {

        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        return insertWithId("insert into spec_types (name,created_at,updated_at)" +
                        " values(:t.name,:t.created_at,:t.updated_at)",
                pp);
    }

    public void deleteSpecType(SpecType c) {
        delete("delete from spec_types  where id = :t.id", c);

    }


    public void updateSpecType(SpecType c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update spec_types set name = :t.name,updated_at = :t.updated_at where id = :t.id", c);


    }
}
