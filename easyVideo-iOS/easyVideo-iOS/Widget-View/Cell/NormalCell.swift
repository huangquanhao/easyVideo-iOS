//
//  NormalCell.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/6.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class NormalCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetailLb: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var line: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc static func cellWithTableViewForSeetingVC(_ tableView: UITableView, indexRow row: Int) -> NormalCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell") as? NormalCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("NormalCell", owner: self, options: nil)?.first as? UITableViewCell) as? NormalCell
        }
        cell?.bottomConstraint.constant = 10
        cell?.cellTitle.text = "发送诊断信息"
        cell?.line.isHidden = true
        
        return cell!
    }
    
    @objc static func cellWithTableViewForAboutVC(_ tableView: UITableView, indexRow row: Int) -> NormalCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell") as? NormalCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("NormalCell", owner: self, options: nil)?.first as? UITableViewCell) as? NormalCell
        }
    
        if row == 0 {
            cell?.cellTitle.text = "软件许可及服务协议"
        }else if row == 1 {
            cell?.cellTitle.text = "检查更新"
        }
        cell?.bottomConstraint.constant = 0
        cell?.line.isHidden = false
        
        return cell!
    }
    
    @objc static func cellWithTableViewForUserInformationVC(_ tableView: UITableView, indexRow row: Int) -> NormalCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell") as? NormalCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("NormalCell", owner: self, options: nil)?.first as? UITableViewCell) as? NormalCell
        }

        cell?.bottomConstraint.constant = 0
        cell?.line.isHidden = false
        cell?.cellTitle.text = "姓名"
        cell?.cellDetailLb.isHidden = false
        cell?.cellDetailLb.text = PlistUtils.loadPlistFilewithFileName(userPlist)[displayName] as? String
        
        return cell!
    }
    
}
