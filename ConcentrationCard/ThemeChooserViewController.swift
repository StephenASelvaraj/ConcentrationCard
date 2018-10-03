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
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇"
    ]
    


    
    @IBAction func chooseTheme(_ sender: Any) {
        performSegue(withIdentifier: "GoToGame", sender: sender as! UIButton)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cvc = segue.destination as? ConcentrationViewController {
    
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]
            {
                cvc.emojichoices = theme
            }
        }
        }
    
}
