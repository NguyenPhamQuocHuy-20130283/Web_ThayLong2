package vn.edu.hcmuaf.fit.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PermissionAction extends Base<PermissionAction> implements Serializable {

    private Integer userId;
    private Integer actionId;
    private boolean licensed;

    public User _user() {
        return new AbstractDAO<User>("users").get(" and id= " + this.userId, User.class, null).get();
    }

    public Action _action() {
        return new AbstractDAO<Action>("actions").get(" and id= " + this.actionId, Action.class, null).get();
    }

}
