include SugarCube::Adjust
include SugarCube::CoreGraphics
include SugarCube::Timer


class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    true
  end
end
