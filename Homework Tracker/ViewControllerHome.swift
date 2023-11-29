//
//  ViewControllerHome.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/15/23.
//
//fix this

public class School : Codable {
    var classs : String
    var assignment : String
    var scoret : Int
    var scoree : Int
    init(classs: String, assignment: String) {
        self.classs = classs
        self.assignment = assignment
        self.scoree = 0
        self.scoret = 0
    }
}

public class AppData {
   
    static var schools : [School] = []
    static var title = ""
   static var index = 0
    
    
}

import UIKit



class ViewControllerHome: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    let defaults = UserDefaults.standard
    var item = ""
    var item2 = ""
    //var stuff : [School] = []
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
        
        
//        if let items = defaults.data(forKey: "theStuff") {
//                        let decoder = JSONDecoder()
//         //decoding a JSAN to an object
//            if let decoded = try? decoder.decode([School].self, from: items) {
//                //make global variable
//                AppData.schools = decoded
//                        }
//                }
        
        
        
//        for x in stuff{
//            print(x.classs)
//
//        }
        
       
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! Assignment
        cell.assignmentOutlet.text = "\(AppData.schools[indexPath.row].assignment)"
        cell.classOutlet.text = "\(AppData.schools[indexPath.row].classs)"
        return cell
    }
    
    @IBAction func addButton(_ sender: UIButton) {
         item = textFieldOutlet.text!
         item2 = textFieldOutlet2.text!
       item = item.lowercased()
        item2 = item2.lowercased()
        var test = School(classs: item2, assignment: item)
       
        for n in AppData.schools {
            
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
                 AppData.schools.append(test)
            }
            self.tableViewOutlet.reloadData()
      
        let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(AppData.schools) {
                           defaults.set(encoded, forKey: "theStuff")
                       }
    //AppData.schools = stuff
        for x in AppData.schools {
            print(x.assignment)
        }
       
        
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        AppData.schools.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(AppData.schools) {
                           defaults.set(encoded, forKey: "theStuff")
                       }
        //AppData.schools = stuff
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        AppData.schools[indexPath.row].assignment = "completed"
       // AppData.schools[indexPath.row].classs = ""
        
        let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(AppData.schools) {
                           defaults.set(encoded, forKey: "theStuff")
                       }
        //AppData.schools = stuff
       
        tableViewOutlet.reloadData()
    }
    
    
    @IBAction func sortButtonAction(_ sender: UIButton) {
        AppData.schools.sort{$0.assignment < $1.assignment}
       // AppData.schools = stuff
        tableViewOutlet.reloadData()
    }
    

}
