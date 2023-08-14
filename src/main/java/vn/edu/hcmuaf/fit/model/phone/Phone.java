package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.dao.impl.StateDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.common.State;
import vn.edu.hcmuaf.fit.model.order.OrderDetail;
import vn.edu.hcmuaf.fit.model.review.Review;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Phone extends Base<Phone> implements Serializable {
    private String name;
    private Integer updated_by;
    private String content;
    private String desc;
    private Boolean isDelete;
    private Integer restored_by;
    private Timestamp restored_at;
    private Integer phone_stateId;
    private String thumbnail;
    private Integer saleId;
    private Integer capId;

    private Boolean enable;
    private Integer brandId;
    private Integer modelId;
    private Integer created_by;
    private Integer deleted_by;
    private Timestamp deleted_at;
    private boolean isNew;

    public boolean getNew() {
        return this.isNew;
    }
//
//    public void setIsNew(boolean i) {
//        this.isNew = i;
//    }

    public Phone _deleteBy() {
        return new PhoneDAO().get(" and id=" + this.deleted_by, Phone.class, null).orElse(null);
    }

    public void setState(String s) {
        this.phone_stateId = new StateDAO().get(" and name='" + s + "'", State.class, null).get().getId();
    }

    public User _createdBy() {
        return new UserDAO().get(" and id=" + created_by, User.class, null).orElse(null);
    }


    public List<Review> question() {
//        return new AbstractDAO<Review>("reviews").list1(" count(id) as sl, ", " and star is null and typeId is not null and phoneId =" + this.id + " group by typeId\n", Review.class, null, null, Variable.Global.JOIN_PHONE_REVIEW, "sl desc", 3, 0);
        return null;
    }

    public List<Review> _reviews() {
        return new AbstractDAO<Review>("reviews").list(" and star is not null and phoneId =" + this.id, Review.class, null, null, null, null);
    }

    public List<Review> _question() {
        return new AbstractDAO<Review>("reviews").list(" and star is null and phoneId =" + this.id, Review.class, null, null, null, null);
    }

    public int questionHasReply() {
        List<Review> reviews = _question();
        int rs = 0;
        for (Review r : reviews
        ) {
            if (!r._reply().isEmpty()) rs++;
        }
        return rs;
    }


    public int count(int i) {

        return Integer.parseInt(new AbstractDAO<Review>("reviews").getCustom("count(id)", " and star=" + i + " and phoneId=" + this.id));
    }

    public int count() {
        return Integer.parseInt(new AbstractDAO<Review>("reviews").getCustom(" count(id) ", "    and phoneId=" + this.id));
    }

    public double avg(int i) {
        if (count() == 0) return 0;
        double rs = ((double) count(i) / (double) count());
        BigDecimal bd = new BigDecimal(rs);
        bd = bd.setScale(2, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }

    public double avg() {

        double rs = 0;
        if (count() == 0) return 0;

        for (int i = 1; i <= 5; i++) {
            rs += i * ((double) count(i) / (double) count());
        }

        BigDecimal bd = new BigDecimal(rs).setScale(2, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }

    public List<OrderDetail> _orderDetails() {
        return new AbstractDAO<OrderDetail>("order_detail").list(" and phoneId =" + this.id, OrderDetail.class, null, null, null, null);
    }

    public State _phoneState() {
        return new StateDAO().get(" and id=" + this.phone_stateId, State.class, null).get();
    }

    public List<Image> _images() {
        return new AbstractDAO<Image>("images").list(" and phoneId =" + this.id, Image.class, null, null, null, null);
    }

    public List<PhoneSpec> _specs() {
        return new AbstractDAO<PhoneSpec>("phone_spec").list(" and phoneId =" + this.id, PhoneSpec.class, null, null, null, null);
    }

    public List<PhoneColor> _colors() {
        return new AbstractDAO<PhoneColor>("phone_color").list(" and phoneId =" + this.id, PhoneColor.class, null, null, null, null);
    }

    public List<PhonePromot> _promots() {
        return new AbstractDAO<PhonePromot>("phone_promot").list(" and phoneId =" + this.id, PhonePromot.class, null, null, null, null);
    }

    public List<PhoneCap> _caps() {
        return new AbstractDAO<PhoneCap>("phone_cap").list(" and phoneId =" + this.id, PhoneCap.class, null, null, null, null);
    }

    public List<SpecType> _specTypes() {

        Set<SpecType> rs = new HashSet<>();

        List<PhoneSpec> pss = _specs();

        for (PhoneSpec ps : pss
        ) {
            rs.add(ps._spec()._specType());

        }
        return new ArrayList<>(rs);
    }

    public Sale _sale() {
        return new AbstractDAO<Sale>("sales").get(" and id=" + this.saleId, Sale.class, null).get();
    }

    public Brand _brand() {
        return new AbstractDAO<Brand>("brands").get(" and id=" + this.brandId, Brand.class, null).get();
    }

    public Model _model() {
        return new AbstractDAO<Model>("models").get(" and id=" + this.modelId, Model.class, null).get();
    }


    public Cap _cap() {
        return new AbstractDAO<Cap>("caps").get(" and id = " + this.capId, Cap.class, null).get();
    }


}
