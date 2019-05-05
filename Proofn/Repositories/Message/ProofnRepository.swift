//
//  UserRepository.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import UIKit

class ProofnRepository {
    let proofnNetwork = ProofnNetworkManager()
    
}


extension ProofnRepository: LoginRepositoryProtocol {
    func login(identifier: String, password: String) throws -> LoginResponse {
        var result: LoginResponse? = nil
        let semaphore = DispatchSemaphore(value: 0)
        
        proofnNetwork.login(identifier: identifier, password: password){ response , error in
            if let error = error {
                print("error: \(error)")
                return
            }
            result = response!
            semaphore.signal()
        }
        
        semaphore.wait()
        return result!

    }
}

extension ProofnRepository: MessagesRepositoryProtocol {
    func getList() throws -> Array<Message> {
        var result: Array<Message> = []
        let semaphore = DispatchSemaphore(value: 0)
        let token = UserDefaults().getToken() ?? ""
        proofnNetwork.getMessageList(token:token) { messages, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            result = messages!
            semaphore.signal()
        }
        
        semaphore.wait()
        return result
    }
}

extension ProofnRepository: DetailRepositoryProtocol {
    func compose(composeRequest: ComposeRequest) throws -> DetailResponse {
        var result: DetailResponse!
        let semaphore = DispatchSemaphore(value: 0)
        let token = UserDefaults().getToken() ?? ""
        proofnNetwork.compose(token: token, composeRequest:composeRequest) { detailMessage, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            result = detailMessage!
            semaphore.signal()
        }
        semaphore.wait()
        return result
    }
    

    func detail(id: String) throws -> DetailResponse {
        var result: DetailResponse!
        let semaphore = DispatchSemaphore(value: 0)
        let token = UserDefaults().getToken() ?? ""
        proofnNetwork.getMessageDetail(token: token, id: id) { detailMessage, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            result = detailMessage!
            semaphore.signal()
        }
        semaphore.wait()
        return result
    }
    
 
}
