package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Agency;

import java.sql.Timestamp;

public class AgencyDAO extends AbstractDAO<Agency> {
    public AgencyDAO() {
        super("agencys");
    }

    public int save(Agency agency){
        agency.setCreated_at(new Timestamp(System.currentTimeMillis()));
        agency.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId
                ("insert into agencys(`userId`, `address`, created_at, `updated_at`) " +
                        "values (:t.userId, :t.address, :t.created_at, :t.updated_at)",agency );
    }
    public boolean update(Agency agency){
        agency.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update agencys set `userId` = :t.userId, `address` = :t.address, " +
                "updated_at = :t.updated_at where id = :t.id ", agency);
    }
    public void delete(Agency agency){
        update("delete from agencys where id=:t.id", agency);
    }
}
