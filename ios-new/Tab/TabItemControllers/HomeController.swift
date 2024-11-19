//
//  HomeViewController.swift
//  ios-new
//
//  Created by Murodjon Turobov on 12/11/24.
//
import UIKit

class HomeController: UIViewController {
    
    
    private let tableView = HomeView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.frame = view.bounds
        
         view.addSubview(tableView)
     }
    
    private func configureNavigationBar() {
        let notificationButton = UIBarButtonItem(
            image: UIImage(systemName: "list.bullet.clipboard.fill"),
            style: .plain,
            target: self,
            action: #selector(notificationTapped)
        )
        
        notificationButton.tintColor = .gray
        navigationItem.rightBarButtonItem = notificationButton
        
        let dateLabel = UILabel()
        dateLabel.text = getCurrentDate()
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        dateLabel.textColor = .black
        
        let hijriDateLabel = UILabel()
        hijriDateLabel.text = getCurrentHijriDate()
        hijriDateLabel.font = UIFont.systemFont(ofSize: 15)
        hijriDateLabel.textColor = .gray
        
        let stackView = UIStackView(arrangedSubviews: [dateLabel, hijriDateLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        
        
        let leftBarButtonItem = UIBarButtonItem(customView: stackView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMMM"
        return formatter.string(from: Date())
    }
    
    private func getCurrentHijriDate() -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .islamicUmmAlQura)
        formatter.dateFormat = "dd-MMMM, yyyy"
        return formatter.string(from: Date())
    }
    
    
    @objc func notificationTapped() {
        print("Notification tapped")
        
    }
}

