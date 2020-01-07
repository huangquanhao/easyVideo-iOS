//
//  SwitchCell.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/6.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc static func cellWithTableView(_ tableView: UITableView, indexRow: IndexPath) -> SwitchCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell") as? SwitchCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("SwitchCell", owner: self, options: nil)?.first as? UITableViewCell as! SwitchCell)
        }
        if indexRow.section == 1 {
            cell?.cellTitle.text = "自动应答"
        }else if indexRow.section == 2 {
            cell?.cellTitle.text = "1080P"
        }else if indexRow.section == 3 {
            cell?.cellTitle.text = "启用高帧率视频"
        }else if indexRow.section == 4 {
            cell?.cellTitle.text = "关闭提示"
        }
        
        cell?.switchBtn.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        return cell!
    }
    
}
