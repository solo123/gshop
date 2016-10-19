function stock_taking_sum(){
  $('table.sumary').each(function(){
    $(this).find('tfoot tr td:nth-child(2)').text((sum_table_column(this)));
    $(this).find('tfoot tr td:nth-child(3)').text((sum_table_field(this)));
  });


}

function sum_table_column(table) {
  var tot = 0;
  $(table).find('tbody tr td:nth-child(4)').each(function() {
    tot += parseInt($(this).text());
  });
  return tot;
}

function sum_table_field(table, columnIndex) {
  var tot = 0;
  $(table).find('input').each(function() {
    tot += parseInt($(this).val());
  });
  return tot;
}

$(function(){
  $('table input').keyup(function(){stock_taking_sum();});
  stock_taking_sum();
});
