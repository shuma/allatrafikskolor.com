$(document).ready(function(){
	$('resCheckLink').click(function(){
		$('resCheck label label-success').removeClass('label-success');
		$('resCheck label').addClass('selected');
	});
});