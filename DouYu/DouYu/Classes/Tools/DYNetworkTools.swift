//
//  DYNetworkTools.swift
//  DouYu
//
//  Created by 侯宝伟 on 2019/4/9.
//  Copyright © 2019 zhunjiee. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class DYNetworkTools {
    class func requestData(URLString: String, type: MethodType, params: [String : Any]?, finishedCallBack: @escaping (_ result: Any) -> Void) {
        let methodType = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: methodType, parameters: params).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "未知的错误")
                return
            }
            finishedCallBack(result)
        }
    }
}
