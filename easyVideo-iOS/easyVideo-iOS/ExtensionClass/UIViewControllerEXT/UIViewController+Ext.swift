//
//  UIViewController+Ext.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import Foundation
import WebKit

public func log(item: Any, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
    print(file + ":\(line):" + function, item)
}

// MARK: BaseViewController
extension BaseViewController {
    
    /// Localized string
    func bundleStr(infoPlistStr str: String) -> String {
        return Bundle(for: type(of: self)).object(forInfoDictionaryKey: str) as! String
    }
    
    /// info.Plist string
    func getInfoString(infoString str: String) -> String {
        let infoDictionary = Bundle.main.infoDictionary
        if infoDictionary?[str] == nil {
            return ""
        }else{
            return (infoDictionary![str] as? String)!
        }
    }
    
    func hiddenNav() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNav() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func customNavItem() {
        let navTitleFont = UIFont.init(name: "Helvetica-BoldOblique", size: 17)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(formHexString: "0x313131") as Any, NSAttributedString.Key.font: navTitleFont as Any]
        UIBarButtonItem.appearance().tintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func createBackItem() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 40))
        view.backgroundColor = UIColor.clear
        let button = UIButton(type: .custom)
        let image = UIImage.init(named: "btn_back")
        let imageview = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 0, y: 10, width: 18, height: 18)
        button.frame = CGRect(x: 0, y: 0, width: 42, height: 40)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        view.addSubview(button)
        view.addSubview(imageview)
        
        let backButtonItem = UIBarButtonItem(customView: view)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        space.width = -17
        self.navigationItem.leftBarButtonItems = [space, backButtonItem]
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

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
            if accoutTF.text?.count == 0 || passwordTF.text?.count == 0 {
                self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                self.hud.label.text = bundleStr(infoPlistStr: "login.note.writePassWord")
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 3)
            }else {
                userLogin(withServer: getInfoString(infoString: ""), withPort: 0, withName: "", withPassword: "")
            }
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
    
}

// MARK: JoinMeeting+Ext

// MARK: Chat+Ext

// MARK: Contact+Ext

// MARK: Me+Ext
extension MeVC {
    func initContent() {
        pushMeDetailBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
    }
    
    func modifyPasswordAction() {
        let alert = UIAlertController(title: "验证原密码", message: "为保障你的数据安全，修改密码前请填写原密码。", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "密码"
        }
        alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case pushMeDetailBtn:
            self.pushUserInformationVC(animated: true)
            break
        default: break
        }
    }
}

// MARK: SettingVC+Ext
extension SettingVC {
    func initContent() {
        self.title = "参数设置"
    }
}

// MARK: InvitaVC+Ext
extension InvitaVC {
    func initContent() {
        self.title = "邀请好友使用"
        
        shareToOneBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
        shareToGroupBtn.addTarget(self, action: #selector(buttonMethod(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case shareToOneBtn:
            break
        case shareToGroupBtn:
            break
        default: break
        }
    }
}

// MARK: AboutVC+Ext
extension AboutVC {
    func initContent() {
        self.title = "关于"
    }
    
    func checkVersion() {
        
    }
}

// MARK: UserInformationVC+Ext
extension UserInformationVC {
    func initContent() {
        self.title = "个人信息"
    }
}
