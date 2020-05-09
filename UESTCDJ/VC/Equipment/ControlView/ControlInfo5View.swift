//
//  ControlInfo5View.swift
//  UESTCDJ
//
//  Created by JLM on 2020/5/9.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class ControlInfo5View: UIView {

    private var titleLabel: UILabel!
    private var contentView: UIScrollView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        contentView = UIScrollView()
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel = UILabel().then {
            $0.text = "云台设置"
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
            make.width.equalTo(Z_SCREEN_HEIGHT * 0.7 - 50.0)
            make.height.equalTo(50.0)
        }
    }

}
