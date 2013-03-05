$(document).ready(function(){
    $('.rec2').hide();
    $('.input-check').click(function() {
        $('.input-check.selected').removeClass('selected');
        $(this).addClass('selected');
        $('.rec2').show();
    });
});