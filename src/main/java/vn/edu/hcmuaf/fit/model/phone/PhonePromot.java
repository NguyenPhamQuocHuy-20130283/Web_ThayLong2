package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PhonePromot extends Base<PhonePromot> implements Serializable {

    private Timestamp end_at;
    private Timestamp start_at;

    private Integer phoneId;

    private Integer promotId;


    public Promot _promot() {
        return new AbstractDAO<Promot>("promots").get(" and id = " + this.getPromotId(), Promot.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id = " + this.getPhoneId(), Phone.class, null).get();
    }

}
