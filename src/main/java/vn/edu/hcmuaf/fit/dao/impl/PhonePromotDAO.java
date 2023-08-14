package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.PhonePromot;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class PhonePromotDAO extends AbstractDAO<PhonePromot> {
    public PhonePromotDAO() {
        super("phone_promot");
    }

    public void insertPhonePromot(PhonePromot pp, int id) {
        pp.setPhoneId(id);
        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_promot(created_at,updated_at,killed_at,phoneId, promotId) " +
                "values(:t.created_at," +
                ":t.updated_at,:t.killed_at,:t.phoneId, :t.promotId)", pp);
    }

    public void insertPhonePromot(PhonePromot pp) {
        pp.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pp.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_promot(created_at,updated_at,start_at,end_at,phoneId, promotId) " +
                "values(:t.created_at," +
                ":t.updated_at,:t.start_at,end_at,:t.phoneId, :t.promotId)", pp);
    }

    public void deletePhonePromot(PhonePromot pp) {
        delete("delete from phone_promot where promotId = :t.promotId and phoneId = :t.phoneId", pp);
    }


    public void updatePromotList(List<PhonePromot> old, List<PhonePromot> colors) {
        if (old.size() < colors.size()) {
            for (PhonePromot color : colors) {
                if (checkSame(old, color.getPromotId())) {
                    updatePromot(color, color.getPromotId());
                } else {
                    insertPhonePromot(color, color.getPhoneId());
                }

            }
        }
        if (old.size() > colors.size()) {
            for (PhonePromot color : old) {
                if (checkSame(colors, color.getPromotId())) {
                    updatePromot(color, color.getPromotId());
                } else {
                    deletePhonePromot(color);
                }
            }
        }
        if (old.size() == colors.size()) {
            for (PhonePromot color : colors) {
                updatePromot(color, color.getPromotId());
            }
        }
    }

    public void deletePhonePromot(Set<PhonePromot> s) {
        List<PhonePromot> imgs = new ArrayList<>(s);
        for (PhonePromot img : imgs
        ) {
            deletePhonePromot(img);
        }


    }

    private void updatePromot(PhonePromot c, int pp) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update phone_promot set promotId = :t.promotId," +
                "updated_at=:t.updated_at , start_at=:t.start_at,end_at=:t.end_at where phoneId = :t.phoneId and promotId = " + pp, c);
    }

    public boolean updatePromot(PhonePromot c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update phone_promot set promotId = :t.promotId," +
                "updated_at=:t.updated_at , start_at=:t.start_at,end_at=:t.end_at where phoneId = :t.phoneId and promotId = :t.promotId", c);
    }

    private boolean checkSame(List<PhonePromot> s, Integer id) {
        for (PhonePromot img : s) {
            if ((img.getPromotId().equals(id))) return true;
        }
        return false;
    }

    public void save(List<PhonePromot> promotList, int id) {
        if (!promotList.isEmpty()) {

            for (PhonePromot pc : promotList) {
                insertPhonePromot(pc, id);
            }
        }
    }
}
