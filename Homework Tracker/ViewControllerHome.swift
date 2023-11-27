//
//  ViewControllerHome.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/15/23.
//
//fix this
public class AppData {
    static var schools : [School] = []
}

import UIKit

public class School : Codable {
    var classs : String
    var assignment : String
    
    init(classs: String, assignment: String) {
        self.classs = classs
        self.assignment = assignment
    }
}

class ViewControllerHome: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    let defaults = UserDefaults.standard
    var item = ""
    var item2 = ""
    var stuff : [School] = []
    var assignments = [""]
    var classes = [""]
    var num = 0
   
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
        if let items = defaults.data(forKey: "theStuff") {
                        let decoder = JSONDecoder()
         //decoding a JSAN to an object
            if let decoded = try? decoder.decode([School].self, from: items) {
                //make global variable
                            stuff = decoded
                        }
                }
//        for x in stuff{
//            print(x.classs)
//
//        }
        
       
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! Assignment
        cell.assignmentOutlet.text = "\(stuff[indexPath.row].assignment)"
        cell.classOutlet.text = "\(stuff[indexPath.row].classs)"
        return cell
    }
    
    @IBAction func addButton(_ sender: UIButton) {
         item = textFieldOutlet.text!
         item2 = textFieldOutlet2.text!
       item = item.lowercased()
        item2 = item2.lowercased()
        var test = School(classs: item2, assignment: item)
       
        for n in stuff {
            
            //print(n.classs)
            //print(item)
            if(n.assignment == item){
                let alert = UIAlertController(title: "Error", message: "assignment already inputted", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .destructive, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                count+=1
                
            }
        }
             if (count == 0){
                 stuff.append(test)
            }
            self.tableViewOutlet.reloadData()
      
        let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(stuff) {
                           defaults.set(encoded, forKey: "theStuff")
                       }
        AppData.schools = stuff
        print(AppData.schools)
        
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        stuff.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(stuff) {
                           defaults.set(encoded, forKey: "theStuff")
                       }
        AppData.schools = stuff
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        stuff[indexPath.row].assignment = "completed"
        stuff[indexPath.row].classs = ""
        
        let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(stuff) {
                           defaults.set(encoded, forKey: "theStuff")
                       }
        AppData.schools = stuff
       
        tableViewOutlet.reloadData()
    }
    
    
    @IBAction func sortButtonAction(_ sender: UIButton) {
        stuff.sort{$0.assignment < $1.assignment}
        AppData.schools = stuff
        tableViewOutlet.reloadData()
    }
    

}
