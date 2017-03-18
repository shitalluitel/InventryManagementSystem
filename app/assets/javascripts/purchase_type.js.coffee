$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  row = $(this).closest('tr')
  value = $('.total',row)
  data = parseFloat(value.val())

  discount = parseFloat($('.discount').val())

  grandtotal = $('.total-cost')
  grand_value = parseFloat(grandtotal.val())
  if (( grand_value - data) < 0)
    grandtotal.val('0')
    $
  else
    grandtotal.val(( (grand_value - data)).toFixed(4))
    $('.grand-total').val(( grand_value - data - discount).toFixed(4))

  row.remove()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  count += 1
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'),'g')
  $('#add-data').append($(this).data('fields').replace(regexp, time))
  event.preventDefault()

