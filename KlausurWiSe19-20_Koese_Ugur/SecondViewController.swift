//
//  SecondViewController.swift
//  KlausurWiSe19-20_Koese_Ugur
//
//  Created by  on 30.01.20.
//  Copyright © 2020 Ugur. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 20, repeats: false, block: {_ in
            self.secureLabel.isHidden = true
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
