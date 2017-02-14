//
//  NetworkManager.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    class func performRequestWithPath(path: String, requestMethod: Alamofire.HTTPMethod, parameters: [String : AnyObject]?, headers: [String : String]?, success:@escaping (Any?) -> Void, failure:  @escaping (Error) -> Void) {
        
        let url = NetworkStruct.baseURL + path
        Alamofire.request(url, method: requestMethod, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(_):
                    success(response.result.value)
                case .failure(let error):
                    failure(error)
                }

                
        }
        
       
        
    }
    
}
