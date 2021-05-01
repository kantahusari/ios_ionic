//
//  LoginObject.swift
//  MobileAppProject
//
//  Created by Laptop on 2021-04-10.
//  Copyright © 2021 Meghan Paris. All rights reserved.
//

import Foundation
final class LoginObject:Codable {
    var email: String
    var password: String
    init(email: String,password: String){
        self.email = email
        self.password = password
    }
}
