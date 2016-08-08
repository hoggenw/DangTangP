//
//  YLChannel.swift
//  DanTang
//
//  Created by 王留根 on 16/8/8.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import Foundation

class YLChannel: NSObject {

    var editable: Bool?
    var channelId: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        channelId = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
    
}
