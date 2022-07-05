//
//  GoldmanIndexVC.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 02.07.2022.
//

import UIKit

class GoldmanIndexVC: UIViewController {
    
    
    @IBOutlet var button_1: UIButton!
    @IBOutlet var button_2: UIButton!
    @IBOutlet var button_3: UIButton!
    @IBOutlet var button_4: UIButton!
    @IBOutlet var button_5: UIButton!
    @IBOutlet var button_6: UIButton!
    @IBOutlet var button_7: UIButton!
    @IBOutlet var button_8: UIButton!
    @IBOutlet var button_9: UIButton!
    
    
    var flag = true
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func testButton(_ sender: Any) {
        
        switch (sender as AnyObject).tag {
        case 1:
            colorButton(button: button_1)
            result += 5
        case 2:
            colorButton(button: button_2)
            result += 10
        case 3:
            colorButton(button: button_3)
            result += 11
        case 4:
            colorButton(button: button_4)
            result += 3
        case 5:
            colorButton(button: button_5)
            result += 7
        case 6:
            colorButton(button: button_6)
            result += 7
        case 7:
            colorButton(button: button_7)
            result += 3
        case 8:
            colorButton(button: button_8)
            result += 4
        case 9:
            colorButton(button: button_9)
            result += 3
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "GoldmanVCToPop"){
            let displayVC = segue.destination as! GoldmanIndexPopUpVC
            displayVC.result = result
        }
    }
    
    
    @IBAction func countResult(_ sender: Any) {
        self.performSegue(withIdentifier: "GoldmanVCToPop", sender: self)
        
        print(result)
        
        
    }
    func colorButton(button: UIButton){
        button.backgroundColor = UIColor(named: "MyGreen")
        button.layer.cornerRadius = 12
    }
}
