//
//  ViewControllerHome.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/15/23.
//

import UIKit

class ViewControllerHome: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var assignments : [String] = []
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell.textLabel?.text = assignments[indexPath.row]
        return cell
    }
    
    @IBAction func addButton(_ sender: UIButton) {
    }
    

}
