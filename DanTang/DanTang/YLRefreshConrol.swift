//
//  YLRefreshConrol.swift
//  DanTang
//
//  Created by 王留根 on 16/8/10.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import UIKit

class YLRefreshConrol: UIRefreshControl {

    //定义变量记录是否需要旋转监听
    private var rotationArrowFlag = false
    // 定义变量记录当前是否正在执行圈圈动画
    private var loadingViewAnimationFlag = false
    
    override init() {
        super.init()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        
    }
    
    private lazy var refreshView: YMRefreshView = YMRefreshView.refreshView()
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}



































