//
//  ViewModel.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 01.07.2022.
//

import Foundation
import RealmSwift


class ViewModel: NSObject {
    static var sharedInstance = ViewModel()
    var patients = [Patient]()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    func addPatient(patient: Patient, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.add(patient)
        
        try! self.realm.commitWrite()
    
        completion()
    }
    
    
    func deletePatient(patient: Patient, patientIndex: Int, completion: completionHandler) {
        self.realm.beginWrite()
        
        self.realm.delete(patient)
        
        try! self.realm.commitWrite()
        
        patients.remove(at: patientIndex)
        
        completion()
    }
    
    
    func editPatient(patient: Patient, updatedPatient: Patient, completion: completionHandler) {
        self.realm.beginWrite()
        
        self.realm.delete(patient)
        self.realm.add(updatedPatient)
        
        try! self.realm.commitWrite()
        
        completion()
    }
    
    
    func loadPatients() {
        self.realm.beginWrite()
        
        let savedPatients = self.realm.objects(Patient.self)
        self.patients.removeAll()
        self.patients.append(contentsOf: savedPatients)
        
        try! self.realm.commitWrite()
    }
}
