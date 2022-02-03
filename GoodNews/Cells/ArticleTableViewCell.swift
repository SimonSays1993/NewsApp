import UIKit

class ArticleTableViewCell: UITableViewCell {

	public lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .label
		label.font = .systemFont(ofSize: 14, weight: .bold)
		label.textAlignment = .left
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines  = 0
		return label
	}()
	
	public lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .secondaryLabel
		label.font = .systemFont(ofSize: 14, weight: .medium)
		label.textAlignment = .left
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines  = 0
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configure() {
		//this will automatically create the default padding for left right bottom and top within in our cells frame inside the tableView
		let marginGuide = contentView.layoutMarginsGuide

		contentView.addSubview(titleLabel)
		contentView.addSubview(descriptionLabel)
				
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),

			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
			descriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
			descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor)
		])
	}
	
	public func configure(cell: ArticleViewModel) {
		titleLabel.text = cell.title
		descriptionLabel.text = cell.description
	}
}
