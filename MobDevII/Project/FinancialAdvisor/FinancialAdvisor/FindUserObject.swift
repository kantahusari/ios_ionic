//
//  FindUser.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-17.
//

import Foundation
final class FindUserObject:Codable {
    var authlevel:String
    var first_name: String
    var last_name: String
    var phone: String
    var email: String
    var password: String

    init(authlevel: String,first_name: String,last_name: String,phone: String,email: String,password: String){
        self.authlevel = authlevel
        self.first_name = first_name
        self.last_name = last_name
        self.phone = phone
        self.email = email
        self.password = password
    }
}
