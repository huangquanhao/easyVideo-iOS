//
//  UIViewController+Ext.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import Foundation
import WebKit
import MobileCoreServices

public func log(item: Any, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
    print(file + ":\(line):" + function, item)
}

// MARK: BaseViewController
extension BaseViewController {
    
    /// Localized string
    func bundleStr(_ str: String) -> String {
        return Bundle(for: type(of: self)).object(forInfoDictionaryKey: str) as? String ?? ""
    }
    
    /// info.Plist string
    func getInfoString(_ str: String) -> String {
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
        
        let userInfo = PlistUtils.loadPlistFilewithFileName(userPlist)
        if userInfo[username] != nil {
            accoutTF.text = userInfo[username] as? String
        }
        if userInfo[password] != nil {
            passwordTF.text = userInfo[password] as? String
        }
        
        Manager.shared()._addDelegate(self)
    }
    
    @objc func buttonMethod(sender: UIButton) {
        switch sender {
        case backBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case loginBtn:
            if accoutTF.text?.count == 0 || passwordTF.text?.count == 0 {
                self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                self.hud.detailsLabel.text = bundleStr("login.note.writePassWord")
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 3)
            }else {
                DDLogWrapper.logInfo("user login server:\(getInfoString("CloudLoginServer")) port:0 accout:\(accoutTF.text!)")
                userLogin(withServer: getInfoString("CloudLoginServer"), withPort: 0, withAccout: accoutTF.text!, withPassword: passwordTF.text!)
                self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                self.hud.detailsLabel.text = bundleStr("login.note.loginIn")
                self.hud.show(animated: true)
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
    }
    
    func loadMeetingVCWeb() {
        let userInfo = PlistUtils.loadPlistFilewithFileName(userPlist)
        if userInfo[loginState] as? String == "YES" {
            var url = "\(userInfo[customizedH5UrlPrefix] ?? "")/mobile/#/conferences?token=\(userInfo[token] ?? "")"
            
            let languages = NSLocale.preferredLanguages
            let currentLanguage = languages[0]
            if currentLanguage.contains("zh")  {
                url = "\(url)&lang=cn&v=\(userInfo[doradoVersion]!)"
            }else {
                url = "\(url)&lang=en&v=\(userInfo[doradoVersion]!)"
            }
            
            DDLogWrapper.logInfo("[UI] meetingVC web url:\(url)")
            
            let myRequest = URLRequest(url: URL(string: url)!)
            webKit.load(myRequest)
        }
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
    
    func setDisplayContent() {
        let headPath = "\(FileTools.getDocumentsFailePath())/header.jpg"
        userImg.sd_setImage(with: URL.init(fileURLWithPath: headPath), completed: nil)
        
        let userInfo = PlistUtils.loadPlistFilewithFileName(userPlist)
        accoutLb.text = userInfo[username] as? String
        disPlayNameLb.text = userInfo[displayName] as? String
    }
    
    func modifyPasswordAction() {
        let alert = UIAlertController(title: bundleStr("alert.pwd.pop.title"), message: bundleStr("alert.pwd.pop.content"), preferredStyle: .alert)
        alert.addTextField {[weak self] (textField) in
            textField.placeholder = self?.bundleStr("alert.password")
        }
        alert.addAction(UIAlertAction(title: bundleStr("alert.cancel"), style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: bundleStr("alert.sure"), style: .default, handler: { (action) in
            
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
    
    func setDisplayContent() {
        
    }
    
    func modifyDisPlayNameAction() {
        let alert = UIAlertController(title: bundleStr("alert.changeName"), message: "", preferredStyle: .alert)
        alert.addTextField {[weak self] (textField) in
            textField.placeholder = self?.bundleStr("alert.updateName.propt")
            textField.text = PlistUtils.loadPlistFilewithFileName(userPlist)[displayName] as? String
        }
        alert.addAction(UIAlertAction(title: bundleStr("alert.cancel"), style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: bundleStr("alert.sure"), style: .default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginOutAction() {
        let section = JGActionSheetSection.init(title: "", message: bundleStr("alert.note.loginout"), buttonTitles: [bundleStr("alert.sure"), bundleStr("alert.cancel")], buttonStyle: .default)
        
        section?.setButtonStyle(.red, forButtonAt: 0)
        
        let sheet = JGActionSheet.init(sections: [section!])
        sheet?.buttonPressedBlock = {[weak self] (actionSheet, indexPath) in
            if indexPath?.row == 0 {
                
                let user = NSMutableDictionary.init(dictionary: PlistUtils.loadPlistFilewithFileName(userPlist))
                user.setValue("NO", forKey: loginState)
                PlistUtils.savePlistFile(user as! [AnyHashable : Any], withFileName: userPlist)
                
                self?.whetherTheLogin()
                self?.appDelegate.evengine.logout()
            }
            sheet?.dismiss(animated: true)
        }
        
        sheet?.show(in: self.view, animated: true)
    }
    
    func modifyHeadImg() {
        let section = JGActionSheetSection.init(title: "", message: bundleStr("alert.note.loginout"), buttonTitles: [bundleStr("takePhoto"), bundleStr("takeLibrary"), bundleStr("alert.cancel")], buttonStyle: .default)
        
        section?.setButtonStyle(.red, forButtonAt: 2)
        
        let sheet = JGActionSheet.init(sections: [section!])
        sheet?.buttonPressedBlock = {[weak self] (actionSheet, indexPath) in
            if indexPath?.row == 0 {
                if (self?.isCameraAvailable())! && (self?.doesCameraSupportTakingPhotos())! {
                    
                }
            }else if indexPath?.row == 1 {
                
            }
            sheet?.dismiss(animated: true)
        }
        
        sheet?.show(in: self.view, animated: true)
    }
    
    func isCameraAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func doesCameraSupportTakingPhotos() -> Bool {
        return cameraSupportsMedia(String(kUTTypeImage), paramSourceType: .camera)
    }
    
    func cameraSupportsMedia(_ paramMediaType: String, paramSourceType: UIImagePickerController.SourceType) ->Bool {
        var result = false
        if paramMediaType.count == 0 {
            return result
        }
        let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: paramSourceType)! as NSArray
        availableMediaTypes.enumerateObjects { (obj, idx, stop) in
            let mediaType = obj as! String
            if mediaType ==  paramMediaType {
                result = true
            }
        }
        return result
    }
}
