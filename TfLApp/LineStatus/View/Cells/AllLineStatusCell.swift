//
//  AllLineStausCell.swift
//  TfLApp
//
//  Created by sa20199164 on 09/11/2023.
//

import UIKit

class AllLineStatusCell: UITableViewCell {

    @IBOutlet weak var statusTextLbl: UILabel!
    @IBOutlet weak var statusValueLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    private func setUpView() {
        statusTextLbl.font = UIFont.Heading.small
        statusValueLbl.font = UIFont.Body.smallSemiBold
    }
}
