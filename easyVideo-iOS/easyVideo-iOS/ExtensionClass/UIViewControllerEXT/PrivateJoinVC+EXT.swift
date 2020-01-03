//
//  PrivateJoinVC+EXT.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

extension PrivateJoinVC {
    func initContent() {
        backBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        cameraBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        micPhoneBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        joinBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)

        cameraBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        micPhoneBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        
        serverTF.layer.cornerRadius = 4
        serverTF.layer.borderWidth = 1
        serverTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        serverTF.layer.masksToBounds = true
        
        meetingNumberTF.layer.cornerRadius = 4
        meetingNumberTF.layer.borderWidth = 1
        meetingNumberTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        meetingNumberTF.layer.masksToBounds = true
        
        nameTF.layer.cornerRadius = 4
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        nameTF.layer.masksToBounds = true
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case backBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case cameraBtn:
            break
        case micPhoneBtn:
            break
        case joinBtn:
            break
        default: break
        }
    }
}
