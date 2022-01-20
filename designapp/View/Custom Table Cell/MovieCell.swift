//
//  MovieCell.swift
//  designapp
//
//  Created by cloud on 18/01/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    //title label
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(post:PostModel?){
        //setting title label
        titleLabel.text = post?.title ?? ""
        
        //setting body label
        bodyLabel.text = post?.body ?? ""
    }

}
