import UIKit


class HomeView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
//    enum SectionType: Int, CaseIterable {
//        case imageSection
//        case collectionSection
//        case userSpacesSection
//        case userRadioSpaceSection
//    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(HomeTopImageCell.self, forCellReuseIdentifier: HomeTopImageCell.identifier)
        self.register(HomeUserSpacesCollectionCell.self, forCellReuseIdentifier: HomeUserSpacesCollectionCell.identifier)
        self.register(CollectionSectionCell.self, forCellReuseIdentifier: CollectionSectionCell.identifier)
        self.register(HomeRadioCell.self, forCellReuseIdentifier: HomeRadioCell.identifier)
        
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
        if indexPath.section == 2 {
            return 270
            
        } else {
            return 250
        }
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
        case .userRadioSpaceCollection:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeRadioCell.identifier, for: indexPath) as! HomeRadioCell
            return cell
        }
    }
}
