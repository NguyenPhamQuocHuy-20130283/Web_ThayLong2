package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.PhoneCap;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class PhoneCapDAO extends AbstractDAO<PhoneCap> {
    public PhoneCapDAO() {
        super("phone_cap");
    }

    public void insertPhoneCap(PhoneCap pcap, int id) {
        pcap.setPhoneId(id);
        pcap.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pcap.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_cap(created_at,updated_at,phoneId, capId) " +
                "values(:t.created_at," +
                ":t.updated_at,:t.phoneId, :t.capId)", pcap);
    }

    public void insertPhoneCap(PhoneCap pcap) {
        pcap.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pcap.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_cap(created_at,updated_at,phoneId, capId,phone_capId) " +
                "values(:t.created_at," +
                ":t.updated_at,:t.phoneId, :t.capId,:t.phone_capId)", pcap);
    }

    public void updateCapList(List<PhoneCap> old, List<PhoneCap> colors) {
        if (old.size() < colors.size()) {
            for (PhoneCap color : colors) {
                if (checkSame(old, color.getCapId())) {
                    updateCap(color, color.getCapId());
                } else {
                    insertPhoneCap(color, color.getPhoneId());
                }

            }
        }
        if (old.size() > colors.size()) {
            for (PhoneCap color : old) {
                if (checkSame(colors, color.getCapId())) {
                    updateCap(color, color.getCapId());
                } else {
                    deleteCap(color);
                }

            }
        }
        if (old.size() == colors.size()) {
            for (PhoneCap color : colors) {
                updateCap(color, color.getCapId());
            }
        }

    }

    public void deletePhoneCap(Set<PhoneCap> s) {
        List<PhoneCap> imgs = new ArrayList<>(s);
        for (PhoneCap img : imgs
        ) {
            deleteCap(img);
        }


    }

    private void updateCap(PhoneCap c, int capid) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update phone_cap set capId = :t.capId," +
                "updated_at=:t.updated_at where phoneId = :t.phoneId and capId = '" + capid + "'", c);


    }

    public boolean updateCap(PhoneCap c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update phone_cap set capId = :t.capId," +
                "updated_at=:t.updated_at,phone_capId=:t.phone_capId where phoneId = :t.phoneId and capId = :t.capId", c);


    }

    public void deleteCap(PhoneCap img) {

        delete("delete from phone_cap where phoneId =:t.phoneId and capId = :t.capId", img);

    }

    private boolean checkSame(List<PhoneCap> s, Integer name) {
        for (PhoneCap img : s) {
            if ((img.getCapId().equals(name))) return true;
        }
        return false;


    }

    public void save(List<PhoneCap> capList, int id) {
        if (!capList.isEmpty()) {

            for (PhoneCap pc : capList) {
                insertPhoneCap(pc, id);
            }
        }
    }

}
