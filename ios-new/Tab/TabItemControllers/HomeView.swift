import UIKit


class HomeView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(HomeTopImageCell.self, forCellReuseIdentifier: HomeTopImageCell.identifier)
        self.register(HomeUserSpacesCollectionCell.self, forCellReuseIdentifier: HomeUserSpacesCollectionCell.identifier)
        self.register(CollectionSectionCell.self, forCellReuseIdentifier: CollectionSectionCell.identifier)
        self.register(HomeRadioCell.self, forCellReuseIdentifier: HomeRadioCell.identifier)
        self.register(VerseOfDayCell.self, forCellReuseIdentifier: VerseOfDayCell.identifier)
        self.register(HomeNameOfGodCell.self, forCellReuseIdentifier: HomeNameOfGodCell.identifier)
        self.register(HomeQuestionDayCell.self, forCellReuseIdentifier: HomeQuestionDayCell.identifier)
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
            
        switch HomeEnum(rawValue: indexPath.section) {
        case .userRadioSpaceCollection:
            return 270
        case .userSpacesCollection:
            return 270
        default:
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
        case .verseOfDayView:
            let cell = tableView.dequeueReusableCell(withIdentifier: VerseOfDayCell.identifier, for: indexPath) as! VerseOfDayCell
            cell.configure(with: "Kun oyati Fotiha 7-oyat \(indexPath.row + 1)", descriptionOriginal: "This is the original description for post \(indexPath.row + 1)", descriptionTranslate: "This is the translated description for post \(indexPath.row + 1)")
            return cell
        case .nameOfGodView:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeNameOfGodCell.identifier, for: indexPath) as! HomeNameOfGodCell
            cell.configure(with: "Kun duosi \(indexPath.row + 1)", descriptionOriginal: "This is the original description for post \(indexPath.row + 1)", descriptionTranslate: "This is the translated description for post \(indexPath.row + 1)")
            return cell
        case .questionOfDayView:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeQuestionDayCell.identifier, for: indexPath) as! HomeQuestionDayCell
            cell.configure(with: "Kun savoli \(indexPath.row + 1)", descriptionOriginal: "This is the original description for post \(indexPath.row + 1)", descriptionTranslate: "This is the translated description for post \(indexPath.row + 1)")
            return cell
        }
    }
}
