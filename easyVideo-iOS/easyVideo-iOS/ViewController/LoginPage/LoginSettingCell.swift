//
//  LoginSettingCell.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class LoginSettingCell: UITableViewCell {
    
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
    
    @objc static func cellWithTableView(_ tableView: UITableView, indexRow row: Int) -> LoginSettingCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "loginSettingCell") as? LoginSettingCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("LoginSettingCell", owner: self, options: nil)?.first as? UITableViewCell as! LoginSettingCell)
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
    
}
