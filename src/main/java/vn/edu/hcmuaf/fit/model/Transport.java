package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Transport extends Base<Transport> implements Serializable {
    private Double weight;
    private Integer userId;
    private Timestamp delivery_date;
    private Timestamp arrival_date;
    private String destination;
    private String departure;
    private String phone;
    private Integer feeship;
    private double distance;
    private String status;

    public User _user(){
        return new UserDAO().get("and id= "+ this.userId, User.class, null).get();
    }
}
