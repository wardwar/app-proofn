//
//  LoginInteractor.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class LoginInteractor: LoginRequesterProtocol {
    var repository : LoginRepositoryProtocol!

    func post(identifier: String, password: String) -> LoginResponse? {
        var response: LoginResponse? = nil
        if let loginResponse = try? repository.login(identifier: identifier, password: password) {
            response = loginResponse
        }
        return response
    }
    
    
}
