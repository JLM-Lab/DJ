//
//  SpaceView.swift
//  xyyd
//
//  Created by JLM on 2020/2/5.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class SpaceView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.kSpaceGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
