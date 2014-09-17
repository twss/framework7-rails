window.F7H =
  app: new Framework7()
  dom: Dom7

window.Phone =
  Views: {}

Phone.Views.Main =
  F7H.app.addView '.view-main',
    dynamicNavbar: true
