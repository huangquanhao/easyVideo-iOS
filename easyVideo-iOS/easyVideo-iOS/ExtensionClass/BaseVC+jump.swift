//
//  BaseVC+jump.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

extension BaseViewController {
    // MARK: Presnet
    
    /// 跳转LoginVC
    func PresentLoginVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let login = LoginVC()
        login.modalPresentationStyle = style
        self.present(login, animated: flag, completion: nil)
    }
    
    /// 跳转PrivateVC
    func PresentPricatePage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let privatvc = PrivateVC()
        privatvc.modalPresentationStyle = style
        self.present(privatvc, animated: flag, completion: nil)
    }
    
    /// 跳转CloudVC
    func PresentCloudVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let cloud = CloudVC()
        cloud.modalPresentationStyle = style
        self.present(cloud, animated: flag, completion: nil)
    }
    
    /// 跳转PrivateJoinVC
    func PresentPrivateJoinVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let privatejoinVC = PrivateJoinVC()
        privatejoinVC.modalPresentationStyle = style
        self.present(privatejoinVC, animated: flag, completion: nil)
    }
    
    /// 跳转PrivateLoginVC
    func PresentPrivateLoginVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let privateloginVC = PrivateLoginVC()
        privateloginVC.modalPresentationStyle = style
        self.present(privateloginVC, animated: flag, completion: nil)
    }
    
    /// 跳转AdvancedSettingVC
    func PresentAdvancedSettingVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let advancedSettingVC = AdvancedSettingVC()
        advancedSettingVC.modalPresentationStyle = style
        self.present(advancedSettingVC, animated: flag, completion: nil)
    }
    
    /// 跳转LoginSettingVC
    func PresentLoginSettingVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let loginSettingVC = LoginSettingVC()
        loginSettingVC.modalPresentationStyle = style
        self.present(loginSettingVC, animated: flag, completion: nil)
    }
    
    /// 跳转CloudLoginVC
    func PresentCloudLoginVCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let cloudLoginVC = CloudLoginVC()
        cloudLoginVC.modalPresentationStyle = style
        self.present(cloudLoginVC, animated: flag, completion: nil)
    }
    
    /// 跳着CloudJoinVC
    func PresentCloudJoinVCCPage(animated flag: Bool, presentStyle style: UIModalPresentationStyle) {
        let cloudJoinVC = CloudJoinVC()
        cloudJoinVC.modalPresentationStyle = style
        self.present(cloudJoinVC, animated: flag, completion: nil)
    }
    
    /// dismissAllModalController
    func disMissAllModelController(animated flag:Bool) {
        if self.responds(to: #selector(getter: presentingViewController)) {
            self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        }else {
            self.parent?.parent?.dismiss(animated: false, completion: nil)
        }
    }
}
