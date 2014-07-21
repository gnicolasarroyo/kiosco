###
@namespace  Tecnoled.Models
@class      Product

@author     G. Nicolas Arroyo <g.nicolas.arroyo@gmail.com> || @gnicoarr
###


"use strict"


class Tecnoled.Models.Product extends Backbone.Model
    defaults:
        "name" : ""
        "code" : ""
        "image" : ""
        "category" :
            "key" : ""
            "title" : ""
        "product_benefits" : {}
        "areas_of_application" : {}
        "technical_data" : {}
        "graphic_images_and_application" : {}
        "packaging_information" : {}
