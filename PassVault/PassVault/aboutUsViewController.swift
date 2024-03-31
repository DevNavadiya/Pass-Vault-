//
//  aboutUsViewController.swift
//  PassVault
//
//  Created by Dev Navadiya on 10/03/24.
//

import UIKit
import AVFoundation

class aboutUsViewController: UIViewController {

    var player: AVAudioPlayer?
    
    @IBOutlet weak var book: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Audiobook(_ sender: Any) {
        
        playSound()
       
        if book.isSelected {
            player?.pause()
        }
     
        self.book.isSelected.toggle()
          
        func playSound() {
            guard let path = Bundle.main.path(forResource: "PassVault", ofType: "mp3" ) else {
                return }
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        
            
            
        }
        
        
    }
   
    
    @IBAction func backBtn(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
        
    }
}
