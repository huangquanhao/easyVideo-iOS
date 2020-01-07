//
//  SettingCell.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // LOGIN
    @objc static func cellWithTableViewForLogin(_ tableView: UITableView, indexRow row: Int) -> SettingCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as? SettingCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("SettingCell", owner: self, options: nil)?.first as? UITableViewCell as! SettingCell)
        }
        if row == 0 {
            cell?.img.image = UIImage.init(named: "icon_setting")
            cell?.cellTitle.text = "设置"
        }else if row == 1 {
            cell?.img.image = UIImage.init(named: "icon_about")
            cell?.cellTitle.text = "关于"
        }
        return cell!
    }
    
    // ME
    @objc static func cellWithTableViewForME(_ tableView: UITableView, indexRow row: Int) -> SettingCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as? SettingCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("SettingCell", owner: self, options: nil)?.first as? UITableViewCell as! SettingCell)
        }
        if row == 0 {
            cell?.img.image = UIImage.init(named: "icon_setting")
            cell?.cellTitle.text = "设置"
        }else if row == 1 {
            cell?.img.image = UIImage.init(named: "icon_password")
            cell?.cellTitle.text = "密码"
        }else if row == 2 {
            cell?.img.image = UIImage.init(named: "icon_invite")
            cell?.cellTitle.text = "邀请好友使用"
        }else if row == 3 {
            cell?.img.image = UIImage.init(named: "icon_about")
            cell?.cellTitle.text = "关于"
        }
        return cell!
    }
    
}
