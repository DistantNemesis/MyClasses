//
//  ViewController.swift
//  myclasses
//
//  Created by Giuseppe D'Orazio on 2022-07-22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
        let grade = pickerData[row]
        defaults.set(grade, forKey: "grade")
    }

    

    let defaults = UserDefaults.standard
    var pickerData: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print (defaults.string(forKey: "name") ?? "null")
        print(defaults.string(forKey: "grade") ?? "null")
        
        self.gradeMenu.delegate = self
        self.gradeMenu.dataSource = self
        pickerData = ["9", "10", "11", "12"]
        appLogo.layer.cornerRadius = 25
        appLogo.layer.borderWidth = 0
        
        background.layer.cornerRadius = 25
        background.layer.borderWidth = 0
        background.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor(red: 92/255, green: 230/255, blue: 201/255, alpha: 1)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    @IBAction func whenPressed(_ sender: UIButton) {
        let text = textField.text
        print(text ?? "null")
        defaults.set(text, forKey: "name")
    }
    
    
    
    @IBOutlet weak var appLogo: UIImageView!
    
    @IBOutlet weak var gradeMenu: UIPickerView!
    
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
}

