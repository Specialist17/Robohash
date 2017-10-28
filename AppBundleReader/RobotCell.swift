//
//  RobotCell.swift
//  AppBundleReader
//
//  Created by Fernando on 10/27/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class RobotCell: UITableViewCell {

    @IBOutlet weak var robotPhrase: UILabel!
    @IBOutlet weak var robotImage: CustomImageView!
    @IBOutlet weak var robotName: UILabel!
    @IBOutlet weak var robotPersonality: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(robot: Robot) {
        robotName.text = robot.name
        robotPhrase.text = robot.phrase
        robotPersonality.text = robot.personality
        
        setupThumbnailImage(robot: robot)
    }
    
    func setupThumbnailImage(robot: Robot) {
        robotImage.loadImageFromUrlString(urlString: robot.image)
    }

}
