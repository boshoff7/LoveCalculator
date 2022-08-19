//
//  Animation+Extensions.swift
//  LoveCalculator
//
//  Created by Chris Boshoff on 2022/08/19.
//

import Foundation
import UIKit

extension ViewController {
    
    func animateHeart(view: UIView) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.damping = 1
        animation.stiffness = 10
        animation.mass = 3
        animation.duration = 13
        view.layer.add(animation, forKey: nil)
    }
}
