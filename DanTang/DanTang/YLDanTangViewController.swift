//
//  YLDanTangViewController.swift
//  DanTang
//
//  Created by 王留根 on 16/8/4.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import UIKit

class YLDanTangViewController: UIViewController {
    
    var channels = [YLChannel]()
    //标签
    weak var titlesView = UIView()
    //底部红色指示器
    weak var indicatorView = UIView()
    
    weak var contentView = UIScrollView()
    
    weak var selectedBtton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
