//
//  LoginView.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class LoginVew: UIViewController {
    var presenter: LoginPresenterProtocol!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Login(_ sender: Any) {
        presenter.login(identifier: username.text!, password: password.text!)
    }
}

extension LoginVew: LoginViewProtocol {
    func populateLoginReponse(response:LoginResponse) {
        UserDefaults().setLoggedIn(to: true)
        UserDefaults().setToken(to: response.token)
        UserDefaults().setUserData(user: response.user)
        presenter.presentMessages()
    }
}

