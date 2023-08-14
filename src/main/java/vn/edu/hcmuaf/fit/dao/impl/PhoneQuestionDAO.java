package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Pay;
import vn.edu.hcmuaf.fit.model.PhoneQuestion;

import java.sql.Timestamp;

public class PhoneQuestionDAO extends AbstractDAO<PhoneQuestion> {
    public PhoneQuestionDAO() {
        super("phone_question");
    }


    public void save(PhoneQuestion p) {
        p.setCreated_at(new Timestamp(System.currentTimeMillis()));
        p.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into phone_question(commentId, replyId, created_at, updated_at) " +
                "values (:t.commentId, :t.replyId, :t.created_at, :t.updated_at)", p);
    }

    public boolean update(PhoneQuestion p) {
        p.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update phone_question set `commentId`=:t.commentId, `replyId`=:t.replyId,  " +
                "updated_at=:t.updated_at where commentId = :t.commentId and replyId= :t.replyId ", p);
    }

    public void delete(PhoneQuestion p) {
        update("delete from phone_question where commentId = :t.commentId and replyId= :t.replyId ", p);
    }
}
