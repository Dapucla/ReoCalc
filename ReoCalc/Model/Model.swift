//
//  Task.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 01.07.2022.
//

import Foundation
import RealmSwift

class Patient: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: String = ""
    @objc dynamic var dateOfBirth: Date = Date()
    @objc dynamic var disease: String = ""
    
    override init() {
        super.init()
    }
    
    init(name: String, age: String, dateOfBirth: Date, disease: String){
        self.name = name
        self.age = age
        self.dateOfBirth = dateOfBirth
        self.disease = disease
    }
}
