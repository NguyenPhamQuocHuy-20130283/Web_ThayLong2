/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmuaf.fit.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.util.StringTokenizer;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Customer extends Base<Customer> implements Serializable {

    private String name;
    private String gender;
    private String phone;
    private String email;
    private String address;

    public String avatar() {
        StringBuilder rs = new StringBuilder();
        StringTokenizer st = new StringTokenizer(this.name);

        String[] sts = this.name.trim().toUpperCase().split(" ");

        int start = 0;
        if (sts.length > 2) start = sts.length - 3;

        for (int i = start; i < sts.length; i++) {
            rs.append(sts[i].charAt(0));
        }
        return rs.toString();
    }


}
