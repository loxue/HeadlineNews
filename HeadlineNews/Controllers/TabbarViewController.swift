//
//  TabbarViewController.swift
//  HeadlineNews
//
//  Created by 马彦春 on 2019/11/20.
//  Copyright © 2019 ZeroJ. All rights reserved.
//

import UIKit

class TabbarViewController : UITabBarController {
    
    // 添加标记
    var indexFlag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addControllers()
    }
    // 添加vc
    private func addControllers() {
        addChildControllers(HomeViewController(), title: "首页", image: "tabbar_icon_home", selectImg: "tabbar_icon_home_sel")
        addChildControllers(WatermelonVideoController(), title: "西瓜视频", image: "tabbar_icon_watermelon", selectImg: "tabbar_icon_watermelon_sel")
        addChildControllers(MiniVideoController(), title: "小视频", image: "tabbar_icon_minivideo", selectImg: "tabbar_icon_minivideo_sel")
        addChildControllers(MeViewController(), title: "我的", image: "tabbar_icon_me", selectImg: "tabbar_icon_me_sel")
    }
    
    // set tabbar
    private func addChildControllers(_ childVC: UIViewController, title: String, image: String, selectImg: String) {
        // 设置title、image、selectImg
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: RGBColor(r: 240, g: 90, b: 90)], for: .selected)
        // 设置导航
        let nav = UINavigationController()
        nav.addChild(childVC)
        addChild(nav)
    }
    
    // item点击
    override func tabBar(_ tabbar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabbar.items?.firstIndex(of: item) {
            if indexFlag != index {
                animationWithIndex(index: index)
            }
        }
    }
    
    // item点击缩放动画
    private func animationWithIndex(index: Int) {
        // 缩放前需要遍历所有控件，拿到每一个item
        var arrViews = [UIView]()
        
        for tabbarBtn in tabBar.subviews {
            if tabbarBtn.isKind(of: NSClassFromString("UITabbarButton")!) {
                arrViews.append(tabbarBtn)
            }
        }
        
        // 添加缩放动画
        let scalsAnimation = CABasicAnimation(keyPath: "transform.scale")
        scalsAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        scalsAnimation.repeatCount = 1
        scalsAnimation.duration = 0.1
        scalsAnimation.autoreverses = true
        scalsAnimation.fromValue = NSNumber(value: 0.7)
        scalsAnimation.toValue = NSNumber(value: 1.1)
        arrViews[index].layer.add(scalsAnimation, forKey: nil)
    }
}
