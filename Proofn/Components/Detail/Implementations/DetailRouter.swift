//
//  DetailRouter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    var viewController: UIViewController!
    
    static func assembleComponent(id:String) -> UIViewController {
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        let repository = ProofnRepository()
        let router = DetailRouter()
        
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailView
        
        interactor.repository = repository
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.showDetailMessage(id: id)
        
        viewController.presenter = presenter

        let navigation = UINavigationController(rootViewController: viewController)
        router.viewController = navigation
        return navigation
    }
    
    func composeMessage(composeRequest: ComposeRequest) {
        
    }
}
