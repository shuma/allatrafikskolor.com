$(function(){
    $('.resCheckLink').click(function(e){
        $('.resCheck.label').removeClass('label-success');
        $(this).parent().addClass('label-success')
    });
});