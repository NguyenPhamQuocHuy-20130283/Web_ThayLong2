package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Question;
import vn.edu.hcmuaf.fit.model.review.QuestionType;

import java.sql.Timestamp;

public class QuestionTypeDAO extends AbstractDAO<QuestionType> {
    public QuestionTypeDAO() {
        super("question_types");
    }


    public int save(QuestionType q) {
        q.setCreated_at(new Timestamp(System.currentTimeMillis()));
        q.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into question_types(`name`, `key`, created_at, updated_at) " +
                "values (:t.name, :t.key, :t.created_at, :t.updated_at)", q);
    }

    public boolean update(QuestionType q) {
        q.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update question_types set `name`=:t.name, `key`=:t.key," +
                " updated_at=:t.updated_at where id=:t.id", q);
    }

    public void delete(QuestionType q) {
        update("delete from question_types where id=t:id", q);
    }
}
