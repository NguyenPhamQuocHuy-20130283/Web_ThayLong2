package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Reviewer;
import vn.edu.hcmuaf.fit.model.review.QuestionType;

import java.sql.Timestamp;

public class ReviewerDAO extends AbstractDAO<Reviewer> {
    public ReviewerDAO() {
        super("reviewers");
    }

    public int save(Reviewer reviewer){
        reviewer.setCreated_at(new Timestamp(System.currentTimeMillis()));
        reviewer.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into reviewers(`name`, `email`,`phone`, created_at, updated_at, `gender`) " +
                "values (:t.name, :t.email ,:t.phone, :t.created_at, :t.updated_at, :t.gender)", reviewer);
    }
    public boolean update(Reviewer reviewer){
        reviewer.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update reviewers set `name`=:t.name,`email`=:t.email,`phone`=:t.phone , " +
                " updated_at=:t.updated_at, `gender`=:t.gender where id=:t.id", reviewer);
    }
    public void delete(Reviewer reviewer){
        update("delete from reviewers where id=t:id", reviewer);
    }
}
