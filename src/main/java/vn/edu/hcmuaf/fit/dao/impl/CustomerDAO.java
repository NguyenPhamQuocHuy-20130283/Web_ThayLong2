package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.user.Customer;

import java.sql.Timestamp;

public class CustomerDAO extends AbstractDAO<Customer> {
    public CustomerDAO() {
        super("customers");
    }

    public int save(Customer customer) {
        customer.setCreated_at(new Timestamp(System.currentTimeMillis()));
        customer.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId(" insert into customers (name,email,phone,address,created_at,updated_at,gender) " +
                "values (:t.name,:t.email,:t.phone,:t.address,:t.created_at,:t.updated_at,"+("nam".equalsIgnoreCase(customer.getGender())?1:0)+")", customer);

    }

    public Integer getID(String cusEmail) {
        try {
            return  Integer.parseInt(getCustom("id","and email='"+cusEmail+"'"));
        }
        catch (Exception e){
            return null;
        }

    }

}
