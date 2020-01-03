//
//  LoginVC+EXT.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

extension LoginVC {
    func initContent() -> Void {
        let companyGest = UITapGestureRecognizer(target: self, action: #selector(self.companyTap))
        let cloudGest = UITapGestureRecognizer(target: self, action: #selector(self.cloudTap))
        
        self.companyImg.addGestureRecognizer(companyGest)
        self.cloudImg.addGestureRecognizer(cloudGest)
    }
    
    @objc func companyTap() -> Void {
        self.PresentPricatePage(animated: true, presentStyle: .fullScreen)
    }
    
    @objc func cloudTap() -> Void {
        self.PresentCloudVCPage(animated: true, presentStyle: .fullScreen)
    }
}
