Teacup::Stylesheet.new :first do
  style :root,
    background: :table_view

  width = 200
  style :button,
    # We position and size the button according to our "width" variable.
    # You can use this trick to position views according to device, or according
    # to the relative position of other views.
    top: 20,
    left: (320-width)/2,
    width: width,
    height: 30,

    # the `title:` method doesn't exist on UIButton, it is assigned
    # using a "teacup_handler".  easier to read, at the cost of a
    # little bit of obfuscation
    title: "Hi!"

end
