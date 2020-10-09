//
//  HttpTool.swift
//  HeadlineNews
//
//  Created by 马彦春 on 2019/11/20.
//  Copyright © 2019 ZeroJ. All rights reserved.
//

import Foundation
import Alamofire

private let httpShareInstance = HttpTool()

/*  请求方法 */
enum MethodType {
    case get
    case post
}

class HttpTool : NSObject {
    // 单例
    class var shareInstance : HttpTool {
        return httpShareInstance
    }
}

extension HttpTool {
    func requestDatas(_ type : MethodType, urlString : String, paramaters : [String : Any]?, successCallBack : @escaping (_ response : Any) -> ()) {
        // 获取请求类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 发送请求
        Alamofire.request(urlString, method: method, parameters: paramaters, encoding: URLEncoding.default, headers: nil).responseJSON { (responseJson) in
            // 判断请求是否成功
            guard responseJson.result.value != nil else {
                print(responseJson.result.error!)
                return
            }
            // 获取结果
            guard responseJson.result.isSuccess else {
                return
            }
            // 请求成功回调
            if let value = responseJson.result.value {
                successCallBack(value)
            }
        }
    }
}
