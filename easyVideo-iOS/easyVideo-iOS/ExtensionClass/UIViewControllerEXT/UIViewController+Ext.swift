//
//  UIViewController+Ext.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import Foundation
import WebKit

// MARK: LoginVC+Ext
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

// MARK: PrivateVC+Ext
extension PrivateVC {
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
            self.PresentPrivateJoinVCPage(animated: true, presentStyle: .fullScreen)
            break
        case loginBtn:
            self.PresentPrivateLoginVCPage(animated: true, presentStyle: .fullScreen)
            break
        case setBtn:
            self.PresentLoginSettingVCPage(animated: true, presentStyle: .fullScreen)
            break
        default: break
        }
    }
}

// MARK: CloudVC+Ext
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
            self.PresentCloudJoinVCCPage(animated: true, presentStyle: .fullScreen)
            break
        case loginBtn:
            self.PresentCloudLoginVCPage(animated: true, presentStyle: .fullScreen)
            break
        case setBtn:
            self.PresentLoginSettingVCPage(animated: true, presentStyle: .fullScreen)
            break
        default: break
        }
    }
}

// MARK: PrivateJoinVC+Ext
extension PrivateJoinVC {
    func initContent() {
        backBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        cameraBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        micPhoneBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        joinBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        advancedSetBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)

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
        case advancedSetBtn:
            self.PresentAdvancedSettingVCPage(animated: true, presentStyle: .fullScreen)
            break
        default: break
        }
    }
}

// MARK: PrivateLoginVC+Ext
extension PrivateLoginVC {
    func initContent() {
        serverTF.layer.cornerRadius = 4
        serverTF.layer.borderWidth = 1
        serverTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        serverTF.layer.masksToBounds = true
        
        accoutTF.layer.cornerRadius = 4
        accoutTF.layer.borderWidth = 1
        accoutTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        accoutTF.layer.masksToBounds = true
        
        passwordTF.layer.cornerRadius = 4
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        passwordTF.layer.masksToBounds = true
        
        backBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        advancedSetBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case backBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case loginBtn:
            break
        case advancedSetBtn:
            self.PresentAdvancedSettingVCPage(animated: true, presentStyle: .fullScreen)
            break
        default: break
        }
    }
}

// MARK: AdvancedSettingVC+Ext
extension AdvancedSettingVC {
    func initContent() {
        portTF.layer.cornerRadius = 4
        portTF.layer.borderWidth = 1
        portTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        portTF.layer.masksToBounds = true
        
        httpSwitch.addTarget(self, action: #selector(switchAction(sender:)), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc func switchAction(sender: UISwitch) {
        switch sender.isOn {
        case true:
            
            break
        case false:
            
            break
        }
    }
    
    @objc func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: LoginSettingVC+Ext
extension LoginSettingVC {
    func initContent() {
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: CloudLoginVC+Ext
extension CloudLoginVC {
    func initContent() {
        backBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        
        accoutTF.layer.cornerRadius = 4
        accoutTF.layer.borderWidth = 1
        accoutTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        accoutTF.layer.masksToBounds = true
        
        passwordTF.layer.cornerRadius = 4
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        passwordTF.layer.masksToBounds = true
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case backBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case loginBtn:
            self.disMissAllModelController(animated: true)
            break
        default: break
        }
    }
}

// MARK:CloudJoinVC+Ext
extension CloudJoinVC {
    func initContent() {
        meetingNumberTF.layer.cornerRadius = 4
        meetingNumberTF.layer.borderWidth = 1
        meetingNumberTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        meetingNumberTF.layer.masksToBounds = true
        
        nameTF.layer.cornerRadius = 4
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.init(formHexString: "0xc1c1c1").cgColor
        nameTF.layer.masksToBounds = true
        
        cameraBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        micPhoneBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        
        backBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        joinBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        micPhoneBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        cameraBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case backBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case joinBtn:
            break
        case cameraBtn:
            break
        case micPhoneBtn:
            break
        default: break
        }
    }
}

// MARK: MeetingVC+Ext
extension MeetingVC {
    func createWKWebView() {
        
        let prefrences = WKPreferences()
        let userContentController = WKUserContentController()
        let webConfiguration = WKWebViewConfiguration()
        userContentController .add(self, name: "callbackObj")
        
        webConfiguration.preferences = prefrences
        webConfiguration.preferences.minimumFontSize = 10
        webConfiguration.preferences.javaScriptEnabled = true
        webConfiguration.preferences.javaScriptCanOpenWindowsAutomatically = false
        webConfiguration.userContentController = userContentController
        
        webKit = WKWebView(frame: self.view.frame, configuration: webConfiguration)
        webKit.navigationDelegate = self as? WKNavigationDelegate
        webKit.uiDelegate = self as? WKUIDelegate
        
        self.view.addSubview(webKit)
        
        let myURL = URL(string: "https://www.baidu.com/")
        let myRequest = URLRequest(url: myURL!)
        webKit.load(myRequest)
    }
    
    func hiddenNav() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
