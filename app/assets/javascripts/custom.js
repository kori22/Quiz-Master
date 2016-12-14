$(document).ready(function () {
    /*
     * HTML Editor
     */
    if ($('.html-editor')[0]) {
       $('.html-editor').summernote({
            height: 150
        });
    }
    
    $('.dropdown-toggle').dropdown();

    App.init();
	App.wizard();

	if($(".datetimepicker")[0]){
		$(".datetimepicker").datetimepicker({autoclose:!0,componentIcon:".s7-date",navIcons:{rightIcon:"s7-angle-right",leftIcon:"s7-angle-left"}})
	}
});


function cek_button(){
	if($("#wizard1 .actions:eq(0) button:eq(1)").html() == 'Submit<i class="icon s7-angle-right"></i>'){
		$("form").submit();
	}
}
