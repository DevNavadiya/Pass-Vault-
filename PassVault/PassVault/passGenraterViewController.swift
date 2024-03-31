//
//  passGenraterViewController.swift
//  PassVault
//
//  Created by Dev Navadiya on 10/03/24.
//

import UIKit
import StoreKit

class passGenraterViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
   
    @IBOutlet weak var charactor: UISwitch!
    
    @IBOutlet weak var specialCharactor: UISwitch!
    
    var caractorpass = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var spicailcaratorpass = "!@#$%^&*()_+=-{}[]\\|:;\"'<>,.?/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func about_Us(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "aboutUsViewController")
        
        rateUs()
        
        
        self.present(vc, animated: true)
        
    }
    
    
    
    @IBAction func save_btn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "presentViewController") as! presentViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle =  .custom
        vc.nevigat = {
            
            let abc = UIStoryboard(name: "Main",bundle: nil).instantiateViewController(identifier: "savePasswordViewController") as! savePasswordViewController
            
            self.navigationController?.pushViewController(abc, animated: true)
        }
        self.present(vc, animated: true)
        vc.genratedpass = self.label.text
        print(FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!)
        
    
    }
    
    
    @IBAction func genrate(_ sender: Any) {
        
        var number = "01234567789"
        
        if charactor.isOn {
            number += caractorpass
        }
        if specialCharactor.isOn {
            number += spicailcaratorpass
        }
        
        var pass = ""
        
        for _ in 0..<6 {
            let randomIndex = Int.random(in: 0..<number.count)
            pass.append(number[number.index(number.startIndex, offsetBy: randomIndex)])
        }
        self.label.text = pass
        
    }
    
    
    
    
    func rateUs() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            print(" - - - - - - Rating view in not present - - - -")
        }
    }
    
    
    
}
