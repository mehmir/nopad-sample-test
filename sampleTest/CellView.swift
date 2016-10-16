//
//  CellView.swift
//  sampleTest
//
//  Created by Mehdi on 10/16/16.
//  Copyright © 2016 mehdi. All rights reserved.
//

import UIKit

class CellView : UIView
{
    private var titleLabel = UILabel()
    private var priceLabel = UILabel()
    private var imageView = UIImageView()
    
    private var title : String?
    private var price : String?
    private var imageUrl: String?
    
    
    init(title: String, price: String, imageUrl:String)
    {
        let frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        super.init(frame: frame)
        
        self.title = title
        self.price = price
        self.imageUrl = imageUrl
        
        titleLabel.text = self.title
        priceLabel.text = self.price
        imageView.downloadedFrom(link: imageUrl, contentMode: .scaleToFill)
        
        setImageProperties()
        addConstraints()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addViews()
    {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
    }
    
    private func addConstraints()
    {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let centerImageConstraint = NSLayoutConstraint(item: self.imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let topImageConstraint = NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8)
        let heightImageConstraint = NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.6, constant: 0)
        let aspectImageConstraint = NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0)
        imageView.addConstraint(aspectImageConstraint)
        
        self.addConstraint(centerImageConstraint)
        self.addConstraint(topImageConstraint)
        self.addConstraint(heightImageConstraint)
        
        
        let topTitleConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.imageView, attribute: .bottom, multiplier: 1, constant: 4)
        let centerTitleConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        
        self.addConstraint(topTitleConstraint)
        self.addConstraint(centerTitleConstraint)
        
        let topPriceConstraint = NSLayoutConstraint(item: self.priceLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 4)
        let centerPriceConstraint = NSLayoutConstraint(item: self.priceLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        
        self.addConstraint(topPriceConstraint)
        self.addConstraint(centerPriceConstraint)

    }
    
    private func setImageProperties()
    {
        imageView.layer.cornerRadius = 10;
        imageView.clipsToBounds = true;
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.darkGray.cgColor
    }
}
