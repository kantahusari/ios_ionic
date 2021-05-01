//
//  Login.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-10.
//

import Foundation
import UIKit

class Login: UIViewController {


    
    @IBOutlet weak var btnemail: UITextField!
    
    @IBOutlet weak var btnpassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Logout",
                            style:.plain,
                            target: self,
                            action: #selector(dismissSelf))
        
    }
    @objc private func dismissSelf(){
        usermanager.doLogout()
        dismiss(animated: true, completion: nil)
    }



}
