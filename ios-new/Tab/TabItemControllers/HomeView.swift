import UIKit


class HomeView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    enum SectionType: Int, CaseIterable {
        case imageSection
        case collectionSection
        case userSpacesSection
        case prayCheckSection
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(HomeTopImageCell.self, forCellReuseIdentifier: HomeTopImageCell.identifier)
        self.register(CollectionSectionCell.self, forCellReuseIdentifier: CollectionSectionCell.identifier)
        self.register(HomeUserSpacesCollectionCell.self, forCellReuseIdentifier: HomeUserSpacesCollectionCell.identifier)
        self.register(PrayCheckCell.self, forCellReuseIdentifier: PrayCheckCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = HomeEnum(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sectionType {
        case .imageCard:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopImageCell.identifier, for: indexPath) as! HomeTopImageCell
            return cell
        case .collectionNews:
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionSectionCell.identifier, for: indexPath) as! CollectionSectionCell
            return cell
        case .userSpacesCollection:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeUserSpacesCollectionCell.identifier, for: indexPath) as! HomeUserSpacesCollectionCell
            return cell
        case .prayCheckCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: PrayCheckCell.identifier, for: indexPath) as! PrayCheckCell
            return cell

        }
    }
}
