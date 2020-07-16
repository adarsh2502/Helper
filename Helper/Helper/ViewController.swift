//
//  ViewController.swift
//  Helper
//
//  Created by Adarsh Gupta on 18/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataPass {

    @IBOutlet var NameText: UITextField!
    @IBOutlet var PofessionText: UITextField!
    @IBOutlet var ExperienceText: UITextField!
    @IBOutlet var UniversityText: UITextField!
    var i = Int()
    var isUpdate = Bool()
    
    @IBAction func Show(_ : Any) {
        
        let listVC = storyboard?.instantiateViewController(withIdentifier: "HelperListViewController") as! HelperListViewController
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
        
    }
    
    @IBAction func SaveButton(_ sender: Any) {
                    
        let dict = ["name":NameText.text,"profession":PofessionText.text,"experience":ExperienceText.text,"university":UniversityText.text]
        
        if isUpdate{
            HelperDB.shareInstance.editData(object: dict as! [String:String], i: i)
        }
        else {
            
            if((NameText.text?.count == 0)||(PofessionText.text?.count == 0) )  {
                let alert = UIAlertController(title: "Data not Saved ", message: "Please fill all the details", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil )
                }))
                //let okAction = UIAlertAction(title: "OK", style: UIAlert)
                present(alert,animated: true, completion: nil)
                
            }
            else {
                HelperDB.shareInstance.save(Object: dict as! [String : String])
                
                let alert = UIAlertController(title: "Data Saved ", message: "Details are saved succesfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil )
                }))
                //let okAction = UIAlertAction(title: "OK", style: UIAlert)
                present(alert,animated: true, completion: nil)
                
            }
        }
        

    }
    
    func data(object: [String : String], index:Int, isEdit:Bool) {
        NameText.text = object["name"]
        PofessionText.text = object["profession"]
        ExperienceText.text = object["experience"]
        UniversityText.text = object["university"]
        i = index
        isUpdate = isEdit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

 
