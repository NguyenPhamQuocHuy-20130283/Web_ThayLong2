package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Cap;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class CapDAO extends AbstractDAO<Cap> {

    public CapDAO() {
        super("caps");

    }


    public List<Cap> list(int[] s) {
        List<Cap> rs = new ArrayList<>();

        for (int i : s
        ) {
            rs.add(get(" and id = " + i, Cap.class, null).get());
        }
        return rs;

    }

    public int insertCap(Cap pp) {
        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into caps (`cap`,`unit`,created_at,updated_at)" +
                        " values(:t.cap,:t.unit,:t.created_at,:t.updated_at)",
                pp);
    }

    public void deleteCap(Cap c) {
        delete("delete from caps  where id = :t.id", c);

    }

    public void updateCap(Cap c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update caps set `cap` = :t.cap, `unit` = :t.unit,updated_at = :t.updated_at where id = :t.id", c);


    }

}
