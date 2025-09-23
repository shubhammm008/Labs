//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Shubham Singh on 16/9/25.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    private func updateView() {
        symbolLabel.text = emoji?.symbol ?? ""
        nameLabel.text = emoji?.name ?? ""
        descriptionLabel.text = emoji?.description ?? ""
    }
    
    var emoji: Emoji? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
