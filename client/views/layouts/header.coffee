Template.header.events
  'click .sidebar-button': ->
    console.log "sidebar clicked!"
    toggleSession 'sidebar'
