//
//  boolAuthViewModel.swift
//  Schedule
//
//  Created by Sobko S on 20.04.2022.
//



import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON


class BoolAuthViewModel: ObservableObject {
    
    func auth(email:String, con:((_ result: String, _ error: String) -> Void )? = nil)  {
//        set API url
        let url = ""
        let parameters = [
            "email": email,
        ]
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                if json.boolValue{
                    con!("Пользователь авторизован", "error")
                }else{
                    con!("Пользователь не авторизован", "error")
                }
                con!("success", "error")
            case .failure(let error):
                con!("error", "success")
                print(error)
            }
        }
    }
  
  
}
