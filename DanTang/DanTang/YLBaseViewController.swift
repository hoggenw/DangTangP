//
//  YLBaseViewController.swift
//  DanTang
//
//  Created by 王留根 on 16/8/9.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class YLBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        navigationController?.fd_prefersNavigationBarHidden = true
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
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
