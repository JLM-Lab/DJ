//
//  EditView.swift
//  xyyd
//
//  Created by JLM on 2020/2/12.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class EditView: UIView {
    var textField: UITextField!
    var title: String?
    var titleLabel: UILabel!
    var placeholder: String?
    var line: SpaceView!
    var titleLabelText: String?
    var isSecurity: Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String, placeHolder: String, titleLabelText: String? = nil, isSecurity: Bool = false) {
        self.init(frame: CGRect.zero)
        self.title = title
        self.placeholder = placeHolder
        self.titleLabelText = titleLabelText
        self.isSecurity = isSecurity
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configUI() {
        backgroundColor = .white
        titleLabel = UILabel().then {
            $0.text = title
            $0.textColor = UIColor.kTextFieldTitle
            $0.font = UIFont.NormalFont(size: 15.0)
        }
        
        textField = UITextField().then {
            if let titleLabelText = titleLabelText {
                $0.text = titleLabelText
                $0.isUserInteractionEnabled = false
            }
            $0.placeholder = placeholder
            $0.textColor = UIColor.kTextFieldTitle
            $0.font = UIFont.NormalFont(size: 15.0)
            $0.isSecureTextEntry = isSecurity ?? false
        }
        line = SpaceView()
        addSubview(textField)
        addSubview(line)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(16.0)
            make.bottom.equalTo(-16.0)
        }
        
        textField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(ScreenUtil.getRelativeWidth(107.0))
            make.height.right.equalToSuperview()
        }
        line.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
    }
}
