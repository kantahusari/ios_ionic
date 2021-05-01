//
//  RequestObject.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-18.
//

import Foundation
final class RequestObject:Codable {
    var reporttype:String
    var topic: String
    var urgency: String
    var description: String
    var email: String
    var user_name: String

    init(reporttype: String,topic: String,urgency: String,description: String,email: String,user_name: String){
        self.reporttype = reporttype
        self.topic = topic
        self.urgency = urgency
        self.description = description
        self.email = email
        self.user_name = user_name
    }
}
