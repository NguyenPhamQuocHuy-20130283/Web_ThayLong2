package vn.edu.hcmuaf.fit.mail;

import vn.edu.hcmuaf.fit.model.cart.CartItem;
import vn.edu.hcmuaf.fit.model.cart.Carts;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.List;
import java.util.Properties;

public class MailReceipt {

    public static void send(String to,int totalNum,int totalPrice,List<CartItem> carts) {
        String fromEmail = "sgfdainesend@gmail.com";
        String password = "dtgpcnjxhmifbxxs";

        try {
            Properties pr = System.getProperties();
            pr.put("mail.smtp.host", "smtp.gmail.com");
            pr.put("mail.smtp.port", "465");
            pr.put("mail.smtp.auth", "true");
            pr.put("mail.smtp.ssl.enable", "true");
//        pr.put("mail.smtp.socketFactory.port","465");
//        pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");


            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            session.setDebug(true);

            Message mess = new MimeMessage(session);

            Multipart multipart = new MimeMultipart();
            MimePart textPart = new MimeBodyPart();

            mess.setFrom(new InternetAddress(fromEmail));
            mess.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            mess.setSubject("Hóa đơn mua hàng");
            multipart.addBodyPart((BodyPart) textPart);
            textPart.setContent(receiptEmail(totalNum,totalPrice,carts), "text/html; charset=utf-8");
            mess.setContent(multipart);
            Transport.send(mess);


        } catch (MessagingException e) {
            throw new IllegalStateException("failed to send email");
        }
    }

    private static  String receiptEmail(int totalNum,int totalPrice,List<CartItem> carts) {
        String tempCarts= "" ;
        for (CartItem cart:carts) {
            tempCarts+=  " <tr>\n" +
                     " <td>"+cart._phone().getName()+"</td>\n" +
                     " <td>"+cart.getQuantity()+"</td>\n" +
//                     " <td>"+cart._phone().getPrice()+"</td>\n" +
                     " </tr>\n" ;
   }
            System.out.println(tempCarts);
        return "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Document</title>\n" +
                "    <style>\n" +
                "       h3{" +
                "        font-size:1rem;}" +
                "        #customers {\n" +
                "          font-family: Arial, Helvetica, sans-serif;\n" +
                "          border-collapse: collapse;\n" +
                "          width: 100%;\n" +
                "        }\n" +
                "        \n" +
                "        #customers td, #customers th {\n" +
                "          border: 1px solid #ddd;\n" +
                "          padding: 8px;\n" +
                "        }\n" +
                "        \n" +
                "        #customers tr:hover {background-color: #ddd;}\n" +
                "        \n" +
                "        #customers th {\n" +
                "          padding-top: 12px;\n" +
                "          padding-bottom: 12px;\n" +
                "          text-align: left;\n" +
                "          background-color: #af1b2e;\n" +
                "          color: white;\n" +
                "        }\n" +
                "        </style>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "    <div style=\"border-style:solid;border-width:thin;border-color:#dadce0;border-radius:8px;padding:40px 20px\"\n" +
                "        align=\"center\" class=\"m_-3328082088826946890mdv2rw\"><img src=\"/images/fptshop-logo.png\" width=\"74\" height=\"24\"\n" +
                "            aria-hidden=\"true\" style=\"margin-bottom:16px\" alt=\"logo-shop\" class=\"CToWUd\" data-bit=\"iit\"\n" +
                "            jslog=\"138226; u014N:xr6bB; 53:W2ZhbHNlLDJd\">\n" +
                "        <div\n" +
                "            style=\"font-family:'Google Sans',Roboto,RobotoDraft,Helvetica,Arial,sans-serif;color:rgba(0,0,0,0.87);line-height:32px;padding-bottom:24px;text-align:center;word-break:break-word\">\n" +
                "            <div style=\"font-size:24px\">Chào bạn</div>\n" +
                "            <div style=\"font-size:24px\">Đây là danh sách những sẩn phẩm bạn vừa mua từ \n" +
                    "                <a href=\"http://localhost:8080/home?page=1&different=moi\">FPTShop</a>\n" +
                "            </div>\n" +
                "            <div style=\"margin-top: 15px;\">\n" +
                "                <table id=\"customers\">\n" +
                "                    <tr>\n" +
                "                      <th>Tên sản phẩm</th>\n" +
                "                      <th>Số lượng</th>\n" +
                "                      <th>Giá</th>\n" +
                "                    </tr>\n" +
                                    tempCarts
                +  "                </table>\n" +
                "                <div style=\"text-align: left;padding-top: 12px;\">\n" +
                "                    <h3>Tổng số sản phẩm đã mua: "+totalNum+"</h3>\n" +
                "                    <h3>Tổng tiền: "+totalPrice+"</h3>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "\n" +
                "</html>";
    }

    public static void main(String[] args) {

        String tempCarts="";

//        for (int i=1;i<3;i++) {
//
//            tempCarts+=  " <tr>\n" +
//                    " <td>"+cart._phone().getName()+"</td>\n" +
//                    " <td>"+cart.getQuantity()+"</td>\n" +
//                    " <td>"+cart._phone().getPrice()+"</td>\n" +
//                    " </tr>\n" ;
//        }
    }
}
