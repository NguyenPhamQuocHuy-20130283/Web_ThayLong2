package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Reviewer;
import vn.edu.hcmuaf.fit.model.SocialAcount;

import java.sql.Timestamp;

public class SocialAcountDAO extends AbstractDAO<SocialAcount> {

    public SocialAcountDAO() {
        super("social_acount");
    }

    public int save(SocialAcount s) {
        s.setCreated_at(new Timestamp(System.currentTimeMillis()));
        s.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into social_acount(`userId`, `provider`,`providerId`, access_token, created_at, `updated_at`) " +
                "values (:t.userId, :t.provider ,:t.providerId, :t.access_token, :t.created_at, :t.updated_at)", s);
    }

    public boolean update(SocialAcount s) {
        s.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update social_acount set `userId`=:t.userId,`provider`=:t.provider,`providerId`=:t.providerId , access_token=:t.access_token," +
                "  `updated_at`=:t.updated_at where id=:t.id", s);
    }

    public void delete(SocialAcount s) {
        update("delete from social_acount where id=t:id", s);
    }
}
