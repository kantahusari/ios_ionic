//
//  Update.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-16.
//

import UIKit

class Update: UIViewController {
    let Label = UILabel()
    let yearinput = UITextField()
    let submit = UIButton()
    
    
    let indicator = UILabel()
    let year = UILabel()
    let Cash = UILabel()
    let Accounts_Receivable = UILabel()
    let Inventory = UILabel()
    let Accounts_Payable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        //Title
        Label.text = "Select a Year to show data "
        view.addSubview(Label)
        Label.textColor = .white
        Label.frame = CGRect(x: 60, y: 100,width:300, height: 50)
        Label.backgroundColor = .systemBlue
        
        //input
        view.addSubview(yearinput)
        yearinput.textColor = .black
        yearinput.frame = CGRect(x: 60, y: 155,width:200, height: 40)
        yearinput.backgroundColor = .white
        
        
        //button
        submit.setTitle("Submit",for:.normal)
        view.addSubview(submit)
        submit.backgroundColor = .systemTeal
        submit.setTitleColor(.black, for:.normal)
        submit.frame = CGRect(x: 60, y: 210,width:100, height: 50)
        submit.addTarget(self,action: #selector(submitReq),for: .touchUpInside)
        
        
        //Labels
        //year
        view.addSubview(year)
        year.textColor = .white
        year.frame = CGRect(x: 60, y: 265,width:300, height: 50)
        year.backgroundColor = .systemBlue

        //indicator
        view.addSubview(indicator)
        indicator.textColor = .white
        indicator.frame = CGRect(x: 60, y: 320,width:300, height: 50)
        indicator.backgroundColor = .systemBlue

        //Cash
        view.addSubview(Cash)
        Cash.textColor = .white
        Cash.frame = CGRect(x: 60, y: 375,width:300, height: 50)
        Cash.backgroundColor = .systemBlue

        //Accounts_Receivable
        view.addSubview(Accounts_Receivable)
        Accounts_Receivable.textColor = .white
        Accounts_Receivable.frame = CGRect(x: 60, y: 430,width:300, height: 50)
        Accounts_Receivable.backgroundColor = .systemBlue

        //Inventory
        view.addSubview(Inventory)
        Inventory.textColor = .white
        Inventory.frame = CGRect(x: 60, y: 485,width:300, height: 50)
        Inventory.backgroundColor = .systemBlue

        //Accounts_Payable
        view.addSubview(Accounts_Payable)
        Accounts_Payable.textColor = .white
        Accounts_Payable.frame = CGRect(x: 60, y: 540,width:300, height: 50)
        Accounts_Payable.backgroundColor = .systemBlue
        
    }
    
