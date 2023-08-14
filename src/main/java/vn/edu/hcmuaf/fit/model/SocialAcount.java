package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocialAcount extends Base<SocialAcount> implements Serializable {
    private Integer userId;
    private String provider;
    private String providerId;
    private String access_token;
    public User _user(){
        return new UserDAO().get("and id= "+this.userId, User.class,null).get();
    }
}
