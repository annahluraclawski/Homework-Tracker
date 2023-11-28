//
//  ViewController.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/13/23.
//
//WERE GONNA SHOW OVERALL GRADES FOR ALL INPUTTED CLASSES ON THE HOME PAGE

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableViewOut: UITableView!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.data(forKey: "theStuff") {
                        let decoder = JSONDecoder()
         //decoding a JSAN to an object
            if let decoded = try? decoder.decode([School].self, from: items) {
                //make global variable
                AppData.schools = decoded
                        }
                }
        tableViewOut.dataSource = self
        tableViewOut.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! HomeScreen
        cell.classOut.text = AppData.schools[indexPath.row].classs
        cell.gradeOut.text = "A"
        return cell
    }
    

}

