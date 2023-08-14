package vn.edu.hcmuaf.fit.model.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhoneReview extends Base<PhoneReview> implements Serializable {
    private Integer commentId;
    private Integer replyId;

    public Review _comment() {
        return new AbstractDAO<Review>("reviews").get(" and isReply=false   and id=" + this.commentId, Review.class, null).get();
    }

    public Review _reply() {
        return new AbstractDAO<Review>("reviews").get(" and isReply=true and star is null  and id= " + this.replyId, Review.class, null).get();
    }

}
