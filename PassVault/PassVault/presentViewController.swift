//
//  presentViewController.swift
//  PassVault
//
//  Created by Dev Navadiya on 10/03/24.
//

import UIKit

class presentViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var textfiled: UITextField!
   
    var nevigat : (() -> Void)?
   
    var genratedpass : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textfiled.delegate = self
        // Do any additional setup after loading the view.
        
     
        
    }
    
    
    
    @IBAction func back_btn(_ sender: Any) {
        
        self.dismiss(animated: true)
        
        
    }
    
    
    
    @IBAction func savelist(_ sender: Any) {
        self.nevigat?()
      self.dismiss(animated: true)
     
    }
    
    @IBAction func save(_ sender: Any) {
        
        databasehelper.shard.savedata(password: genratedpass ?? "" , name: self.textfiled.text ?? "" )
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textfiled.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textfiled.inputView = nil
    }
}
