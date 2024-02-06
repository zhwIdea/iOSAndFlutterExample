//
//  NewsViewController.swift
//  SwiftTestDemo
//
//  Created by zhw_mac on 2024/2/2.
//

import UIKit

class NewsViewController: UIViewController {
    var arguments = NSDictionary()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "这是一个原生页面"
        self.view.backgroundColor = .white;
        
        let label = UILabel()
        label.text = "下面内容是从Flutter页面传过来的"
        label.textColor = UIColor.black
        self.view.addSubview(label)

        label.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(200)
            make.centerX.equalTo(self.view)
        }
        
        // 获取从Flutter页面传过来的值
        let dataStr = arguments["data"];

        let detailLab = UILabel()
        detailLab.text = (dataStr as! String)
        detailLab.backgroundColor = UIColor.darkGray
        detailLab.textColor = UIColor.white
        detailLab.numberOfLines = 0;
        self.view.addSubview(detailLab)
        
        detailLab.snp.makeConstraints { make in
            make.top.equalTo(label.snp_bottomMargin).offset(30)
            make.left.equalTo(self.view).offset(60)
            make.right.equalTo(self.view).offset(-60)
            make.centerX.equalTo(label)
        }
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
