//
//  MessageRouter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import UIKit

class MessageRouter: MessageRouterProtocol {
    var viewController: UIViewController!
    
    static func assembleComponent() -> UIViewController {
        let presenter = MessagePresenter()
        let interactor = MessageInteractor()
        let repository = ProofnRepository()
        let router = MessageRouter()
        
        let storyboard = UIStoryboard(name: "MessagesView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MessagesView") as! MessagesView
        
        interactor.repository = repository
//        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.showMessageList()
        
        viewController.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)
        router.viewController = navigation
        return navigation
    }
    
    func presentDetail(message:Message) {
        let detailRouter = DetailRouter.assembleComponent(id: message.id)
        viewController.show(detailRouter, sender: self)
    }
    
}
