package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.phone.PhoneSpec;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class PhoneSpecDAO extends AbstractDAO<PhoneSpec> {
    public PhoneSpecDAO() {
        super("phone_spec");
    }

    public void insertPhoneSpec(PhoneSpec ps, int id) {
        ps.setPhoneId(id);
        ps.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        ps.setCreated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_spec(created_at,updated_at,value, phoneId,specId) " +
                "values(:t.created_at," +
                ":t.updated_at,:t.value, :t.phoneId,:t.specId)", ps);
    }

    public void insertPhoneSpec(PhoneSpec ps) {
        ps.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        ps.setCreated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_spec(created_at,updated_at,value, phoneId,specId) " +
                "values(:t.created_at," +
                ":t.updated_at,:t.value, :t.phoneId,:t.specId)", ps);
    }


    public void updateSpecList(List<PhoneSpec> old, List<PhoneSpec> colors) {

        if (old.size() < colors.size()) {

            for (PhoneSpec spec : colors) {
                if (checkSame(old, spec.getSpecId())) {
                    updateSpec(spec, spec.getSpecId());
                } else {
                    insertPhoneSpec(spec, spec.getPhoneId());
                }

            }
        }
        if (old.size() > colors.size()) {
            for (PhoneSpec color : old) {
                if (checkSame(colors, color.getSpecId())) {
                    updateSpec(color, color.getSpecId());
                } else {
                    deleteSpec(color);
                }

            }
        }
        if (old.size() == colors.size()) {
            for (PhoneSpec color : colors) {
                updateSpec(color, color.getSpecId());
            }
        }
    }

    public void deletePhoneSpec(Set<PhoneSpec> s) {
        List<PhoneSpec> imgs = new ArrayList<>(s);
        for (PhoneSpec img : imgs
        ) {
            deleteSpec(img);
        }


    }

    public void updateSpec(PhoneSpec c, int sp) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update("update phone_spec set value = :t.value,specId = :t.specId," +
                "updated_at=:t.updated_at where phoneId = :t.phoneId and specId = " + sp, c);
    }

    public boolean updateSpec(PhoneSpec c) {
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update phone_spec set value = :t.value,specId = :t.specId," +
                "updated_at=:t.updated_at where phoneId = :t.phoneId and specId = :t.specId", c);
    }

    public void deleteSpec(PhoneSpec img) {

        delete("delete from phone_spec where phoneId =:t.phoneId and specId = :t.specId", img);

    }

    private boolean checkSame(List<PhoneSpec> s, Integer id) {
        for (PhoneSpec img : s) {
            if ((img.getSpecId().equals(id))) return true;
        }
        return false;


    }


    public void save(List<PhoneSpec> specList, int id) {
        if (!specList.isEmpty()) {

            for (PhoneSpec pc : specList) {
                insertPhoneSpec(pc, id);
            }
        }

    }
}
