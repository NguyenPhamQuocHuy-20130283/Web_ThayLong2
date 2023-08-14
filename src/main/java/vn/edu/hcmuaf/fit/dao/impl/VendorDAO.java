package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.UserVoucher;
import vn.edu.hcmuaf.fit.model.Vendor;

import java.sql.Timestamp;

public class VendorDAO extends AbstractDAO<Vendor> {
    public VendorDAO() {
        super("vendors");
    }
    public int save(Vendor vendor){
        vendor.setCreated_at(new Timestamp(System.currentTimeMillis()));
        vendor.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into vendors(`name`, `address`,`phone`, email, `created_at`, updated_at) " +
                "values (:t.name, :t.address ,:t.phone, :t.email, :t.created_at , :t.updated_at)", vendor);
    }
    public boolean update(Vendor vendor){
        vendor.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update vendors set `name`=:t.name,`address`=:t.address,`phone`=:t.phone , email=:t.email," +
                "  updated_at=:t.updated_at where id=:t.id", vendor);
    }
    public void delete(Vendor vendor){
        update("delete from vendors where id=t:id", vendor);
    }
}
