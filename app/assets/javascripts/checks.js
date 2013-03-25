$(document).ready(function(){
    $('.resCheckLink').click(function(e){
        $('.resCheck').removeClass('label-success');
        $(this).parent().addClass('label-success');
    });
});