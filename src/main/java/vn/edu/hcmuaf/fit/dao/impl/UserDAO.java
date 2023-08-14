package vn.edu.hcmuaf.fit.dao.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.user.User;

import java.sql.Timestamp;

public class UserDAO extends AbstractDAO<User> {
    public UserDAO() {
        super("users");
    }

    public boolean checkPass(User user, String pass) {
        return BCrypt.checkpw(pass, user.getPassword());
    }

    public void updateDelete(User user) {
        if (new UserDAO().get(" and id=" + user.getId(), User.class, null).get().getIsDelete()) {
            user.setRestored_at(new Timestamp(System.currentTimeMillis()));
            update("update users set restored_by=:t.restored_by,restored_at=:t.restored_at,isDelete=false   where id=:t.id", user);

        }
    }

    public boolean updatePass(User user, String pass) {
        return update(" update users set password ='" + pass + "' where id=:t.id", user);
    }

    public void deleteSoftUser(User phone) {
        Boolean b = new UserDAO().get(" and id=" + phone.getId(), User.class, null).get().getIsDelete();
        if (b == null || !b) {
            phone.setDeleted_at(new Timestamp(System.currentTimeMillis()));
            update("update users set  isDelete=true,deleted_at =:t.deleted_at,deleted_by=:t.deleted_by where id = :t.id ", phone);
        }
    }


    public boolean update(User u) {
        u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update(" update users set enable=:t.enable, method=:t.method ,phone=:t.phone,name=:t.name,address=:t.address,active=:t.active,gender=:t.gender,email=:t.email,updated_at=:t.updated_at where id=" + u.getId(), u);
    }

    public void active(String mail) {
        update(" update users set active =true where email='" + mail + "'", null);
    }

    public int save(User u) {
        u.setCreated_at(new Timestamp(System.currentTimeMillis()));
        u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        u.setPassword(BCrypt.hashpw(u.getPassword(), BCrypt.gensalt(10)));
        return insertWithId(" insert into users(enable,method,phone,password,`name`,address,gender,email,created_at,updated_at,active,permission,user_stateId)" +
                " values(:t.enable,:t.method,:t.phone,:t.password,:t.name,:t.address,false,:t.email,:t.created_at,:t.updated_at,0,:t.permission,:t.user_stateId)  ", u);
    }

    public int save2(User u) {
        u.setCreated_at(new Timestamp(System.currentTimeMillis()));
        u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId(" insert into users(enable,method,phone,`name`,address,gender,email,created_at,updated_at,active,permission,user_stateId)" +
                " values(enable,:t.method,:t.phone,:t.name,:t.address,false,:t.email,:t.created_at,:t.updated_at,0,:t.permission,:t.user_stateId)  ", u);
    }

    public User findAccount(String email, String pass) {
        return get(" and email='" + email + "' and password='" + pass + "'", User.class, null).get();
    }

    public boolean hasEmail(String email) {
        return get(" and email='" + email + "'", User.class, null).orElse(null) != null;
    }

    public boolean hasPhone(String phone) {
        return get(" and phone=" + phone, User.class, null).orElse(null) != null;
    }

    public void delete(User s) {
        update(" delete from users where id=:t.id", s);
    }

    public Integer getID(String cusEmail) {
        try {
            return Integer.parseInt(getCustom("id", "and email='" + cusEmail + "'"));
        } catch (Exception e) {
            return null;
        }
    }

    public void updateAvatar(User user) {
        user.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        update(" update users set avatar=:t.avatar,created_at=:t.created_at,updated_at=:t.updated_at where id=:t.id", user);
    }
}

