//
//  ViewController.swift
//  Eggcelent
//
//  Created by Eimantas Klimas on 2021-06-01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    
    enum HardnessValue: Float {
        case Soft = 300
        case Medium = 420
        case Hard = 720
        
        init(_ title: String?) {
            switch title {
            case "Soft"? : self = .Soft
            case "Medium"? : self = .Medium
            case "Hard"? : self = .Hard
            default: self = .Soft
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        totalTime = HardnessValue.init(sender.currentTitle).rawValue
        secondsPassed = 0
        timer.invalidate()
        
        titleLabel.text = sender.currentTitle!
        Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            let percentageProgess = secondsPassed/totalTime
            
            secondsPassed += 1
            progressBar.progress = percentageProgess
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
}

