package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Warranty;

import java.sql.Timestamp;

public class WarrantyDAO extends AbstractDAO<Warranty> {
    public WarrantyDAO() {
        super("warranties");
    }


    public int save(Warranty w) {
        w.setCreated_at(new Timestamp(System.currentTimeMillis()));
        w.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId(" insert into warranties(`description`,`status`,created_at,updated_at,userId,phoneId,title,finished_at) " +
                "values(:t.description,:t.status,:t.created_at,:t.updated_at,:t.userId,:t.phoneId,:t.title,:t.finished_at) ", w);


    }

    // phục vụ cho admin nên cần truy cập hết các trường
    public boolean update(Warranty w) {
        w.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update(" update warranties set updated_at=:t.updated_at, description =:t.description, status = :t.status," +
                " userId=:t.userId,phoneId=:t.phoneId,title=:t.title,finished_at=:t.finished_at where id=:t.id", w);


    }

    public void delete(Warranty w) {

        delete(" delete from warranties where id=:t.id", w);

    }

    public static void main(String[] args) {

        Warranty w = new Warranty();
//        w.setDescription("liệt màn hình");
//        w.setTitle("hư màn hình");
//        w.setUserId(1);
//        w.setStatus("đang xử lý");

//        new WarrantyDAO().save(w);
        w.setId(1);

        new WarrantyDAO().delete(w);
    }


}
