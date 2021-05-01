//
//  Profile.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-11.
//
import Foundation
import UIKit

class DashBoard: UIViewController {
    


    let username = usermanager.name
    
    let buttonProfile = UIButton()
    let buttonRequest = UIButton()
    let buttonUpdate = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        showLabel(name:username)
        
        view.backgroundColor = .systemTeal
        //buttons:
        
        //Request
        buttonRequest.setTitle("Request",for:.normal)
        view.addSubview(buttonRequest)
        buttonRequest.backgroundColor = .white
        buttonRequest.setTitleColor(.black, for:.normal)
        buttonRequest.frame = CGRect(x: 110, y: 90,width:100, height: 45)
        buttonRequest.addTarget(self,action: #selector(toRequest),for: .touchUpInside)
        
        
        //profile
        buttonProfile.setTitle("Profile",for:.normal)
        view.addSubview(buttonProfile)
        buttonProfile.backgroundColor = .white
        buttonProfile.setTitleColor(.black, for:.normal)
        buttonProfile.frame = CGRect(x: 0, y: 90,width:100, height: 45)
        buttonProfile.addTarget(self,action: #selector(toProfile),for: .touchUpInside)
        
        
        //Update
        buttonUpdate.setTitle("Dashboard",for:.normal)
        view.addSubview(buttonUpdate)
        buttonUpdate.backgroundColor = .white
        buttonUpdate.setTitleColor(.black, for:.normal)
        buttonUpdate.frame = CGRect(x: 220, y: 90,width:100, height: 45)
        buttonUpdate.addTarget(self,action: #selector(toUpdate),for: .touchUpInside)
        

        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Logout",
                            style:.plain,
                            target: self,
                            action: #selector(dismissSelf))
    }

    
    @objc private func toProfile(){
        let vc = Profile()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func toRequest(){
        let req = Request()
        navigationController?.pushViewController(req, animated: true)
    }
    
    @objc private func toUpdate(){
        let vc = Update()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showLabel(name:String){
        let label = UILabel()
        //label
        label.text = "Welcome "+name
        view.addSubview(label)
        label.textColor = .white
        label.frame = CGRect(x: 100, y: 350,width:300, height: 100)
        label.backgroundColor = .systemTeal
        
    }
    
    
    
    
    
    
    
    @objc private func dismissSelf(){
        usermanager.doLogout()
        dismiss(animated: true, completion: nil)
    }
    

}
