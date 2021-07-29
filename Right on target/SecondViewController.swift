//
//  SecondViewController.swift
//  Right on target
//
//  Created by SERGEY SHLYAKHIN on 29.07.2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print(#function, 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, 2)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, 2)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function, 2)
    }

}
