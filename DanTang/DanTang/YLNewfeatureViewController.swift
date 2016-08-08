//
//  YLNewfeatureViewController.swift
//  DanTang
//
//  Created by 王留根 on 16/8/5.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import UIKit
import SnapKit

let newFeatureID = "newFeatureID"
/**required修饰符只能用于修饰类初始化方法。
当子类含有异于父类的初始化方法时（初始化方法参数类型和数量异于父类），子类必须要实现父类的required初始化方法，并且也要使用required修饰符而不是override。
当子类没有初始化方法时，可以不用实现父类的required初始化方法。*/

class YLNewfeatureViewController: UICollectionViewController {

    //布局对象
    private var layout: UICollectionViewFlowLayout = YMNewfeatureLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.registerClass(YLNewfeatureCell.self, forCellWithReuseIdentifier: newFeatureID)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension YLNewfeatureViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kNewFeatureCount
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(newFeatureID, forIndexPath: indexPath) as! YLNewfeatureCell
        cell.imageIndex = indexPath.item

        return cell
    }
    //完全显示一个cell之后调用
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        //获取当前显示cell的下标
        let path = collectionView.indexPathsForVisibleItems().last!
        if path.item == (kNewFeatureCount - 1){
            let cell = collectionView.cellForItemAtIndexPath(path) as! YLNewfeatureCell
            cell.startBtnAnimation()
        }
        
    }
}

private class YMNewfeatureLayout: UICollectionViewFlowLayout {
    /// 准备布局
    private override func prepareLayout() {
        // 设置 layout 布局
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        // 设置 contentView 属性
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
    }
}

private class YLNewfeatureCell: UICollectionViewCell {
    
    private lazy var iconView = UIImageView()
    /// 延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用@lazy来标示一个延迟存储属性。
    private lazy var startButton: UIButton = {
       let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "btn_begin"), forState: .Normal)
        btn.addTarget(self, action: #selector(startButtonClick), forControlEvents: .TouchUpInside)
        btn.layer.masksToBounds = true;
        btn.hidden = true
        return btn
    }()
    
    private var imageIndex: Int? {
        didSet {
            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
        }
    }
    /**
     属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。有如下特点：
     1，不仅可以在属性值改变后触发didSet，也可以在属性值改变前触发willSet。
     2，给属性添加观察者必须要声明清楚属性类型，否则编译器报错。
     3，willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
     4，didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
     5，属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
     6，即使是设置的值和原来值相同，willSet和didSet也会被调用
     原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_519.html
     */
    @objc func startButtonClick(){
        UIApplication.sharedApplication().keyWindow?.rootViewController = YLTabBarController()
    }
    
    func startBtnAnimation(){
        startButton.hidden = false
        startButton.transform = CGAffineTransformMakeScale(0, 0)
        startButton.userInteractionEnabled = false
        
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { 
            //清空变形
            self.startButton.transform = CGAffineTransformIdentity
            }) { (_) in
                self.startButton.userInteractionEnabled = true
                
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        contentView.addSubview(iconView)
        contentView.addSubview(startButton)
        
        iconView.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        startButton.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_bottom).offset(-50)
            make.size.equalTo(CGSizeMake(150, 40))
            make.centerX.equalTo(contentView.snp_centerX)
        }
    }
}



































