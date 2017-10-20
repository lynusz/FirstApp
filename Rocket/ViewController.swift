//
//  ViewController.swift
//  Rocket
//
//  Created by Lynus Zullo on 10/20/17.
//  Copyright © 2017 Zullo Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustelLBL: UILabel!
    @IBOutlet weak var onLBL: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        powerBtn.isHidden = false

        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError{
            print(error.description)
        }
    }

    @IBAction func PowerBtnPressed(_ sender: Any) {
        
        powerBtn.isHidden = false
        cloudHolder.isHidden = false
        powerBtn.isHidden = true
        darkBlueBG.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x : 0, y: 20, width: 375, height: 402)
        }){(finished) in
            self.hustelLBL.isHidden = false
            self.onLBL.isHidden = false
        }
    }
}

