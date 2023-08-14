package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.PhoneColor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class PhoneColorDAO extends AbstractDAO<PhoneColor> {
    public PhoneColorDAO() {
        super("phone_color");
    }

    public void savePhoneColor(PhoneColor color, int id) {
        color.setPhoneId(id);
        color.setCreated_at(new Timestamp(System.currentTimeMillis()));
        color.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_color (phoneId,colorId,img,created_at,updated_at,total) values(:t.phoneId,:t.colorId,:t.img,:t.created_at,:t.updated_at,:t.total)",
                color);
    }

    public void savePhoneColor(PhoneColor color) {
        color.setCreated_at(new Timestamp(System.currentTimeMillis()));
        color.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_color (phoneId,colorId,img,created_at,updated_at,total) values(:t.phoneId,:t.colorId,:t.img,:t.created_at,:t.updated_at,:t.total)",
                color);
    }


    public void deletePhoneColor(Set<PhoneColor> s) {
        List<PhoneColor> imgs = new ArrayList<>(s);
        for (PhoneColor img : imgs
        ) {
            deleteColor(img);
        }


    }


    public void updatePhoneColor(PhoneColor c, int name) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update phone_color set colorId = :t.colorId,img =:t.img,total=:t.total," +
                "updated_at=:t.updated_at where phoneId = :t.phoneId and colorId = '" + name + "'", c);
    }

    public boolean updatePhoneColor(PhoneColor c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update phone_color set colorId = :t.colorId,img =:t.img,total=:t.total," +
                "updated_at=:t.updated_at where phoneId = :t.phoneId and colorId = :t.colorId", c);
    }

    public void updatePhoneColorList(List<PhoneColor> old, List<PhoneColor> colors) {
        if (old.size() < colors.size()) {
            for (PhoneColor color : colors) {
                if (checkSame(old, color.getColorId())) {
                    updatePhoneColor(color, color.getColorId());
                } else {
                    savePhoneColor(color, color.getPhoneId());
                }

            }
        }
        if (old.size() > colors.size()) {
            for (PhoneColor color : old) {
                if (checkSame(colors, color.getColorId())) {
                    updatePhoneColor(color, color.getColorId());
                } else {
                    deleteColor(color);
                }

            }
        }
        if (old.size() == colors.size()) {
            for (PhoneColor color : colors) {
                updatePhoneColor(color, color.getColorId());
            }
        }
    }

    public void deleteColor(PhoneColor img) {

        delete("delete from phone_color where phoneId =:t.phoneId and colorId = :t.colorId", img);

    }

    private boolean checkSame(List<PhoneColor> s, Integer name) {
        for (PhoneColor img : s) {
            if ((img.getColorId().equals(name))) return true;
        }
        return false;


    }


    public void save(List<PhoneColor> colorList, int id) {
        if (!colorList.isEmpty()) {
            for (PhoneColor color : colorList) {
                savePhoneColor(color, id);
            }
        }
    }
}
