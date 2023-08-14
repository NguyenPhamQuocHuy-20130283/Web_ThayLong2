package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.*;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import javax.annotation.ManagedBean;

@ManagedBean
public class PhoneService {

    //        @Inject
    PhoneDAO phoneDAO = new PhoneDAO();
    //        @Inject
    ImageDAO imageDAO = new ImageDAO();
    //    @Inject
    PhoneCapDAO phoneCapDAO = new PhoneCapDAO();
    //    @Inject
    PhoneSpecDAO phoneSpecDAO = new PhoneSpecDAO();
    //    @Inject
    PhoneColorDAO phoneColorDAO = new PhoneColorDAO();
    //    @Inject
    PhonePromotDAO phonePromotDAO = new PhonePromotDAO();
    //    @Inject
//    ReviewDAO reviewDAO = new ReviewDAO("phone_review");


    public Phone save(Phone phone) {
        int id = phoneDAO.savePhone(phone);
        imageDAO.save(phone._images(), id);
        phoneColorDAO.save(phone._colors(), id);
        phoneCapDAO.save(phone._caps(), id);
        phoneSpecDAO.save(phone._specs(), id);
        phonePromotDAO.save(phone._promots(), id);
        return phoneDAO.get(" and id =" + id, Phone.class, null).get();
    }

    public Phone update(Phone phone) {
        Phone old = new PhoneDAO().get(" and id = " + phone.getId(), Phone.class, null).get();
        imageDAO.updateImageList(old._images(), phone._images());
        phoneColorDAO.updatePhoneColorList(old._colors(), phone._colors());
        phoneCapDAO.updateCapList(old._caps(), phone._caps());
        phoneSpecDAO.updateSpecList(old._specs(), phone._specs());
        phonePromotDAO.updatePromotList(old._promots(), phone._promots());
        phoneDAO.updatePhone(phone);
        return phoneDAO.get(" and id=" + phone.getId(), Phone.class, null).get();
    }

    public void delete(Phone phone) {

        phoneDAO.deleteSoftPhone(phone);

//        if (phone.getReviews() == null)
//            phone.setReviews(new HashMap<>());
//        for (Integer r : phone.getReviews().keySet()
//        ) {
//            reviewDAO.deleteReview(phone.getReviews().get(r));
//            reviewDAO.deleteReviewList(phone.getReviews().get(r).getReplyList());
//        }
//        phoneDAO.deletePhone(phone);
    }
}
