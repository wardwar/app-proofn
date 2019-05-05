//
//  ProofnNetworkManager.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class ProofnNetworkManager: RootManager {
     let router = Router<ProofnApi>()
    
    
    func login(identifier:String, password:String, completion: @escaping (_ loginResponse: LoginResponse?, _ error: String?) -> ()) {
        router.request(.login(identifier: identifier, password: password)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                
                    do {
                        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from:data)
                        completion(loginResponse, nil)
                    }catch(let e){
                        print(e)
                        completion(nil, e.localizedDescription)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getMessageList(token:String, completion: @escaping (_ messages: Array<Message>?, _ error: String?) -> ()) {
        router.request(.messages(token: token)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let messages = try JSONDecoder().decode(MessagesReponse.self, from:data)
                        completion(messages.data, nil)
                    }catch(let e) {
                        print(e)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getMessageDetail(token:String, id:String, completion: @escaping (_ messageDetail: DetailResponse?, _ error: String?) -> ()){
        router.request(.detail(id: id,token:token)) { data, response, error in
            if error != nil {
                completion(nil,"Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else{
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let messageDetail = try JSONDecoder().decode(DetailResponse.self, from: data)
                        completion(messageDetail,nil)
                    }catch(let e){
                        print(e)
                        completion(nil,NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil,networkFailureError)
                }
                
            }
        }
    }
    
    func compose(token:String, composeRequest:ComposeRequest, completion: @escaping (_ messageDetail: DetailResponse?, _ error: String?) -> ()){
        router.request(.compose(token:token,compose:composeRequest)){ data, response, error in
            if error != nil {
                completion(nil,"Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else{
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let messageDetail = try JSONDecoder().decode(DetailResponse.self, from: data)
                        completion(messageDetail,nil)
                    }catch(let e){
                        print(e)
                        completion(nil,NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil,networkFailureError)
                }
                
            }
        }
    }
    
}
