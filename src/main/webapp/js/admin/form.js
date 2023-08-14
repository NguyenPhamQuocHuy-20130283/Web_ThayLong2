$(function(){

$('#modal .modal-content .modal-footer button').click(function(){
    const email = $('#defaultForm-email');
    const pass = $('#defaultForm-pass');
    const rePass = $('#defaultForm-repass');
    let hasInvalid = false;
    console.log(1);
    if(pass.val()==''){ pass.addClass('invalid');
    hasInvalid=true;
}
    const notRePass = (rePass.val()=='')|| rePass.val().search(pass.val())<=-1?true:false;
    if(notRePass){ rePass.addClass('invalid');
    hasInvalid=true;
    }
    if(email.val()==''){ email.addClass('invalid');
    hasInvalid=true;
}
    if(hasInvalid)return;
    $('#modal').css('display','none');
    $('.modal-backdrop').css('display','none');

})

});
