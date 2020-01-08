//
//  LoginVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {

    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var cloudImg: UIImageView!
    @IBOutlet weak var companyLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.once(token: "LoginVC", block: {
            let userInfo = PlistUtils.loadPlistFilewithFileName(userPlist)
            if userInfo[loginMethod] != nil {
                if userInfo[loginMethod] as? String == "cloud" {
                    self.PresentCloudVCPage(animated: true, presentStyle: .fullScreen)
                }else if userInfo[loginMethod] as? String == "private" {
                    self.PresentPricatePage(animated: true, presentStyle: .fullScreen)
                }
            }
        })
    }
}
