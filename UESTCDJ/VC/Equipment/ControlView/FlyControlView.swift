//
//  FlyControlView.swift
//  UESTCDJ
//
//  Created by JLM on 2020/5/9.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

class FlyControlView: UIView {
    
    private var coverView: UIView!
    var showHandler: (() -> Void)?
    private var contentView: UIView!
    private var leftView: UIView!
    private var infoView: UIView!
    
    /// 左侧按钮
    private var leftBtn0: UIButton!
    private var leftBtn1: UIButton!
    private var leftBtn2: UIButton!
    private var leftBtn3: UIButton!
    private var leftBtn4: UIButton!
    private var leftBtn5: UIButton!
    private var leftBtn6: UIButton!
    
    /// 右侧目标
    private var info0: ControlInfo0View!
    private var info1: ControlInfo1View!
    private var info2: ControlInfo2View!
    private var info3: ControlInfo3View!
    private var info4: ControlInfo4View!
    private var info5: ControlInfo5View!
    private var info6: ControlInfo6View!
    
    private var previousIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        coverView = UIView()
        addSubview(coverView)
        coverView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(Z_SCREEN_HEIGHT * 0.3)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(coverTap))
        coverView.addGestureRecognizer(tap)
        coverView.isUserInteractionEnabled = true
        
        contentView = UIView().then {
            $0.backgroundColor = .black
        }
//        contentView.isUserInteractionEnabled = false
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.equalTo(Z_SCREEN_HEIGHT * 0.3)
            make.top.right.bottom.equalToSuperview()
        }
        
        leftView = UIView()
        contentView.addSubview(leftView)
        leftView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(50.0)
        }
        
        let line1 = UIView().then {
            $0.backgroundColor = UIColor.ccw.hex(0xE8D7D7, alpha: 0.5)
        }
        leftView.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(0.3)
        }
        
        infoView = UIView()
        contentView.addSubview(infoView)
        infoView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(leftView.snp.right)
