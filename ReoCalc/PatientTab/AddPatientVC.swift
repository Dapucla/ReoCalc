//
//  AddPatientVC.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 01.07.2022.
//

import UIKit

class AddPatientVC: UIViewController {

    @IBOutlet var pateintsNameTextField: UITextField!
    @IBOutlet var patientsAgeTextField: UITextField!
    @IBOutlet var diseaseTextField: UITextField!
    @IBOutlet var dateOfBirthDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let patient = Patient(name: pateintsNameTextField.text ?? "", age: patientsAgeTextField.text ?? "", dateOfBirth: dateOfBirthDatePicker.date, disease: diseaseTextField.text ?? "" )
        
        let vm = ViewModel.sharedInstance
        vm.addPatient(patient: patient) {
            self.navigationController?.popViewController(animated: true)            
        }
    }
    
    
    func configureUI() {
        self.title = "Новый пациент"
        dateOfBirthDatePicker.datePickerMode = .date
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
