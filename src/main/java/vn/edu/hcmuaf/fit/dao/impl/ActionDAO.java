package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.user.Action;

import java.sql.Timestamp;

public class ActionDAO extends AbstractDAO<Action> {
    public ActionDAO() {
        super("actions");
    }

    public int save(Action a) {
        a.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        a.setCreated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId(" insert into actions(`code`,`group`,created_at,updated_at) values (:t.code,:t.group,:t.created_at,:t.updated_at)", a);
    }

    public boolean update(Action a) {
        a.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update(" update actions set `code` =:t.code,`group`=:t.group,`updated_at`=:t.updated_at where id=:t.id", a);
    }

    public void delete(Action a) {
        update(" delete from actions where id=:t.id ", a);
    }

}
