//
//  BaseViewController.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

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
        
    }
    
    /// 设置背景颜色
    func setBackGroudColor(color:UIColor) {
        self.view.backgroundColor = color
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