//            make.width.equalTo(Z_SCREEN_HEIGHT * 0.7 - 60)
        }
        
        
        leftBtn0 = UIButton().then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_fc"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_fc_selected"), for: .selected)
        }
        leftBtn0.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 0)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn0)
        
        leftBtn1 = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_perception"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_perception_selected"), for: .selected)
        }
        leftBtn1.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 1)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn1)
        
        leftBtn2 = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_rc"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_rc_selected"), for: .selected)
        }
        leftBtn2.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 2)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn2)
        
        leftBtn3 = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_radio"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_radio_selected"), for: .selected)
        }
        leftBtn3.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 3)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn3)
        
        leftBtn4 = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_battery"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_battery_selected"), for: .selected)
        }
        leftBtn4.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 4)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn4)
        
        leftBtn5 = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_gimbal"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_gimbal_selected"), for: .selected)
        }
        leftBtn5.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 5)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn5)
        
        leftBtn6 = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_other"), for: .normal)
            $0.setImage(UIImage(named: "fpv_aircraft_setting_segment_icon_other_selected"), for: .selected)
        }
        leftBtn6.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.setIndex(index: 6)
        }).disposed(by: rx.disposeBag)
        leftView.addSubview(leftBtn6)
        
        let marginTop = (Z_SCREEN_WIDTH - 20.0 * 7) / 8.0
        leftBtn0.snp.makeConstraints { (make) in
            make.top.equalTo(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        leftBtn1.snp.makeConstraints { (make) in
            make.top.equalTo(leftBtn0.snp.bottom).offset(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        leftBtn2.snp.makeConstraints { (make) in
            make.top.equalTo(leftBtn1.snp.bottom).offset(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        leftBtn3.snp.makeConstraints { (make) in
            make.top.equalTo(leftBtn2.snp.bottom).offset(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        leftBtn4.snp.makeConstraints { (make) in
            make.top.equalTo(leftBtn3.snp.bottom).offset(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        leftBtn5.snp.makeConstraints { (make) in
            make.top.equalTo(leftBtn4.snp.bottom).offset(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        leftBtn6.snp.makeConstraints { (make) in
            make.top.equalTo(leftBtn5.snp.bottom).offset(marginTop)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        info0 = ControlInfo0View()
        info1 = ControlInfo1View()
        info2 = ControlInfo2View()
        info3 = ControlInfo3View()
        info4 = ControlInfo4View()
        info5 = ControlInfo5View()
        info6 = ControlInfo6View()
        
        infoView.addSubview(info0)
        info0.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

/// 对外暴露
extension FlyControlView {
    public func setIndex(index: Int) {
        switch previousIndex {
        case 0:
            info0.removeFromSuperview()
        case 1:
            info1.removeFromSuperview()
        case 2:
            info2.removeFromSuperview()
        case 3:
            info3.removeFromSuperview()
        case 4:
            info4.removeFromSuperview()
        case 5:
            info5.removeFromSuperview()
        case 6:
            info6.removeFromSuperview()
        default:
            break
        }
        
        previousIndex = index
        
        switch index {
        case 0:
            self.leftBtn0.isSelected = true
            self.leftBtn1.isSelected = false
            self.leftBtn2.isSelected = false
            self.leftBtn3.isSelected = false
            self.leftBtn4.isSelected = false
            self.leftBtn5.isSelected = false
            self.leftBtn6.isSelected = false
            infoView.addSubview(info0)
            info0.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case 1:
            self.leftBtn0.isSelected = false
            self.leftBtn1.isSelected = true
            self.leftBtn2.isSelected = false
            self.leftBtn3.isSelected = false
            self.leftBtn4.isSelected = false
            self.leftBtn5.isSelected = false
            self.leftBtn6.isSelected = false
            infoView.addSubview(info1)
            info1.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case 2:
            self.leftBtn0.isSelected = false
            self.leftBtn1.isSelected = false
            self.leftBtn2.isSelected = true
            self.leftBtn3.isSelected = false
            self.leftBtn4.isSelected = false
            self.leftBtn5.isSelected = false
            self.leftBtn6.isSelected = false
            infoView.addSubview(info2)
            info2.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case 3:
            self.leftBtn0.isSelected = false
            self.leftBtn1.isSelected = false
            self.leftBtn2.isSelected = false
            self.leftBtn3.isSelected = true
            self.leftBtn4.isSelected = false
            self.leftBtn5.isSelected = false
            self.leftBtn6.isSelected = false
            infoView.addSubview(info3)
            info3.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case 4:
            self.leftBtn0.isSelected = false
            self.leftBtn1.isSelected = false
            self.leftBtn2.isSelected = false
            self.leftBtn3.isSelected = false
            self.leftBtn4.isSelected = true
            self.leftBtn5.isSelected = false
            self.leftBtn6.isSelected = false
            infoView.addSubview(info4)
            info4.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case 5:
            self.leftBtn0.isSelected = false
            self.leftBtn1.isSelected = false
            self.leftBtn2.isSelected = false
            self.leftBtn3.isSelected = false
            self.leftBtn4.isSelected = false
            self.leftBtn5.isSelected = true
            self.leftBtn6.isSelected = false
            infoView.addSubview(info5)
            info5.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case 6:
            self.leftBtn0.isSelected = false
            self.leftBtn1.isSelected = false
            self.leftBtn2.isSelected = false
            self.leftBtn3.isSelected = false
            self.leftBtn4.isSelected = false
            self.leftBtn5.isSelected = false
            self.leftBtn6.isSelected = true
            infoView.addSubview(info6)
            info6.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        default:
            break
        }
    }
}

extension FlyControlView {
    @objc private func coverTap() {
        showHandler?()
    }
    
    @objc private func leftAction(_ sender: UIButton) {
        setIndex(index: sender.tag)
    }
}
