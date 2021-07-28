//
//  ViewController.swift
//  Right on target
//
//  Created by SERGEY SHLYAKHIN on 29.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    
    var number = 0
    var points = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkNumber() {
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                let alert = UIAlertController(title: "Game over", message: "You got \(points) points", preferredStyle: .alert)
                let newGameAction = UIAlertAction(title: "New game", style: .default, handler: nil)
                alert.addAction(newGameAction)
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(describing: number)
        }
    }
}

