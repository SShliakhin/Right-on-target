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
        // Создаем генератор случайных чисел
        let generator = Generator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(describing: game.currentRound.currentSecretValue))
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
        game.currentRound.calculateScoreWith(with: numSlider)
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(describing: game.currentRound.currentSecretValue))
    }
    
}

