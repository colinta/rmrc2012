include SugarCube::Adjust
include SugarCube::CoreGraphics
include SugarCube::Timer


class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    first_controller = FirstViewController.new
    nav_ctlr = UINavigationController.alloc.initWithRootViewController(first_controller)

    @window.rootViewController = nav_ctlr
    @window.makeKeyAndVisible

    true
  end
end
