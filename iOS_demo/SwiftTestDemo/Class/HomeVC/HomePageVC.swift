//
//  HomeVC.swift
//  SwiftTestDemo
//
//  Created by zhw_mac on 2023/10/26.
//

import UIKit
import flutter_boost

class HomePageVC: UIViewController {
    let textLabel = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        view.backgroundColor = UIColor.white
        
        // 初始化UI
        initUI()
        
        // 设置当前的导航控制器为BoostDelegate的导航控制器，用来控制push的导航栏。
        BoostDelegate.shared.navigationController = self.navigationController;
    }

    func initUI (){
        textLabel.text = "明月几时有，把酒问青天。不知天上宫阙，今夕是何年。我欲乘风归去，又恐琼楼玉宇，高处不胜寒。起舞弄清影，何似在人间。"
        textLabel.backgroundColor = UIColor.darkGray
        textLabel.textColor = UIColor.white
        textLabel.numberOfLines = 0;
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.left.equalTo(60)
            make.right.equalTo(-60);
            make.centerX.equalTo(self.view);
        }

        let nativePushFlutterButton = UIButton()
        nativePushFlutterButton.setTitle("原生页面跳转Flutter页面\n跳转后的页面显示原生导航条", for: UIControl.State.normal)
        nativePushFlutterButton.setTitleColor(.white, for: UIControl.State.normal)
        nativePushFlutterButton.titleLabel?.textAlignment = .center
        nativePushFlutterButton.titleLabel?.numberOfLines = 0;
        nativePushFlutterButton.backgroundColor = .systemOrange
        nativePushFlutterButton.addTarget(self, action: #selector(onClickNativePushFlutterButton), for: UIControl.Event.touchUpInside)
        self.view.addSubview(nativePushFlutterButton)
        
        nativePushFlutterButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp_bottomMargin).offset(80);
            make.size.equalTo(CGSize(width: 260, height: 70));
            make.centerX.equalTo(self.view);
        }

        let nativePushFlutterButton2 = UIButton()
        nativePushFlutterButton2.setTitle("原生页面跳转Flutter页面\n跳转后的页面显示Flutter导航条", for: UIControl.State.normal)
        nativePushFlutterButton2.titleLabel?.textAlignment = .center
        nativePushFlutterButton2.titleLabel?.numberOfLines = 0;
        nativePushFlutterButton2.backgroundColor = .systemOrange
        nativePushFlutterButton2.addTarget(self, action: #selector(onClickNativePushFlutterButton2), for: UIControl.Event.touchUpInside)
        self.view.addSubview(nativePushFlutterButton2)
        
        nativePushFlutterButton2.snp.makeConstraints { make in
            make.top.equalTo(nativePushFlutterButton.snp_bottomMargin).offset(40);
            make.size.equalTo(CGSize(width: 260, height: 70));
            make.centerX.equalTo(self.view);
        }
    }
    
    @objc func onClickNativePushFlutterButton(){
        // 路由参数配置
        let options = FlutterBoostRouteOptions()
        
        // 路由的名称
        options.pageName = "homepage"
        
        // 传递的参数
        options.arguments = ["data" : textLabel.text as Any]
        // 页面是否透明
        options.opaque = true
        options.completion = {completion in
            print("打开Flutter页面的操作完成")
        }
        options.onPageFinished = { dict in
            print("Flutter 页面关闭返回到原生页面时，参数值:\(String(describing: dict))")
        }

        // 执行open()会调用"BoostDelegate"中的"pushFlutterRoute"方法
        FlutterBoost.instance().open(options)
    }
    
    @objc func onClickNativePushFlutterButton2(){
        let options = FlutterBoostRouteOptions()
        options.pageName = "simplePage"
        options.arguments = ["data" : textLabel.text as Any,
                              "isBarHidden":true
                             ]
        options.opaque = true
        options.completion = {completion in
            print("打开Flutter页面的操作完成")
        }
        options.onPageFinished = { dict in
            print("Flutter 页面关闭返回到原生页面时，参数值:\(String(describing: dict))")
        }
        
        // 执行open会调用"BoostDelegate"中的"pushFlutterRoute"方法
        FlutterBoost.instance().open(options)
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
