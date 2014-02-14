class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    c = ExampleController.alloc.initWithNibName nil, bundle: nil
    #c = ConversationChatController.alloc.initWithNibName nil, bundle:nil
    tab = UINavigationController.alloc.initWithRootViewController(c)
    @window.rootViewController = tab
    @window.makeKeyAndVisible

    true
  end
end
