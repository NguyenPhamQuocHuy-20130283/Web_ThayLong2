package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.AgencyDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.dao.impl.VendorDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImportInvoice extends Base<ImportInvoice> implements Serializable {
    private  Integer agencyId;
    private Integer total;
    private  Integer userId;
    private Integer price;
    private Integer vendorId;

    public User _user() { return  new UserDAO().get(" and id =" + this.userId, User.class, null).get();
    }
    public Agency _agency() {return new AgencyDAO().get("and id =" + this.agencyId, Agency.class, null).get();
    }
    public Vendor _vendor() { return new VendorDAO().get("and id =" + this.vendorId, Vendor.class, null).get();
    }
}
