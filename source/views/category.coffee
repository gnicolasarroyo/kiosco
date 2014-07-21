###
@namespace  Tecnoled.Views
@class      Category

@author     G. Nicolas Arroyo <g.nicolas.arroyo@gmail.com> || @gnicoarr
###


"use strict"


class Tecnoled.Views.Category extends Backbone.View
    events:
        'pagehide' : 'onPageHide'
    
    initialize: ->
        @template = _.template Tecnoled.Templates.Category

    render: ->
        $(@el).html @template
            "categories": @model.toJSON()
        @

    onPageHide: ->
        do @el.remove