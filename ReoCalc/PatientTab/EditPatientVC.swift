//
//  EditPatientVC.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 01.07.2022.
//

import UIKit

class EditPatientVC: UIViewController {

    @IBOutlet var fullnameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var dateOfBirthDatePicker: UIDatePicker!
    @IBOutlet var diseaseTextField: UITextField!
    
    
    var patient: Patient?
    let vm = ViewModel.sharedInstance
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let myPatient = self.patient {
            fullnameTextField.text = myPatient.name
            ageTextField.text = myPatient.age
            dateOfBirthDatePicker.date = myPatient.dateOfBirth
            diseaseTextField.text = myPatient.disease
            self.title = "\(myPatient.name)"
        }
    }
    
    
    func configureUI() {
        dateOfBirthDatePicker.datePickerMode = .date
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @IBAction func save(_ sender: Any) {
        let newPatient = Patient(name: fullnameTextField.text ?? "", age: ageTextField.text ?? "", dateOfBirth: dateOfBirthDatePicker.date, disease: diseaseTextField.text ?? "")
        vm.editPatient(patient: self.patient!, updatedPatient: newPatient) {

            navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        vm.deletePatient(patient: self.patient!, patientIndex: self.index!) {
            navigationController?.popViewController(animated: true)
        }
    }
}
