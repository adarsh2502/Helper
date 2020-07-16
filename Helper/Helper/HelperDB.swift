//
//  HelperDB.swift
//  Helper
//
//  Created by Adarsh Gupta on 18/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class HelperDB {
    
    static var shareInstance = HelperDB()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    func save(Object:[String:String]) {
        
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context!) as! Person
        
        person.name = Object["name"]
        person.profession = Object["profession"]
        person.experience = Object["experience"]
        person.university = Object["university"]
        
        do{
            try context?.save()
        }catch{
            print("Unsuccesful")
        }
        
    }
    
    func getPersonData() -> [Person] {
        var person = [Person]()
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do{
            person = try context?.fetch(fetchRequest) as! [Person ]
        }catch{
            print("Can not fetch data ")
        }
        return person
    }
    
    func deleteData(index:Int) -> [Person]
    {
        var person = getPersonData()
        context?.delete(person[index])
        person.remove(at: index)
        do{
            try context?.save()
        }catch {
            print("Sorry Data canot be deleted")
        }
        return person
    }
    
    func editData(object:[String:String], i:Int) {
        var person = getPersonData()
        person[i].name = object["name"]
        person[i].profession = object["profession"]
        person[i].experience = object["experience"]
        person[i].university = object["university"]
        do{
            try context?.save()
        }catch {
            print("Sorry Data canot be Updated")
        }
        
    }
} 
