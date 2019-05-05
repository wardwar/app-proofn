//
//  UIImageView.swift
//  Proofn
//
//  Created by Wildan Angga Rahman on 5/5/19.
//  Copyright © 2019 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Cannot create Url")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(UserDefaults().getToken())", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                if(data == nil){
                    self.image = UIImage(named: "placeholder")
                }else{
                    self.image = UIImage(data: data!)
                }
                
            }
            
            }.resume()
    }
}
