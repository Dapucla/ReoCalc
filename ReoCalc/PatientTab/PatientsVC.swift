//
//  ViewController.swift
//  ReoCalc
//
//  Created by Даниил Алексеев on 01.07.2022.
//

import UIKit

class PatientsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    let vm = ViewModel.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        vm.loadPatients()
        tableView.reloadData()
    }
    
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddPatientVC") as! AddPatientVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.patients.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PatientsTVC
        
        let data = vm.patients[indexPath.row]
        
        cell.fullNameLabel.text = data.name
        cell.avatarImageView.image = UIImage(named: "test")
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditPatientVC") as! EditPatientVC
        vc.patient = vm.patients[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}

