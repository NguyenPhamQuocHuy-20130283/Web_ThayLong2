package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.dao.impl.QuestionTypeDAO;
import vn.edu.hcmuaf.fit.dao.impl.ReviewerDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.review.QuestionType;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Question extends Base<Question> implements Serializable {
    private Integer userId;
    private Integer phoneId;
    private String content;
    private Integer reviewerId;
    private String status;
    private Boolean isReply;
    private Integer typeId;

    public User _user() {
        return new UserDAO().get("and id= " + this.userId, User.class, null).get();
    }

    public Phone _phone() {
        return new PhoneDAO().get("and id= " + this.phoneId, Phone.class, null).get();
    }

    public Reviewer _reviewer() {
        return new ReviewerDAO().get("and id= " + this.reviewerId, Reviewer.class, null).get();
    }

    public QuestionType _questionType() {
        return new QuestionTypeDAO().get("and id= " + this.typeId, QuestionType.class, null).get();
    }
}
