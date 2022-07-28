//
//  InterestsViewController.swift
//  myclasses
//
//  Created by Giuseppe D'Orazio on 2022-07-27.
//

import UIKit
import SwiftUI
import Foundation

protocol itemDelegate {
    func returnItem(type:String)
}

class InterestsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, itemDelegate{
    
    let defaults = UserDefaults.standard
    var onePress = false
    var twoPress = false
    var threePress = false
    
    var editOne = false
    var editTwo = false
    var editThree = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
        let option = options[row]
        defaults.set(option, forKey: "postSec")
    }
    
    var options: [String] = [String]()

    
    func returnItem(type:String)
    {
        if (onePress == true) {
            interestOne.text = type
            onePress = false
            editOne = true
            defaults.set(type, forKey: "interestOne")
        } else if (twoPress == true) {
            interestTwo.text = type
            twoPress = false
            editTwo = true
            defaults.set(type, forKey: "interestTwo")
        } else if (threePress == true) {
            interestThree.text = type
            threePress = false
            editThree = true
            defaults.set(type, forKey: "interestThree")
        }
    }

    var returnInterest: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        options = ["College", "University", "Not sure"]
        welcome.text = "Welcome, " + (defaults.string(forKey: "name") ?? "null") + "!"
        self.postSecMenu.delegate = self
        self.postSecMenu.dataSource = self
        continueButton.isEnabled = false
        buttonOne.layer.cornerRadius = 25
        buttonTwo.layer.cornerRadius = 25
        buttonThree.layer.cornerRadius = 25
        
        self.view.backgroundColor = UIColor(red: 92/255, green: 230/255, blue: 201/255, alpha: 1)
        background.layer.cornerRadius = 25
        background.layer.borderWidth = 0
        background.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor(red: 92/255, green: 230/255, blue: 201/255, alpha: 1)
            // Do any additional setup after loading the view.
    }
    func unlock() {
        if editOne == true && (editTwo == true && editThree == true) {
            continueButton.isEnabled = true
        }
    }
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var continueButton: UIButton!

    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var postSecMenu: UIPickerView!
    
    @IBOutlet weak var interestOne: UILabel!
    @IBOutlet weak var interestTwo: UILabel!
    @IBOutlet weak var interestThree: UILabel!
    
    @IBOutlet weak var background: UIView!
    
    @IBAction func buttonOnePress(_ sender: UIButton) {
        buttonOne.setTitle("Edit", for: .normal)
        onePress = true
    }
    
    @IBAction func buttonTwoPress(_ sender: UIButton) {
        buttonTwo.setTitle("Edit", for: .normal)
        twoPress = true
    }
    
    @IBAction func buttonThreePress(_ sender: UIButton) {
        buttonThree.setTitle("Edit", for: .normal)
        threePress = true
    }
    
    @IBAction func move(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoToB", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToB" {
            let destination = segue.destination as! MenuViewController
            destination.delegate = self
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



