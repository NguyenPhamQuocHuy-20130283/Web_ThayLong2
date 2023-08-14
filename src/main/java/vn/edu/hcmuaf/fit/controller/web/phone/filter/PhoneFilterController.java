package vn.edu.hcmuaf.fit.controller.web.phone.filter;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.*;
import vn.edu.hcmuaf.fit.model.phone.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.stream.IntStream;

@WebServlet(urlPatterns = {"/phone-filter"})
public class PhoneFilterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int size = 0;
        String search = request.getParameter("search");


        String pagination = request.getParameter("page");
        int paginationnum = 0;
        if (pagination != null) {
            paginationnum = Integer.parseInt(pagination) - 1;
        }


        Brand f = null;
        List<Phone> phones = null;
        String sql = " and phones.isDelete =false and isDelete is not null ";
        Map<String, List<Object>> map = new HashMap<>();
        List<Cap> capList = new AbstractDAO<Cap>("caps").list("", Cap.class, null, null, null, null);
        List<Promot> promotList = new AbstractDAO<Promot>("promots").list("", Promot.class, null, null, null, null);
        List<Brand> brandList = new AbstractDAO<Brand>("brands").list("", Brand.class, null, null, null, null);
        Map<String, String> priceList = new HashMap<>();
        Map<String, String> sortList = new HashMap<>();
        Map<String, String> differentList = new HashMap<>();
        differentList.put(" and phones.saleId is not null ", "giam gia");
        differentList.put(" and phone_promot.promotId =1 ", "tra gop");
        differentList.put(" and phones.isNew is true ", "moi");

        priceList.put("<2000", "duoi 2 tr");
        priceList.put("between 100 and 10000", "tu 4 tr den 6 tr");
        sortList.put("phones.`name` asc ", "sap xep theo A - Z");
        sortList.put(" phones.`name` desc ", "sap xep theo Z - A");
        sortList.put("phones.price desc ", "sap xep theo gia giam");
        sortList.put("  phones.price asc ", "sap xep theo gia tang");
        List<String> keys3 = new ArrayList<>(differentList.keySet());
        List<String> keys2 = new ArrayList<>(sortList.keySet());
        List<String> keys = new ArrayList<>(priceList.keySet());

        String sort = request.getParameter("sort");

        String[] differentCheck = request.getParameterValues("differentCheck");

        String[] brandCheck = request.getParameterValues("brandCheck");
        String[] capCheck = request.getParameterValues("capCheck");
        String[] typeCheck = request.getParameterValues("typeCheck");
        String[] modelCheck = request.getParameterValues("modelCheck");
        String[] promotCheck = request.getParameterValues("promotCheck");
        String[] priceCheck = request.getParameterValues("priceCheck");
        boolean[] brandCheck2 = new boolean[brandList.size()];
        boolean[] priceCheck2 = new boolean[keys.size()];
        boolean[] differentCheck2 = new boolean[keys3.size()];
        boolean[] capCheck2 = new boolean[capList.size()];
        boolean[] promotCheck2 = new boolean[promotList.size()];

        if (promotCheck != null) {
            int[] promotId = convert(promotCheck);
            List<Promot> promotCheckList = new PromotDAO().list(promotId);
            promotCheck2 = checkPromot(promotList, promotCheckList);
            sql += " and phone_promot.promotId in (<promotCheck>)";
            map.put("promotCheck", Arrays.asList(promotCheck));
            request.setAttribute("promotCheckList", promotCheckList);
        }


        if (capCheck != null) {
            int[] capId = convert(capCheck);
            List<Cap> capCheckList = new CapDAO().list(capId);

            capCheck2 = checkCap(capList, capCheckList);
            sql += " and phones.capId in (<capCheck>)";
            map.put("capCheck", Arrays.asList(capCheck));
            request.setAttribute("capCheckList", capCheckList);
        }

        if (brandCheck != null) {
            int[] brandId = convert(brandCheck);
            List<Brand> brandCheckList = new BrandDAO().list(brandId);
            size = brandCheckList.size();
            f = brandCheckList.get(0);
            brandCheck2 = checkBrand(brandList, brandCheckList);
            sql += " and phones.brandId in (<brandCheck>)";
            map.put("brandCheck", Arrays.asList(brandCheck));
            request.setAttribute("brandCheckList", brandCheckList);

        }

        List<Model> modelList = new ArrayList<>();

        if (size == 1) {
            modelList = new AbstractDAO<Model>("models").list(" and brandId = " + f.getId(), Model.class, null, null, null, null);
        }
        boolean[] modelCheck2 = new boolean[modelList.size()];
        if (modelCheck != null) {
            int[] modelId = convert(modelCheck);
            List<Model> modelCheckList = new ModelDAO().list(modelId);
            modelCheck2 = checkModel(modelList, modelCheckList);
            sql += " and phones.modelId in (<modelCheck>)";
            map.put("modelCheck", Arrays.asList(modelCheck));
            request.setAttribute("modelCheckList", modelCheckList);
        }
        if (priceCheck != null) {
            List<Object> os = new ArrayList<>();
            for (String s : keys
            ) {
                for (int i = 0; i < priceCheck.length; i++) {
                    if (priceList.get(s).equals(priceCheck[i])) {
                        os.addAll(new AbstractDAO<Object>("phones").listValue("price", " and price " + s, String.class));
                    }
                }
            }
            sql += " and phones.price in (<priceCheck>)";
            priceCheck2 = checkString(priceList, priceCheck);
            map.put("priceCheck", os);
        }
        if (promotCheck != null) {
            sql += " and phone_promot.promotId in (<promotCheck>)";
            map.put("promotCheck", Arrays.asList(promotCheck));
        }
        if (differentCheck != null) {
            for (String key : keys3
            ) {
                for (int i = 0; i < differentCheck.length; i++) {
                    if (differentList.get(key).equals(differentCheck[i])) {
                        sql += key;
                    }
                }

            }
            differentCheck2 = checkString(differentList, differentCheck);
        }
        if (search != null && "".equals(search.trim())) {
            String key = "%" + search + "%";
            sql += " and phones.`name` like " + key + " or phones.`desc` like " +
                    key + " or brands.`name` like " +
                    key + " or models.`name` like " + key + " or phone_cap.`name` like " + key
                    + " or phone_color like " + key + " or phone_spec like " + key
                    + " or phone_promot like " + key + " or types.`name` like " + key;
        }


        String orderby = "";
        if (sort != null) {
            for (String key : keys2
            ) {
                if (sortList.get(key).equals(sort)) {
                    orderby = key;
                    break;
                }
            }
        } else {
            orderby = keys2.get(0);
        }
        phones = new AbstractDAO<Phone>("phones").list0(sql, Phone.class, null, map, Variable.Global.JOIN_PHONE, orderby, 8, paginationnum * 8);
        List<Phone> phones2 = new AbstractDAO<Phone>("phones").list0(sql, Phone.class, null, map, Variable.Global.JOIN_PHONE, orderby, null, null);
        double s = phones2.size();
        double total = s / 8;

        if (Math.floor(total) != Math.ceil(total)) total = Math.ceil(total);
        boolean[] finalBrandCheck = priceCheck2;
        request.setAttribute("priceCheck0", IntStream.range(0, priceCheck2.length)
                .mapToObj(idx -> finalBrandCheck[idx]).noneMatch(num -> num.equals(Boolean.TRUE)));
        request.setAttribute("total", total);
        request.setAttribute("sortList", sortList);
        request.setAttribute("phoneAll", phones2);
        request.setAttribute("paginationnum", paginationnum + 1);
        request.setAttribute("sort", sort);
        request.setAttribute("promotCheck", promotCheck2);
        request.setAttribute("capList", capList);
        request.setAttribute("differentList", differentList);
        request.setAttribute("differentCheck", differentCheck2);
        request.setAttribute("capCheck", capCheck2);
        request.setAttribute("search", search);
        request.setAttribute("brandList", brandList);
        request.setAttribute("priceList", priceList);
        request.setAttribute("promotList", promotList);
        request.setAttribute("priceCheck", priceCheck2);
        request.setAttribute("phones", phones);
        request.setAttribute("modelCheck", modelCheck2);
        request.setAttribute("modelList", modelList);
        request.setAttribute("brandCheck", brandCheck2);
        request.getRequestDispatcher("/views/web/productlist.jsp").forward(request, response);
    }

    private boolean[] checkSort(List<String> s, String ss) {

        boolean[] rs = new boolean[s.size()];
        for (int i = 0; i < rs.length; i++) {
            if (s.get(i).equals(ss)) rs[i] = true;
        }
        return rs;
    }

    private boolean[] checkPromot(List<Promot> s, List<Promot> ss) {

        boolean[] rs = new boolean[s.size()];
        for (int i = 0; i < rs.length; i++) {
            for (Promot b : ss
            ) {
                if (s.get(i).getId() == b.getId()) rs[i] = true;
            }
        }
        return rs;
    }



    private boolean[] checkCap(List<Cap> s, List<Cap> ss) {
        boolean[] rs = new boolean[s.size()];
        for (int i = 0; i < rs.length; i++) {
            for (Cap b : ss
            ) {
                if (s.get(i).getId() == b.getId()) rs[i] = true;
            }
        }
        return rs;

    }


    private int[] convert(String[] s) {
        int[] rs = new int[s.length];

        for (int i = 0; i < s.length; i++) {
            rs[i] = Integer.parseInt(s[i]);
        }
        return rs;
    }


    private boolean[] checkString(Map<String, String> s, String[] ss) {

        List<String> key = new ArrayList<>(s.keySet());

        boolean[] rs = new boolean[key.size()];
        for (int i = 0; i < rs.length; i++) {
            for (int j = 0; j < ss.length; j++) {
                if (s.get(key.get(i)).equals(ss[j])) rs[i] = true;
            }
        }
        return rs;
    }


    private boolean[] checkBrand(List<Brand> s, List<Brand> ss) {
        boolean[] rs = new boolean[s.size()];
        for (int i = 0; i < rs.length; i++) {
            for (Brand b : ss
            ) {
                if (s.get(i).getId() == b.getId()) rs[i] = true;
            }
        }
        return rs;
    }

    private boolean[] checkModel(List<Model> s, List<Model> ss) {
        boolean[] rs = new boolean[s.size()];
        for (int i = 0; i < rs.length; i++) {
            for (Model b : ss
            ) {
                if (s.get(i).getId() == b.getId()) rs[i] = true;
            }
        }
        return rs;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

    public static void main(String[] args) {
        System.out.println(Math.ceil((double) 24 / 7));
        System.out.println(Math.floor((double) 24 / 7));
    }

}
