//
//  ViewController.swift
//  pleaseWork
//
//  Created by NYUAD on 28/01/2023.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOn = UserDefaults.standard.bool(forKey: "DarkModeIsOn")
       UpdateBGColor(isOn: isOn)
    }
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var cat: UIImageView!
    @IBOutlet weak var dog: UIImageView!
    @IBOutlet weak var rabbit: UIImageView!
    @IBOutlet weak var turtle: UIImageView!
    @IBOutlet weak var FirstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var school: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var pets: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var morePets: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBAction func darkModeOn(_ sender: UISwitch) {
        UpdateBGColor(isOn: sender.isOn)
        UserDefaults.standard.setValue(sender.isOn, forKey: "DarkModeIsOn")
    }
    
    @IBAction func morePets(_ sender: UISwitch) {
        if (morePetsSwitch.isOn){
            cat.isHidden=false;
            dog.isHidden=false;
            rabbit.isHidden=false;
            turtle.isHidden=false;
        }
        else {
            cat.isHidden=true;
            dog.isHidden=true;
            rabbit.isHidden=true;
            turtle.isHidden=true;
        }
    }
    
    
    @IBAction func IntroduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex);
                
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        let warning = "Please fill out all fields"
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        let alertController2 = UIAlertController(title: "Warning", message: warning, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alertController.addAction(action)
        alertController2.addAction(action2)
                
        
        
        if (firstNameTextField.text! == "" || lastNameTextField.text! == "" || schoolTextField.text! == "") {
            present(alertController2, animated: true, completion: nil)
        }
        else {
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    private func UpdateBGColor(isOn: Bool){
        view.backgroundColor = isOn ? .gray : .white;
        FirstName.textColor = isOn ? .white : .black;
        lastName.textColor = isOn ? .white : .black;
        school.textColor = isOn ? .white : .black;
        year.textColor = isOn ? .white : .black;
        pets.textColor = isOn ? .white : .black;
        morePets.textColor = isOn ? .white : .black;
        number.textColor = isOn ? .white : .black;
        darkModeLabel.textColor = isOn ? .white : .black;

        darkModeSwitch.isOn = isOn;
    }


}

