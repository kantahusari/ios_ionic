//
//  ViewController.swift
//  LabExercise
//
//  Created by Laptop on 2021-01-28.
//

import UIKit

class ViewController: UIViewController {

    
    var cnt:Int = 0
    var step:Int = 1
    
    @IBOutlet weak var Result: UILabel!
    
    @IBAction func Minus(_ sender: UIButton) {
        cnt -= step
        Result.text = "\(cnt)"
    }
    @IBAction func Plus(_ sender: UIButton) {
        cnt += step
        Result.text = "\(cnt)"
    }
    @IBAction func Reset(_ sender: UIButton) {
        cnt -= cnt
        step = 1
        Result.text = "\(cnt)"
    }
    @IBAction func Step(_ sender: UIButton) {
        step = 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Result.text = "\(cnt)"
    }


}

