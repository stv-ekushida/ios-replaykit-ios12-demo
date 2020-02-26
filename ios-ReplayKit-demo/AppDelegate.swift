//
//  AppDelegate.swift
//  ios-ReplayKit-demo
//
//  Created by eiji kushida on 2020/02/26.
//  Copyright © 2020 eiji kushida. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            // do nothing
        } else {
            window = UIWindow()
            AppDelegate.setupWindow(window!)
        }
        return true
    }
    
    class func setupWindow(_ window: UIWindow) {
        
        // position and size
        window.frame = UIScreen.main.bounds

        if #available(iOS 13.0, *) {
            window.backgroundColor = .systemBackground
        } else {
            let viewController = ViewController.instance()
            window.rootViewController = viewController
            window.backgroundColor = .white
        }

        window.makeKeyAndVisible()
    }
}

//MARK : - instance Helper
extension ViewController {
    static func instance() -> ViewController {
        
        guard let viewController = UIStoryboard.viewController(
            storyboardName: "Main",
            identifier: "Main" ) as? ViewController else {
                fatalError("ViewController not Found.")
        }
        return viewController
    }
}

public extension UIStoryboard {
    
    class func viewController<T: UIViewController>(storyboardName: String,
                                                   identifier: String) -> T? {
        
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(
            withIdentifier: identifier) as? T
    }
}
