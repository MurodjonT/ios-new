//
//  HomeTopImageCell.swift
//  ios-new
//
//  Created by Murodjon Turobov on 18/11/24.
//
import UIKit

class HomeTopImageCell: UITableViewCell {
    static let identifier = "HomeTopImageCell"
    
    private let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "tongImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(topImageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
