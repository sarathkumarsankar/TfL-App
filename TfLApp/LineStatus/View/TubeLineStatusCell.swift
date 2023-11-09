import UIKit

final class TubeLineStatusCell: UITableViewCell {

    let textStackView = UIStackView()
    let nameLabel = UILabel()
    let statusLabel = UILabel()
    let lineColorView = UIView()

    // Accessibility Identifiers

    private enum AccessiblityIdentifier {
        static let tubeLineStatusCell = "tubeLineStatusCellIdentifier"
        static let nameLabel = "nameLabelIdentifier"
        static let statusLabel = "statusLabelIdentifier"
    }

    private struct Spacing {
        static let edgeInsets: CGFloat = 20.0
        static let labelLeading: CGFloat = 15.0
        static let labelTrailing: CGFloat = 15.0
        static let stackViewSpacing: CGFloat = 5.0
        static let lineViewWidth: CGFloat = 15.0
    }

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Common Initialization
    private func commonInit() {
        setupAccessibility()
        
        setupLabel(nameLabel,
                   font: UIFont.Heading.xtraSmall,
                   accessibilityIdentifier: AccessiblityIdentifier.nameLabel)
        setupLabel(statusLabel,
                   font: UIFont.Body.regular,
                   accessibilityIdentifier: AccessiblityIdentifier.statusLabel)

        textStackView.distribution = .fillEqually
        textStackView.axis = .vertical
        textStackView.spacing = 5
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        lineColorView.translatesAutoresizingMaskIntoConstraints = false
        
        setupViewsHierarchy()
        setupConstraints()
    }

    // MARK: - Accessibility Setup

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = AccessiblityIdentifier.tubeLineStatusCell
        nameLabel.accessibilityIdentifier = AccessiblityIdentifier.nameLabel
        statusLabel.accessibilityIdentifier = AccessiblityIdentifier.statusLabel
    }

    // MARK: - Label Setup

    private func setupLabel(_ label: UILabel, font: UIFont, accessibilityIdentifier: String) {
        label.font = font
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.accessibilityIdentifier = accessibilityIdentifier
    }
    
    // MARK: - Views Hierarchy Setup

    func setupViewsHierarchy() {
        contentView.addSubview(lineColorView)
        contentView.addSubview(textStackView)
        textStackView.addArrangedSubviews(nameLabel, statusLabel)
    }

    // MARK: - Constraints Setup

    func setupConstraints() {
        NSLayoutConstraint.activate([
            lineColorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineColorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            lineColorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            lineColorView.widthAnchor.constraint(equalToConstant: Spacing.lineViewWidth),

            textStackView.leadingAnchor.constraint(equalTo: lineColorView.trailingAnchor, constant: Spacing.labelLeading),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.labelTrailing),
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.edgeInsets),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.edgeInsets),
        ])
    }
    
    // MARK: - Configuration
    func configure(_ line: TubeLine) {
        nameLabel.text = line.name
        statusLabel.text = line.lineStatuses?.first?.statusSeverityDescription
        lineColorView.backgroundColor = UIColor.color(for: line.id)
        accessibilityLabel = "\(line.name), \(line.lineStatuses?.first?.statusSeverityDescription ?? "")"
     }

}
