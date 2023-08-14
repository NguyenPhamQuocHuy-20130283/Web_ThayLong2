<script type="text/javascript" src="<c:url value='/lib/mdb4/js/jquery.min.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/popper.min.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/mdb.min.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/js/scriptSp.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/product.js'/>"></script>
<script src="<c:url value='/lib/sweetAlert2/sweetalert2.js'/>"></script>
<script src="<c:url value='/lib/jquery.serializejson.js'/>"></script>
<script type="text/javascript">

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
                    alert('Xóa Thành Công','success');
                    row.remove().draw();
                }).fail(function (jqXHR, status, error) {
                    alert('thất bại','warning')
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
            alert('thanh cong','success')
        }).fail(function (jqXHR, status, error) {
            alert('that bai','warning')
            if (jqXHR.status !== 500) {
                warningAlert('Lỗi liệu lỗi');
            } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
        })
    }

    function add(data, url) {
        $.ajax({
            type: 'POST', url: url,
            dataType: 'json',
            miniType: "multipart/form-data",
            contentType: 'application/json',
            data: JSON.stringify(data),
            cache: false,
            contentType: false,
            processData: false,
        }).done(function (responseText) {
            alert('thành công','success')
        }).fail(function (jqXHR, status, error) {
            alert('thất bại','warning')
            if (jqXHR.status !== 500) {
                warningAlert('Lỗi liệu lỗi');
            } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
        })
    }


    function alert(mes, type) {
        Toast.fire({
            icon: type,
            title: mes
        })
    }

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

</script>