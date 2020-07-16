//
//  DetailViewController.swift
//  Helper
//
//  Created by Adarsh Gupta on 19/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var professionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var experienceLabel: UILabel!
    @IBOutlet var universityLabel: UILabel!
    
    
    @IBAction func EditButton(_ sender: Any) {
        
        
//        let alert = UIAlertController(title: "Update the Details", message: "Now you can update the details", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
//            alert.dismiss(animated: true, completion: nil )
//        }))
        
    }
    var name = ""
    var profession = ""
    var experience = ""
    var university = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        professionLabel.text = profession
        experienceLabel.text = experience
        universityLabel.text = university

        // Do any additional setup after loading the view.
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
