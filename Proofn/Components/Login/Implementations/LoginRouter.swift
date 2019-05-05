//
//  LoginRouter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//


import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
  
    var viewController: UIViewController!
    
    static func assembleComponent() -> UIViewController {
        
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let repository = ProofnRepository()
        let router = LoginRouter()
       
        let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginView") as! LoginVew
        
        interactor.repository = repository
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
         viewController.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)
        router.viewController = navigation
        return navigation
    }
    func presentMessageList() {
        let messageRouter = MessageRouter.assembleComponent()
        viewController.show(messageRouter, sender: self)
    }
    
}

