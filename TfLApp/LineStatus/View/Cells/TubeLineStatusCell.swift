import UIKit

final class TubeLineStatusCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var lineColorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        statusLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        statusLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontSizeToFitWidth = true
        statusLabel.adjustsFontSizeToFitWidth = true

        // Add accessibility labels
        self.isAccessibilityElement = true
    }
    
    func configure(_ line: TubeLine, row: Int) {
        nameLabel.text = line.name
        statusLabel.text = line.lineStatuses?.first?.statusSeverityDescription
        lineColorView.backgroundColor = UIColor.color(for: line.id)
        accessibilityLabel = "\(line.name), \(line.lineStatuses?.first?.statusSeverityDescription ?? "")"
        accessibilityHint = "tap to hear again"
     }
}
