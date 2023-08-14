package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.user.ConfirmationToken;

public class ConfirmationTokenDAO extends AbstractDAO<ConfirmationToken> {
    public ConfirmationTokenDAO() {
        super("confirmationtoken");
    }

    public int save(String key) {
        return insertWithId("INSERT INTO confirmationtoken(token,created_at,expired_at) VALUES('" + key + "',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP + INTERVAL 15 MINUTE)", null);

    }


    public void active(String key) {
        update(" update confirmationtoken set confirmed_at = CURRENT_TIMESTAMP where token ='" + key + "'", null);
    }
}
