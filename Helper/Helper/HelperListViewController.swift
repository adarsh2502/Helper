//
//  HelperListViewController.swift
//  Helper
//
//  Created by Adarsh Gupta on 19/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//

import UIKit
protocol  DataPass {
    func data(object:[String:String], index:Int, isEdit:Bool)
}
enum selectedScope:Int
{
    case profession = 0
    case experience = 1
    case university = 2
}
class HelperListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var delegate:DataPass!
    var person = [Person]()
    var searchList = [Person]()
    var isSearch = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  isSearch ? searchList.count: person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.NameLabel.text = isSearch ? searchList[indexPath.row].name: person[indexPath.row].name
        
        cell.ProfLabel.text = isSearch ? searchList[indexPath.row].profession: person[indexPath.row].profession
     //   cell.ExpLabel.text = person[indexPath.row].experience
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detail: DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "fullDetail") as! DetailViewController
       //let detail: DetailViewController = tableView.dequeueReusableCell(withIdentifier: "fullDetail", for: indexPath) as! DetailViewController
        detail.name = isSearch ? searchList[indexPath.row].name!: person[indexPath.row].name ?? "adarsh"
        
        detail.profession = isSearch ? searchList[indexPath.row].profession!: person[indexPath.row].profession ?? "Analyst"
        
        detail.experience = isSearch ? searchList[indexPath.row].experience!: person[indexPath.row].experience ?? "2"
        
        detail.university = isSearch ? searchList[indexPath.row].university!: person[indexPath.row].university ?? "swinburne"
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editButton = UITableViewRowAction(style: .normal, title: "Edit")  { (rowAction, indexPath) in
            let dict = ["name":self.person[indexPath.row].name,"profession":self.person[indexPath.row].profession,"experience":self.person[indexPath.row].experience,"university":self.person[indexPath.row].university]
            
            self.delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
            self.navigationController?.popViewController(animated: true)
        }
        
        let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
            self.person = HelperDB.shareInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return[editButton,deleteButton]
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            person = HelperDB.shareInstance.deleteData(index: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        person = HelperDB.shareInstance.getPersonData()
        self.setUpSearchbar()
        // Do any additional setup after loading the view.
    }
    
    func setUpSearchbar() {
        
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Profession","Experience","University"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        //self.tableView.tableHeaderView = searchBar
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty
        {
            isSearch = false
            
            tableView.reloadData()
        }
            
        else
        {
            isSearch = true
            SearchTableView(ind: searchBar.selectedScopeButtonIndex, text:searchText)
        }
    }
    
    func SearchTableView(ind :Int,text:String)
    {
        switch ind {
        case selectedScope.profession.rawValue:
            
            searchList = person.filter({(mod) ->  Bool in
                return mod.profession!.lowercased().contains(text.lowercased())
                
            })
            self.tableView.reloadData()
            
        case selectedScope.experience.rawValue:
            
            searchList = person.filter({(mod) ->  Bool in
                return String(mod.experience!).contains(text)
            })
            //self.tableView.reloadData()
            self.tableView.reloadData()
            
        case selectedScope.university.rawValue:
            
            searchList = person.filter({(mod) ->  Bool in
                return mod.university!.lowercased().contains(text.lowercased())
                
            })
            self.tableView.reloadData()
            
            
            
        default:
            print("InValid Type")
            
            tableView.reloadData()
        }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

