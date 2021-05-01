//
//  ViewController.swift
//  Lab_Test_01
//
//  Created by Laptop on 2021-02-09.
//

import UIKit

class ViewController: UIViewController {

    var numbers: [Int] = []
    
    func randomInt(max:Int)->Int{
        let rand:Int = Int(arc4random())
        return (rand % max)+1
    }
    func randomNum()->Int{
        let max:Int = 65
        let random = randomInt(max:max)
        return random
    }
    
    //this is generate
    func generate(){
        let max:Int = 65
        for _ in 1...7{
            let rand:Int = Int(arc4random())
            numbers.append((rand % max)+1 )
        }

    }
    
    //empty
    func empty(){
        numbers.removeAll()
        
    }
    
    
    
    
    @IBOutlet weak var N1: UILabel!
    
    @IBOutlet weak var N2: UILabel!
    
    @IBOutlet weak var N3: UILabel!
    
    @IBOutlet weak var N4: UILabel!
    
    @IBOutlet weak var N5: UILabel!
    
    @IBOutlet weak var N6: UILabel!
    
    @IBAction func Clear(_ sender: Any) {
        empty()
        N1.text = "-"
        N2.text = "-"
        N3.text = "-"
        N4.text = "-"
        N5.text = "-"
        N6.text = "-"
    }
    
    
    @IBAction func Draw(_ sender: Any) {
        empty()
        generate()
        N1.text = String(numbers[0])
        N2.text = String(numbers[1])
        N3.text = String(numbers[2])
        N4.text = String(numbers[3])
        N5.text = String(numbers[4])
        N6.text = String(numbers[5])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

