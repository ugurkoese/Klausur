//
//  ViewController.swift
//  KlausurWiSe19-20_Koese_Ugur
//
//  Created by  on 30.01.20.
//  Copyright © 2020 Ugur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    
    var logInAttempts = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeBackLabel.isHidden = true
        
       NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @IBAction func signIn(_ sender: UIButton) {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            if let username = UserDefaults.standard.string(forKey: "username"), let password = UserDefaults.standard.string(forKey: "password") {
                loginButton.setTitle("Log In", for: .normal)
            
                if username == usernameTextField.text && password == passwordTextField.text {
                    performSegue(withIdentifier: "secretView", sender: self)
                } else if logInAttempts < 3 {
                    logInAttempts += 1
                } else if logInAttempts == 3 {
                    usernameTextField.isUserInteractionEnabled = false
                    passwordTextField.isUserInteractionEnabled = false
                    loginButton.isUserInteractionEnabled = false
                    
                    Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: {_ in
                        self.usernameTextField.isUserInteractionEnabled = true
                        self.passwordTextField.isUserInteractionEnabled = true
                        self.loginButton.isUserInteractionEnabled = true
                    })
                }
            }
            
            
            let username = usernameTextField.text
            let password = passwordTextField.text
            
			
			//  merke im Nachhinein, dass das hier nicht richtig ist, man muss 3 mal falsch gemacht haben, bevor gespeichert wird, habe vergessen es auch generell zu erlauben
            if logInAttempts == 3 {
                // Persistent speichern mit UserDefaults
                
                UserDefaults.standard.set(password, forKey: "password")
                UserDefaults.standard.set(username, forKey:"username")
                
                logInAttempts = 0
            }
            
        } else {
            logInAttempts += 1
        }
    }
    
    @objc func applicationWillEnterForeground(_ notification: NSNotification) {
        self.welcomeBackLabel.isHidden = false
       
    }
}

