//
//  PersonalViewController.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 24.10.2022.
//

import UIKit

/// Экран личной страницы
final class PersonalViewController: UIViewController {
    
    // MARK: - Constants
    private enum CellIdentifiers {
        static let infoTextCellIdentifier = "PesonInfoTableViewCell"
        static let descCellIdentifier = "PersonDescTableViewCell"
        static let storiesCellIdentifier = "PersonStoriesTableViewCell"
        static let postCellIdentifier = "PersonPostTableViewCell"
    }
    
    enum TableCellTypes {
        case personalInformation
        case personalDescription
        case personalStories
        case personalPosts
    }
    
    // MARK: - IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private Visual Components
    private let refresherControl = UIRefreshControl()
    private var tableCellTypes: [TableCellTypes] = [
        .personalInformation, .personalDescription, .personalStories, .personalPosts
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    
    // MARK: - Private Methods
    @objc private func handleRefreshAction() {
         refresherControl.endRefreshing()
     }
    
    private func initMethods() {
        createTableViewSettings()
        addTargers()
    }
    
    private func addTargers() {
        refresherControl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
    }
    
    private func createTableViewSettings() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CellIdentifiers.infoTextCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.infoTextCellIdentifier)
        tableView.register(UINib(
            nibName: CellIdentifiers.descCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.descCellIdentifier)
        tableView.register(UINib(nibName: CellIdentifiers.storiesCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.storiesCellIdentifier)
        tableView.register(UINib(nibName: CellIdentifiers.postCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.postCellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(refresherControl)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension PersonalViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableCellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let screen = tableCellTypes[indexPath.section]
         switch screen {
         case .personalInformation:
             guard let personCell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifiers.infoTextCellIdentifier, for: indexPath)
                    as? PesonInfoTableViewCell else { return UITableViewCell() }
             return personCell
         case .personalDescription:
             guard let descriptionCell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifiers.descCellIdentifier, for: indexPath)
                    as? PersonDescTableViewCell else { return UITableViewCell() }
             return descriptionCell
         case .personalStories:
             guard let storiesCell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifiers.storiesCellIdentifier, for: indexPath)
                    as? PersonStoriesTableViewCell else { return UITableViewCell() }
             return storiesCell
         case .personalPosts:
             guard let postsCell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifiers.postCellIdentifier, for: indexPath)
                    as? PersonPostTableViewCell else { return UITableViewCell() }
             return postsCell
             
         }
         
     }
 }
