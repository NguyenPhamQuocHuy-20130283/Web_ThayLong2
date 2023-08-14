package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.VoucherDAO;
import vn.edu.hcmuaf.fit.dao.impl.OrderDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.order.Voucher;
import vn.edu.hcmuaf.fit.model.order.Order;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDiscount extends Base<OrderDiscount> implements Serializable {
    private Integer orderId;
    private Integer codeId;
    private Integer total;
    public Order _order(){
        return new OrderDAO().get("and id = " + this.orderId, Order.class, null).get();
    }
    public Voucher _code(){
        return new VoucherDAO().get("and id = " +this.codeId, Voucher.class, null).get();
    }
}
