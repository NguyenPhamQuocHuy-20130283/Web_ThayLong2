package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import java.sql.Timestamp;

public class PhoneDAO extends AbstractDAO<Phone> {
    public PhoneDAO() {
        super("phones");
    }

    public void updateDelete(Phone phone) {
        if (new PhoneDAO().get(" and id=" + phone.getId(), Phone.class, null).get().getIsDelete()) {
            phone.setRestored_at(new Timestamp(System.currentTimeMillis()));
            update("update phones set restored_by=:t.restored_by,restored_at=:t.restored_at,isDelete=false where id=:t.id", phone);

        }
    }

    public int savePhone(Phone phone) {
        phone.setCreated_at(new Timestamp(System.currentTimeMillis()));
        phone.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into phones (enable,`name`,typeId,price,content,created_at,updated_at,total,thumbnail,`desc`,brandId,modelId,saleId,capId,created_by,updated_by,phone_stateId,isNew) " +
                "values (:t.enable,:t.name,:t.typeId,:t.price,:t.content,:t.created_at,:t.updated_at,:t.total,:t.thumbnail,:t.desc,:t.brandId,:t.modelId,:t.saleId,:t.capId,:t.created_by,:t.updated_by,:t.phone_stateId,:t.isNew)", phone);
    }

    public void deletePhone(Phone phone) {
        delete("delete from phones where id = :t.id", phone);
    }

    public void updatePhone(Phone phone) {
        phone.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update phones set enable=:t.enable, `name` = :t.name," +
                "typeId=:t.typeId," +
                "price=:t.price," +
                "content=:t.content,isNew=:t.new," +
                "updated_at=:t.updated_at," +
                "total=:t.total," +
                "thumbnail=:t.thumbnail," +
                "`desc`=:t.desc," +
                "brandId=:t.brandId," +
                "modelId=:t.modelId," +
                "saleId=:t.saleId , capId=:t.capId, updated_by=:t.updated_by,phone_stateId=:t.phone_stateId" +
                "  where id = :t.id", phone);
    }


    public void deleteSoftPhone(Phone phone) {
        Boolean b = new PhoneDAO().get(" and id=" + phone.getId(), Phone.class, null).get().getIsDelete();
        System.out.println(b);
        if (b == null || !b) {
            phone.setDeleted_at(new Timestamp(System.currentTimeMillis()));
            update("update phones set  isDelete=true,deleted_at =:t.deleted_at,deleted_by=:t.deleted_by where id = :t.id ", phone);
        }
    }

    public void delete(Phone phone) {
        update(" delete from phones where id=:t.id", phone);
    }
}
