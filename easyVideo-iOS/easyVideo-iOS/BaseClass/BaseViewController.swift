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
    var hud:MBProgressHUD! = nil
    
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
        DispatchQueue.main.async {
            
            let headPath = "\(FileTools.getDocumentsFailePath())/header.jpg"
            self.appDelegate.evengine.downloadUserImage(headPath)
            
            DDLogWrapper.logInfo("[UI] user login onLoginSucceed:username:\(user.username)")
            // update user info
            let userInfo = NSMutableDictionary(dictionary: PlistUtils.loadPlistFilewithFileName(userPlist))
            userInfo.setValue(user.username, forKey: username)
            userInfo.setValue(user.displayName, forKey: displayName)
            userInfo.setValue(user.org, forKey: org)
            userInfo.setValue(user.cellphone, forKey: cellphone)
            userInfo.setValue(user.email, forKey: email)
            userInfo.setValue(user.telephone, forKey: telephone)
            userInfo.setValue(user.token, forKey: token)
            userInfo.setValue(String(user.userId), forKey: userId)
            userInfo.setValue(String(user.deviceId), forKey: deviceId)
            userInfo.setValue(user.doradoVersion, forKey: doradoVersion)
            userInfo.setValue(user.dept, forKey: dept)
            userInfo.setValue(user.customizedH5UrlPrefix, forKey: customizedH5UrlPrefix)
            
            PlistUtils.savePlistFile(userInfo as! [AnyHashable : Any], withFileName: userPlist)
            Manager.shared().delegates.onLoginSucceed(forMg: user)
        }
    }
    
    func onError(_ err: EVError) {
        DispatchQueue.main.async {
            DDLogWrapper.logInfo("[UI] onError msg:\(err.msg) code:\(err.code)")
            if err.type == .sdk || err.type == .locate {
                self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                self.hud.customView = UIImageView.init(image: UIImage.init(named: "wrong_tip"))
                self.hud.detailsLabel.text = "alert.cantconnert.server".localized
                self.hud.show(animated: true)
                self.hud.removeFromSuperViewOnHide = true
                self.hud.hide(animated: true, afterDelay: 3)
            }else if err.type == .server {
                if err.code == 1101 {
                    let alert = "\("alert.passworderror1".localized) \(String((err.args?[0])!)) \("alert.passworderror2".localized)"
                    self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    self.hud.customView = UIImageView.init(image: UIImage.init(named: "wrong_tip"))
                    self.hud.detailsLabel.text = alert
                    self.hud.show(animated: true)
                    self.hud.removeFromSuperViewOnHide = true
                    self.hud.hide(animated: true, afterDelay: 3)
                }else if err.code == 1102 {
                    self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    self.hud.customView = UIImageView.init(image: UIImage.init(named: "wrong_tip"))
                    self.hud.detailsLabel.text = "alert.passworderror3".localized
                    self.hud.show(animated: true)
                    self.hud.removeFromSuperViewOnHide = true
                    self.hud.hide(animated: true, afterDelay: 3)
                }else if err.code == 1100 {
                    self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    self.hud.customView = UIImageView.init(image: UIImage.init(named: "wrong_tip"))
                    self.hud.detailsLabel.text = "errorcode.1100".localized
                    self.hud.show(animated: true)
                    self.hud.removeFromSuperViewOnHide = true
                    self.hud.hide(animated: true, afterDelay: 3)
                }else if err.code == 1112 {
                    self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    self.hud.customView = UIImageView.init(image: UIImage.init(named: "wrong_tip"))
                    self.hud.detailsLabel.text = "error.1112".localized
                    self.hud.show(animated: true)
                    self.hud.removeFromSuperViewOnHide = true
                    self.hud.hide(animated: true, afterDelay: 3)
                }else {
                    self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    self.hud.customView = UIImageView.init(image: UIImage.init(named: "wrong_tip"))
                    self.hud.detailsLabel.text = "alert.cantconnert.server".localized
                    self.hud.show(animated: true)
                    self.hud.removeFromSuperViewOnHide = true
                    self.hud.hide(animated: true, afterDelay: 3)
                }
            }
        }
    }

}
