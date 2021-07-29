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
    var number = 0
    var points = 0
    var round = 1
    
    lazy var secondViewController = getSecondViewController()
    
    // MARK: Life cycle
    override func loadView() {
        super.loadView()
        print(#function)
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Version 1.1"
        view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        number = Int.random(in: 1...50)
        label.text = String(describing: number)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    // MARK: Custom methods
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
        return vc as! SecondViewController
    }

    // MARK: Actions
    @IBAction func checkNumber() {
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
    
    @IBAction func showNextScreen() {
        present(secondViewController, animated: true, completion: nil)
    }
}

