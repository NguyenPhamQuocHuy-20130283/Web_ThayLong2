package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Brand;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO extends AbstractDAO<Brand> {

    public BrandDAO() {
        super("brands");

    }

    public BrandDAO(String table) {
        super(table);
    }

    public List<Brand> list(int[] s) {
        List<Brand> rs = new ArrayList<>();

        for (int i : s
        ) {
            rs.add(get(" and id = " + i, Brand.class, null).get());
        }
        return rs;

    }

    public int insertBrand(Brand br) {
        br.setCreated_at(new Timestamp(System.currentTimeMillis()));
        br.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into brands (`name`,`logo`,created_at,updated_at, `country`)" +
                        " values(:t.name,:t.logo,:t.created_at,:t.updated_at, :t.country)",
                br);
    }


    public void deleteBrand(Brand b) {
        delete("delete from brands  where id = :t.id", b);
    }

    public void updateBrand(Brand b) {
        b.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update brands set `name` = :t.name,`logo` = :t.logo,updated_at = :t.updated_at, `country` = :t.country  where id = :t.id", b);

    }
}
