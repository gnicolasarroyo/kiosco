###
@namespace  Tecnoled.Routers
@class      Catalog

@author     G. Nicolas Arroyo <g.nicolas.arroyo@gmail.com> || @gnicoarr
###


"use strict"


class Tecnoled.Routers.Catalog extends Backbone.Router
    routes:
        "":"category"

    category: ->
        @changePage new Tecnoled.Views.Category
            "model": Tecnoled.App.Collections.Category

    changePage: (page) ->
        $(page.el).attr 'data-role', 'page' 
        
        do page.render
        
        $('body').append($(page.el))
        
        transition = $.mobile.defaultPageTransition
        
        if @firstPage
            transition = 'none'
            @firstPage = false
        
        $.mobile.changePage $(page.el), 
            "changeHash" : false, 
            "transition" : transition