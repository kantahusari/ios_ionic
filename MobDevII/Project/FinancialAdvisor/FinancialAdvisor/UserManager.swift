//
//  UserManager.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-11.
//

import Foundation
class UserManager{
    private var user:String
    public var name = ""
    
    public var fname:String
    public var lname:String
    public var phone:String
    public var email:String
    public var password:String
    public var authlevel:String
    
    private var loginStatus:Bool
    private var registerStatus:Bool
    private var updatevalues:Bool

    //indicators
           public var indicator:String
             public var emailind:String
             public var year:Int
             public var Cash:Int
             public var Accounts_Receivable:Int
             public var Prepaid_expenses:Int
             public var Inventory:Int
             public var Property_Equipment:Int
             public var Goodwill:Int
             public var Accounts_Payable:Int
             public var Accrued_expenses:Int
             public var Unearned_revenue:Int
             public var Long_term_debt:Int
             public var Other_long_term_liabilities:Int
             public var Equity_Capital:Int
             public var Retained_Earnings:Int

    
    init(){
        //basic info
        self.user = ""
        self.loginStatus = false
        self.registerStatus = false
        self.updatevalues = false
        
        self.fname = ""
        self.lname = ""
        self.phone = ""
        self.email = ""
        self.password = ""
        self.authlevel = ""
        
        //indicators
             self.indicator = ""
             self.emailind = ""
             self.year = 0
             self.Cash = 0
             self.Accounts_Receivable = 0
             self.Prepaid_expenses = 0
             self.Inventory = 0
             self.Property_Equipment = 0
             self.Goodwill = 0
             self.Accounts_Payable = 0
             self.Accrued_expenses = 0
             self.Unearned_revenue = 0
             self.Long_term_debt = 0
             self.Other_long_term_liabilities = 0
             self.Equity_Capital = 0
             self.Retained_Earnings = 0
    }

    
    public func setUser(authlevel: String,first_name: String,last_name: String,phone: String,email: String,password: String)->Bool{
        self.fname = first_name
        self.name = self.fname
        self.lname = last_name
        self.phone = phone
        self.email = email
        self.password = password
        self.authlevel = authlevel
        return true
    }
    public func getfname()->String{
        return "\(self.fname)"
    }
    
    public func getlname()->String{
        return "\(self.lname)"
    }

    public func getphone()->String{
        return "\(self.phone)"
    }
    public func getemail()->String{
        return "\(self.email)"
    }
    public func getpass()->String{
        return "\(self.password)"
    }
//set indicators

    public func setIndicators(indicator:String ,emailind:String ,year:Int ,Cash:Int ,Accounts_Receivable:Int ,Prepaid_expenses:Int ,Inventory:Int ,Property_Equipment:Int ,Goodwill:Int ,Accounts_Payable:Int ,Accrued_expenses:Int ,Unearned_revenue:Int ,Long_term_debt:Int ,Other_long_term_liabilities:Int ,Equity_Capital:Int ,Retained_Earnings:Int)->Bool{
       self.indicator = indicator
             self.emailind = emailind
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
             return true
    }
    

    //get indicators

public func getindicator()->String{
    return "\(self.indicator)"
}


public func getyear()->String{
    return "\(self.year)"
}


public func getCash()->String{
    return "\(self.Cash)"
}

public func getAccounts_Receivable()->String{
    return "\(self.Accounts_Receivable)"
}

public func getInventory()->String{
    return "\(self.Inventory)"
}

public func getAccounts_Payable()->String{
    return "\(self.Accounts_Payable)"
}


    
    //Manage Login
    public func doLogin()->Bool{
        self.loginStatus = true
        return self.loginStatus
    }


public func deleteInfo()->Bool{
    self.fname = ""
    self.lname = ""
    self.phone = ""
    self.email = ""
    self.password = ""
    self.authlevel = ""
    
    self.indicator  = ""
    self.email  = ""
    self.year  = 0
    self.Cash  = 0
    self.Accounts_Receivable  = 0
    self.Prepaid_expenses  = 0
    self.Inventory  = 0
    self.Property_Equipment  = 0
    self.Goodwill  = 0
    self.Accounts_Payable  = 0
    self.Accrued_expenses  = 0
    self.Unearned_revenue  = 0
    self.Long_term_debt  = 0
    self.Other_long_term_liabilities  = 0
    self.Equity_Capital  = 0
    self.Retained_Earnings  = 0
            return true
        }
    
    public func setupdatevalues()->Bool{
        self.updatevalues = true
        return true
    }
    
    public func resetupdatevalues()->Bool{
        self.updatevalues = false
        self.indicator  = ""
        self.email  = ""
        self.year  = 0
        self.Cash  = 0
        self.Accounts_Receivable  = 0
        self.Prepaid_expenses  = 0
        self.Inventory  = 0
        self.Property_Equipment  = 0
        self.Goodwill  = 0
        self.Accounts_Payable  = 0
        self.Accrued_expenses  = 0
        self.Unearned_revenue  = 0
        self.Long_term_debt  = 0
        self.Other_long_term_liabilities  = 0
        self.Equity_Capital  = 0
        self.Retained_Earnings  = 0
        return true
    }
    
    public func getupdatevalues()->Bool{
        return self.updatevalues
    }
    

public func doLogout()->Bool{
        self.loginStatus = false
        self.deleteInfo()
//        self.deleteUser()
        return self.loginStatus
    }
    
    public func getLoginStatus()->Bool{
        return self.loginStatus
    }
    
    //Manage register
    public func registerSuccess()->Bool{
        self.registerStatus = true
        return self.registerStatus
    }
    public func registerFail()->Bool{
        self.registerStatus = false
        return self.registerStatus
    }
    
    public func getRegisterStatus()->Bool{
        return self.registerStatus
    }

    
}

var usermanager = UserManager()
