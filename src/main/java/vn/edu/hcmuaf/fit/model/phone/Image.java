/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Image extends Base<Image> implements Serializable {
    private Integer phoneId;
    private String link;

    public Phone _phone(){
        return new PhoneDAO().get("and id= "+ this.phoneId, Phone.class, null).get();
    }


}
