//
//  ThemeChooserViewController.swift
//  ConcentrationCard
//
//  Created by Stephen Selvaraj on 9/19/18.
//  Copyright © 2018 Stephen Selvaraj. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SportsTheme(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToGame", sender: self)
        
    }
    
    @IBAction func FaceTheme(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToGame", sender: self)
    }
    
    @IBAction func FoodDrink(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
