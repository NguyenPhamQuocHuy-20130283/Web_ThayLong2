package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.review.PhoneReview;

import java.sql.Timestamp;

public class PhoneReviewDAO extends AbstractDAO<PhoneReview> {
    public PhoneReviewDAO() {
        super("phone_review");
    }

    public void insert(PhoneReview p) {
        p.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        p.setCreated_at(new Timestamp(System.currentTimeMillis()));
        update(" insert into phone_review(commentId,replyId,created_at,updated_at) values(:t.commentId,:t.replyId,:t.created_at,:t.updated_at)", p);
    }

    public void delete(PhoneReview p) {
        update("delete from phone_review where commentId = :t.commentId and replyId = :t.replyId", p);
    }
}
