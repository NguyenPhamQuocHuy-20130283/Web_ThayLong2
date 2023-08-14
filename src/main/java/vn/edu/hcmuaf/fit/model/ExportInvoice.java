package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.AgencyDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExportInvoice extends Base<ExportInvoice> implements Serializable {
    private Integer agencyId;
    private Integer total;
    private Integer userId;
    private Integer price;

    public Agency _agency(){
        return new AgencyDAO().get("and id ="+ this.agencyId, Agency.class, null).get();
    }
    public User _user(){
        return new UserDAO().get("and id =" + this.userId, User.class, null).get();
    }
}
