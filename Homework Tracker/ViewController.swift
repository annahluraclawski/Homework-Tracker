//
//  ViewController.swift
//  Homework Tracker
//
//  Created by ANNAHLU RACLAWSKI on 11/13/23.
//
//WERE GONNA SHOW OVERALL GRADES FOR ALL INPUTTED CLASSES ON THE HOME PAGE

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //var totalPoints : Int
    //var earned : Int
    var classes : [String] = []
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
      
       //totalPoints = 0
       // earned = 0
        
        
        
//        for tot in AppData.schools{
//            totalPoints += tot.scoret
//        }
//        for earn in AppData.schools{
//            earned += earn.scoree
//        }
        
//        for x in AppData.schools{
//            classes.append(x.classs)
//        }
        
        tableViewOut.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        tableViewOut.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! HomeScreen
        var c =  AppData.schools[indexPath.row].classs
     
        cell.classOut.text = c
        var tote = 0
        var tott = 0
        
        for a in AppData.schools {
            if a.classs == c {
                tote += a.scoree
                tott += a.scoret
            }
        }
        if tott != 0 {
            var sco = Double(tote)/Double(tott)
            sco*=100
            var scoo = Double(round(10 * sco) / 10)
            
            cell.gradeOut.text = "\(scoo)%"
        }
        else {
            cell.gradeOut.text = "\(tote)/\(tott)"
        }
        return cell
    }
    

}

