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
public class PhoneCap extends Base<PhoneCap> implements Serializable {

    private Integer phoneId;

    private Integer capId;
    private Integer phone_capId;

    public Cap _cap() {
        return new AbstractDAO<Cap>("caps").get(" and id = " + this.getCapId(), Cap.class, null).get();
    }

    public Phone _phoneCap() {
        return new AbstractDAO<Phone>("phones").get(" and id ="+this.phone_capId, Phone.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id = " + this.getPhoneId(), Phone.class, null).get();
    }

    public static void main(String[] args) {
     PhoneCap p=   new PhoneCap();
        p.setPhone_capId(2);

        System.out.println(p._phoneCap().getId());
    }


}
