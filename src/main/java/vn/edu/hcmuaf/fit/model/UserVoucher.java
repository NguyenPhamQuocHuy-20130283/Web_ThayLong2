package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.VoucherDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.order.Voucher;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor

public class UserVoucher extends Base<UserVoucher> implements Serializable {
    private  Integer userId;
    private Integer codeId;
    private Integer total;

    public User _user(){
        return new UserDAO().get("and id= "+ this.userId, User.class, null).get();
    }
    public Voucher _code(){
        return new VoucherDAO().get("and id= " +this.codeId, Voucher.class, null).get();
    }
}
