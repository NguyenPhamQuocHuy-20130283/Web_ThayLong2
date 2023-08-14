package vn.edu.hcmuaf.fit.model.phone;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;

import java.io.Serializable;
import java.util.List;
import java.util.StringTokenizer;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Brand extends Base<Brand> implements Serializable {
    private String name;
    private String logo;
    private String country;

    public List<Model> _models() {
        return new AbstractDAO<Model>("models").list(" and brandId =" + this.id, Model.class, null, null, null, null);
    }


    public List<Phone> _phones() {
        return new AbstractDAO<Phone>("phones").list(" and brandId=" + this.id, Phone.class, null, null, null, null);
    }

    public static void main(String[] args) {
        StringTokenizer st = new StringTokenizer("<200");
//        st.nextToken("><=");
        System.out.println(st.nextToken("><="));

        System.out.println(Integer.parseInt(String.valueOf(1 < Integer.parseInt(st.nextToken("><=")))));

    }

}
