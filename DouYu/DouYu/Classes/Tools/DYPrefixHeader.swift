//
//  DYPrefixHeader.swift
//  DouYu
//
//  Created by 侯宝伟 on 2019/4/4.
//  Copyright © 2019 zhunjiee. All rights reserved.
//

import UIKit

// 屏幕尺寸
let DYScreenW = UIScreen.main.bounds.width
let DYScreenH = UIScreen.main.bounds.height
let DYTabBarH = 83
let DYStatusBarH = UIApplication.shared.statusBarFrame.height


// 颜色相关
func DYColor(_ r: Int, _ g: Int, _ b: Int) -> UIColor {
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
}
func DYAlphaColor(_ r: Int, _ g: Int, _ b: Int, _ a: Float) -> UIColor {
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a / 1.0))
}
let DYWhiteColor = UIColor.white
