//
//  LoginRepositoryProtocol.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

protocol LoginRepositoryProtocol {
    func login(identifier: String, password: String) throws -> LoginResponse
}
