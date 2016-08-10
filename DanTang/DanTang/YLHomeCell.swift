//
//  YLHomeCell.swift
//  DanTang
//
//  Created by 王留根 on 16/8/10.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import UIKit
import Kingfisher

protocol YLHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button: UIButton)
}

class YLHomeCell: UITableViewCell {
    weak var delegate: YLHomeCellDelegate?
    
    @IBOutlet var bgImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var favoriteBtn: UIButton!
    
    @IBOutlet var placeholderBtn: UIButton!
    
    var homeItem: YLHomeItem? {
        didSet {
            let url = homeItem!.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil){ (Image,error,CacheType,imageURL) in
                self.placeholderBtn.hidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", forState: .Normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBtn.layer.shouldRasterize = true
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.mainScreen().scale
    }
    
    
    
    @IBAction func favoriteBtn(sender: UIButton) {
        delegate?.homeCellDidClickedFavoriteButton(sender)
    }
    
    
}



























