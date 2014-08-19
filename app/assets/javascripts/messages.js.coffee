$ ->
  $('#new_message')
    .on 'ajax:complete', (event, ajax, status) ->
      # フォームを初期化
      $('#new_message')[0].reset()
