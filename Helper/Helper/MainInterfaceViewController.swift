//
//  MainInterfaceViewController.swift
//  Helper
//
//  Created by Adarsh Gupta on 26/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//

import UIKit

class MainInterfaceViewController: UIViewController {

    @IBAction func ViewMyList(_ sender: Any) {
        
        let listVC = storyboard?.instantiateViewController(withIdentifier: "HelperListViewController") as! HelperListViewController
        self.navigationController?.pushViewController(listVC, animated: true)
        
    }
    
    @IBAction func AddNewPerson(_ sender: Any) {
        let listVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    @IBAction func OrgBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Organise Event ", message: "You can organise an event like: Get together of swinburne graduates or a group meeting of business analyst", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil )
        }))
        
        present(alert,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
