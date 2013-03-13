$(function(){
    $('.resCheckLink').click(function(e){
        e.preventDefault();
        $('.resCheck.label').removeClass('.label-success');
        $(this).parent().addClass('.label-success')
    });
});