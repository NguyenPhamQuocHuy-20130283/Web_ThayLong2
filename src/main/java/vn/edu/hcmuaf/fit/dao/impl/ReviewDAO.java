package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.review.Review;

import java.sql.Timestamp;

public class ReviewDAO extends AbstractDAO<Review> {
    public ReviewDAO() {
        super("reviews");
    }

    public int save(Review r) {
        r.setCreated_at(new Timestamp(System.currentTimeMillis()));
        r.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        return insertWithId(" insert into reviews(phoneId,content,star,created_at,updated_at,reviewerId,userId) " +
                "values(:t.phoneId,:t.content,:t.star,:t.created_at,:t.updated_at,:t.reviewerId,:t.userId) ", r);
    }


    public void delete(Review parseInt) {
        update(" delete from reviews where id=:t.id ", parseInt);
    }


    public boolean updateReview(Review r) {
        r.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update(" update reviews set content = :t.content , star =:t.star,updated_at=:t.updated_at where id=:t.id", r);
    }

    public boolean updatteQuestion(Review r) {
        r.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update(" update reviews set content = :t.content , typeId =:t.typeId,updated_at=:t.updated_at where id=:t.id", r);
    }
}
