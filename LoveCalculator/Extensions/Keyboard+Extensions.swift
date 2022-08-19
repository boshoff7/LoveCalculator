//
//  Keyboard+Extensions.swift
//  LoveCalculator
//
//  Created by Chris Boshoff on 2022/08/19.
//

import Foundation
import UIKit


extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
