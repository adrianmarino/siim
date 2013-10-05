// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require i18n
//= require bootstrap-select
//= require bootstrap-spinedit
//= require i18n/translations
//= require jquery_nested_form
//= require bootstrap-file-input

function functionIsDefined(functionName) {
  try {
    return typeof eval(functionName) == 'function';
  } catch(e) { return false; }
}

function existElement(aQuery) {
  return $(aQuery).length;
}

$.fn.datepicker.dates['es'] = {
  days: ["Domindo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado", "Domingo"],
  daysShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"],
  daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do"],
  months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
  monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
  today: "Hoy"
};


$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({
        "format": "yyyy-mm-dd",
        "weekStart": 1, 
        "autoclose": true,
        "language": I18n.locale
    });
});

function trim(str) {
    str = str.replace(/^\s+/, '');
    for (var i = str.length - 1; i >= 0; i--) {
        if (/\S/.test(str.charAt(i))) {
            str = str.substring(0, i + 1);
            break;
        }
    }
    return str;
}
 
function dateHeight(dateStr){
    if (trim(dateStr) != '') {
        var frDate = trim(dateStr).split(' ');
        var frTime = frDate[1].split(':');
        var frDateParts = frDate[0].split('/');
        var day = frDateParts[0] * 60 * 24;
        var month = frDateParts[1] * 60 * 24 * 31;
        var year = frDateParts[2] * 60 * 24 * 366;
        var hour = frTime[0] * 60;
        var minutes = frTime[1];
        var x = day+month+year+hour+minutes;
    } else {
        var x = 99999999999999999; //GoHorse!
    }
    return x;
}
 
jQuery.fn.dataTableExt.oSort['date-euro-asc'] = function(a, b) {
    var x = dateHeight(a);
    var y = dateHeight(b);
    var z = ((x < y) ? -1 : ((x > y) ? 1 : 0));
    return z;
};

jQuery.fn.dataTableExt.oSort['date-euro-desc'] = function(a, b) {
    var x = dateHeight(a);
    var y = dateHeight(b);
    var z = ((x < y) ? 1 : ((x > y) ? -1 : 0));
    return z;
};


$(document).ready(function() {
    $('input[type=file]').bootstrapFileInput();
    $('.file-inputs').bootstrapFileInput();

    $('.patient_height').spinedit({
        minimum: 0,
        maximum: 4,
        step: 0.01,
        value: 1.5,
        numberOfDecimals: 2
    });

    $('.patient_weight').spinedit({
        minimum: 0,
        maximum: 800,
        step: 1,
        value: 60,
        numberOfDecimals: 0
    });

    $(".remove_nested_fields").addClass('btn').prepend('<i class="icon-minus-sign icon-white remove_nested_fields_icon">&nbsp;</i>');
    $(".add_nested_fields").addClass('btn').prepend('<i class=" icon-plus-sign icon-white">&nbsp;</i>');

    $(".selectpicker").selectpicker({
        style: 'btn-info',
        size: '10'
    });


    /*  
      Tables...
    */
    if (functionIsDefined('tableColumnSortdDefinicion')) {
        $('#crud_list').dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
            "sPaginationType": "bootstrap",
            "aLengthMenu": [[5, 10, 15, 25, 50, 100], [5, 10, 15, 25, 50, 100]],
            "iDisplayLength": 5,
            "aoColumns": tableColumnSortdDefinicion(),
            "oLanguage": {
                "oPaginate": {
                    "sFirst": I18n.t("data_table.paginate.first"),
                    "sLast": I18n.t("data_table.paginate.last"),
                    "sNext": I18n.t("data_table.paginate.next"),
                    "sPrevious": I18n.t("data_table.paginate.previous")
                },
                "sEmptyTable": I18n.t("data_table.emptyTable"),
                "sInfo": I18n.t("data_table.info"),
                "sInfoEmpty": I18n.t("data_table.infoEmpty"),
                "sInfoFiltered": I18n.t("data_table.infoFiltered"),
                "sInfoPostFix": I18n.t("data_table.infoPostFix"),
                "sSearch": I18n.t("data_table.search"),
                "sZeroRecords": I18n.t("data_table.zeroRecords"),
                "sLengthMenu": I18n.t("data_table.lengthMenu")
            }
        });
        $(".sorting:last").removeClass("sorting");
        $("[name='list_length']").selectpicker({
            style: 'btn-info',
            size: '10',
            width: '70px'
        });
    }
    if (existElement('#attention_time_list')) {
        $('#attention_time_list').dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
            "sPaginationType": "bootstrap",
            "aLengthMenu": [[5, 10, 15, 25, 50, 100], [5, 10, 15, 25, 50, 100]],
            "iDisplayLength": 25,
            "aoColumns": [null,{ "sType": "date-euro" },null,null,null,null],
            "oLanguage": {
                "oPaginate": {
                    "sFirst": I18n.t("data_table.paginate.first"),
                    "sLast": I18n.t("data_table.paginate.last"),
                    "sNext": I18n.t("data_table.paginate.next"),
                    "sPrevious": I18n.t("data_table.paginate.previous")
                },
                "sEmptyTable": I18n.t("data_table.emptyTable"),
                "sInfo": I18n.t("data_table.info"),
                "sInfoEmpty": I18n.t("data_table.infoEmpty"),
                "sInfoFiltered": I18n.t("data_table.infoFiltered"),
                "sInfoPostFix": I18n.t("data_table.infoPostFix"),
                "sSearch": I18n.t("data_table.search"),
                "sZeroRecords": I18n.t("data_table.zeroRecords"),
                "sLengthMenu": I18n.t("data_table.lengthMenu")
            }
        });
        $(".sorting:last").removeClass("sorting");
        $("[name='list_length']").selectpicker({
            style: 'btn-info',
            size: '10',
            width: '70px'
        });
    }
});

$(document).on('nested:fieldAdded', function(event){
  var field = event.field; 
  var remove_button = field.find('.remove_nested_fields');
  remove_button.addClass('btn').prepend('<i class="icon-minus-sign icon-white remove_nested_fields_icon">&nbsp;</i>');

  $("#consultations .selectpicker").selectpicker({
        style: 'btn-info',
        size: '10'
  });
});

$(document).on('click', '#user_is_medical', function(){
   
      var isChecked = $('#user_is_medical').is(':checked');

      if(isChecked){       
        $('#divMedical').show();       
      } else {
         $('#divMedical').hide(); 
      }
 });
