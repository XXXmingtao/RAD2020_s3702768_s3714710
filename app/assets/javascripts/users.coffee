# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

    @showInfo=() ->
      $('.update-field').hide()
      $('#edit-info').show()
      $('.panel-sub-nav li').css("color":"black","border":"none")
      $('#setting-info-btn').css("color":"#009486","border-bottom":"2px solid #009486")

    @showAvatar=() ->
      $('.update-field').hide()
      $('#edit-avatar').show()
      $('.panel-sub-nav li').css("color":"black","border":"none")
      $('#setting-avatar-btn').css("color":"#009486","border-bottom":"2px solid #009486")

    @showPassword=() ->
      $('.update-field').hide()
      $('#edit-password').show()
      $('.panel-sub-nav li').css("color":"black","border":"none")
      $('#setting-password-btn').css("color":"#009486","border-bottom":"2px solid #009486")

    @showVerify=() ->
      $('.update-field').hide()
      $('#edit-verification').show()
      $('.panel-sub-nav li').css("color":"black","border":"none")
      $('#setting-verification-btn').css("color":"#009486","border-bottom":"2px solid #009486")

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





