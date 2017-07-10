//
//  Cell.swift
//  Galaxy
//
//  Created by Garlic Technologies  on 2017/07/09.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {


    let backgroundImage: UIImageView = {
    
        let bI = UIImageView()
        bI.translatesAutoresizingMaskIntoConstraints = false
        bI.image = UIImage(named: "firewatchMoon")
        
        return bI
    }()
    
    let cityName: UILabel = {
    
        let cN = UILabel()
        cN.translatesAutoresizingMaskIntoConstraints = false
        cN.textColor = .white
        cN.textAlignment = NSTextAlignment.center
        cN.text = "Cape Town"
        
        return cN
    }()
    
    let tempLabel: UILabel = {
    
        let tL = UILabel()
        tL.translatesAutoresizingMaskIntoConstraints = false
        tL.textAlignment = NSTextAlignment.center
        tL.textColor = .white
        tL.text = "!2"
        
        return tL
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup(){
    
        addSubview(backgroundImage)
        addSubview(cityName)
        addSubview(tempLabel)
        
        backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        cityName.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        cityName.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cityName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cityName.widthAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        
        tempLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: cityName.rightAnchor).isActive = true
        tempLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
