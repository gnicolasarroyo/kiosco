###
Load templates and data for Tecnoled.App

@author     G. Nicolas Arroyo <g.nicolas.arroyo@gmail.com> || @gnicoarr
###


"use strict"


# Load template
Tecnoled.load_template 'assets/templates/category.html', (data) ->
    Tecnoled.Templates.Category = data

# Load data
Tecnoled.load_data 'assets/data/categories.json', (data) ->
	Tecnoled.App.Collections.Category = new Tecnoled.Collections.Category data