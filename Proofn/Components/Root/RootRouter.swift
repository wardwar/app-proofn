//
//  RootRouter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class RouteRouter {
    static var window : UIWindow!
    
    static func presentLoginScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        let viewController = LoginRouter.assembleComponent()
        window.rootViewController = viewController
        self.window = window
    }
    
    static func presentMessageList(in window: UIWindow){
        window.makeKeyAndVisible()
        let viewController = MessageRouter.assembleComponent()
        window.rootViewController = viewController
        self.window = window
    }
    
    static func resetScreen(screen: UIViewController) {
        window.rootViewController = screen
    }
    
}
