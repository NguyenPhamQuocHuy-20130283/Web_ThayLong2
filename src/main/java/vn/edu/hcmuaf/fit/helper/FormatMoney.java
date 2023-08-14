package vn.edu.hcmuaf.fit.helper;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatMoney {

    public String format(int money) {
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")); // tạo đối tượng NumberFormat với địa phương là tiếng Việt và Việt Nam
        return formatter.format(money);
    }

}
