package vn.edu.hcmuaf.fit.model.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Log extends Base<Log> implements Serializable {
    private String level;
    private String url;
    private String content;
    private String src;
    private String ip;
    private Integer userId;


    public User _user() {
        return new UserDAO().get(" and id=" + this.userId, User.class, null).get();
    }

}
