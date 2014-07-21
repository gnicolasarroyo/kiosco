Tecnoled.$ ->
    console.log "------------------------------------------------------------"
    console.log "Tecnoled v#{Tecnoled.version}"
    console.log "------------------------------------------------------------"

    # Settings base
    $.mobile.ajaxEnabled = false
    $.mobile.linkBindingEnabled = false
    $.mobile.hashListeningEnabled = false
    $.mobile.pushStateEnabled = false

    # Settings app
    Tecnoled.App.Routers.Catalog = new Tecnoled.Routers.Catalog()
    Backbone.history.start()