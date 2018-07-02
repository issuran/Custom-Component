//
//  CustomButton.swift
//  Custom Component
//
//  Created by Tiago Oliveira on 01/07/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var view: UIView!
    
    @IBOutlet weak var contentButtonView: UIButton!
    @IBOutlet weak var imageButtonView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let view = CustomButton.nib().instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        contentButtonView.layer.borderColor = UIColor.white.cgColor
        contentButtonView.layer.masksToBounds = true
        contentButtonView.layer.cornerRadius = 8
        contentButtonView.layer.borderWidth = 2
        
        contentButtonView.isUserInteractionEnabled = true
        
        textView.text = "Transferência eletrônica"
        textView.textColor =  .white
        
        view.isUserInteractionEnabled = false
        contentButtonView.showsTouchWhenHighlighted = true
        
        
        imageButtonView.image = UIImage(named: "transfer")
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
}
