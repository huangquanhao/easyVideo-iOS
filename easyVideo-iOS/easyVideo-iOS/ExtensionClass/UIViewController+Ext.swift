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
    /// info.Plist string
    func getInfoString(_ str: String) -> String {
        let infoDictionary = Bundle.main.infoDictionary
        if infoDictionary?[str] == nil {
            return ""
        }else{
            return (infoDictionary![str] as? String)!
        }
    }
    
    func showErrorHud(_ str: String, _ time: TimeInterval) {
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.hud.customView = UIImageView(image: UIImage(named: "wrong_tip"))
        self.hud.detailsLabel.text = str
        self.hud.mode = .customView
        self.hud.show(animated: true)
        self.hud.removeFromSuperViewOnHide = true
        self.hud.hide(animated: true, afterDelay: time)
    }
    
    func showNormalHud(_ str: String, _ time: TimeInterval) {
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.hud.detailsLabel.text = str
        self.hud.removeFromSuperViewOnHide = true
        self.hud.show(animated: true)
        self.hud.hide(animated: true, afterDelay: time)
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
                showErrorHud("login".localized, 3)
            }else {
                DDLogWrapper.logInfo("user login server:\(getInfoString("CloudLoginServer")) port:0 accout:\(accoutTF.text!)")
                userLogin(withServer: getInfoString("CloudLoginServer"), withPort: 0, withAccout: accoutTF.text!, withPassword: passwordTF.text!)
                showNormalHud("login.note.loginIn".localized, 3)
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
        userImg.image = UIImage.init(contentsOfFile: headPath)
        
        let userInfo = PlistUtils.loadPlistFilewithFileName(userPlist)
        accoutLb.text = userInfo[username] as? String
        disPlayNameLb.text = userInfo[displayName] as? String
    }
    
    func modifyPasswordAction() {
        let alert = UIAlertController(title: "alert.pwd.pop.title".localized, message: "alert.pwd.pop.content".localized, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "alert.password".localized
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "alert.cancel".localized, style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "alert.sure".localized, style: .default, handler: { (action) in
            let textField = alert.textFields![0]
            if textField.text?.count != 0 {
                let userInfo = PlistUtils.loadPlistFilewithFileName(userPlist)
                if textField.text == userInfo[password] as? String {
                    self.pushModifyPasswordVC(animated: true)
                }else {
                    self.showErrorHud("alert.passwordError".localized, 3)
                }
            }
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
        self.title = "me.invite".localized
        
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

// MARK: ModifyPasswordVC+Ext
extension ModifyPasswordVC {
    func initContent() {
        self.title = "title.modifyPassword".localized
        
        let buttonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(modifyPasswordAction))
        buttonItem.tintColor = UIColor.init(formHexString: "0xf04848")
        self.navigationItem.rightBarButtonItem = buttonItem
        
        self.view.backgroundColor = UIColor.init(formHexString: "0xf7f7f7")
    }
    
    @objc func modifyPasswordAction() {
        let cell = tab.cellForRow(at: NSIndexPath.init(row: 0, section: 1) as IndexPath) as! NormalWithTFCell
        let cell2 = tab.cellForRow(at: NSIndexPath.init(row: 1, section: 1) as IndexPath) as! NormalWithTFCell
        
        if cell.cellTF.text?.count == 0 || cell2.cellTF.text?.count == 0 {
            showErrorHud("alert.pass.note.writeNew".localized, 3)
        }else if !CheckString(cell.cellTF.text!, 4, 16) {
            showErrorHud("alert.pass.note.format".localized, 3)
        }else if cell.cellTF.text != cell2.cellTF.text {
            showErrorHud("alert.pass.note.notMatch".localized, 3)
        }else {
            if appDelegate.evengine.changePassword(appDelegate.evengine.encryptPassword(PlistUtils.loadPlistFilewithFileName(userPlist)[password] as! String), newpassword: appDelegate.evengine.encryptPassword(cell.cellTF.text!)) == 0 {
                
                showNormalHud("alert.changepasswordok".localized, 1)
                self.perform(#selector(loginOut), with: self, afterDelay: 1)
            }
        }
    }
    
    func CheckString(_ str: String, _ minLen: Int, _ maxLen: Int) -> Bool {
        if str.count > maxLen || str.count < minLen {
            return false
        }
        
        return true
    }
    
    @objc func loginOut() {
        let user = NSMutableDictionary.init(dictionary: PlistUtils.loadPlistFilewithFileName(userPlist))
        user.setValue("NO", forKey: loginState)
        PlistUtils.savePlistFile(user as! [AnyHashable : Any], withFileName: userPlist)
        
        appDelegate.evengine.logout()
        whetherTheLogin()
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
        let alert = UIAlertController(title: "alert.changeName".localized, message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "alert.updateName.propt".localized
            textField.text = PlistUtils.loadPlistFilewithFileName(userPlist)[displayName] as? String
        }
        alert.addAction(UIAlertAction(title: "alert.cancel".localized, style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "alert.sure".localized, style: .default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginOutAction() {
        let section = JGActionSheetSection.init(title: "", message: "alert.note.loginout".localized, buttonTitles: ["alert.sure".localized, "alert.cancel".localized], buttonStyle: .default)
        
        section?.setButtonStyle(.red, forButtonAt: 0)
        
        let sheet = JGActionSheet.init(sections: [section!])
        sheet?.buttonPressedBlock = {[weak self] (actionSheet, indexPath) in
            if indexPath?.row == 0 {
                
                let user = NSMutableDictionary.init(dictionary: PlistUtils.loadPlistFilewithFileName(userPlist))
                user.setValue("NO", forKey: loginState)
                PlistUtils.savePlistFile(user as! [AnyHashable : Any], withFileName: userPlist)
                
                self?.appDelegate.evengine.logout()
                self?.whetherTheLogin()
            }
            sheet?.dismiss(animated: true)
        }
        
        sheet?.show(in: self.view, animated: true)
    }
    
    func modifyHeadImg() {
        let section = JGActionSheetSection.init(title: "", message: "alert.note.loginout".localized, buttonTitles: ["takePhoto".localized, "takeLibrary".localized, "alert.cancel".localized], buttonStyle: .default)
        
        section?.setButtonStyle(.red, forButtonAt: 2)
        
        let sheet = JGActionSheet.init(sections: [section!])
        sheet?.buttonPressedBlock = {[weak self] (actionSheet, indexPath) in
            if indexPath?.row == 0 {
                if (self?.isCameraAvailable())! && (self?.doesCameraSupportTakingPhotos())! {
                    self?.imgPicker.sourceType = .camera
                    if (self?.isFrontCameraAvailable())! {
                        self?.imgPicker.cameraDevice = .front
                    }
                    
                    self?.imgPicker.mediaTypes = [(kUTTypeImage as String)]
                    self?.imgPicker.delegate = self
                    self?.imgPicker.allowsEditing = true
                    self?.imgPicker.transitioningDelegate = self
                    self?.imgPicker.modalPresentationStyle = .fullScreen
                    
                    self?.present(self!.imgPicker, animated: true, completion: {
                        DDLogWrapper.logInfo("[UI] user open camera")
                    })
                }
            }else if indexPath?.row == 1 {
                if (self?.isPhotoLibraryAvailable())! {
                    self?.imgPicker.navigationBar.isTranslucent = false
                    self?.imgPicker.navigationBar.tintColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
                    self?.imgPicker.navigationBar.barStyle = .default
                    self?.imgPicker.sourceType = .photoLibrary
                    self?.imgPicker.mediaTypes = [(kUTTypeImage as String)]
                    self?.imgPicker.delegate = self
                    self?.imgPicker.allowsEditing = true
                    self?.imgPicker.transitioningDelegate = self
                    self?.imgPicker.modalPresentationStyle = .fullScreen
                    
                    self?.present(self!.imgPicker, animated: true, completion: {
                        DDLogWrapper.logInfo("[UI] user open PhotoLibrary")
                    })
                }
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
    
    func isFrontCameraAvailable() -> Bool {
        return UIImagePickerController.isCameraDeviceAvailable(.front)
    }
    
    func isPhotoLibraryAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
    }
    
    func imageByScalingToMaxSize(_ sourceImage: UIImage) -> UIImage {
        if sourceImage.size.width < 640.0 {
            return sourceImage
        }
        
        var btWidth = 0.0
        var btHeight = 0.0
        
        if sourceImage.size.width > sourceImage.size.height {
            btHeight = 640.0
            btWidth = Double(sourceImage.size.width * (640.0 / sourceImage.size.height))
        }else {
            btWidth = 640.0
            btHeight = Double(sourceImage.size.width * (640.0 / sourceImage.size.height))
        }
        
        let targetSize = CGSize(width: btWidth, height: btHeight)
        
        return imageByScalingAndCroppingForSourceImage(sourceImage, targetSize)
    }
    
    func imageByScalingAndCroppingForSourceImage(_ sourceImage: UIImage,_ targetSize: CGSize) -> UIImage {
        var newImage:UIImage?
        let imageSize = sourceImage.size
        let width = imageSize.width
        let height = imageSize.height
        let targetWidth = targetSize.width
        let targetHeight = targetSize.height
        var scaleFactor = 0.0
        var scaledWidth = targetWidth
        var scaledHeight = targetHeight
        var thumbnailPoint = CGPoint(x: 0.0, y: 0.0)
        
        if __CGSizeEqualToSize(imageSize, targetSize) == false {
            let widthFactor = targetWidth / width
            let heightFactor = targetHeight / height
            
            if widthFactor > heightFactor {
                scaleFactor = Double(widthFactor)
            }else {
                scaleFactor = Double(heightFactor)
            }
            
            scaledWidth  = width * CGFloat(scaleFactor)
            scaledHeight = height * CGFloat(scaleFactor)
            
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            }else if widthFactor < heightFactor {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContext(targetSize)
        var thumbnailRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width  = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        if (newImage != nil) {
            
        }
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
