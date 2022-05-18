//
//  SignInViewModel.swift
//  Schedule
//
//  Created by Sobko S on 20.04.2022.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON


class AuthViewModel: ObservableObject {
    
    func signIn(email:String, password:String, con:((_ result: String, _ error: String) -> Void )? = nil)  {
//        set API url
        let url = ""
        let parameters = [
            "email": email,
            "password": password,
       
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                con!("success", "error")
            case .failure(let error):
                con!("error", "success")
                print(error)
            }
        }
    }
    func signUpIn(email:String, password:String, firstName:String, lastName:String, con:((_ result: String, _ error: String) -> Void )? = nil)  {
//        set API url
        let url = ""
        let parameters = [
            "email": email,
            "password": password,
            "fistName": firstName,
            "lastName": lastName
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                con!("success", "error")
            case .failure(let error):
                con!("error", "success")
                print(error)
            }
        }
    }
  
}
