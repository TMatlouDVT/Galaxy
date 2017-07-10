//
//  Model.swift
//  Galaxy
//
//  Created by Garlic Technologies  on 2017/07/09.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit
class Model: NSObject {

    
    lazy var regularBTN: UIButton = {
    
    
        let rBTN = UIButton()
        rBTN.translatesAutoresizingMaskIntoConstraints = false
        
        return rBTN
    }()
    
    let regularView: UIView = {
    
        let rV = UIView()
        rV.translatesAutoresizingMaskIntoConstraints = false
        
        
        return rV
    }()
    
    let regularLBL: UILabel = {
    
        let rLBL = UILabel()
        rLBL.translatesAutoresizingMaskIntoConstraints = false
        
        return rLBL
    }()

}
