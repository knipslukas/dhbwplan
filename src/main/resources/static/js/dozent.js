$(".js-toggle-intern").change(function() {
    $(".js-collapse-intern").collapse('toggle');
    if ($(this).prop('checked')) {
        $(".js-toggle-untern").val("DHBW Intern");
    }
    else {
        $(".js-toggle-untern").val("");
    }
});