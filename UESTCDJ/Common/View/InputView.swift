//
//  InputView.swift
//  xyyd
//
//  Created by JLM on 2020/2/5.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit
import SnapKit
import Then

class InputView: UIView {
    var textField: UITextField!
    var isSecurity: Bool?
    var placeholder: String?
    var line: SpaceView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeHolder: String, isSecurity: Bool = false) {
        self.init(frame: CGRect.zero)
        self.isSecurity = isSecurity
        self.placeholder = placeHolder
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configUI() {
        textField = UITextField().then {
            $0.placeholder = placeholder
            $0.textColor = UIColor.kTextFieldTitle
            $0.font = UIFont.NormalFont(size: 15.0)
            $0.isSecureTextEntry = isSecurity ?? false
        }
        line = SpaceView()
        addSubview(textField)
        addSubview(line)
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.width.equalToSuperview()
            make.height.equalTo(25)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(4)
            make.bottom.width.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
}
