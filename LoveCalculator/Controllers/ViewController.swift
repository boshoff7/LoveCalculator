//
//  ViewController.swift
//  LoveCalculator
//
//  Created by Chris Boshoff on 2022/08/19.
//

import UIKit

class ViewController: UIViewController, LoveProtocol {


    @IBOutlet weak var bottomTrimView       : UIView!
    @IBOutlet weak var topTrimView          : UIView!
    @IBOutlet weak var firstNameTextField   : UITextField!
    @IBOutlet weak var secondNameTextField  : UITextField!
    @IBOutlet weak var resultView           : UIView!
    @IBOutlet weak var scoreLabel           : UILabel!
    @IBOutlet weak var messageLabel         : UILabel!
    @IBOutlet weak var resultHeart          : UIImageView!
    @IBOutlet weak var topImage             : UIImageView!
    @IBOutlet weak var bottomImage          : UIImageView!
    
    var loveManager = LoveManager()
    var loveModel   = [LoveModel]()
    var displayLove : LoveModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loveManager.delegate              = self
        resultView.alpha                  = 0
        resultView.layer.cornerRadius     = 10
        bottomTrimView.layer.cornerRadius = 10
        topTrimView.layer.cornerRadius    = 10
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func calculateTapped(_ sender: Any) {
        loveManager.callAPI(firstName: firstNameTextField.text!, secondName: secondNameTextField.text!)
        resultView.alpha     = 1
        topImage.alpha       = 0
        bottomImage.alpha    = 0
        topTrimView.alpha    = 0
        bottomTrimView.alpha = 0
        animateHeart(view: resultHeart)
    }
    
    @IBAction func recalculateTapped(_ sender: Any) {
        resultView.alpha         = 0
        topImage.alpha           = 1
        bottomImage.alpha        = 1
        topTrimView.alpha        = 1
        bottomTrimView.alpha     = 1
        firstNameTextField.text  = ""
        secondNameTextField.text = ""
        scoreLabel.text          = ""
        messageLabel.text        = ""
    }
    
    func fetchLove(_ love: LoveModel) {
        self.loveModel    = [love]
        messageLabel.text = love.message
        scoreLabel.text   = String(love.result)
    }
}


