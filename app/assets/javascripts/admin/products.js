var autocomplete_global_timeout = null;
var autocomplete_objects_name = null;

function autocomplete_find(objects_name){
  autocomplete_objects_name = objects_name;
  var str = $('#' + objects_name + '_search').val().trim();
  if (autocomplete_global_timeout !=null) clearTimeout(autocomplete_global_timeout);
  autocomplete_global_timeout = setTimeout(autocomplete_search, 1000);

}
function autocomplete_search(){
  autocomplete_global_timeout = null;
  $('#search_result').html('');

  var str = $('#' + autocomplete_objects_name + '_search').val().trim();
  $.get('/' + autocomplete_objects_name + '/search?q=' + str, function(data){
    $('#search_result').html(data);
  });
}
function autocomplete_selected(node, fn){
  var result = $(node).closest('tr').attr('id');
  $.Dialog.close();
  if (typeof fn == 'undefined') {
    alert(result);
  } else {
    fn(result);
  }
}

function customer_selected(cid){
  $('#customer_id').val(cid.slice(9));
}

function product_selected(result){
  $.Dialog.close();
  $('#product_id').val(result.slice(8));
  $('#quantity').val(1);
}

function goto_find_user(){
  var user_name = $('#order_order_detail_attributes_full_name').val();
  $.getScript(host_path + '/user_infos/find?n=' + user_name);
}

function find_agent(){
  var str = $('#agent_find').val();
  if (str.length < 2 ){
    $('#list_result_agents tr').remove();
    if (find_agent_global_timeout !=null) clearTimeout(find_agent_global_timeout);
  } else {
    if (find_agent_global_timeout !=null) clearTimeout(find_agent_global_timeout);
    find_agent_global_timeout = setTimeout(search_agent, 1000);
  }

}
function search_agent(){
  find_agent_global_timeout = null;
  $('#list_result_agents tr').remove();
  $('#list_result_agents').append('<tr><td colspan=5>Loading...</td></tr>');
  $.get(host_path + '/companies/search_agent?q=' + $('#agent_find').val(), function(data){
    $('#list_result_agents tr').remove();
    $('#list_result_agents').append(data);
    $('#list_result_agents tr').click(function(){
      $.get(host_path + '/companies/' + $(this).attr('tag') + '/edit');
    });
  });
}
function goto_find_agent(){
  //var user_name = $('#order_order_detail_attributes_full_name').val();
  $.getScript(host_path + '/companies/find_agent');
}
