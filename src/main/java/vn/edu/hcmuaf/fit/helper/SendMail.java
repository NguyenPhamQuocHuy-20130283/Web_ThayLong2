package vn.edu.hcmuaf.fit.helper;

import vn.edu.hcmuaf.fit.model.user.User;

import javax.mail.*;
import javax.mail.internet.*;
import java.io.File;
import java.util.Properties;
import java.util.Random;

public class SendMail {

	public String random() {
		Random rd = new Random();
		int num = rd.nextInt(99999);

		return String.format("%06d", num);
	}

	public boolean sendEmail(User u) {
		boolean test = false;

		String fromEmail = "20130218@st.hcmuaf.edu.vn";
		String password = "mymeslmspxoogvoo";

		String toEmail = u.getEmail();

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

			MimePart attachmentPart = null;

			MimePart textPart = new MimeBodyPart();
			MimePart htmlPart = new MimeBodyPart();

			mess.setFrom(new InternetAddress(fromEmail));
			mess.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			mess.setSubject("verity");

			File f = new File("D:\\test");

			if (!f.exists())
				throw new Exception("file ko ton tai");
			if (f.isFile()) {
				attachmentPart = new MimeBodyPart();
				((MimeBodyPart) attachmentPart).attachFile(f);
			}
			if (f.isDirectory()) {
				File[] content = f.listFiles();
				if (content != null)
					for (File f1 : content) {
						attachmentPart = new MimeBodyPart();
						((MimeBodyPart) attachmentPart).attachFile(f1);
						multipart.addBodyPart((BodyPart) attachmentPart);
					}
			}

			textPart.setText("This is code : " + random());
			htmlPart.setContent("<table style=\"width:100%\">\n" + "  <tr>\n" + "    <th>Company</th>\n"
					+ "    <th>Contact</th>\n" + "    <th>Country</th>\n" + "  </tr>\n" + "  <tr>\n"
					+ "    <td>Alfreds Futterkiste</td>\n" + "    <td>Maria Anders</td>\n" + "    <td>Germany</td>\n"
					+ "  </tr>\n" + "  <tr>\n" + "    <td>Centro comercial Moctezuma</td>\n"
					+ "    <td>Francisco Chang</td>\n" + "    <td>Mexico</td>\n" + "  </tr>\n" + "</table>",
					"text/html");

			multipart.addBodyPart((BodyPart) textPart);

			multipart.addBodyPart((BodyPart) htmlPart);

			mess.setContent(multipart);

			Transport.send(mess);

			test = true;

		} catch (Exception e) {
			e.getMessage();
		}

		return test;

	}

}
