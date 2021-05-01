//
//  User.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-11.
//

import Foundation
class User{
    private var name: String

    init(name:String){
        self.name = name
    }
    
    public func getName()->String{
        return self.name
    }
    
    public func setName(name:String)->Bool{
        self.name = name
        return true
    }
}
