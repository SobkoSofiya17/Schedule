//
//  UserModel.swift
//  Schedule
//
//  Created by Sobko S on 20.04.2022.
//

import Foundation
import SwiftUI

struct UserModel:Hashable, Codable {
    var userID:String
    var firstName:String
    var lastName:String
    var email:String
    var password:String
}

struct Users:Hashable, Codable {
    var username:String
    var password:String
}
class CheckUser:ObservableObject{
    @Published var model = [Users]()
    
}
