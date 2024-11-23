import UIKit

class HomeRadioCell: UITableViewCell {
    static let identifier = "HomeRadioCell"
    
    private var collectionView: UICollectionView!
    private let tableImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
        configureTableImageView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserRadioSpaceCell.self, forCellWithReuseIdentifier: UserRadioSpaceCell.identifier)
        contentView.addSubview(collectionView)
    }
    
    private func configureTableImageView() {
        tableImageView.contentMode = .scaleToFill
        tableImageView.image = UIImage(named: "yourBigImage")
        tableImageView.clipsToBounds = true
        tableImageView.layer.cornerRadius = 16
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.backgroundColor = .lightGray // Added background color for better visibility
        contentView.addSubview(tableImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            tableImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            tableImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //tableImageView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -5),
            tableImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
                       
            collectionView.topAnchor.constraint(equalTo: tableImageView.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15),
            collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6) // Fixed height for better visibility
        ])
    }
}

extension HomeRadioCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserRadioSpaceCell.identifier, for: indexPath) as? UserRadioSpaceCell else {
            return UICollectionViewCell()
        }
        let imageNames = ["dots", "tongImage", "quyoshImage"]

        if indexPath.row < imageNames.count {
            
            if let image = UIImage(systemName: imageNames[indexPath.row]) {
                cell.configure(with: image)
            } else if let image = UIImage(named: imageNames[indexPath.row]) {
                cell.configure(with: image)
            }
        }
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 24) / 3
        return CGSize(width: width, height: width)
    }
}

class UserRadioSpaceCell: UICollectionViewCell {
    static let identifier = "userRadioSpaceCell"
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 3
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}

