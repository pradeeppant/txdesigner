
$(document).ready(function () {

    //User update and profile button
    $('.profileSettingDD').hide();
    $('div.profileSetting').hover(
		function () {
		    var target = $('.profileSettingDD');
		    target.slideDown('fast');
		},
		function () {
		    var target = $('.profileSettingDD');
		    target.slideUp('fast');
		}
	);


    //Focus On Off Code	
    //    var el = $('input[type=text], textarea, input[type=password]');
    //    el.focus(function (e) {
    //        if (e.target.value == e.target.defaultValue)
    //            e.target.value = '';
    //    });
    //    el.blur(function (e) {
    //        if (e.target.value == '')
    //            e.target.value = e.target.defaultValue;
    //    });

    //Brose File Code
    $('input#browseFile').change(function () {
        var browseVal = $(this).val().replace(/C:\\fakepath\\/i, '');
        $('input[name="displayFile"]').val(browseVal);
        $('span#fileNm').html(browseVal);
        //Assign into hidden field
        $('input#HdnFileName').val(browseVal);
        //        var hdnValue = $("#HdnFileName").val();
        //        alert(hdnValue);
    });

    //File type Check
    //    $('input#browseFile').change(function () {
    //        var ext = this.value.match(/\.(.+)$/)[1];
    //        switch (ext) {
    //            case 'xlsx':
    //            case 'xls':
    //                //alert('True File Type');
    //                $('input#stepOneNext').addClass('stepI-next-active').removeAttr('disabled', 'disabled');
    //                $('span.browsefile-dis-icon').slideUp('fast');
    //                $('span.browsefile-toltip').slideUp('fast');
    //                $('span.browsefile-done-icon').slideDown('fast');
    //                break;
    //            default:
    //                //alert('False File Type');
    //                $('input#stepOneNext').removeClass('stepI-next-active').attr('disabled', 'disabled');
    //                $('span.browsefile-dis-icon').slideDown('fast');
    //                $('span.browsefile-toltip').slideDown('fast');
    //                $('span.browsefile-done-icon').slideUp('slow');
    //                this.value = '';
    //        }
    //    });

    //First step loader and slide action
    $('input#stepOneNext').click(function () {
        $('div#step-one').slideUp('slow');
        $('html, body').animate({ scrollTop: 0 }, 'slow');
        $('.loader').fadeIn('slow').show().delay(1500).fadeOut('fast');
        $('div#step-two').delay(1800).slideDown('slow');
    });
    //First step back button
    $('input.upload-newfile-btn').click(function () {
        $('div#step-two').slideUp('slow');
        $('div#step-three').slideUp('slow');
        $('html, body').animate({ scrollTop: 0 }, 'slow');
        $('.loader').fadeIn('slow').show().delay(1500).fadeOut('fast');
        $('div#step-one').delay(1800).slideDown('slow');
        $('li.upload-als').delay(400).removeClass('active-upload-als');
        $('li.pick-active').delay(400).removeClass('pick-active').addClass('pick');
        $('li.select-active').delay(400).removeClass('select-active').addClass('select');
        $('input.browse-file-name').val('');
        $('span.browsefile-done-icon').hide();
    });
    //Select Matrix loader and slide action
    $('input.pick-matrixsheet-btn').click(function () {
        $('div#step-two').slideUp('slow');
        $('div#step-three').delay(500).slideDown('slow');
        $('li.upload-als').delay(400).addClass('active-upload-als');
    });

    //Multiple Checkbox action
    //    $('span.multichecks input:checkbox').change(function () {
    //        var c = $('span.multichecks input:checkbox:checked').length;
    //        if (c !== 0) {
    //            $('span.multiselect-val').removeClass('opacity');
    //            $('input.format-type-btn').addClass('format-type-btn-active').removeAttr('disabled', 'disabled');
    //            $('li.pick').removeClass('pick').addClass('pick-active');
    //        }
    //        else {
    //            $('span.multiselect-val').addClass('opacity');
    //            $('input.format-type-btn').removeClass('format-type-btn-active').attr('disabled', 'disabled');
    //            $('li.pick-active').removeClass('pick-active').addClass('pick');
    //        }
    //        var ccval = [];
    //        $.each($('span.multichecks input:checkbox:checked'), function (a, b) {
    //            ccval.push($(b).val());
    //        });
    //        $('span.multiselect-values').text(ccval);
    //    });

    //Multiple Checkbox action

    //    ************ Step 3 Start **************************
    $('span.multichecks input:checkbox').change(function () {
        var c = $('span.multichecks input:checkbox:checked').length;
        if (c !== 0) {
            $('span.multiselect-val').removeClass('opacity');
            $('input.format-type-btn').addClass('format-type-btn-active').removeAttr('disabled', 'disabled');
            $('li.pick').removeClass('pick').addClass('pick-active');
        }
        else {
            $('span.multiselect-val').addClass('opacity');
            $('input.format-type-btn').removeClass('format-type-btn-active').attr('disabled', 'disabled');
            $('li.pick-active').removeClass('pick-active').addClass('pick');
        }
        var ccval = [];

        $.each($('span.multichecks input:checkbox:checked').next('label'), function (a, b) {
            ccval.push(' ' + $(b).text());
        });


        $('input#HdnSelectedMatrix').val(ccval.toString());
        $('span.multiselect-values').text(ccval.toString());
    });

    //var cmat = $('span.multiselect-values').text();
    var cmat = $("#HdnSelectedMatrix").val().toString();
    //    ************ Step 3 End **************************
    //alert($("#HdnSelectedMatrix").val().toString());


    //    ************  **************************
    //Fourth step loader and slide action
    $('input.format-type-btn').click(function () {
        $('div#step-three').slideUp('slow');
        $('html, body').animate({ scrollTop: 0 }, 'slow');
        $('.loader-processed').fadeIn('slow').show().delay(1500).fadeOut('fast');
        $('div#step-four').delay(1800).slideDown('slow');
        $('span#matrixNm').text(cmat);
        // alert(cmat);
        //dinesh
    });
    //PDF Type checkboxes
    $('span.pdf-type-checks input:checkbox').change(function () {
        var cc = $('span.pdf-type-checks input:checkbox:checked').length;
        if ($(this).is(':checked')) {
            $(this).parent('span').addClass('active-check');
        }
        else {
            $(this).parent('span').removeClass('active-check');
        }
        if (cc !== 0) {
            $('li.select').removeClass('select').addClass('select-active');
            $('input.download-process-btn').addClass('download-process-btn-active').removeAttr('disabled', 'disabled');
        }
        else {
            $('li.select-active').removeClass('select-active').addClass('select');
            $('input.download-process-btn').removeClass('download-process-btn-active').attr('disabled', 'disabled');
        }
    });
    //Fourth step back to select matrix slide action
    $('input.pick-matrixsheet-back-btn').click(function () {
        $('div#step-four').slideUp('slow');
        $('div#step-three').delay(500).slideDown('slow');
    });

    //Fifth Step slide actions
    $('input.download-process-btn').click(function () {
        $('div#step-four').slideUp('slow');
        $('.loader-generated').fadeIn('slow').show().delay(1500).fadeOut('fast');
        $('div#step-five').delay(500).slideDown('slow');
    });

    //Fifth Step back slide action	
    $('input.format-type-back-btn').click(function () {
        $('div#step-five').slideUp('slow');
        $('div#step-four').delay(500).slideDown('slow');
    });

    $('a.run-log').click(function () {
        var hdn = $('#hdnCurrentPanel').val();
        $("#" + hdn).slideUp();
        $('div#step-six').slideDown('fast');
        $('a.run-log').css('visibility', 'hidden');

    });

    $('a.run-log-down').click(function () {
        var hdn = $('#hdnCurrentPanel').val();
        $("#" + hdn).slideDown('fast');
        $('div#step-six').slideUp('fast');
        $('a.run-log').css('visibility', 'visible');
    });





















    

    $('input#btnSugnUp').click(function () {
        var delay = 0;
        $('.p-hide:lt(15)').each(function () {
            $(this).delay(delay).animate({
                width: 0,
                opacity: 0
            }, 90, function () {
                $('.personal-plan-content').hide('slow');
                $('.enterprise-plan-content').css('display', 'block');
            });
            delay += 90;
        });

        $('.personal-plan-form').slideDown('slow');
        alert('');
        $(this).hide('fast');
        $('.start-trial').delay(500).slideDown('slow');

        $('.enterprise-plan-form').slideUp('fast');
        $('.sign-up-confirmation').slideUp('fast');
        $('.e-hide').removeAttr('style');
        $('.submit-btn').slideUp();
        $('.getin-touch').removeAttr('style');
    });
    $('.start-trial').click(function () {
        $('.personal-plan-form').slideUp('fast');
        $('.personal-plan-form').next('span.sign-up-confirmation').slideDown('fast');
        $(this).slideUp('fast');
        $('.signin-btn').delay(500).slideDown('slow');
    });
    $('.signin-btn').click(function () {
        window.location.assign('login.html');
    });

    $('.getin-touch').click(function () {
        var delay = 0;
        $('.e-hide:lt(15)').each(function () {
            $(this).delay(delay).animate({
                width: 0,
                opacity: 0
            }, 90, function () {
                $('.enterprise-plan-content').hide('slow');
                $('.personal-plan-content').css('display', 'block');
            });
            delay += 90;
        });
        $('.enterprise-plan-form').slideDown('slow');
        $(this).slideUp('fast');
        $('.submit-btn').delay(500).slideDown('slow');


        $('.personal-plan-form').slideUp('fast');
        $('.sign-up-confirmation').slideUp('fast');
        $('.p-hide').removeAttr('style');
        $('.start-trial').slideUp('slow');
        $('.signin-btn').slideUp('slow');
        $('.personal-plan-btn').removeAttr('style');
    });

    $('.submit-btn').click(function () {
        $('.enterprise-plan-form').slideUp('fast');
        $('.enterprise-plan-form').next('span.sign-up-confirmation').slideDown('fast');
        $(this).hide('fast');
    });


});