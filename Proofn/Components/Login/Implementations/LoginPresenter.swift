//
//  LoginPresenter.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class LoginPresenter : LoginPresenterProtocol {
    var interactor: LoginRequesterProtocol!
    var view:  LoginViewProtocol!
    var router: LoginRouterProtocol!
    
    func login(identifier: String, password: String) {
        
        let dispatchQueue = DispatchQueue(label: "post login", qos: .background)
        dispatchQueue.async {
            let response = self.interactor.post(identifier: identifier, password: password)
            DispatchQueue.main.async {
               guard let unwrapResponse = response else {return}
                self.view.populateLoginReponse(response: unwrapResponse)
        
            }
        }
        
    }
    
    func presentMessages() {
        router.presentMessageList()
    }
    
}
