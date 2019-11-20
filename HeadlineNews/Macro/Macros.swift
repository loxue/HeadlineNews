//
//  Macros.swift
//  HeadlineNews
//
//  Created by 马彦春 on 2019/11/20.
//  Copyright © 2019 ZeroJ. All rights reserved.
//

import UIKit

// 屏幕宽高
let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height

// window
let keyWindow = UIApplication.shared.keyWindow

// 是否iPhone
let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
let kIsIphoneX = Bool(kScreenW >= 375.0 && kScreenH >= 812.0 && kIsIphone)

// navbar statusbar tabbar height
let kNavigationBarH = CGFloat(kIsIphoneX ? 88.0 : 64.0)
let kStatusBarH = CGFloat(kIsIphoneX ? 44.0 : 20.0)
let kTabbarH = CGFloat(kIsIphoneX ? (49.0+34.0) : 49.0)

// color
func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

// font
func customFont(font: CGFloat) -> UIFont {
    // 刘海屏
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font)
    }
    // 5.5
    guard kScreenH == 736 else {
        return UIFont.systemFont(ofSize: font - 2)
    }
    // 4.7
    guard kScreenH >= 736 else {
        return UIFont.systemFont(ofSize: font - 4)
    }
    
    return UIFont.systemFont(ofSize: font)
}