    @objc private func submitReq(){
        let indicatorfield = ""
        let emailfield = usermanager.getemail()
        let yearfield = Int(yearinput.text!)
        let Cashfield = 0
        let Accounts_Receivablefield = 0
        let Prepaid_expensesfield = 0
        let Inventoryfield = 0
        let Property_Equipmentfield = 0
        let Goodwillfield = 0
        let Accounts_Payablefield = 0
        let Accrued_expensesfield = 0
        let Unearned_revenuefield = 0
        let Long_term_debtfield = 0
        let Other_long_term_liabilitiesfield = 0
        let Equity_Capitalfield = 0
        let Retained_Earningsfield = 0
        if(yearinput.text == ""){
            Label.text = "Empty Entry"
        }else{
        //API
        let balancesheetObject = BalancesheetObjects(indicator:indicatorfield ,email:emailfield ,year:yearfield! ,Cash:Cashfield ,Accounts_Receivable:Accounts_Receivablefield ,Prepaid_expenses:Prepaid_expensesfield ,Inventory:Inventoryfield ,Property_Equipment:Property_Equipmentfield ,Goodwill:Goodwillfield ,Accounts_Payable:Accounts_Payablefield ,Accrued_expenses:Accrued_expensesfield ,Unearned_revenue:Unearned_revenuefield ,Long_term_debt:Long_term_debtfield ,Other_long_term_liabilities:Other_long_term_liabilitiesfield ,Equity_Capital:Equity_Capitalfield ,Retained_Earnings:Retained_Earningsfield)
        //post
        let postRequest=APIRequest(endpoint: "/user/iosbalancesheet")

        //send the requesrt and wait for response
        postRequest.balancesheetrequest(balancesheetObject,completion:{
            result in
            print(result)
            switch result{
            case.success(let balancesheetObject):print("the request has been sent \(balancesheetObject.year)")
                self.setupvalues(indicator:balancesheetObject.indicator ,
                                   emailind:balancesheetObject.email ,
                                   year:balancesheetObject.year ,
                                   Cash:balancesheetObject.Cash ,
                                   Accounts_Receivable:balancesheetObject.Accounts_Receivable ,
                                   Prepaid_expenses:balancesheetObject.Prepaid_expenses ,
                                   Inventory:balancesheetObject.Inventory ,
                                   Property_Equipment:balancesheetObject.Property_Equipment ,
                                   Goodwill:balancesheetObject.Goodwill ,
                                   Accounts_Payable:balancesheetObject.Accounts_Payable ,
                                   Accrued_expenses:balancesheetObject.Accrued_expenses ,
                                   Unearned_revenue:balancesheetObject.Unearned_revenue ,
                                   Long_term_debt:balancesheetObject.Long_term_debt ,
                                   Other_long_term_liabilities:balancesheetObject.Other_long_term_liabilities ,
                                   Equity_Capital:balancesheetObject.Equity_Capital ,
                                   Retained_Earnings:balancesheetObject.Retained_Earnings)
                OperationQueue.main.addOperation{
                    self.seltlabels()
                }
            case.failure(let error):print("error is:\(error)")
                        OperationQueue.main.addOperation{
                self.deletelabelcontent()
            }
            }
        })
        yearinput.text = ""
         Label.text = "Select a Year to show data"
        }
    }
    //---------------------------
    @objc private func setupvalues(indicator:String,
                                     emailind:String,
                                     year:Int,
                                     Cash:Int,
                                     Accounts_Receivable:Int,
                                     Prepaid_expenses:Int,
                                     Inventory:Int,
                                     Property_Equipment:Int,
                                     Goodwill:Int,
                                     Accounts_Payable:Int,
                                     Accrued_expenses:Int,
                                     Unearned_revenue:Int,
                                     Long_term_debt:Int,
                                     Other_long_term_liabilities:Int,
                                     Equity_Capital:Int,
                                     Retained_Earnings:Int)->Bool{
        if(usermanager.setIndicators(indicator: indicator, emailind: emailind, year: year, Cash: Cash, Accounts_Receivable: Accounts_Receivable, Prepaid_expenses: Prepaid_expenses, Inventory: Inventory, Property_Equipment: Property_Equipment, Goodwill: Goodwill, Accounts_Payable: Accounts_Payable, Accrued_expenses: Accrued_expenses, Unearned_revenue: Unearned_revenue, Long_term_debt: Long_term_debt, Other_long_term_liabilities: Other_long_term_liabilities, Equity_Capital: Equity_Capital, Retained_Earnings: Retained_Earnings)){
            usermanager.setupdatevalues()
            return true
        }else{
            usermanager.resetupdatevalues()
            return false
        }
    }
    @objc private func seltlabels(){
        self.indicator.text = "Indicator: \(usermanager.indicator)"
        self.year.text = "Year: \(usermanager.year)"
        self.Cash.text = "Cash: \(usermanager.Cash)"
        self.Accounts_Receivable.text = "Accounts Receivable: \(usermanager.Accounts_Receivable)"
        self.Inventory.text = "Inventory: \(usermanager.Inventory)"
        self.Accounts_Payable.text = "Accounts Payable: \(usermanager.Accounts_Payable)"
        
    }
    @objc private func deletelabelcontent(){
            self.Label.text = "No Data To Show"
            self.indicator.text = ""
            self.year.text = ""
            self.Cash.text = ""
            self.Accounts_Receivable.text = ""
            self.Inventory.text = ""
            self.Accounts_Payable.text = ""

        
    }
//--------------------------
}
