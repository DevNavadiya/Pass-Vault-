//
//  ViewController.swift
//  PassVault
//
//  Created by Dev Navadiya on 10/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextbutoon_Action(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "passGenraterViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
}

