//
//  DYTabBarController.swift
//  DouYu
//
//  Created by 侯宝伟 on 2019/4/4.
//  Copyright © 2019 zhunjiee. All rights reserved.
//

import UIKit

class DYTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBarItemAttributes()
        setUpAllChildViewController()
    }

    /// 创建所有的子控制器
    func setUpAllChildViewController() {
        let homeVC = DYHomeViewController()
        setUpOneChildViewController(vc: homeVC, imageName: "btn_home_normal", selImageName: "btn_home_selected", title: "首页")
        
        let liveVC = DYLiveViewController()
        setUpOneChildViewController(vc: liveVC, imageName: "btn_column_normal", selImageName: "btn_column_selected", title: "直播")
        
        let followVC = DYFollowViewController()
        setUpOneChildViewController(vc: followVC, imageName: "btn_follow_normal", selImageName: "btn_follow_selected", title: "关注")
        
        let mineVC = DYMineViewController()
        setUpOneChildViewController(vc: mineVC, imageName: "btn_user_normal", selImageName: "btn_user_selected", title: "我的")
    }

    /// 设置单个子控制器
    ///
    /// - Parameters:
    ///   - vc: 子控制器
    ///   - withImageName: tabBar 普通图片
    ///   - selImageName:  tabBar 选中图片
    ///   - title: tabBar 标题
    func setUpOneChildViewController(vc: UIViewController, imageName: String, selImageName: String, title: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selImageName)?.withRenderingMode(.alwaysOriginal)
        let nav = DYNavigationController(rootViewController: vc)
        addChild(nav)
    }
    
}

// MARK: - 设置UI界面
extension DYTabBarController {
    /// 设置 tabBar 的样式
    fileprivate func setUpTabBarItemAttributes() {
        // 设置 tabBar 背景颜色为纯白色，取消毛玻璃效果
        UITabBar.appearance().isTranslucent = false
        
        // 统一设置 tabBar 的文字颜色
        let item = UITabBarItem.appearance()
        // 正常状态颜色
        var normalAttrs = [NSAttributedString.Key : Any]()
        normalAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 12)
        normalAttrs[NSAttributedString.Key.foregroundColor] = DYColor(208, 208, 208)
        item.setTitleTextAttributes(normalAttrs, for: .normal)
        
        // 选中状态颜色
        var selectedAttrs = [NSAttributedString.Key : Any]()
        selectedAttrs[NSAttributedString.Key.foregroundColor] = UIColor.orange
        item.setTitleTextAttributes(selectedAttrs, for: .selected)
    }
}
