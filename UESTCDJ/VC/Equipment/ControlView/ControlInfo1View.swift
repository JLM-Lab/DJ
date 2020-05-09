//
//  ControlInfo1View.swift
//  UESTCDJ
//
//  Created by JLM on 2020/5/9.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class ControlInfo1View: UIView {

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
            $0.text = "感知设置"
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
        
        let tipLabel0 = UILabel().then {
            $0.text = "启用视觉避障功能"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel0)
        tipLabel0.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.left.equalTo(16.0)
        }
        
        let switch1 = UISwitch().then {
            $0.tintColor = UIColor.white
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 15.0
        }
        contentView.addSubview(switch1)
        switch1.snp.makeConstraints { (make) in
            make.centerY.equalTo(tipLabel0)
            make.right.equalTo(-16.0)
        }
        
        let tipLabel1 = UILabel().then {
            $0.text = "飞行器在前方视野中检测到障碍物时，会自动悬停。（避障系统工作时，最大飞行速度为10.0m/s）"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
            $0.numberOfLines = 0
        }
        contentView.addSubview(tipLabel1)
        tipLabel1.snp.makeConstraints { (make) in
            make.top.equalTo(switch1.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
        
        let tipLabel2 = UILabel().then {
            $0.text = "开启视觉避障功能将自动开启返航障碍物检测，如需关闭返航障碍物检测，请进入高级模式更改"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
            $0.numberOfLines = 0
        }
        contentView.addSubview(tipLabel2)
        tipLabel2.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel1.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
        
        let tipLabel3 = UILabel().then {
            $0.text = "前视感知摄像头的可视角度为水平60度，垂直54度，超出视野范围的障碍物将无法被检测"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
            $0.numberOfLines = 0
        }
        contentView.addSubview(tipLabel3)
        tipLabel3.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel2.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
        
        let tipLabel4 = UILabel().then {
            $0.text = "注意：视觉感知摄像头在光线不充足时将无法正常工作；障碍物检测精度与障碍物大小有关，详细请参考用户指南"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
            $0.numberOfLines = 0
        }
        contentView.addSubview(tipLabel4)
        tipLabel4.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel2.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
        
        let line1 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        contentView.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel4.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
            make.height.equalTo(0.3)
        }
        
        let tipLabel5 = UILabel().then {
            $0.text = "显示雷达图"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel5)
        tipLabel5.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
        }
        
        let switch2 = UISwitch().then {
            $0.tintColor = UIColor.white
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 15.0
        }
        contentView.addSubview(switch2)
        switch2.snp.makeConstraints { (make) in
            make.centerY.equalTo(tipLabel5)
            make.right.equalTo(-16.0)
        }
        
    }

}
