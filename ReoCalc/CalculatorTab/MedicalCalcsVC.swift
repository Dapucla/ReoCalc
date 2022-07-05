//
//  MedicalCalcsVC.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 02.07.2022.
//

import UIKit

class MedicalCalcsVC: UIViewController {

    @IBOutlet var goldmanIndexButton: UIButton!
    @IBOutlet var glasgowButton: UIButton!
    @IBOutlet var comaButton: UIButton!
    @IBOutlet var LISButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        beatifyButton(button: glasgowButton)
        beatifyButton(button: LISButton)
        beatifyButton(button: goldmanIndexButton)
        beatifyButton(button: comaButton)
    }
    
    func beatifyButton(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 1.0
    }

}
