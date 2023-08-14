package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Sale;

import java.sql.Timestamp;

public class SaleDAO extends AbstractDAO<Sale> {
    public SaleDAO() {
        super("sales");
    }

    public int insertSale(Sale pp) {
        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into sales (name,`desc`,img,created_at,updated_at,end_at,start_at,value,unit)" +
                        " values(:t.name,:t.desc,:t.img,:t.created_at,:t.updated_at,:t.end_at,:t.start_at,:t.value,:t.unit)",
                pp);
    }

    public void deleteSale(Sale c) {
        delete("delete from sales  where id = :t.id", c);
    }


    public void updateSale(Sale c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update sales set `name` = :t.name,`desc`=:t.desc,img=:t.img,  updated_at = :t.updated_at, " +
                "end_at = :t.end_at, start_at =:t.start_at,`value`=:t.value,unit=:t.unit  where id = :t.id", c);
    }
}
