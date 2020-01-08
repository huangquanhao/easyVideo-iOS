//
//  CloudLoginVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class CloudLoginVC: BaseViewController, ManagerDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var accoutTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initContent()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Manager.shared().removeDelegate(self)
    }
    
    func onLoginSucceed(forMg user: EVUserInfo) {
        hud.hide(animated: true)
        let userInfo = NSMutableDictionary(dictionary: PlistUtils.loadPlistFilewithFileName(userPlist))
        userInfo.setValue("YES", forKey: loginState)
        userInfo.setValue("cloud", forKey: loginMethod)
        userInfo.setValue(passwordTF.text!, forKey: password)
        PlistUtils.savePlistFile(userInfo as! [AnyHashable : Any], withFileName: userPlist)
        
        self.disMissAllModelController(animated: true)
    }

}
