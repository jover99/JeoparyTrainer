//
//  SplashScreenViewController.swift
//  JeopardyTrainerRetake
//
//  Created by Richard Jove on 12/14/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    var yAtLaunch: CGFloat = 0.0
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yAtLaunch = logoImageView.frame.origin.y
        logoImageView.frame.origin.y = self.view.frame.height
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playSound(soundName: "jeopardy-intro", audioPlayer: &audioPlayer)
        UIView.animate(withDuration: 2.0, animations: {self.logoImageView.frame.origin.y = self.yAtLaunch})
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file.")
            }
        } else {
            print("ERROR: Could not load data from file \(soundName)")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }
    
    @IBAction func logoTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ShowCategories", sender: nil)
        
    }
    
}
