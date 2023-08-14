package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.PhoneQuestion;
import vn.edu.hcmuaf.fit.model.Question;

import java.sql.Timestamp;

public class QuestionDAO extends AbstractDAO<Question> {
    public QuestionDAO() {
        super("questions");
    }

    public int save(Question question) {
        question.setCreated_at(new Timestamp(System.currentTimeMillis()));
        question.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into questions(userId, phoneId, `content`, created_at, updated_at, reviewerId, `status`, isReply, typeId) " +
                "values (:t.userId,  :t.phoneId, :t.content,:t.created_at, :t.updated_at, :t.reviewerId , :t.status, :t.isReply, :t.typeId)", question);
    }

    public boolean update(Question question) {
        question.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update questions set userId=:t.userId, phoneId=:t.phoneId, content=:t.content," +
                "updated_at=:t.updated_at, reviewerId=:t.reviewerId, status=:t.status, isReply=:t.isReply, typeId=:t.typeId where id=:t.id", question);
    }

    public void delete(Question question) {
        update("delete from questions where id=t:id", question);
    }
}
