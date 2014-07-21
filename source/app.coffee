###
Global namespace for Tecnoled.App

@author     G. Nicolas Arroyo <g.nicolas.arroyo@gmail.com> || @gnicoarr
###


"use strict"


Tecnoled = @Tecnoled =
    version       : "1.0.0"
    Collections   : {}
    Models        : {}
    Routers       : {}
    Views         : {}
    Templates     : {}
    App           :
    	Routers       : {}
    	Collections   : {}

    $             : (args...) -> $ args...

    load_template : (url, callback) ->
        $.get url, (data) ->
            callback data

    load_data     : (url, callback) ->
    	$.getJSON url, (data) ->
            callback data