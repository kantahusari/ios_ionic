//
//  TEST.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-10.
//

import Foundation
import UIKit

class TEST: UIViewController {
    let buttonlogin = UIButton()
    var userText:String = ""
    var loginStatus = ""
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var error: UILabel!
    
    public func getUser() -> String{
        return self.userText
    }
    
    // Work with the view
    override func viewDidLoad() {
        super.viewDidLoad()
        email.placeholder = "Email"
        password.placeholder = "Password"
        view.backgroundColor = .systemBlue
        //login button init
                buttonlogin.setTitle("Login",for:.normal)
                view.addSubview(buttonlogin)
        buttonlogin.backgroundColor = .systemTeal
                buttonlogin.setTitleColor(.white, for:.normal)
                buttonlogin.frame = CGRect(x: 120, y: 250,width:150, height: 52)
        buttonlogin.addTarget(self,action: #selector(didTabButton),for: .touchUpInside)
    }
    //get info
    //setUser
    @objc private func getinfo(email:String){
        if(usermanager.getLoginStatus()==true){
            let authlevel = ""
            let first_namefield = ""
            let last_namefield = ""
            let phonefield = ""
            let emailfield = "\(email)"
            let  passwordfield = ""
            
            let findUserObject = FindUserObject(authlevel: authlevel,first_name: first_namefield, last_name: last_namefield, phone: phonefield, email: emailfield, password: passwordfield)
            //post
            let postRequest=APIRequest(endpoint: "/user/iosinfo")
            postRequest.finduser(findUserObject,completion: {
                result in
                switch result{
                case.success(let findUserObject):print("success \(findUserObject.authlevel)")
                    usermanager.setUser(authlevel: findUserObject.authlevel, first_name: findUserObject.first_name, last_name: findUserObject.last_name, phone: findUserObject.phone, email: findUserObject.email, password: findUserObject.password)
                    print("this the result "+usermanager.getfname())

                case.failure(let error):print("error is problem:\(error)")
                }
                
            })
            
        }

        
        
    }
    
    
    //do login
    @objc private func login(){
        if(usermanager.getLoginStatus()==true){
                            email.text = ""
                            password.text = ""
                            error.text = ""
                            let rootVC = DashBoard()
                            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
                            present(navVC, animated: true)
        }else{
            print("error")
                            email.text = ""
                            password.text = ""
                            error.text = "Wrong credit"
        }
    }

    
    //login process
    @objc private func didTabButton(){
        
        if(email.text == "" || password.text == ""){
            error.text = "Fields are empty"
        }else {
            let emailfield = email.text
            let passwordfield = password.text
            let loginObject = LoginObject(email: emailfield!, password: passwordfield!)
            //post
            let postRequest=APIRequest(endpoint: "/user/ioslogin")

            //send the requesrt and wait for response
            postRequest.save(loginObject,completion:{
                result in
                switch result{
                case.success(let loginObject):print("the request has been sent \(loginObject.email)")
                    self.loginStatus = "success"
                    self.userText = loginObject.email
                    print("login status inside switch: ",self.loginStatus)
                    usermanager.doLogin()
                    self.getinfo(email:"\(loginObject.email)")
                case.failure(let error):print("error is:\(error)")
                    self.loginStatus = "fail"
                    print("login status inside switch: ",self.loginStatus)
                    usermanager.doLogout()
                }
                //-----------
                print("Login Status after switch: \(usermanager.getLoginStatus())")
                //get user data getinfo
                
//                OperationQueue.main.addOperation{
//                    self.getinfo(email:"\(loginObject.email)")
//                }
                //finaly login
                OperationQueue.main.addOperation{
                    self.login()
                }

            })
        }
    }
}

class UserProfile : UIViewController {

    let Label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        buttonlogin.setTitle("Push Another",for:.normal)
//        view.addSubview(buttonlogin)
//        buttonlogin.backgroundColor = .blue
//        buttonlogin.setTitleColor(.black, for:.normal)
//        buttonlogin.frame = CGRect(x: 100, y: 250,width:200, height: 52)
//buttonlogin.addTarget(self,action: #selector(didTabButton),for: .touchUpInside)
        
        //label
        Label.text = "jjjjj"
        view.addSubview(Label)
        Label.textColor = .white
        Label.frame = CGRect(x: 100, y: 175,width:200, height: 52)
        Label.backgroundColor = .systemTeal
        
        view.backgroundColor = .systemTeal
        title = "User Page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Logout",
                            style:.plain,
                            target: self,
                            action: #selector(dismissSelf))
    }
    
    @objc private func didTabButton(){
        let vc = Login()
        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
}
