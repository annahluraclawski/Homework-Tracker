//
//  ViewControllerHome.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/15/23.
//

import UIKit

class ViewControllerHome: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    let defaults = UserDefaults.standard
    
    var assignments = [""]
    var classes = [""]
    //var assignments2 = ""
    var count = 0
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var textFieldOutlet2: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        //assignments2 = defaults.string(forKey: "theAssignments") ?? ""
        //assignments.append(assignments2)
        if let c =  defaults.array(forKey: "theAssignments") {
            assignments = c as! [String]
            tableViewOutlet.reloadData()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! Assignment
        cell.assignmentOutlet.text = assignments[indexPath.row]
        cell.classOutlet.text = assignments[indexPath.row]
        return cell
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let item = textFieldOutlet.text!
        let item2 = textFieldOutlet2.text!
        for n in assignments{
            if(n == item){
                let alert = UIAlertController(title: "Error", message: "assignment already inputted", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .destructive, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                count+=1
                
            }
        }
             if (count == 0){
                assignments.append(item)
                 classes.append(item2)
               
            }
            self.tableViewOutlet.reloadData()
        //defaults.set(item, forKey: "theAssignments")
        defaults.set(assignments, forKey: "theAssignments")
        
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        assignments.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        defaults.set(assignments, forKey: "theAssignments")
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        assignments[indexPath.row] = "\(assignments[indexPath.row]) completed"
        defaults.set(assignments, forKey: "theAssignments")
        tableViewOutlet.reloadData()
    }
    
    
    

}
