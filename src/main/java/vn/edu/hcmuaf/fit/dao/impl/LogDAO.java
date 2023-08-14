package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Log;
import vn.edu.hcmuaf.fit.model.user.User;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

public class LogDAO<T> extends AbstractDAO<Log> {


    public LogDAO() {
        super("logs");
    }

    public int save(Log log) {
        log.setCreated_at(new Timestamp(System.currentTimeMillis()));

        return insertWithId(" insert into logs(`level`,userId,url,created_at,content,src,ip) values(:t.level,:t.userId,:t.url,:t.created_at,:t.content,:t.src,:t.ip)", log);

    }

    public int saveLog(Log log, HttpServletRequest request, String level) {

        String ip = request.getHeader("X-FORWARDED-FOR");

        if (ip == null || ip.isEmpty()) {
            ip = request.getRemoteAddr();
        }
        log.setLevel(level);
        log.setIp(ip);
        log.setUrl(request.getRequestURL().toString() + "?" + request.getQueryString());


        return save(log);
    }

    public int saveLogInfo(User user, Class<T> cl, HttpServletRequest request) {
        Log log = new Log();
        log.setUserId(user == null ? null : user.getId());
        log.setSrc(cl.getName());
        log.setContent(cl.toString());
        return saveLog(log, request, "INFO");
    }

    public int saveLogWarning(User user, Class<T> cl, HttpServletRequest request) {
        Log log = new Log();
        log.setUserId(user == null ? null : user.getId());
        log.setSrc(cl.getName());
        log.setContent(cl.toString());
        return saveLog(log, request, "WARNING");
    }

    public int saveLogDANGER(User user, Class<T> cl, HttpServletRequest request) {
        Log log = new Log();
        log.setUserId(user == null ? null : user.getId());
        log.setSrc(cl.getName());
        log.setContent(cl.toString());
        return saveLog(log, request, "DANGER");
    }

    public int saveLogALERT(User user, Class<T> cl, HttpServletRequest request) {
        Log log = new Log();
        log.setUserId(user == null ? null : user.getId());
        log.setSrc(cl.getName());
        log.setContent(cl.toString());
        return saveLog(log, request, "ALERT");
    }

    public int saveLogALERT(User user, Class<T> cl, T s, HttpServletRequest request) {
        Log log = new Log();
        log.setUserId(user == null ? null : user.getId());
        log.setSrc(cl.getName());
        log.setContent(cl.toString());
        return saveLog(log, request, "ALERT");
    }


}
