package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pay extends Base<Pay> implements Serializable {
    private String payment;
    private String status;
    private Integer amount;

}
