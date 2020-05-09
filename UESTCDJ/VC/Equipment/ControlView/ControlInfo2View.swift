//
//  ControlInfo0View.swift
//  UESTCDJ
//
//  Created by JLM on 2020/5/9.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class ControlInfo2View: UIView {
    private var titleLabel: UILabel!
    private var contentView: UIScrollView!
    private var btn1: UIButton!
    private var btn2: UIButton!
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
            $0.text = "遥控器设置"
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
        
        let btn1Label = UILabel().then {
            $0.text = "遥控器校准"
            $0.textColor = .white
            $0.textAlignment = .left
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(btn1Label)
        btn1Label.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.left.equalTo(16.0)
            make.height.equalTo(44.0)
            make.right.equalToSuperview()
        }
        btn1 = UIButton()
        contentView.addSubview(btn1)
        btn1.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.left.equalTo(16.0)
            make.height.equalTo(44.0)
            make.right.equalToSuperview()
        }
        let line1 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        contentView.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
            make.height.equalTo(0.5)
            make.top.equalTo(btn1.snp.bottom).offset(0.3)
        }
        
        let btn2View = UIView()
        contentView.addSubview(btn2View)
        btn2View.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom)
            make.left.right.equalToSuperview()
        }
        let btn2TitleLabel = UILabel().then {
            $0.text = "遥感模式"
            $0.textColor = .white
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        btn2View.addSubview(btn2TitleLabel)
        btn2TitleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(16.0)
        }
        let btn2SubTitleLabel = UILabel().then {
            $0.text = "系统默认遥控模式为美国手，更换遥感模式会改变遥控器对飞机的操控方式。如果不熟悉所选择的操作方式，可能会导致严重后果，请谨慎操作。"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
            $0.numberOfLines = 0
        }
        btn2View.addSubview(btn2SubTitleLabel)
        btn2SubTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(btn2TitleLabel.snp.bottom).offset(10)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
            make.bottom.equalTo(-16.0)
        }
        let line2 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        btn2View.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
            make.height.equalTo(0.3)
            make.bottom.equalToSuperview()
        }
        
        
        btn2 = UIButton()
        btn2View.addSubview(btn2)
        btn2.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}
