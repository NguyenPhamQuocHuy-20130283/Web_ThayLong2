package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.ExportInvoice;
import vn.edu.hcmuaf.fit.model.ImageColor;

import java.sql.Timestamp;

public class ImageColorDAO extends AbstractDAO<ImageColor> {
    public ImageColorDAO() {
        super("image_color");
    }

    public int save(ImageColor i) {
        i.setCreated_at(new Timestamp(System.currentTimeMillis()));
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into image_color(phoneId, colorId, `link`, created_at, updated_at) " +
                "values (:t.phoneId, :t.colorId, :t.link, :t.created_at, :t.updated_at)", i);
    }

    public boolean update(ImageColor i) {
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update image_color set phoneId=:t.phoneId, colorId=:t.colorId, link=:t.link," +
                " updated_at=:t.updated_at where id=:t.id", i);
    }

    public void delete(ImageColor i) {
        update("delete from image_color where id=t:id", i);
    }
}
