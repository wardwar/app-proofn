//
//  ParameterEncodeProtocol.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/4/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation

typealias  Parameters = [String:Any]

protocol ParameterEncoderProtocol {
    static func encode(urlRequest: URLRequest, with parameters: Parameters) throws -> URLRequest
}
