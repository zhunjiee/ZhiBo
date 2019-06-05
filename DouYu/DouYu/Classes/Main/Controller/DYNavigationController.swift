//
//  DYNavigationController.swift
//  DouYu
//
//  Created by 侯宝伟 on 2019/4/4.
//  Copyright © 2019 zhunjiee. All rights reserved.
//

import UIKit

class DYNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        interactivePopGestureRecognizer?.delegate = self
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        子页面隐藏 TabBar
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
//            自定义返回按钮样式
            let backBtn = UIButton(type: .custom)
            backBtn.setImage(UIImage(named: "nav_back_btn_n"), for: .normal)
            backBtn.setImage(UIImage(named: "nav_back_btn_n"), for: .highlighted)
//            backBtn.setTitle("返回", for: .normal)
//            backBtn.setTitleColor(UIColor.black, for: .normal)
            backBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
            backBtn.sizeToFit()
            backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return children.count > 1
    }
}

// MARK: - 设置UI界面
extension DYNavigationController {
    /// 设置导航栏的样式
    fileprivate func setUpNavigationBar() {
        let navBar = UINavigationBar.appearance()
        
        // 取消毛玻璃效果，设置导航栏背景色为纯白色
        navBar.isTranslucent = false
        
        // 设置标题文字
        var attrs = [NSAttributedString.Key : Any]()
        attrs[NSAttributedString.Key.font] = UIFont.boldSystemFont(ofSize: 20)
        navBar.titleTextAttributes = attrs
    }
}

// MARK: - 事件监听函数
extension DYNavigationController {
    /// 返回前一个界面
    @objc func goBack() {
        popViewController(animated: true)
    }
}
