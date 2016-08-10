//
//  YLNetWorkingTool.swift
//  DanTang
//
//  Created by 王留根 on 16/8/10.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON

class YLNetWorkingTool: NSObject {
    //单列
    static let shareNetWorkTool = YLNetWorkingTool()
    
    /**
     *  获取首页数据
     */
    func loadHomeInfo(id: Int,finished:(homeItems: [YLHomeItem]) ->() ) {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showErrorWithStatus("加载失败")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfoWithStatus(message)
                    return
                }
                let data = dict["data"].dictionary
                //字典转模型
                if let items = data!["items"]?.arrayObject {
                    var homeItems = [YLHomeItem]()
                    for item in items {
                        let homeItem = YLHomeItem(dict: item as! [String: AnyObject])
                        homeItems.append(homeItem)
                    }
                    finished(homeItems: homeItems)
                }
            }
      
        }
    }
    /**
     *  获取首页顶部选择数据
     */
    func loadHomeTopData(finished:(ym_channels: [YLChannel]) -> ()) {
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfoWithStatus(message)
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let channels = data!["channels"]?.arrayObject {
                    var ym_channels = [YLChannel]()
                    for channel in channels {
                        let ym_channel = YLChannel(dict: channel as! [String: AnyObject])
                        ym_channels.append(ym_channel)
                    }
                    finished(ym_channels: ym_channels)
                }
            }
            
        }
    }
}
























