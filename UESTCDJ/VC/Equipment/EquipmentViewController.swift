//
//  EquipmentViewController.swift
//  UESTCDJ
//
//  Created by JLM on 2020/4/17.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class EquipmentViewController: BaseViewController {
    @IBOutlet weak var swiper: FSPagerView!
    @IBOutlet weak var swiperControl: FSPageControl!
    @IBOutlet weak var introductionBtn: UIButton!
    
    
    private let imageNames = ["cameravc_product_disconnected_inspire-1-raw", "cameravc_product_disconnected_p3c", "cameravc_product_disconnected_m100", "cameravc_product_disconnected_osmoCV600"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenLeftNavigationItem()
        configUI()

        // Do any additional setup after loading the view.
    }

    @IBAction func introductionAction(_ sender: Any) {
        let controller = IntroductionViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func moreAction(_ sender: Any) {
        let controller = KnowMoreViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension EquipmentViewController {
    private func configUI() {
        let imageView = UIImageView(image: UIImage(named: "logo_black_dji"))
//        navigationController.ti
//        self.title
        navigationItem.titleView = imageView
        swiper.backgroundColor = .white
        swiper.automaticSlidingInterval = 2.5
        swiper.isInfinite = true
        swiper.dataSource = self
        swiper.delegate = self
        swiper.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        swiper.itemSize = FSPagerView.automaticSize
        
        swiperControl.numberOfPages = imageNames.count
        //设置下标位置
        swiperControl.contentHorizontalAlignment = .center
        swiperControl.setStrokeColor(.gray, for: .normal)
        swiperControl.setStrokeColor(.white, for: .selected)
        swiperControl.setFillColor(UIColor.ccw.hex(0x999999), for: .normal)
        swiperControl.setFillColor(UIColor.ccw.hex(0x333333), for: .selected)
        swiperControl.setPath(UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: 5, height: 5), cornerRadius: 4.0), for: .normal)
        swiperControl.setPath(UIBezierPath(ovalIn: CGRect(x: 0, y: -1.5, width: 8, height: 8)), for: .selected)
        
        introductionBtn.layer.cornerRadius = 22.0
        introductionBtn.layer.borderColor = UIColor.ccw.hex(0x333333).cgColor
        introductionBtn.layer.borderWidth = 1.0
    }
}

extension EquipmentViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.backgroundColor = .white
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.layer.cornerRadius = 4.0
        cell.imageView?.layer.cornerRadius = 4.0
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        swiperControl?.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        swiperControl?.currentPage = swiper?.currentIndex ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        print("选中\(index)")
        let controller = ControlViewController()
        present(controller, animated: true, completion: nil)
    }
}
