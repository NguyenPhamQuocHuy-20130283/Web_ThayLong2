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
public class PhoneColor extends Base<PhoneColor> implements Serializable {

    private Integer phoneId;

    private Integer colorId;
    private String img;
    private Integer total;

//    public List<Phone> _phones() {
//        return new AbstractDAO<Phone>("phone_color").list(" and colorId =" + this.id, Phone.class, null, null);
//    }

    public Color _color() {
        return new AbstractDAO<Color>("colors").get(" and id = " + this.getColorId(), Color.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id = " + this.getPhoneId(), Phone.class, null).get();
    }
}
