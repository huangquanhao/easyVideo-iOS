//
//  UITabBarController+Ext.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

extension BaseTabBarVC {
    
    /// 加载当前VC
    func loadTabBarVC() -> Void {
        self.delegate = self
        
        let meetingVC = MeetingVC()
        let meetingNav = UINavigationController(rootViewController: meetingVC)
        let chatVC = ChatVC()
        let chatNav = UINavigationController(rootViewController: chatVC)
        let joinMeetingVC = JoinMeetingVC()
        let joinMeetingNav = UINavigationController(rootViewController: joinMeetingVC)
        let contactVC = ContactVC()
        let contactNav = UINavigationController(rootViewController: contactVC)
        let meVC = MeVC()
        let meNav = UINavigationController(rootViewController: meVC)
        
        self.viewControllers = [meetingNav, chatNav, joinMeetingNav, contactNav, meNav]
        
        let item1 = self.tabBar.items![0]
        let item2 = self.tabBar.items![1]
        let item3 = self.tabBar.items![2]
        let item4 = self.tabBar.items![3]
        let item5 = self.tabBar.items![4]
        
        item1.image = UIImage(named: "nav_meeting_nor")
        item2.image = UIImage(named: "icon_nav_chat_n")
        item3.image = UIImage(named: "nav_join_nor")
        item4.image = UIImage(named: "nav_contacts_n")
        item5.image = UIImage(named: "nav_me_nor")
        
        item1.title = "会议"
        item2.title = "聊天"
        item3.title = "加入会议"
        item4.title = "通讯录"
        item5.title = "我"
        
        item1.selectedImage = UIImage(named: "nav_meeting_pre")
        item2.selectedImage = UIImage(named: "icon_nav_chat_p")
        item3.selectedImage = UIImage(named: "nav_join_pre")
        item4.selectedImage = UIImage(named: "nav_contacts_p")
        item5.selectedImage = UIImage(named: "nav_me_pre")
        
        UITabBar.appearance().tintColor = UIColor.init(formHexString: "0x0079FF")
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 11.0)!] as [NSAttributedString.Key: Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 11.0)!] as [NSAttributedString.Key: Any], for: .highlighted)
        
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor.init(formHexString: "0x313131")
        }
        
        self.selectedIndex = 0
    }
    
}

