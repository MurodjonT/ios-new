import UIKit

class VerseOfDayCell: UITableViewCell {
    static let identifier = "VerseOfDayCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionOriginalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionTranslateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sendingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let savedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // ContentView sozlamalari
        contentView.backgroundColor = .systemGray5
        self.selectionStyle = .none
        
        // ContainerViewni qo'shish
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionOriginalLabel)
        containerView.addSubview(descriptionTranslateLabel)
        containerView.addSubview(favoriteButton)
        containerView.addSubview(sendingButton)
        containerView.addSubview(savedButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            descriptionOriginalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            descriptionOriginalLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            descriptionOriginalLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            descriptionTranslateLabel.topAnchor.constraint(equalTo: descriptionOriginalLabel.bottomAnchor, constant: 4),
            descriptionTranslateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            descriptionTranslateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            favoriteButton.topAnchor.constraint(equalTo: descriptionTranslateLabel.bottomAnchor, constant: 15),
            favoriteButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            sendingButton.topAnchor.constraint(equalTo: descriptionTranslateLabel.bottomAnchor, constant: 15),
            sendingButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            savedButton.topAnchor.constraint(equalTo: descriptionTranslateLabel.bottomAnchor, constant: 15),
            savedButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            savedButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with title: String, descriptionOriginal: String, descriptionTranslate: String) {
        titleLabel.text = title
        descriptionOriginalLabel.text = descriptionOriginal
        descriptionTranslateLabel.text = descriptionTranslate
    }
}

// TableView fon rangini o'zgartirish
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.lightGray
        tableView.register(VerseOfDayCell.self, forCellReuseIdentifier: VerseOfDayCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // Masalan, 10 qator
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VerseOfDayCell.identifier, for: indexPath) as? VerseOfDayCell else {
            return UITableViewCell()
        }
        cell.configure(with: "Verse \(indexPath.row + 1)", descriptionOriginal: "Original description", descriptionTranslate: "Translated description")
        return cell
    }
}
