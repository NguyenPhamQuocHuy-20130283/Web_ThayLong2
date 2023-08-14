<script src="<c:url value='/lib/mdb4/js/jquery.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/popper.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/mdb.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/bootstrap.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/addons/datatables.min.js'/>"></script>
<script src="<c:url value='/lib/sweetAlert2/sweetalert2.js'/>"></script>
<script src="<c:url value='/lib/jquery.serializejson.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.2.3/jspdf.plugin.autotable.js"></script>
<script src="/lib/export-table-json-csv-txt-pdf/src/tableHTMLExport.js"></script>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '{your-app-id}',
            cookie: true,
            xfbml: true,
            version: '{api-version}'
        });

        FB.AppEvents.logPageView();

    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function dele(data, url) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value === true) {
                $.ajax({
                    type: 'DELETE', url: url,
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(data)
                }).done(function (responseText) {
                    alert('Xóa Thành Công');
                    row.remove().draw();
                }).fail(function (jqXHR, status, error) {
                    if (jqXHR.status !== 500) {
                        warningAlert(jqXHR.responseText);
                    } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin để sửa lỗi.");
                })

            }
        })

    }

    function restore(data, url) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, restore it!'
        }).then((result) => {
            if (result.value === true) {
                $.ajax({
                    type: 'PUT', url: url,
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(data)
                }).done(function (responseText) {
                    alert('khoi phuc Thành Công');
                    row.remove().draw();
                }).fail(function (jqXHR, status, error) {
                    if (jqXHR.status !== 500) {
                        warningAlert(jqXHR.responseText);
                    } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin để sửa lỗi.");
                })

            }
        })

    }

    function warningAlert(mes) {
        alert(mes, 'warning');
    }

    function errorAlert(mes) {
        alert(mes, 'error');
    }

    function update(data, url) {
        $.ajax({
            type: 'PUT', url: url,
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data)
        }).done(function (responseText) {
            alert('thanh cong')

        }).fail(function (jqXHR, status, error) {
            if (jqXHR.status !== 500) {
                warningAlert('Lỗi liệu lỗi');
            } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
        })

    }

    function get(data, url) {
        $.ajax({
            type: 'get', url: url,
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data)
        }).done(function (responseText) {
            alert('thanh cong')

        }).fail(function (jqXHR, status, error) {
            if (jqXHR.status !== 500) {
                warningAlert('Lỗi liệu lỗi');
            } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
        })

    }


    function add(data, url) {
        $.ajax({
            type: 'POST', url: url,
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data)
        }).done(function (responseText) {
            alert('thanh cong')

        }).fail(function (jqXHR, status, error) {
            if (jqXHR.status !== 500) {
                warningAlert('Lỗi liệu lỗi');
            } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
        })

    }


    function alert(mes, type) {
        Swal.fire({
            position: 'top',
            title: 'THÔNG BÁO',
            html: mes,
            icon: type != null ? type : 'success',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            showCancelButton: false,
            // confirmButtonText: 'Yes!'
        })
        location.reload();
    }

    $('i.fa-arrow-left-long').on('click', function () {
        location.reload()
    })
    $('i.fa-rotate-left').on('click', function () {
        history.back()
    })
    $('i.fa-xmark').on('click', function () {
        location.pathname = '/admin/home';
    })

    $('#exportcsv').on('click', function () {
        $('#detail').tableHTMLExport({

// csv, txt, json, pdf
            type: 'csv',

            // default file name
            filename: 'tableHTMLExport.csv',

            // for csv
            separator: ',',
            newline: '\r\n',
            trimContent: true,
            quoteFields: true,

            // CSS selector(s)
            ignoreColumns: '',
            ignoreRows: '',

            // your html table has html content?
            htmlContent: false,

            // debug
            consoleLog: false,

        });


    })

    $('#exportpdf').on('click', function () {
        var doc = new jsPDF('p', 'pt', 'a4');

        doc.autoTable({
            html: '#detail'
        });
        doc.save('table.pdf');


    })
    $('#exportjson').on('click', function () {
        $('#detail').tableHTMLExport({
            type: 'json',
            filename: 'sample.json'
        })
    })
</script>

