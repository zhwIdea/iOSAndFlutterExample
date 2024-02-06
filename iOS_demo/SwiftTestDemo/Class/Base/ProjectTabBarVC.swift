//
//  ProjectTabBarVC.swift
//  SwiftTestDemo
//
//  Created by zhw_mac on 2023/10/26.
//

import UIKit

class ProjectTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomePageVC()
        let workbenchVC = ProjectWorkbenchVC()
        let myVC = ProjectMYVC()

        let baseNaviHomeVC = BaseNavigationController(rootViewController: homeVC)
        let baseNaviWorkbenchVC = BaseNavigationController(rootViewController: workbenchVC)
        let baseNaviMyVC = BaseNavigationController(rootViewController: myVC)
  
        // 设置标题和图片 (selectedImage显示问题需在Assets中点击图片修改：Render as: Original image)
        let barItemHome = UITabBarItem(title: "首页", image: UIImage(named: "tab_home_unSelected"), selectedImage: UIImage(named: "tab_home_selected"))
        let baseItemWorkbench = UITabBarItem(title: "工作台", image: UIImage(named: "tab_workbench_unSelected"), selectedImage: UIImage(named: "tab_workbench_selected"))
        let barItemMy = UITabBarItem(title: "我的", image: UIImage(named: "tab_my_unSelected"), selectedImage: UIImage(named: "tab_my_selected"))

        baseNaviHomeVC.tabBarItem = barItemHome
        baseNaviMyVC.tabBarItem = barItemMy
        baseNaviWorkbenchVC.tabBarItem = baseItemWorkbench

        viewControllers = [baseNaviHomeVC, baseNaviWorkbenchVC, baseNaviMyVC]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
