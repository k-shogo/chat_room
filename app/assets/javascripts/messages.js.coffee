$ ->
  $('#new_message')
    .on 'ajax:complete', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      html = response.html
      # 画面に追加
      $('#messages').prepend html
      # フォームを初期化
      $('#new_message')[0].reset()
