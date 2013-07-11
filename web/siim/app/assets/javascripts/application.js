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

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
    "date-eu-pre": function ( date ) {
        var date = date.replace(" ", "");

        if (date.indexOf('.') > 0) {
            /*date a, format dd.mn.(yyyy) ; (year is optional)*/
            var eu_date = date.split('.');
        } else {
            /*date a, format dd/mn/(yyyy) ; (year is optional)*/
            var eu_date = date.split('/');
        }

        /*year (optional)*/
        if (eu_date[2]) {
            var year = eu_date[2];
        } else {
            var year = 0;
        }

        /*month*/
        var month = eu_date[1];
        if (month.length == 1) {
            month = 0+month;
        }

        /*day*/
        var day = eu_date[0];
        if (day.length == 1) {
            day = 0+day;
        }

        return (year + month + day) * 1;
    },

    "date-eu-asc": function ( a, b ) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },

    "date-eu-desc": function ( a, b ) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    }
} );

$(document).ready(function() {
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

    $('#list').dataTable({
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
        "sPaginationType": "bootstrap",
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

