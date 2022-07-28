//
//  MenuViewController.swift
//  myclasses
//
//  Created by Giuseppe D'Orazio on 2022-07-27.
//

import UIKit
import SwiftUI
import Foundation

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var delegate:itemDelegate?
    let defaults = UserDefaults.standard

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interests.count
    }
    
    @IBOutlet var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellId) as UITableViewCell?)!
        
        cell.textLabel?.text = self.interests[indexPath.row]
        return cell
    
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.returnItem(type: interests[indexPath.row])
        interests.remove(at: indexPath.row)
        self.dismiss(animated: true, completion: nil)
    }

    var interests: [String] = ["Computers and tech", "Art", "Video games", "Movies", "Sports", "New languages", "Animals", "Fasion", "Space", "Cooking", "Politics"]
    
    let cellId = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}


