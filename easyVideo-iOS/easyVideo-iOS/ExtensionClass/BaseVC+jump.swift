//
//  BaseVC+jump.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

extension BaseViewController {
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
}
