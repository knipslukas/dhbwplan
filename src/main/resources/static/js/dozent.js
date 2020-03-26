$(".js-toggle-intern").change(function() {
    $(".js-collapse-intern").collapse('toggle');
    $(".js-collapse-stuleiter").collapse('toggle');
    if ($(this).prop('checked')) {
        $(".js-toggle-untern").val("DHBW Intern");
    }
    else {
        $(".js-toggle-untern").val("");
        $('.js-toggle-stuleiter').bootstrapToggle('off');
        
    }
});