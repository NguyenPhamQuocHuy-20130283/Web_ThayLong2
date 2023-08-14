package vn.edu.hcmuaf.fit.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.impl.ColorDAO;
import vn.edu.hcmuaf.fit.dao.impl.ImportInvoiceDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor

public class ImportInvoiceDetail extends Base<ImportInvoiceDetail> implements Serializable {
    private Integer import_invoiceId;
    private Integer phoneId;
    private Integer total;
    private Integer price;
    private Timestamp date_of;
    private Integer colorId;

    public ImportInvoice _importInvoice() {
        return new ImportInvoiceDAO().get("and id= " + this.import_invoiceId, ImportInvoice.class, null).get();
    }

    public Phone _phone() {
        return new PhoneDAO().get("and id = " + this.phoneId, Phone.class, null).get();
    }

    public Color _color() {
        return new ColorDAO().get("and id =" + this.colorId, Color.class, null).get();
    }
}
