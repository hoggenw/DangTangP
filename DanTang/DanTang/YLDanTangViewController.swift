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
        setupNav()
        weak var weakSelf = self
        YLNetWorkingTool.shareNetWorkTool.loadHomeTopData  { (ym_channels) in
            for channel in ym_channels {
                let vc = YLTopicViewController()
                vc.title = channel.name!
                vc.type = channel.channelId!
                weakSelf!.addChildViewController(vc)
            }
            weakSelf!.setupTitlesView()
        }

        // Do any additional setup after loading the view.
    }

    /**
     顶部标签栏
     */
    func setupTitlesView() {
        let bgView = UIView()
        bgView.frame = CGRectMake(0, kTitlesViewY, SCREENW, kTitlesViewH)
        view.addSubview(bgView)
        // 标签
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     设置导航栏
     */
    func setupNav(){
//        //不要自动调整Inset
//        automaticallyAdjustsScrollViewInsets = false
//        let contentView = UIScrollView()
//        contentView.frame = view.bounds
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(seachButtonAction))
        
    }
    func seachButtonAction(){
        let searchBarVC = YLSearchViewController()
        self.navigationController?.pushViewController(searchBarVC, animated: true)
        
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
