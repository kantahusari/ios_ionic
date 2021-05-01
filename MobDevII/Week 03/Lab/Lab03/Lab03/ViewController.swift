//
//  ViewController.swift
//  Lab03
//
//  Created by Laptop on 2021-01-28.
//

import UIKit

class ViewController: UIViewController {

    var cnt:Int = 0
    
    @IBOutlet weak var outTxt: UILabel!
    
    @IBAction func onClick(_ sender: UIButton) {
        cnt += 1
        if(cnt==0){
            outTxt.text = "Feels Cool"
        }else{
            outTxt.text = "Feels Cool \(cnt)"
        }
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        cnt -= cnt
        outTxt.text = "Feels Cool"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outTxt.text = "Hi this is my first App !!!"
    }


}

