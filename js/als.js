    $(document).ready(function () {
        $('INPUT[type="file"]').change(function () {
            //var ext = this.value.match(/\.(.+)$/)[1];
            var ext = this.value.substring(this.value.lastIndexOf('.') + 1);

            switch (ext) {
                case 'xlsx':
                case 'xls':
                    $('p.screen-info').hide();
                    $("#<%= btn.ClientID %>").attr('disabled', false);
                    $("#<%= btn.ClientID %>").css('opacity', '1');
                    break;
                default:
                    $("#<%= btn.ClientID %>").attr('disabled', true);
                    $("#<%= btn.ClientID %>").css('opacity', '.5');
                    $('span.info-user').slideUp('fast');
                    $('p.screen-info').addClass('user-error');
                    $('span.error-user:first').css('display', 'none');
                    $('span.error-user').addClass('error-user-large');
                    $('span.error-user:last-child').css('visibility', 'visible');
                    this.value = '';
            }
        });

        if ($('input[name=ctl00$MainContent$Test]').is(':checked')) {
            $("#<%= btnStep3.ClientID %>").attr('disabled', false);
            $("#<%= btnStep3.ClientID %>").removeClass('opacity');
        }
        $('input[name=ctl00$MainContent$Test]:radio').click(function () {
            $('.step-three .conversion-steps li.two').css('background-position', '-267px -667px');
            $('input:radio[name=' + $(this).attr('name') + ']').parent().removeClass('radiobtn-active');
            $(this).parent().addClass('radiobtn-active');
            $("#<%= btnStep3.ClientID %>").attr('disabled', false);
            $("#<%= btnStep3.ClientID %>").removeClass('opacity');
            var a = $(this).next('label:first').html()
            $("#<%= hdnMatrix.ClientID %>").val(a);
            var s = $(this).val();
            // alert(s);
            $("#<%= hdnRbutton.ClientID %>").val(s);
        });
        $('input:checkbox').change(function () {
            $('.step-four .conversion-steps li.three').css('background-position', '-525px -661px');
            $(this).parent('span').toggleClass('checkbox-active');
            $("#<%= btnConvert.ClientID %>").attr('disabled', false);
            $("#<%= btnConvert.ClientID %>").removeClass('opacity');
            if ($("#<%= chkNormal.ClientID %>").is(':checked') || $("#<%= chkBlank.ClientID %>").is(':checked') || $("#<%= chkEdit.ClientID %>").is(':checked')) {
                $("#<%= btnConvert.ClientID %>").attr('disabled', false);
                $("#<%= btnConvert.ClientID %>").removeClass('opacity');
            }
            else {

                $("#<%= btnConvert.ClientID %>").attr('disabled', true);
                $("#<%= btnConvert.ClientID %>").addClass('opacity');
            }
        })
  
    });
