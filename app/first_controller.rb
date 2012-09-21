class FirstViewController < UIViewController
  # we have moved the styling code from the `layout` method to the stylesheet
  # named :first, in styles.rb.  Our Controller is slimmer, but we can still
  # see all the UIView object instantiation.
  stylesheet :first

  def init
    super.tap do
      self.title = "First"
    end
  end

  # style the root view
  layout :root do
    # use teacup to create a button and style it.
    button = subview(UIButton.rounded_rect, :button)

    button.on :touch do
      self.navigationController << SecondViewController.new
    end
  end

end
