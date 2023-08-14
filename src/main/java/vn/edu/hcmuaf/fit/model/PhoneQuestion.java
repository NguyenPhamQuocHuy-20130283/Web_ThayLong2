package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.QuestionDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import javax.xml.stream.events.Comment;
import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhoneQuestion extends Base<PhoneQuestion> implements Serializable {
    private Integer commentId;
    private Integer replyId;

    public Question _comment(){
        return new QuestionDAO().get("and id= " + this.commentId, Question.class, null).get();
    }
    public Question _reply(){
        return new QuestionDAO().get("and id= " + this.replyId, Question.class, null).get();
    }
}
