//
//  BaseViewController.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, EVEngineDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var hud:MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
        
        self.setRootViewAttribute()
        
        self.setBackGroudColor(color: UIColor.white)
        
    }
    
    /// 创建UI
    func createUI() {
        
    }
    
    /// 设置属性
    func setRootViewAttribute() {
        appDelegate.evengine.setDelegate(self as EVEngineDelegate)
    }
    
    /// 设置背景颜色
    func setBackGroudColor(color:UIColor) {
        self.view.backgroundColor = color
    }
    
    // MARK: EVEngineDelegate
    func onLoginSucceed(_ user: EVUserInfo) {
        
    }
    
    func onError(_ err: EVError) {
        
    }

}
