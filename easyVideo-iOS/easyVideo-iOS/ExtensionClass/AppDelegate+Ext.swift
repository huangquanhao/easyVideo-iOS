//
//  AppDelegate+Ext.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit
import AVFoundation

extension AppDelegate {
    func setIQKeyboardManager() {
        IQKeyboardManager.shared().isEnabled = true
    }
    
    func setEVSDK() {
        let path = FileTools.getDocumentsFailePath()
        let logPath = path + "/Log"
        
        
        setDDLog(withPath: logPath)
        
        DDLogWrapper.logInfo("++++++++++++++++++++++++++++++ app start ++++++++++++++++++++++++++++++")
        
        evengine.setLog(EVLogLevel.message, path: logPath, file: "evsdk", size: 20*20*1024)
        DDLogWrapper.logInfo("evengine.setLog")
        evengine.enableLog(true)
        DDLogWrapper.logInfo("evengine.enableLog")
        evengine.initialize(path, filename: "config")
        DDLogWrapper.logInfo("evengine.initialize")
        evengine.setMaxRecvVideo(4)
        DDLogWrapper.logInfo("evengine.setMaxRecvVideo(4)")
        evengine.enablePreview(false)
        DDLogWrapper.logInfo("evengine.enablePreview(false)")
        evengine.setRootCA(FileTools.bundleFile("rootca.pem"))
        DDLogWrapper.logInfo("evengine.setRootCA")
        evengine.setBandwidth(2048)
        DDLogWrapper.logInfo("evengine.setBandwidth(2048)")
        evengine.getDevice(.videoCapture)
        DDLogWrapper.logInfo("evengine.getDevice(.videoCapture)")
        evengine.getDevice(.audioCapture)
        DDLogWrapper.logInfo("evengine.getDevice(.audioCapture)")
    }
    
    func setDDLog(withPath path:String) {
        DDLog().add(DDASLLogger.sharedInstance)
        DDLog().add(DDTTYLogger.sharedInstance)
        
        let fileManager = DDLogFileManagerDefault.init(logsDirectory: path)
        let fileLogger = DDFileLogger.init(logFileManager: fileManager)
        
        fileLogger.rollingFrequency = 60 * 60 * 24 * 1000
        fileLogger.maximumFileSize = 40 * 1024 * 1024
        fileLogger.logFileManager.maximumNumberOfLogFiles = 1
        
        DDLog.add(fileLogger)
        
        if !FileTools.isExist(withFile: path + "/EVUILOG.log") {
            try? FileManager().createDirectory(atPath: path + "/EVUILOG.log", withIntermediateDirectories: true, attributes: nil)
        }
        
        if FileTools.isExist(withFile: path + "/EVUILOG.log") {
            if FileTools.getFileSize(path + "/EVUILOG.log") > 20000000 {
                FileTools.deleteTheFile(withFilePath: (path + "/EVUILOG2.log"))
                saveFile(withPath: path)
                FileTools.deleteTheFile(withFilePath: (path + "/EVUILOG.log"))
            }
        }
    }
    
    func saveFile(withPath path:String) {
        let dataPath = path + "/EVUILOG2.log"
        let srcPath = path + "/EVUILOG.log"
        
        try? FileManager.default.copyItem(atPath: srcPath, toPath: dataPath)
    }
    
    func getPermissionInAdvance() {
        //MARK: APP启动时候，判断用户是否授权使用相机
        if (AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .notDetermined) {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (statusFirst) in
                if statusFirst {
                    //用户首次允许
                    DDLogWrapper.logInfo("camera is permitted by user!")
                } else {
                    DDLogWrapper.logInfo("camera permission is denied by user, call will not send any audio sample to remote!")
                }
            })
        }
       
        //MARK: APP启动时候，判断用户是否授权使用相册
        if (AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .notDetermined) {
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: { (statusFirst) in
                if statusFirst {
                    //用户首次允许
                    DDLogWrapper.logInfo("micphone is permitted by user!")
                } else {
                    DDLogWrapper.logInfo("micphone permission is denied by user, call will not send any audio sample to remote!")
                }
            })
        }
    }
}
