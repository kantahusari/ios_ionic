//
//  BalancesheetObject.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-18.
//

import Foundation
final class BalancesheetObjects:Codable {
          var indicator:String
          var email:String
          var year:Int
          var Cash:Int
          var Accounts_Receivable:Int
          var Prepaid_expenses:Int
          var Inventory:Int
          var Property_Equipment:Int
          var Goodwill:Int
          var Accounts_Payable:Int
          var Accrued_expenses:Int
          var Unearned_revenue:Int
          var Long_term_debt:Int
          var Other_long_term_liabilities:Int
          var Equity_Capital:Int
          var Retained_Earnings:Int

    init(       indicator:String ,
                email:String ,
                year:Int ,
                Cash:Int ,
                Accounts_Receivable:Int ,
                Prepaid_expenses:Int ,
                Inventory:Int ,
                Property_Equipment:Int ,
                Goodwill:Int ,
                Accounts_Payable:Int ,
                Accrued_expenses:Int ,
                Unearned_revenue:Int ,
                Long_term_debt:Int ,
                Other_long_term_liabilities:Int ,
                Equity_Capital:Int ,
                Retained_Earnings:Int){
        self.indicator = indicator
              self.email = email
              self.year = year
              self.Cash = Cash
              self.Accounts_Receivable = Accounts_Receivable
              self.Prepaid_expenses = Prepaid_expenses
              self.Inventory = Inventory
              self.Property_Equipment = Property_Equipment
              self.Goodwill = Goodwill
              self.Accounts_Payable = Accounts_Payable
              self.Accrued_expenses = Accrued_expenses
              self.Unearned_revenue = Unearned_revenue
              self.Long_term_debt = Long_term_debt
              self.Other_long_term_liabilities = Other_long_term_liabilities
              self.Equity_Capital = Equity_Capital
              self.Retained_Earnings = Retained_Earnings
    }
}
