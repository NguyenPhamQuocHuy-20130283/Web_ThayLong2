package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.WarrantyDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WarrantyHistory extends Base<WarrantyHistory> implements Serializable {
    private Integer warrantyId;
    private Timestamp finished_at;
    private String description;

    public Warranty _warranty(){
        return new WarrantyDAO().get("and id= " +this.warrantyId, Warranty.class, null).get();
    }
}
