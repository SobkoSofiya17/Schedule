//
//  UserViewModel.swift
//  Schedule
//
//  Created by Sobko S on 20.04.2022.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON


class UserViewModel: ObservableObject {
    @Published var userID = [UserModel]()
    @Published var firstName = [UserModel]()
    @Published var lastName = [UserModel]()
    @Published var email = [UserModel]()
    @Published var password = [UserModel]()
    
    func getUser( con:((_ result: String, _ error: String) -> Void )? = nil)  {
//        set API url
       let url = ""
        AF.request(url, method: .post).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                guard let movie = try? JSONDecoder().decode([UserModel].self, from: response.data!) else { return }

                            self.userID = movie
                            self.firstName = movie
                            self.lastName = movie
                            self.email = movie
                            self.password = movie
                
                con!("success", "error")
            case .failure(let error):
                con!("error", "success")
                print(error)
            }
        }
    }
}
