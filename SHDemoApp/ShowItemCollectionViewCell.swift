//
//  ShowItemCollectionViewCell.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/15/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit
import MaterialComponents
import Material

class ShowItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var rateBackgroundView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var generLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet fileprivate weak var moreButton : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moreButton.setImage(Icon.moreVertical?.tint(with: Color.grey.darken2), for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.generLabel.text = nil
        self.durationLabel.text = nil
        self.rateLabel.text = nil
        self.descriptionLabel.text = nil
//        self.imageView.image = nil
    }
    
    func configure(with item:ShowItemShortModel){
        
        self.titleLabel.text = item.title
        self.generLabel.text = item.genres
        self.durationLabel.text = item.duration
        self.rateLabel.text = item.rating
        self.descriptionLabel.text = item.summary
        
        
    }

}
