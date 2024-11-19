//
//  PrayCheckCell.swift
//  ios-new
//
//  Created by Murodjon Turobov on 19/11/24.
//

import UIKit


class PrayCheckCell: UITableViewCell {
    static let identifier = "ImageTableSectionCell"
    
    private let tableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(tableImageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            tableImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            tableImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            tableImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
