//
//  ViewController.swift
//  Right on target
//
//  Created by SERGEY SHLYAKHIN on 29.07.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    
    // MARK: Properties
    
    var game: Game!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(describing: game.currentSecretValue))
    }
    
    // MARK: Custom methods
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Game over", message: "You got \(score) points", preferredStyle: .alert)
        let newGameAction = UIAlertAction(title: "New game", style: .default, handler: nil)
        alert.addAction(newGameAction)
        present(alert, animated: true, completion: nil)
    }

    // MARK: Actions
    
    @IBAction func checkNumber() {
        let numSlider = Int(slider.value.rounded())
        game.calculateScore(with: numSlider)
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(describing: game.currentSecretValue))
    }
    
}

