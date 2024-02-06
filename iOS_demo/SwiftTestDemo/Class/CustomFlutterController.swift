//
//  CustomFlutterController.swift
//  BoostTestIOS
//
//  Created by 谢佳培 on 2023/2/1.
//

import UIKit
import flutter_boost

class CustomFlutterController: UIViewController {
    lazy var flutterVC: FBFlutterViewContainer = FBFlutterViewContainer()
    var isBarHidden : Bool?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(self.isBarHidden!, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        addChild(flutterVC)
        view.addSubview(flutterVC.view)
        flutterVC.view.frame = view.bounds
        
        BoostDelegate.shared.navigationController = self.navigationController
    }
    
    func configFlutter(name: String, uniqueId: String?, params: [AnyHashable : Any]?, opaque: Bool) {
        flutterVC.setName(name, uniqueId: uniqueId, params: params, opaque: opaque)
    }
    
    deinit {
        flutterVC.removeFromParent()
    }
}
