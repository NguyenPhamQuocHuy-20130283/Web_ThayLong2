package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Promot extends Base<Promot> implements Serializable {

    private String name;
    private String key;

    public List<PhonePromot> _phones() {
        return new AbstractDAO<PhonePromot>("phone_promot").list(" and promotId =" + this.id, PhonePromot.class, null, null,null, null);
    }


}
