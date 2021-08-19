//
//  TableViewCell.swift
//  TableViewAPI
//
//  Created by Bryan Lee on 8/18/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var propertyName: UILabel!
    
    @IBOutlet weak var propertyTwo: UILabel!
    @IBOutlet weak var propertyThree: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
