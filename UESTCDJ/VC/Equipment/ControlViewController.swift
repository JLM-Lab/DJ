//
//  ControlViewController.swift
//  UESTCDJ
//
//  Created by JLM on 2020/4/17.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit
import RxSwift

class ControlViewController: BaseViewController {
    // main_dji_logo_iPhone
    private var topStatusView: UIView!
    private var popBtn: UIButton!
    private var connectStatusLabel: UILabel!
    
    /// 顶上的横着几个状态
    private var statusView1: StatusView!
    private var statusView2: StatusView!
    private var statusView3: StatusView!
    private var statusView4: StatusView!
    private var statusView5: StatusView!
    private var statusView6: StatusView!
    private var moreBtn: UIButton!
    
    
    /// 控制弹窗
    private var controlShow = false
    private var controlView: FlyControlView!
    
    /// 页面
    private var layerView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.rightRotation = true
            setRotation(true)
        }
        configUI()
        NotificationCenter.default.addObserver(self, selector: #selector(receiveInfo(info:)), name: NSNotification.Name.init(rawValue: "postImage"), object: nil)
        
    }
    
    @objc private func receiveInfo(info: Notification) {
        guard let info = info.object as? Data else {
            print("数据转化失败")
            return
        }
        layerView.image = UIImage.init(data: info as Data)
    }


   func setRotation(_ rotation : Bool) {
        if rotation {
            UIDevice.current.setValue(NSNumber.init(value: UIInterfaceOrientation.unknown.rawValue), forKey: "orientation")
            UIDevice.current.setValue(NSNumber.init(value: UIInterfaceOrientation.landscapeRight.rawValue), forKey: "orientation")
        } else {
            UIDevice.current.setValue(NSNumber.init(value: UIInterfaceOrientation.unknown.rawValue), forKey: "orientation")
            UIDevice.current.setValue(NSNumber.init(value: UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
    }

    @objc func popAction() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.rightRotation = false
            setRotation(false)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension ControlViewController {
    private func configUI() {
        layerView = UIImageView()
        layerView.backgroundColor = .black
        layerView.contentMode = .scaleAspectFit
        layerView.frame = CGRect(x: 0, y: 0, width: Z_SCREEN_HEIGHT, height: Z_SCREEN_WIDTH)
        view.insertSubview(layerView, at: 0)
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = layerView.bounds
//        gradientLayer.colors = [UIColor.ccw.hex(0x000000).cgColor, UIColor(displayP3Red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0).cgColor, UIColor.ccw.hex(0x000000).cgColor]
//        gradientLayer.locations = [0.0, 0.8, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//        layerView.layer.insertSublayer(gradientLayer, at: 0)
        
        topStatusView = UIView()
        view.addSubview(topStatusView)
        topStatusView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(40.0)
        }
        
        popBtn = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "main_dji_logo_iPhone"), for: .normal)
            $0.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        }
        topStatusView.addSubview(popBtn)
        popBtn.snp.makeConstraints { (make) in
            make.left.equalTo(UIApplication.shared.statusBarFrame.size.height + 10.0)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 35.0, height: 35.0))
        }
        
        connectStatusLabel = UILabel().then {
            $0.text = "设备未连接"
            $0.textColor = .white
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        topStatusView.addSubview(connectStatusLabel)
        connectStatusLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(popBtn.snp.right).offset(16.0)
        }
        
        moreBtn = UIButton(type: .custom).then {
            $0.setImage(UIImage(named: "basic_more_button_icon"), for: .normal)
            $0.addTarget(self, action: #selector(moreBtnTap), for: .touchUpInside)
        }
        topStatusView.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-16)
            make.size.equalTo(CGSize(width: 35.0, height: 35.0))
            make.centerY.equalToSuperview()
        }
        
        statusView6 = StatusView(leftImageName: "basic_battery_icon_iPhone", rightImageName: "NA")
        topStatusView.addSubview(statusView6)
        statusView6.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(moreBtn.snp.left).offset(-10)
        }
        
        statusView5 = StatusView(leftImageName: "HD", rightImageName: "fb_live_level_0")
        topStatusView.addSubview(statusView5)
        statusView5.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(statusView6.snp.left).offset(-10)
        }

        statusView4 = StatusView(leftImageName: "fpv_aircraft_setting_segment_icon_rc", rightImageName: "fb_live_level_0")
        topStatusView.addSubview(statusView4)
        statusView4.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(statusView5.snp.left).offset(-10)
        }

        statusView3 = StatusView(leftImageName: "check_list_aircraft_mode", rightImageName: "fb_live_level_0")
        topStatusView.addSubview(statusView3)
        statusView3.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(statusView4.snp.left).offset(-10)
        }

        statusView2 = StatusView(leftImageName: "check_list_aircraft_mode", rightImageName: "fb_live_level_0")
        topStatusView.addSubview(statusView2)
        statusView2.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(statusView3.snp.left).offset(-10)
        }

        statusView1 = StatusView(leftImageName: "check_list_aircraft_mode", rightImageName: "NA")
        topStatusView.addSubview(statusView1)
        statusView1.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(statusView2.snp.left).offset(-10)
        }
        
        controlView = FlyControlView()
        controlView.showHandler = { [weak self] in
            self?.controlShow(index: nil)
        }
        controlView.isHidden = true
        view.addSubview(controlView)
        controlView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: 页面点击事件
extension ControlViewController {
    private func controlShow(index: Int?) {
        controlView.isHidden = !controlView.isHidden
//        guard let index = index else { return }
        controlView.setIndex(index: index ?? 0)
    }
    
    @objc private func moreBtnTap() {
        controlShow(index: nil)
    }
}


class StatusView: UIView {
    let bag = DisposeBag()
    var leftImageView: UIImageView!
    var rightImageView: UIImageView!
    var leftImageName: String?
    var rightImageName: String?
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(leftImageName: String, rightImageName: String) {
        self.init(frame: CGRect.zero)
        self.leftImageName = leftImageName
        self.rightImageName = rightImageName
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        leftImageView = UIImageView(image: UIImage(named: leftImageName ?? ""))
        addSubview(leftImageView)
        leftImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        rightImageView = UIImageView(image: UIImage(named: rightImageName ?? ""))
        addSubview(rightImageView)
        rightImageView.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp.right).offset(1.0)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
}
