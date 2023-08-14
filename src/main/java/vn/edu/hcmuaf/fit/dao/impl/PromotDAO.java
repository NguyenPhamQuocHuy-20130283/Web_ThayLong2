package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Promot;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PromotDAO extends AbstractDAO<Promot> {

    public PromotDAO() {
        super("promots");

    }

    public PromotDAO(String table) {
        super(table);
    }

    public List<Promot> list(int[] s) {
        List<Promot> rs = new ArrayList<>();

        for (int i : s
        ) {
            rs.add(get(" and id = " + i, Promot.class, null).get());
        }
        return rs;

    }
    public int insertPromot(Promot pp) {

        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        return insertWithId("insert into promots (name,created_at,updated_at)" +
                        " values(:t.name,:t.created_at,:t.updated_at)",
                pp);
    }
    public void deletePromot(Promot c) {
        delete("delete from promots  where id = :t.id", c);

    }


    public void updatePromot(Promot c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update promots set name = :t.name,updated_at = :t.updated_at where id = :t.id", c);


    }
}
