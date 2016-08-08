//
//  YLTabBarController.swift
//  DanTang
//
//  Created by 王留根 on 16/8/4.
//  Copyright © 2016年 ios-mac. All rights reserved.
//

import UIKit

class YLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 245 / 255.0, green: 80 / 255.0, blue: 83 / 255.0, alpha: 1.0)

        addViewControllers();
        
    }
    /**
     添加子控制器
     */
    private func addViewControllers(){
        addViewControllerSelf("YLDanTangViewController", title: "单糖", imageName: "TabBar_home_23x23_")
        addViewControllerSelf("YLProductViewController", title: "单品", imageName: "TabBar_gift_23x23_")
        addViewControllerSelf("YLCategoryViewController", title: "分类", imageName: "TabBar_category_23x23_")
        addViewControllerSelf("YLMeViewController", title: "我", imageName: "TabBar_me_boy_23x23_")

    }
    
    private func addViewControllerSelf(childControllerName: String, title:String,imageName: String) {
        // 动态获取命名空间
        let nameSpaceStrig = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        //将字符串转化为类，默认情况下命名空间就是项目名称，但命名空间可以修改
        let cls : AnyClass? = NSClassFromString(nameSpaceStrig + "." + childControllerName)
        let viewControllerClass = cls as! UIViewController.Type
        let vc = viewControllerClass.init()
        /**
         在swift中打印对象时，会发现在类型前面总会有命名空间 .+类名
         在swift中用字符串生成类对象就需要拼接成这样的格式，才能成功生成类
         注意，命名空间不要加特殊符号，不然依然无法获取控制器类
         */
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title 
        //添加导航控制器
        let nav = YLNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav);
        
        
        
        
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































