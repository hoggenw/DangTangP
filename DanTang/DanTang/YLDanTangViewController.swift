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
    
    weak var selectedButton = UIButton()

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
            //设置顶部标签栏
            weakSelf!.setupTitlesView()
            //底部的scrollview
            weakSelf!.setupContentView()
        }

        // Do any additional setup after loading the view.
    }
    
    //底部的Scrollview
    func setupContentView() {
        //不要自动调整Inset
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSizeMake(contentView.width * CGFloat(childViewControllers.count), 0)
        contentView.pagingEnabled = true
        view.insertSubview(contentView, atIndex: 0)
        self.contentView = contentView
        //添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)
    }

    /**
     顶部标签栏
     */
    func setupTitlesView() {
        let bgView = UIView()
        bgView.frame = CGRectMake(0, kTitlesViewY, SCREENW, kTitlesViewH)
        view.addSubview(bgView)
        // 标签
        let titlesView  = UIView()
        titlesView.backgroundColor = YMGlobalColor()
        titlesView.frame =  CGRectMake(0, 0, SCREENW - kTitlesViewH, kTitlesViewH)
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = YMGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH - kIndicatorViewH
        indicatorView.tag = -1
        self.indicatorView = indicatorView
        
        // 选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRectMake(SCREENW - kTitlesViewH, 0, kTitlesViewH, kTitlesViewH)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), forState: .Normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick(_:)), forControlEvents: .TouchUpInside)
        arrowButton.backgroundColor = YMGlobalColor()
        bgView.addSubview(arrowButton)
        //内部子标签
        let count  = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x = CGFloat(index) * width
            button.tag = index
            let vc = childViewControllers[index]
            button.titleLabel!.font = UIFont.systemFontOfSize(14)
            button.setTitle(vc.title!, forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.setTitleColor(YMGlobalRedColor(), forState: .Disabled)
            button.addTarget(self, action: #selector(titlesClick(_:)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            //默认点击了第一个按钮
        }
        
        
    }
    
    func titlesClick(button: UIButton) {
        //修改按钮状态
        selectedButton!.enabled = true
        button.enabled = false
        selectedButton = button
        //让标签执行动画
        UIView.animateWithDuration(kAnimationDuration) { 
            self.indicatorView!.width = self.selectedButton!.titleLabel!.width
            self.indicatorView!.centerX = self.selectedButton!.centerX
        }
        //滚动，切换子控制器
        var offset = contentView!.contentOffset
        offset.x = CGFloat(button.tag) * contentView!.width
        contentView!.setContentOffset(offset, animated: true)
        
    }
    /// 箭头按钮点击
    func arrowButtonClick(button: UIButton) {
        UIView.animateWithDuration(kAnimationDuration) {
            button.imageView?.transform = CGAffineTransformRotate(button.imageView!.transform, CGFloat(M_PI))
        }
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

extension YLDanTangViewController: UIScrollViewDelegate {
    
      func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        // 添加子控制器的 view
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0 // 设置控制器的y值为0(默认为20)
        //设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
}



























