package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.SocialAcount;
import vn.edu.hcmuaf.fit.model.Transport;

import java.sql.Timestamp;

public class TransportDAO extends AbstractDAO<Transport> {
    public TransportDAO() {
        super("transports");
    }

    public int save(Transport transport) {
        transport.setCreated_at(new Timestamp(System.currentTimeMillis()));
        transport.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into transports(`weight`, `userId`,`delivery_date`, arrival_date, destination, `departure`, `phone`, `feeship`, `distance`, `status`,created_at,updated_at) " +
                "values (:t.weight, :t.userId ,:t.delivery_date, :t.arrival_date, :t.destination, :t.departure, :t.phone, :t.feeship, :t.distance, :t.status,:t.created_at,:t.updated_at)", transport);
    }

    public boolean update(Transport transport) {
        transport.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update transports set `weight`=:t.weight,`userId`=:t.userId,`delivery_date`=:t.delivery_date , arrival_date=:t.arrival_date, updated_at=:t.updated_at " +
                " destination=:t.destination, `departure`=:t.departure, `phone`=:t.phone, `feeship`=:t.feeship, `distance`=:t.distance, `status`=:t.status where id=:t.id", transport);
    }

    public void delete(Transport transport) {
        update("delete from transports where id=t:id", transport);
    }
}
