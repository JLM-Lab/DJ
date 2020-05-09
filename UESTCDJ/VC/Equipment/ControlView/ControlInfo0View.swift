//
//  ControlInfo0View.swift
//  UESTCDJ
//
//  Created by JLM on 2020/5/9.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class ControlInfo0View: UIView {
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
            $0.text = "飞控参数设置"
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
            $0.text = "基础设置"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
        }
        
        contentView.addSubview(tipLabel0)
        tipLabel0.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(16.0)
        }
        
        let tipLabel1 = UILabel().then {
            $0.text = "允许切换飞行模式"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel1)
        tipLabel1.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel0.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
        }
        
        let switch1 = UISwitch().then {
            $0.tintColor = UIColor.white
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 15.0
        }
        contentView.addSubview(switch1)
        switch1.snp.makeConstraints { (make) in
            make.centerY.equalTo(tipLabel1)
            make.right.equalTo(-16)
        }
        
        let tipLabel2 = UILabel().then {
            $0.text = "P 模式（定位）- 使用GPS或视觉定位系统实现精确悬停；\nA模式（姿态）- 不使用GPS和视觉定位系统，不能精确悬停；\nF 模式（功能）- 和P模式类似，可使用智能飞行模式。"
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
        
        let line1 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        contentView.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel2.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(16.0)
            make.height.equalTo(0.3)
        }
        
        let tipLabel3 = UILabel().then {
            $0.text = "返航高度"
            $0.textColor = .white
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel3)
        tipLabel3.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
        }

        let textField = UITextField().then {
            $0.placeholder = "20~50m"
            $0.borderStyle = .roundedRect
        }
        contentView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(5.0)
            make.height.equalTo(35.0)
            make.right.equalTo(-16.0)
            make.width.equalTo(100.0)
        }

        let tipLabel4 = UILabel().then {
            $0.text = "返航时，飞行器将上升到设置的最低安全高度返航。如果前/后障碍物感知系统正常工作，飞行器遇障会上升躲避"
            $0.numberOfLines = 0
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
        }
        contentView.addSubview(tipLabel4)
        tipLabel4.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
        let line2 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        contentView.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel4.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(16.0)
            make.height.equalTo(0.5)
        }


        let tipLabel5 = UILabel().then {
            $0.text = "飞行限制"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
        }

        contentView.addSubview(tipLabel5)
        tipLabel5.snp.makeConstraints { (make) in
            make.top.equalTo(line2.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
        }

        let tipLabel6 = UILabel().then {
            $0.text = "新手模式"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel6)
        tipLabel6.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel5.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
        }

        let switch2 = UISwitch().then {
            $0.tintColor = UIColor.white
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 15.0
        }
        contentView.addSubview(switch2)
        switch2.snp.makeConstraints { (make) in
            make.centerY.equalTo(tipLabel6)
            make.right.equalTo(-16)
        }

        let tipLabel7 = UILabel().then {
            $0.text = "新手模式下，飞行器只能在返航点30米的半径范围内飞行，飞行器飞行速度将显著变慢"
            $0.textColor = UIColor.ccw.hex(0x999999)
            $0.font = UIFont.NormalFont(size: 12.0)
            $0.numberOfLines = 0
        }
        contentView.addSubview(tipLabel7)
        tipLabel7.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel6.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
        }
        
        let line3 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        contentView.addSubview(line3)
        line3.snp.makeConstraints { (make) in
            make.top.equalTo(tipLabel7.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(16.0)
            make.height.equalTo(0.5)
        }

        let tipLabel8 = UILabel().then {
            $0.text = "限高"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel8)
        tipLabel8.snp.makeConstraints { (make) in
            make.top.equalTo(line3.snp.bottom).offset(5.0)
            make.left.equalTo(16.0)
        }

        let textField2 = UITextField().then {
            $0.placeholder = "20~50m"
            $0.borderStyle = .roundedRect
        }
        contentView.addSubview(textField2)
        textField2.snp.makeConstraints { (make) in
            make.top.equalTo(line3.snp.bottom).offset(5.0)
            make.height.equalTo(35.0)
            make.right.equalTo(-16.0)
            make.width.equalTo(100.0)
        }
        
        let line4 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        contentView.addSubview(line4)
        line4.snp.makeConstraints { (make) in
            make.top.equalTo(textField2.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
            make.right.equalTo(16.0)
            make.height.equalTo(0.5)
        }

        let tipLabel9 = UILabel().then {
            $0.text = "距离限制"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        contentView.addSubview(tipLabel9)
        tipLabel9.snp.makeConstraints { (make) in
            make.top.equalTo(line4.snp.bottom).offset(10.0)
            make.left.equalTo(16.0)
        }

        let switch3 = UISwitch().then {
            $0.tintColor = UIColor.white
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 15.0
        }
        contentView.addSubview(switch3)
        switch3.snp.makeConstraints { (make) in
            make.centerY.equalTo(tipLabel9)
            make.right.equalTo(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }
}
