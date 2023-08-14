package vn.edu.hcmuaf.fit.helper;

import org.ocpsoft.pretty.time.PrettyTime;

import java.sql.Timestamp;
import java.util.Date;

public class FormatTime {


    public static String format(Timestamp lt, boolean time) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(new Date(lt.getTime()));
//        Date before5HrDate = Date.from(lt.toLocalDateTime().get.atZone(ZoneId.systemDefault()).toInstant());
//        StringBuilder format = new StringBuilder("dd/MM/yyyy");
//        if (lt == null)
//            return "??/??/???";
//        if (time)
//            format.append(" HH:mm:ss");
//        return DateTimeFormatter.ofPattern(format.toString()).format(lt.toLocalDateTime());
    }




}
