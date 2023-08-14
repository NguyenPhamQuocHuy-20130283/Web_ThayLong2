package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reviewer extends Base<Reviewer> implements Serializable {
    private String name;
    private String email;
    private String phone;
    private Boolean gender;

}
