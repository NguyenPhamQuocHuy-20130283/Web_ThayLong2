package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.user.PermissionAction;

import java.sql.Timestamp;

public class PermissionActionDAO extends AbstractDAO<PermissionAction> {
    public PermissionActionDAO() {
        super("permission_action");
    }

    public void save(PermissionAction p) {
        p.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        p.setCreated_at(new Timestamp(System.currentTimeMillis()));
        System.out.println(p);
        update(" insert into permission_action(created_at,updated_at,licensed,userId,actionId)" +
                " values (:t.created_at,:t.updated_at,:t.licensed,:t.userId,:t.actionId)", p);

    }

    public static void main(String[] args) {
        PermissionAction p = new PermissionAction();
        p.setLicensed(true);
        p.setActionId(1);
        p.setUserId(5);
        new PermissionActionDAO().save(p);
    }

    public boolean update(PermissionAction p) {
        p.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        return update(" update permission_action set updated_at=:t.updated_at,licensed=:t.licensed,userId=:t.userId,actionId=:t.actionId where userId=:t.userId and actionId=:t.actionId", p);
    }

    public void delete(PermissionAction p) {
        update(" delete from permission_action where userId = :t.userId and actionId=:t.actionId", p);
    }


}
