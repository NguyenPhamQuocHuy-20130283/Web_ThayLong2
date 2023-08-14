package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Warranty extends Base<Warranty> implements Serializable {

    private String description;
    private String status;
    private Integer userId;
    private Integer phoneId;
    private String title;
    private Timestamp finished_at;


    public User _user() {
        return new UserDAO().get(" and id=" + this.userId, User.class, null).get();
    }

    public Phone _phone() {
        return new PhoneDAO().get(" and id =" + this.phoneId, Phone.class, null).get();
    }


}
