//
//  DYHomeViewController.swift
//  DouYu
//
//  Created by 侯宝伟 on 2019/4/4.
//  Copyright © 2019 zhunjiee. All rights reserved.
//

import UIKit

class DYHomeViewController: DYBaseViewController {
    // MARK: - 懒加载
    fileprivate lazy var btn : UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setTitle("点击", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
}

// MARK: - 设置UI界面
extension DYHomeViewController {
    fileprivate func setUpView() {
        navigationItem.title = "首页"
        view.backgroundColor = DYWhiteColor
        view.addSubview(btn)
        btn.center = view.center
        btn.addTarget(self, action: #selector(goViewController), for: .touchUpInside)
    }
}

// MARK: - 事件监听函数
extension DYHomeViewController {
    @objc func goViewController() {
        let vc = DYGameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - 网络数据的请求
extension DYHomeViewController {
    fileprivate func loadData() {
        DYNetworkTools.requestData(URLString: "http://www.baidu.com", type: .post, params: nil) { (result : Any) in
            
        }
    }
}
