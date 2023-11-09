import UIKit

class AllLineStatusCell: UITableViewCell {
    // MARK: - Constants and Spacing

    private enum Spacing {
        static let layoutMargins: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        static let statusTextTop: CGFloat = 10
        static let valueStackBottom: CGFloat = -10
        static let statusTextHeight: CGFloat = 35
        static let liveImageSize: CGSize = CGSize(width: 18, height: 20)
        static let stackViewSpacing: CGFloat = 10
    }

    let statusTextLbl = UILabel()
    let statusValueLbl = UILabel()
    let liveImageView = UIImageView()
    let valueStackView = UIStackView()

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
        // Set accessibility
        configureAccessibility()
        
        // Layout margins
        layoutMargins = Spacing.layoutMargins

        // UI element setups
        setupStatusLabel(label: statusTextLbl, font: UIFont.Heading.small, key: "status.title")
        setupStatusLabel(label: statusValueLbl, font: UIFont.Body.smallSemiBold, key: "status.title.live")
        setupLiveImageView()

        // Stack view setup
        setupViewsHierarchy()
        setupConstraints()
    }

    // MARK: - Accessibility Configuration

    private func configureAccessibility() {
        isAccessibilityElement = true
        statusValueLbl.accessibilityHint = LocalizedString(key: "status.accessabilty.hint")
    }
    
    // MARK: - UI Element Setups

    private func setupStatusLabel(label: UILabel, font: UIFont, key: String) {
        label.font = font
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizedString(key: key)
    }

    private func setupLiveImageView() {
        liveImageView.image = UIImage(systemName: "circle.circle.fill")
        liveImageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(scale: .small)
    }

    // MARK: - Views Hierarchy Setup

    private func setupViewsHierarchy() {
        valueStackView.distribution = .fillProportionally
        valueStackView.axis = .horizontal
        valueStackView.spacing = Spacing.stackViewSpacing
        valueStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(statusTextLbl)
        contentView.addSubview(valueStackView)
        valueStackView.addArrangedSubviews(liveImageView, statusValueLbl)

    }
    
    // MARK: - Constraints Setup

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            statusTextLbl.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            statusTextLbl.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            statusTextLbl.heightAnchor.constraint(equalToConstant: Spacing.statusTextHeight),

            liveImageView.heightAnchor.constraint(equalToConstant: Spacing.liveImageSize.height),
            liveImageView.widthAnchor.constraint(equalToConstant: Spacing.liveImageSize.width),

            valueStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            valueStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            valueStackView.topAnchor.constraint(equalTo: statusTextLbl.bottomAnchor, constant: Spacing.statusTextTop),
            valueStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: Spacing.valueStackBottom),
        ])
    }

}
