package vn.edu.hcmuaf.fit.model.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.ReviewerDAO;
import vn.edu.hcmuaf.fit.model.Reviewer;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.user.Customer;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.Period;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review extends Base<Review> implements Serializable {
    private String content;
    private Integer star;
    private Integer userId;
    private Integer phoneId;
    private Integer reviewerId;
    public Reviewer _reviewer(){
        return new ReviewerDAO().get("and id= "+ this.reviewerId, Reviewer.class, null).get();
    }
    public Period period(){

        return Period.between(updated_at.toLocalDateTime().toLocalDate(),new Timestamp(System.currentTimeMillis()).toLocalDateTime().toLocalDate());
    }
    public User _user() {
        return new AbstractDAO<User>("users").get(" and id =" + this.userId, User.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id =" + this.phoneId, Phone.class, null).get();
    }

    public List<PhoneReview> _reply() {
        return new AbstractDAO<PhoneReview>("phone_review").list("  and commentId =" + this.id, PhoneReview.class, null, null, null, null);
    }

    public List<Vote> _like() {
        return new AbstractDAO<Vote>("votes").list(" and commentId=" + this.id, Vote.class, null, null, null, null);
    }

    public List<Vote> _dislike() {
        return new AbstractDAO<Vote>("votes").list("  and commentId=" + this.id, Vote.class, null, null, null, null);
    }


}
