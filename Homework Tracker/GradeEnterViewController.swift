//
//  GradeEnterViewController.swift
//  Homework Tracker
//
//  Created by CLAIRE MCGUIRE on 11/28/23.
//

import UIKit

class GradeEnterViewController: UIViewController {

    @IBOutlet weak var titleOut: UILabel!
    @IBOutlet weak var earnedOut: UITextField!
    @IBOutlet weak var totalOut: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleOut.text = AppData.title
        
        
    }
    

    
    @IBAction func enterGrade(_ sender: UIButton) {
     
        
        if let t = Int(totalOut.text!){
            //AppData.pointstot.append(t)
            AppData.schools[AppData.index].scoret = t
        }
        
        if let e = Int(earnedOut.text!){
            AppData.schools[AppData.index].scoree = e
        }
        
       
        
    }
    
}
