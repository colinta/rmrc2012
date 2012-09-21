Teacup::Stylesheet.new :first do

  style :button,
    # `frame` is a property on UIView,
    # and so this assignment is the same as `button.frame = [...]`
    frame: [[10, 10], [100, 20]],

    # the `title:` method doesn't exist on UIButton, it is assigned
    # using a "teacup_handler".  easier to read, at the cost of a
    # little bit of obfuscation
    title: "Hi!"

end
