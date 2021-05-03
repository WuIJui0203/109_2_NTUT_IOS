//
//  ViewController.swift
//  middern
//
//  Created by WUIJUI on 2021/5/1.
//

import UIKit

class ViewController:UIViewController {
    var C = calculate()
    var ans:String = "0"
    {
        didSet{
            answer.text = "\(ans)"
        }
    }
    var cal:String = ""
    {
        didSet{
            calculation.text = " \(cal)"
        }
    }
    @IBOutlet weak var calculation: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var number: [UIButton]!
    
    @IBAction func addnumber(_ sender: UIButton)
    {
        if let index = number.index(of:sender)
        {
            cal = C.touchnumber(at :index)
        }
    }
    @IBOutlet var OPS: [UIButton]!
    
    @IBAction func operating(_ sender: UIButton)
    {
        if let index = OPS.index(of:sender)
        {
            cal = C.touchoperation(at :index)
        }
        
    }
    @IBAction func AC(_ sender: UIButton) {
        (cal, ans)  = C.reset()
    }
    
    @IBAction func equal(_ sender: UIButton) {
        ans = C.touchEqual()
    }
}

