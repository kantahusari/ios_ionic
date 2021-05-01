//
//  Register.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-10.
//

import UIKit

class Register: UIViewController {
    let buttonregister = UIButton()
    

    @IBOutlet weak var Fname: UITextField!
    @IBOutlet weak var Lname: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var RePassword: UITextField!
    
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        Fname.placeholder = "First Name"
        Lname.placeholder = "Last Name"
        Phone.placeholder = "Phone"
        Email.placeholder = "Email"
        Password.placeholder = "Password"
        RePassword.placeholder = "Re-Password"
        
        //login button init
        buttonregister.setTitle("Register",for:.normal)
                view.addSubview(buttonregister)
        buttonregister.backgroundColor = .systemTeal
        buttonregister.setTitleColor(.white, for:.normal)
        buttonregister.frame = CGRect(x: 120, y: 450,width:150, height: 52)
        buttonregister.addTarget(self,action: #selector(doRegister),for: .touchUpInside)
        
    }
    //-----------------------------
    //update register status
    @objc private func getRegisterStatus(){
        if(usermanager.getRegisterStatus() == true){
            error.text = "Registration Success"
            Fname.text = ""
            Lname.text = ""
            Phone.text = ""
            Email.text = ""
            Password.text = ""
            RePassword.text = ""
            
        }else{
            error.text = "User Already exist"
        }
    }
    
    //------------------------------
    @objc private func doRegister(){
        //do register here
        if(Fname.text == "" || Lname.text == "" || Phone.text == "" || Email.text == "" || Password.text == "" || RePassword.text == ""){
            error.text = "Empty Fields"
        }else{
            if(Password.text != RePassword.text){
                error.text = "Passwords does not match"
            }else{
                //do the registration here
                let authlevelvalue = "user"
                let first_namefield = Fname.text
                let last_namefield = Lname.text
                let phonefield = Phone.text
                let emailfield = Email.text
                let  passwordfield = Password.text
                
                let registerObject = RegisterObject(authlevel: authlevelvalue,first_name: first_namefield!, last_name: last_namefield!, phone: phonefield!, email: emailfield!, password: passwordfield!)
                
                //post
                let postRequest=APIRequest(endpoint: "/user/iosregister")
                postRequest.register(registerObject,completion: {
                    result in
                    switch result{
                    case.success(let registerObject):print("success\(registerObject.first_name)")
                        usermanager.registerSuccess()
                    case.failure(let error):print("error is:\(error)")
                        usermanager.registerFail()
                    }
                    OperationQueue.main.addOperation{
                        self.getRegisterStatus()
                    }
                })
            }
            
        }
        
        
    }
    //------------------------------
}
