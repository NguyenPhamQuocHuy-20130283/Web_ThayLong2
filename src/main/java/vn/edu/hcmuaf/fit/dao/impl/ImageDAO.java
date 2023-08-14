package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.Image;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ImageDAO extends AbstractDAO<Image> {
    public ImageDAO() {
        super("images");
    }

    public int insertImage(Image img, int id) {
        img.setPhoneId(id);
        img.setCreated_at(new Timestamp(System.currentTimeMillis()));
        img.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into images (link,`desc`,phoneId,created_at,updated_at) values(:t.link,:t.desc,:t.phoneId,:t.created_at,:t.updated_at)",
                img);
    }

    public int insertImage(Image img) {
        img.setCreated_at(new Timestamp(System.currentTimeMillis()));
        img.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into images (link,`desc`,phoneId,created_at,updated_at) values(:t.link,:t.desc,:t.phoneId,:t.created_at,:t.updated_at)",
                img);
    }

    public void updateImageList(List<Image> old, List<Image> imgs) {
        if (old.size() < imgs.size()) {
            for (Image img : imgs) {
                if (checkSame(old, img.getId())) {
                    updateImage(img);
                } else {
                    insertImage(img, img.getPhoneId());
                }

            }
        }

        if (old.size() > imgs.size()) {
            for (Image img : old) {
                if (checkSame(imgs, img.getId())) {
                    updateImage(img);
                } else {
                    deleteImage(img);
                }

            }
        }

        if (old.size() == imgs.size()) {
            for (Image img : imgs) {
                updateImage(img);
            }
        }
    }

    public void deleteImageList(List<Image> s) {

        List<Image> imgs = new ArrayList<>(s);
        for (Image img : imgs
        ) {
            deleteImage(img);
        }

    }

    public void updateImage(Image i) {
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update images  set link = :t.link, `desc`=:t.desc,updated_at = :t.updated_at where id = :t.id", i);
    }


    public void deleteImage(Image i) {
        delete("delete from images where id = :t.id", i);
    }

    public boolean checkSame(List<Image> s, int id) {
        for (Image img : s) {

            if (img.getId() == id) return true;
        }
        return false;
    }


    public void save(List<Image> imageList, int id) {
        if (!imageList.isEmpty()) {
            for (Image img : imageList) {
                insertImage(img, id);
            }
        }
    }
}
