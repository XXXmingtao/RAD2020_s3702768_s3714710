# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

    @showInfo=() ->
      $('#edit-info').show(500)
      $('#edit-avatar').hide()
      $('#edit-password').hide()
      $('#edit-verification').hide()

    @showAvatar=() ->
      $('#edit-info').hide()
      $('#edit-avatar').show(500)
      $('#edit-password').hide()
      $('#edit-verification').hide()

    @showPassword=() ->
      $('#edit-info').hide()
      $('#edit-avatar').hide()
      $('#edit-password').show(500)
      $('#edit-verification').hide()

    @showVerify=() ->
      $('#edit-info').hide()
      $('#edit-avatar').hide()
      $('#edit-password').hide()
      $('#edit-verification').show(500)

    @readAvatar = (input) ->
      if input.files and input.files[0]
        reader = new FileReader
        reader.onload = (e) ->
         $('#avatar_prev').attr('src', e.target.result)
         return
        reader.readAsDataURL input.files[0]
      return

    @readVerification = (input) ->
      if input.files and input.files[0]
        reader = new FileReader
        reader.onload = (e) ->
         $('#verification_prev').attr('src', e.target.result)
         return
        reader.readAsDataURL input.files[0]
      return





