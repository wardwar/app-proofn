//
//  ProofnEndPoint.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

enum ProofnApi {
    case login(identifier:String,password:String)
    case messages(token:String)
    case detail(id:String,token:String)
    case compose(token:String,compose:ComposeRequest)
}

extension ProofnApi: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://beta.proofn.com/v1") else { fatalError("baseURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .login(_,_):
            return "/auth/login"
        case .messages(_):
            return "/messages/inbox"
        case .detail(let id,_):
            return "/messages/inbox/\(id)"
        case .compose(_,_):
            return "/messages/send"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login(_,_):
            return .post
        case .messages(_):
            return .get
        case .detail(_,_):
            return .get
        case .compose(_,_):
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(let identifier,let password):
            return .requestParameters(bodyParameters: ["identifier":identifier,"password":password],
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: nil)
        case .detail(_,let token):
            return .requestParametersAndHeaders(bodyParameters: nil,
                                                bodyEncoding: .urlEncoding,
                                                urlParameters: nil,
                                                additionHeaders: ["Authorization":"Bearer \(token)"])
        case .messages(let token):
            return .requestParametersAndHeaders(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: nil,
                                      additionHeaders: ["Authorization":"Bearer \(token)"])
            
        case .compose(let token, let compose):
            return .requestParametersAndHeaders(bodyParameters: ["content":compose.content,"subject": compose.subject,"to":compose.to],
                                                bodyEncoding: .urlEncoding,
                                                urlParameters: nil,
                                                additionHeaders: ["Authorization":"Bearer \(token)"])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
