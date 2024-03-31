//
//  passwordmanager.swift
//  PassVault
//
//  Created by Dev Navadiya on 10/03/24.
//

import Foundation
import UIKit
import CoreData

class databasehelper {
    static  let shard = databasehelper()
    
    lazy var persistentcontener : NSPersistentContainer = {
        let contener = NSPersistentContainer(name: "PassVault")
        
        contener.loadPersistentStores (completionHandler: {(storediscription , error) in
            if let error = error as NSError? {
                fatalError("Unresloved error \(error), \(error.userInfo)")
            }
            
        })
        
        return contener
        
    }()
    
    func savedata (password : String , name : String) {
        let context = persistentcontener.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Adddata", into: context) as! Adddata
        
        entity.name = name
        entity.password = password
        
        do {
            try context.save()
        } catch {
            print("Data Save Error")
        }
        
    }
    
    func getdata () -> [Adddata] {
        
        let context = persistentcontener.viewContext
        var request = [Adddata]()
        
        do {
            request = try context.fetch(Adddata.fetchRequest())
        }catch let erro{
            print(erro)
        }
        return request
        
    }
    
    func deletdata (arr : inout[Adddata] , index : Int) {
        
        let context = persistentcontener.viewContext
        context.delete(arr[index])
        arr.remove(at: index)
        
        do {
            try context.save()
        }catch {
            print("Not save")
        }
        
        
    }
   
    
    
}
 
