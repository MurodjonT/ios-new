import UIKit

class HomeUserSpacesCollectionCell: UITableViewCell {
    static let identifier = "HomeUserSpacesCollectionCell"
    
    private var collectionView: UICollectionView!
    private let tableImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemGray5
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
        collectionView.backgroundColor = .systemGray5
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserSpaceCell.self, forCellWithReuseIdentifier: UserSpaceCell.identifier)
        contentView.addSubview(collectionView)
    }
    
    private func configureTableImageView() {
        tableImageView.contentMode = .scaleToFill
        tableImageView.image = UIImage(named: "tongImage")
        tableImageView.clipsToBounds = true
        tableImageView.layer.cornerRadius = 16
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.backgroundColor = .systemGray5 // Added background color for better visibility
        contentView.addSubview(tableImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                       collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
                       
                       tableImageView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            tableImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            tableImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                       tableImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                       tableImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6) // Fixed height for better visibility
        ])
    }
}

extension HomeUserSpacesCollectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserSpaceCell.identifier, for: indexPath) as? UserSpaceCell else {
            return UICollectionViewCell()
        }
        let imageNames = ["dots", "tongImage", "quyoshImage", "yourBigImage"]
        if indexPath.row < imageNames.count {
            cell.configure(with: UIImage(named: imageNames[indexPath.row]))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 24) / 4
        return CGSize(width: width, height: width)
    }
}

class UserSpaceCell: UICollectionViewCell {
    static let identifier = "userSpaceCell"
    
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

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
