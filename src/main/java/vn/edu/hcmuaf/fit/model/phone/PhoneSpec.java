package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PhoneSpec extends Base<PhoneSpec> implements Serializable {

    private Integer phoneId;

    private Integer specId;
    private String value;

    public Spec _spec() {
        return new AbstractDAO<Spec>("specs").get(" and id = " + this.getSpecId(), Spec.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id = " + this.getPhoneId(), Phone.class, null).get();
    }


}
