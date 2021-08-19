//
//  TableCell.swift
//  movieList
//
//  Created by Bryan Lee on 8/17/21.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonNum: UILabel!
    @IBOutlet weak var episodeNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
