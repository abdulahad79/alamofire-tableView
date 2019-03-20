//
//  TableViewCell.swift
//  alamoFdemo
//
//  Created by abdul ahad on 19/03/2019.
//  Copyright © 2019 abdul ahad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblgender: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
