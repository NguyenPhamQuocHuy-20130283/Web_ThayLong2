<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ"/></title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <%@include file="/common/web/css.jsp" %>
    <dec:getProperty property="page.local_style"/>
</head>
<body>
<!-- header -->

<%@include file="/common/web/header.jsp" %>
<!-- header -->
<%
    if (SessionUntil.get(request, "error") != null) {
        Map<String, String> map = (Map<String, String>) SessionUntil.get(request, "error");
        List<String> keys = new ArrayList<>(map.keySet());

%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <%
        for (String s : keys
        ) {

    %>
    <strong><%=s%>
    </strong> <%=map.get(s)%>
    </br>
    <%}%>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        SessionUntil.delItem(request,"error");
    }%>
<dec:body/>

<!-- footer -->
<%@ include file="/common/web/footer.jsp" %>
<!-- footer -->
<%@include file="/common/web/js.jsp" %>

<dec:getProperty property="page.local_script"/>

<script type="text/javascript">
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 7000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })
<%if (SessionUntil.get(request, "message") != null) { %>


    Toast.fire({
        icon: '<%=SessionUntil.get(request,"type") %>',
        title: '<%=SessionUntil.get(request,"message") %>'
    })

<%

        SessionUntil.delItem(request, "message");
    }

%>


    $(document).ready(function () {
        $('#modalLoginForm .modal-footer button').click(function () {
            const ckFEmail = $('#defaultForm-email').hasClass('invalid') ? true : false;
            const ckFPass = $('#defaultForm-pass').hasClass('invalid') || $('#defaultForm-pass').val().length < 1 ? true : false;
            if (ckFEmail || ckFPass)
                $('#modalLoginForm form').attr('onsubmit', 'return false');
            else
                $('#modalLoginForm form').attr('onsubmit', 'return true');
        });
        popUp();

    })

    function popUp() {
        if ($('#mess-form').val() != undefined) {
            $('#btn-login').trigger('click')
        } else {
            $('#btn-login').trigger('')
        }
    }
</script>
</body>
</html>