package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.ColorDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageColor extends Base<ImageColor> implements Serializable {
    private Integer phoneId;
    private Integer colorId;
    private String link;

    public Phone _phone() {
        return new PhoneDAO().get("and id =" + this.phoneId, Phone.class, null).get();
    }

    public Color _color() {
        return new ColorDAO().get("and id =" + this.colorId, Color.class, null).get();
    }
}
