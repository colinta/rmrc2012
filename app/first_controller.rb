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

  # use teacup to create a button and style it.
  layout do
    button = subview(UIButton.rounded_rect, :button)
  end

end
