//
//  Request.swift
//  FinancialAdvisor
//
//  Created by Laptop on 2021-04-16.
//

import UIKit

class Request: UIViewController {
    let Label = UILabel()
    let reportype = UITextField()
    let topic = UITextField()
    let urgency = UITextField()
    let reqdescription = UITextField()
    
    let submit = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBlue
//        Label.text = "Hello From Request"
        view.addSubview(Label)
        Label.textColor = .white
        Label.frame = CGRect(x: 100, y: 450,width:300, height: 52)
        Label.backgroundColor = .systemBlue
        
        
        
        view.addSubview(reportype)
        reportype.textColor = .black
        reportype.placeholder = "Report Type"
        reportype.frame = CGRect(x: 100, y: 100,width:200, height: 50)
        reportype.backgroundColor = .white
        
        
        view.addSubview(topic)
        topic.textColor = .black
        topic.placeholder = "Topic"
        topic.frame = CGRect(x: 100, y: 160,width:200, height: 50)
        topic.backgroundColor = .white
        
        
        
        view.addSubview(urgency)
        urgency.textColor = .black
        urgency.placeholder = "Urgent / Not Urgent"
        urgency.frame = CGRect(x: 100, y: 220,width:200, height: 50)
        urgency.backgroundColor = .white
        
        
        view.addSubview(reqdescription)
        reqdescription.textColor = .black
        reqdescription.placeholder = "Description"
        reqdescription.frame = CGRect(x: 100, y: 280,width:200, height: 80)
        reqdescription.backgroundColor = .white
        
        
        
        //button
        submit.setTitle("Submit",for:.normal)
        view.addSubview(submit)
        submit.backgroundColor = .white
        submit.setTitleColor(.black, for:.normal)
        submit.frame = CGRect(x: 110, y: 400,width:100, height: 45)
        submit.addTarget(self,action: #selector(submitReq),for: .touchUpInside)

    }
    @objc private func submitReq(){
        let reportypefield = reportype.text
        let topicfield = topic.text
        let urgencyfield = urgency.text
        let reqdescriptionfield = reqdescription.text
        let emailfield = usermanager.getemail()
        let user_namefield = usermanager.getfname()+" "+usermanager.getlname()
        
        
        if(reportype.text == "" || topic.text  == "" || urgency.text == "" || reqdescription.text == ""){
            Label.text = "Empty Fields"
        }else{
            if(urgency.text == "Urgent" || urgency.text == "Not Urgent"){
                //submit the request
                let requestObject = RequestObject(reporttype: reportypefield!, topic: topicfield!, urgency: urgencyfield!, description: reqdescriptionfield!, email: emailfield, user_name: user_namefield)
                //post
                let postRequest=APIRequest(endpoint: "/user/iosuserrequest")

                //send the requesrt and wait for response
                postRequest.userrequest(requestObject,completion:{
                    result in
                    switch result{
                    case.success(let requestObject):print("the request has been sent \(requestObject.email)")
                    case.failure(let error):print("error is:\(error)")
                    }
                })
                reportype.text = ""
                topic.text  = ""
                urgency.text = ""
                reqdescription.text = ""
                Label.text = ""
            }else{
                Label.text = "Please specify Urgent/Not Urgent"
            }
        }
//        Label.text = user_namefield
        
        print("submitted")
        urgency.text = ""
    }
    

}
