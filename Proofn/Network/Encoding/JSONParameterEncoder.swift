//
//  JSONParameterEncoder.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

class JSONParameterEncoder: ParameterEncoderProtocol {
    static func encode(urlRequest: URLRequest, with parameters: Parameters) throws -> URLRequest {
        do {
            var urlRequest = urlRequest
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            return urlRequest
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
