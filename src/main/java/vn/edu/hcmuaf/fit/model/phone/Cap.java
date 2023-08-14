package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cap extends Base<Cap> {
    private String unit;
    private Integer cap;

    public List<PhoneCap> _phones() {
        return new AbstractDAO<PhoneCap>("phone_cap").list(" and capId=" + this.id, PhoneCap.class, null, null, null, null);
    }

}
