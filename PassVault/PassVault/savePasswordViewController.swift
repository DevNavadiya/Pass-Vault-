//
//  savePasswordViewController.swift
//  PassVault
//
//  Created by Dev Navadiya on 10/03/24.
//

import UIKit
import CoreData

class savePasswordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tabel_view: UITableView!
    var data = [Adddata]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabel_view.dataSource = self
        self.tabel_view.delegate = self
        data = databasehelper.shard.getdata()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back_butoon(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "savePasswordTableViewCell") as! savePasswordTableViewCell
        let index = data[indexPath.row]
        cell.namefopass.text = index.name
        cell.passlabell.text = index.password
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let index = data[indexPath.row]
        
        let deletbtn = UIContextualAction(style: .destructive, title: "Delet") { Suss, view, handler in
            
            databasehelper.shard.deletdata(arr: &self.data, index: indexPath.row)
            self.tabel_view.reloadData()
            
        }
        
        
        
        
        return UISwipeActionsConfiguration(actions: [deletbtn])
    }
    
}
