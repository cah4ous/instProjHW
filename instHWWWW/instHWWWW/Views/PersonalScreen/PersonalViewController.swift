//
//  PersonalViewController.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 24.10.2022.
//

import UIKit

/// Экран личной страницы
class PersonalViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        enum CellIdentifiers {
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
    }
    
    // MARK: - IBOutlet
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Private Properties
    private let refresherControl = UIRefreshControl()
    
    private var tableCellTypes: [Constants.TableCellTypes] = [
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
        tableView.register(UINib(nibName: Constants.CellIdentifiers.infoTextCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.infoTextCellIdentifier)
        tableView.register(UINib(
            nibName: Constants.CellIdentifiers.descCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.descCellIdentifier)
        tableView.register(UINib(nibName: Constants.CellIdentifiers.storiesCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.storiesCellIdentifier)
        tableView.register(UINib(nibName: Constants.CellIdentifiers.postCellIdentifier,
                                 bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.postCellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(refresherControl)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension PersonalViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableCellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let screen = tableCellTypes[indexPath.section]
         switch screen {
         case .personalInformation:
             guard let personCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.infoTextCellIdentifier, for: indexPath)
                    as? PesonInfoTableViewCell else { return UITableViewCell() }
             return personCell
         case .personalDescription:
             guard let descriptionCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.descCellIdentifier, for: indexPath)
                    as? PersonDescTableViewCell else { return UITableViewCell() }
             return descriptionCell
         case .personalStories:
             guard let storiesCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.storiesCellIdentifier, for: indexPath)
                    as? PersonStoriesTableViewCell else { return UITableViewCell() }
             return storiesCell
         case .personalPosts:
             guard let postsCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.postCellIdentifier, for: indexPath)
                    as? PersonPostTableViewCell else { return UITableViewCell() }
             return postsCell
             
         }
         
     }
 }
