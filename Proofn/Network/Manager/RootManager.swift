//
//  RouteManager.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation


enum NetworkResponse : String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Results<String> {
    case success
    case failure(String)
}

class RootManager {
    static let MovieAPIKey = "82eb971347b9a2ca2847f59a68b27d6c"
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Results<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...500:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
