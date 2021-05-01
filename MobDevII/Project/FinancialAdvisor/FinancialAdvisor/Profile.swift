//
//  Profile.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-16.
//

import UIKit

class Profile: UIViewController {
    let Label = UILabel()
    let fname = UILabel()
    let lname = UILabel()
    let phone = UILabel()
    let email = UILabel()
    let password = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        

        fname.text = "First Name: "+usermanager.getfname()
        view.addSubview(fname)
        fname.textColor = .white
        fname.frame = CGRect(x: 100, y: 100,width:300, height: 52)


        
        
        lname.text = "Last Name: "+usermanager.getlname()
        view.addSubview(lname)
        lname.textColor = .white
        lname.frame = CGRect(x: 100, y: 150,width:300, height: 52)

        
        
        phone.text = "Phone: "+usermanager.getphone()
        view.addSubview(phone)
        phone.textColor = .white
        phone.frame = CGRect(x: 100, y: 200,width:300, height: 52)

        
        
        
        email.text = "Email: "+usermanager.getemail()
        view.addSubview(email)
        email.textColor = .white
        email.frame = CGRect(x: 100, y: 250,width:300, height: 52)

        
        
        password.text = "Password: "+usermanager.getpass()
        view.addSubview(password)
        password.textColor = .white
        password.frame = CGRect(x: 100, y: 300,width:300, height: 52)

    }


}
