//
//  CloudVC+EXT.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

extension CloudVC {
    func initContent() {
        backBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        joinMeetingBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        setBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case backBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case joinMeetingBtn:
            break
        case loginBtn:
            break
        case setBtn:
            break
        default: break
        }
    }
}
