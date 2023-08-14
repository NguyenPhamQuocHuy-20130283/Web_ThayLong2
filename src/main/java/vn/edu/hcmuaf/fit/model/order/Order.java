/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmuaf.fit.model.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.CustomerDAO;
import vn.edu.hcmuaf.fit.dao.impl.StateDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.common.State;
import vn.edu.hcmuaf.fit.model.user.Customer;
import vn.edu.hcmuaf.fit.model.user.User;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order extends Base<Order> implements Serializable {

    private Integer userId;
    private Integer customerId;
    private Integer order_stateId;
    private int price;
    private String payment;
    private Integer total;
    private Integer billerId;
    private int discount;
    private int feeship;
    private Integer payId;
    private Integer transportId;


    public void setState(String s) {
        this.order_stateId = new StateDAO().get(" and name='" + s + "'", State.class, null).get().getId();
    }

    public State _state() {
        return new StateDAO().get(" and id=" + this.order_stateId, State.class, null).get();
    }


    public List<OrderDetail> _orderDetails() {
        return new AbstractDAO<OrderDetail>("order_detail").list(" and orderId =" + this.id, OrderDetail.class, null, null, null, null);
    }

//    public Code _code() {
//        return new AbstractDAO<Code>("codes").get(" and id=" + this.codeId, Code.class, null).get();
//    }

    public State _orderState() {
        return new StateDAO().get(" and id=" + this.order_stateId, State.class, null).get();
    }


    public User _user() {
        return new AbstractDAO<User>("users").get(" and id=" + this.userId, User.class, null).get();
    }

    public User _biller() {
        return new AbstractDAO<User>("users").get(" and id=" + this.billerId, User.class, null).get();
    }

    public Customer _customer() {
        return new CustomerDAO().get(" and id=" + this.customerId, Customer.class, null).get();
    }


    //    public BigDecimal total() {
//        BigDecimal total = new BigDecimal(0);
//        for (OrderDetail orderDetail : orderDetails) {
//            total = total.add(orderDetail.getRealPrice());
//        }
//        return total;
//    }

    public static void main(String[] args) throws IOException {
        String address = "1600 Amphitheatre Parkway, Mountain View, CA";
        String url = "https://maps.googleapis.com/maps/api/geocode/json?address="
                + URLEncoder.encode(address, "UTF-8")
                + "&key=AIzaSyCFHzU7oGGprrvohofGvIdDFag418nFKms";
        URLConnection conn = new URL(url).openConnection();
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        String line = reader.readLine();
        System.out.println(line);
        JSONObject json = new JSONObject(line);
        String status = json.getString("status");
        if (!status.equals("OK")) {
            System.out.println("Geocoding failed: " + status);
            return;
        }
        JSONArray results = json.getJSONArray("results");
        JSONObject result = results.getJSONObject(0);
        String formattedAddress = result.getString("formatted_address");
        double latitude = result.getJSONObject("geometry").getJSONObject("location").getDouble("lat");
        double longitude = result.getJSONObject("geometry").getJSONObject("location").getDouble("lng");
        String postalCode = null;
        JSONArray addressComponents = result.getJSONArray("address_components");
        for (int i = 0; i < addressComponents.length(); i++) {
            JSONObject component = addressComponents.getJSONObject(i);
            JSONArray types = component.getJSONArray("types");
            for (int j = 0; j < types.length(); j++) {
                String type = types.getString(j);
                if (type.equals("postal_code")) {
                    postalCode = component.getString("short_name");
                    break;
                }
            }
            if (postalCode != null) {
                break;
            }
        }
        System.out.println("Formatted address: " + formattedAddress);
        System.out.println("Latitude: " + latitude);
        System.out.println("Longitude: " + longitude);
    }

}
