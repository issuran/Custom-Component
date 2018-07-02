//
//  CustomCollectionViewCell.swift
//  Custom Component
//
//  Created by Tiago Oliveira on 01/07/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentCellView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    
}
