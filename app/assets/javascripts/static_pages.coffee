# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
postCards = document.getElementsByClassName("home-post-card")
selectedTopics = []

@displayRecent=() -> 
    window.document.getElementById('recent').checked=true
    for postCard in postCards
        do(postCard)->
            postCard.style.display = ""

@displaySelected=() ->
    window.document.getElementById('selected').checked=true
    for postCard in postCards when postCard.id not in selectedTopics
        do(postCard)->
            postCard.style.display = "none"

@selectTopic=() ->
    temp = []
    for topic in window.document.querySelectorAll("input[type='checkbox']")
        do(topic)->
            temp.push("post-card-#{topic.id}") if topic.checked
    selectedTopics=temp
    if window.document.getElementById('selected').checked
        displayRecent()
        displaySelected()