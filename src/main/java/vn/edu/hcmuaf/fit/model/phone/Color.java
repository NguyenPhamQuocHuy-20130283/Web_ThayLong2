package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Color extends Base<Color> implements Serializable {

    private String name;
    private String key;

    public List<PhoneColor> _phones() {
        return new AbstractDAO<PhoneColor>("phone_color").list(" and colorId =" + this.id, PhoneColor.class, null, null,null, null);
    }


}
