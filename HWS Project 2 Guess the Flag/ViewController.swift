//
//  ViewController.swift
//  HWS Project 2 Guess the Flag
//
//  Created by Bochkarov Valentyn on 22/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var correctAnswer = 0
    var countries = [String]()
    var score = 0
    var qtrack = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
 
        countries += ["estonia", "france", "germany", "ireland", "italy",
                      "monaco", "nigeria", "poland", "russia", "spain", "uk",
                      "us"]
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) scrore: \(score)"
        qtrack += 1

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            let currentTag = sender.tag
            title = "Wrong, that’s the flag of \(countries[currentTag].uppercased())"

            score -= 1
        }
        
        
        
        if qtrack == 10 {
            let resetAC = UIAlertController(title: "Thats all!", message: "Your score is \(score)", preferredStyle: .alert)
            resetAC.addAction(UIAlertAction(title: "Start again", style: .default, handler: { (reset) in
                self.score = 0
                self.qtrack = 0
                self.askQuestion(action: nil)
            }))
            present(resetAC, animated: true)

        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
        
        
    }
    
}

