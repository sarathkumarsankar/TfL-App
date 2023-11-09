import UIKit

final class TubeLineStatusCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.accessibilityIdentifier = AccessiblityIdentifier.nameLabel
        }
    }
    @IBOutlet private weak var statusLabel: UILabel! {
        didSet {
            statusLabel.accessibilityIdentifier = AccessiblityIdentifier.statusLabel
        }
    }
    @IBOutlet private weak var lineColorView: UIView!

    private enum AccessiblityIdentifier {
        static let tubeLineStatusCell = "tubeLineStatusCell"
        static let nameLabel = "nameLabel"
        static let statusLabel = "statusLabel"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView() {
        nameLabel.font = UIFont.Heading.xtraSmall
        statusLabel.font = UIFont.Body.regular
        nameLabel.adjustsFontForContentSizeCategory = true
        statusLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontSizeToFitWidth = true
        statusLabel.adjustsFontSizeToFitWidth = true

        // Add accessibility labels
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = AccessiblityIdentifier.tubeLineStatusCell
    }
    
    func configure(_ line: TubeLine, row: Int) {
        nameLabel.text = line.name
        statusLabel.text = line.lineStatuses?.first?.statusSeverityDescription
        lineColorView.backgroundColor = UIColor.color(for: line.id)
        accessibilityLabel = "\(line.name), \(line.lineStatuses?.first?.statusSeverityDescription ?? "")"
     }
}
