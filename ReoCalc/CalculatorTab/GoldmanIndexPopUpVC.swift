//
//  GoldmanIndexPopUpVC.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 02.07.2022.
//

import UIKit

class GoldmanIndexPopUpVC: UIViewController {
    
    
    var result: Int?
    

    @IBOutlet var frequencyLabel: UILabel!
    @IBOutlet var classLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        representResult()
    
    }
    
    func representResult() {
        if (0...5).contains(result!) {
            ratingLabel.text = "Баллы: \(result!)"
            classLabel.text = "Класс кардиального риска: I"
            frequencyLabel.text = "Частота осложнений 1%"
        }
        
        if (6...12).contains(result!) {
            ratingLabel.text = "Баллы: \(result!)"
            classLabel.text = "Класс кардиального риска: II"
            frequencyLabel.text = "Частота осложнений 7%"
        }
        
        if (13...25).contains(result!) {
            ratingLabel.text = "Баллы: \(result!)"
            classLabel.text = "Класс кардиального риска: III"
            frequencyLabel.text = "Частота осложнений 14%"
        }
        
        if (26...53).contains(result!) {
            ratingLabel.text = "Баллы: \(result!)"
            classLabel.text = "Класс кардиального риска: IV"
            frequencyLabel.text = "Частота осложнений 78%"
        }
    }

    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
