//
//  ViewController.swift
//  Back to BachThree
//
//  Created by George Garcia on 6/12/17.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "Aruarian", ofType: "mp3")

    
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var scrubSlider: UISlider!
    
    @IBAction func playButton(_ sender: AnyObject) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateSlider), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton(_ sender: AnyObject) {
        print("Pause Button Pressed")
        
        player.pause()
        timer.invalidate() // stop timer
        
    }
    
    @IBAction func stopButton(_ sender: AnyObject) {
        print("Stop Button Pressed")
        
        timer.invalidate()
        player.stop()
        player.currentTime = 0
        
    }
    
    @IBAction func restartButton(_ sender: AnyObject) {
        print("Restart Button Pressed")
    }
    
    @IBAction func changeVolume(_ sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBAction func changeAudioTime(_ sender: AnyObject) {
        
        player.currentTime = TimeInterval(scrubSlider.value)
        
    }
    
    func updateSlider(){
        
        scrubSlider.value = Float(player.currentTime)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubSlider.maximumValue = Float(player.duration)
            
            print("Woah")
            
        } catch let error as NSError{
            // process errors
            print("Woah2")
            print(error.description)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

