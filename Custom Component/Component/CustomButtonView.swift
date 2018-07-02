//
//  CustomButtonView.swift
//  Custom Component
//
//  Created by Tiago Oliveira on 30/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class CustomButtonView: UIView {
    var view: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
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
        let view = CustomButtonView.nib().instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2

        textView.text = "Transferência eletrônica"
        textView.textColor =  .white
        
        imageView.image = UIImage(named: "transfer")
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
