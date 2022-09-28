//
//  APIClient.swift
//  API
//
//  Created by Lorenzo Limoli on 28/09/22.
//

import Foundation

public class APIClient{
    
    public static let shared = APIClient()
    
    private init(){}
    
    public func execute(request: URLRequest, completion: @escaping (Data?) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            completion(nil)
        }
    }
}
