package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vendor extends Base<Vendor> implements Serializable {
    private String name;
    private String address;
    private String phone;
    private String email;

}
