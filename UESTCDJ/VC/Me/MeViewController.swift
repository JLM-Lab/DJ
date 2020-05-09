//
//  MeViewController.swift
//  UESTCDJ
//
//  Created by JLM on 2020/4/17.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MeViewController: BaseViewController {
    private var iconImageView: UIImageView!
    private var phoneLabel: UILabel!
    private var desLabel: UILabel!
    private var loginBtn: UIButton!
    private let bag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserManager.shared.user != nil {
            phoneLabel.isHidden = false
            desLabel.isHidden = false
            loginBtn.isHidden = true
            let phoneString = UserManager.shared.user?.mobile ?? ""
            var phoneText = ""
            for (index,item) in phoneString.enumerated() {
                if index < 3 {
                    phoneText.append(item)
                } else if index >= 7 {
                    phoneText.append(item)
                } else {
                    phoneText.append("*")
                }
            }
            phoneLabel.text = phoneText
        } else {
            phoneLabel.isHidden = true
            desLabel.isHidden = true
            loginBtn.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
        hiddenLeftNavigationItem()
//        view.backgroundColor = .kSpace5F5
        hiddenLeftNavigationItem()
        configureRightItem()
        
        let topImageView = UIImageView(image: UIImage(named: "img_background"))
        view.addSubview(topImageView)
        topImageView.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        iconImageView = UIImageView(image: UIImage(named: "icon_head portrait_me"))
        iconImageView.layer.cornerRadius = 30.0
        view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(30.0)
            make.left.equalTo(16.0)
            make.size.equalTo(CGSize(width: 60.0, height: 60.0))
        }
        
        phoneLabel = UILabel().then {
            $0.text = "189****9308"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.MediumFont(size: 16.0)
        }
        topImageView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(40.0)
            make.left.equalTo(92.0)
        }
        
        desLabel = UILabel().then {
            $0.text = "相信美好的事情即将发生"
            $0.textColor = UIColor.ccw.hex(0xffffff)
            $0.font = UIFont.NormalFont(size: 14.0)
        }
        topImageView.addSubview(desLabel)
        desLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel.snp.bottom).offset(1)
            make.left.equalTo(92.0)
        }
        
        loginBtn = UIButton().then {
            $0.setTitle("登录/注册", for: .normal)
            $0.setTitleColor(UIColor.KThreeGray, for: .normal)
            $0.titleLabel?.font = UIFont.MediumFont(size: 20.0)
            $0.addTarget(self, action: #selector(jumpToLogin), for: .touchUpInside)
        }
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(10.0)
            make.height.equalTo(iconImageView)
        }
        
        let actionsView = UIView()
        actionsView.layer.cornerRadius = 7.0
        actionsView.backgroundColor = UIColor.ccw.hex(0xffffff)
        view.addSubview(actionsView)
        actionsView.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(120.0)
            make.left.equalTo(14.0)
            make.right.equalTo(-14.0)
            make.height.equalTo(ScreenUtil.kScreenWidth / 375 * 85)
        }
        
        let actionNames = ["足迹", "个人资料", "技术支持", "设置"]
        for index in 1...4 {
            let btn = ActionView()
            btn.subject.value = ["title":actionNames[index - 1],"img": UIImage(named: "profile_action_\(index)") ?? UIImage()]
            btn.tag = index
            actionsView.addSubview(btn)
            let y = (index - 1) % 6
            let left = ((ScreenUtil.kScreenWidth - 72.0 - 44.0 * 4.0) / 3.0 + 44.0) * CGFloat(y) + 24.0
            btn.snp.makeConstraints { (make) in
                make.left.equalTo(left)
                make.width.equalTo(38.0)
                make.top.equalToSuperview().offset(14.0)
                make.height.equalTo(ScreenUtil.kScreenWidth / 375 * 85 - 14)
            }
            let tap = UITapGestureRecognizer()
            btn.addGestureRecognizer(tap)
            btn.isUserInteractionEnabled = true
            tap.rx.event.subscribe(onNext: { [weak self] (_) in
                self?.jumpToSetting(index: index)
            }).disposed(by: bag)
        }
        
    }
    
    private func configureRightItem() {
        let done = UIButton()
        done.frame = CGRect.init(origin: .zero, size: CGSize.init(width: 44, height: 44))
        done.setTitle("更多", for: .normal)
        done.setTitleColor(UIColor.ccw.hex(0x3377FF), for: .normal)
        done.titleLabel?.font = UIFont.NormalFont(size: 16.0)
        done.addTarget(self, action: #selector(jumpToFeedBack), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: done)
    }
    
    @objc private func jumpToFeedBack() {
        if UserManager.shared.user != nil {
//            let controller = FeedBackViewController()
//            controller.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(controller, animated: true)
        } else {
            jumpToLogin()
        }
    }
    
    @objc private func jumpToSetting(index: Int) {
        if UserManager.shared.user != nil {
//            if index == 4 {
//                let controller = SettingViewController()
//                controller.hidesBottomBarWhenPushed = true
//                navigationController?.pushViewController(controller, animated: true)
//            } else {
//                MBProgressHUD.show(text: AppConf.shared.todoMsg, onView: view)
//            }
        } else {
            jumpToLogin()
        }
    }
    
    @objc private func jumpToLogin() {
//        let controller = InputPhoneViewController()
//        controller.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(controller, animated: true)
    }
}


class ActionView: UIView {
    let bag = DisposeBag()
    let subject = Variable<[String:Any]>([:])
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        titleLabel.font = UIFont.NormalFont(size: 13.0)
        titleLabel.textColor = UIColor.ccw.hex(0x878787, alpha: 1)
        subject.asObservable().subscribe(onNext: { [weak self] value in
            if let title = value["title"] as? String {
                self?.titleLabel.text = title
            }
            if let img = value["img"] as? UIImage {
                self?.iconImageView.image = img
            }
        }).disposed(by: bag)
        addSubview(iconImageView)
        addSubview(titleLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.width.equalTo(iconImageView.snp.height).multipliedBy(1)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.bottom).offset(8)
            make.centerX.equalTo(iconImageView)
        }
    }
}
