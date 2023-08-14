package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.ColorDAO;
import vn.edu.hcmuaf.fit.dao.impl.ExportInvoiceDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExportInvoiceDetail extends Base<ExportInvoiceDetail> implements Serializable {
     private Integer export_invoiceId;
     private Integer phoneId;
     private Integer total;
     private Integer price;
     private Timestamp expiration_date;
     private Integer colorId;

     public ExportInvoice _exportInvoice(){
         return new ExportInvoiceDAO().get("and id = " +this.export_invoiceId, ExportInvoice.class, null).get();
     }
     public Phone _phone(){
         return new PhoneDAO().get("and id =" + this.phoneId, Phone.class, null).get();
     }
     public Color _color(){
         return new ColorDAO().get("and id =" + this.colorId, Color.class, null).get();
     }
}
