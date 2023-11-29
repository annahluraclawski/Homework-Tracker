//
//  ViewControllerGrades.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/21/23.
//

import UIKit

class ViewControllerGrades: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newOne = AppData.schools
    
    @IBOutlet weak var tableViewOut: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewOut.dataSource = self
        tableViewOut.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        tableViewOut.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(AppData.schools.count)
        return AppData.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! Grades
        cell.assignmentOut.text = AppData.schools[indexPath.row].assignment
        cell.gradeOut.text = " \(AppData.schools[indexPath.row].scoree)/\(AppData.schools[indexPath.row].scoret)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.title = AppData.schools[indexPath.row].assignment
        
        performSegue(withIdentifier: "toVC", sender: nil)
        AppData.index = indexPath.row
    }

}
