package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SpecType extends Base<SpecType> implements Serializable {
    private String name;
    private String key;

    public List<Spec> _specs() {
        return new AbstractDAO<Spec>("specs").list(" and spec_typeId=" + this.id, Spec.class, null, null, null, null);
    }


}
