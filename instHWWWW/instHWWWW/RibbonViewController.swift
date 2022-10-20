//
//  RibbonViewController.swift
//  InstProjectHW
//
//  Created by Александр Троицкий on 19.10.2022.
//

import UIKit

/// Экран отвечает за ленту новостей
final class RibbonViewController: UIViewController {
    private enum Constants {
        static let postTextCellIdentifire = "PostTableViewCell"
        static let storiesTextCellIdentifire = "StoriesTableViewCell"
        static let recomendationTextCellIdentifire = "RecomendationTableViewCell"
    }
    
    private enum TableCellTypes {
         case stories
         case post
         case recomendation
     }
    
    // MARK: IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private properties
     private var tableCellTypes: [TableCellTypes] = [.stories, .post, .recomendation]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    
    // MARK: Private Methods
    private func initMethods() {
        createTableViewSettings()
    }
    
    private func createTableViewSettings() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Constants.postTextCellIdentifire,
                                 bundle: nil), forCellReuseIdentifier: Constants.postTextCellIdentifire)
        tableView.register(UINib(nibName: Constants.storiesTextCellIdentifire,
                                 bundle: nil), forCellReuseIdentifier: Constants.storiesTextCellIdentifire)
        tableView.register(UINib(nibName: Constants.recomendationTextCellIdentifire,
                                 bundle: nil), forCellReuseIdentifier: Constants.recomendationTextCellIdentifire)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension RibbonViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return tableCellTypes.count
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let screen = tableCellTypes[indexPath.row]
         switch screen {
         case .stories:
             guard let storiesCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storiesTextCellIdentifire, for: indexPath)
                    as? StoriesTableViewCell else { return UITableViewCell() }
             return storiesCell
         case .post:
             guard let postCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postTextCellIdentifire, for: indexPath)
                    as? PostTableViewCell else { return UITableViewCell() }
             return postCell
         case .recomendation:
             guard let recomendationCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendationTextCellIdentifire, for: indexPath)
                    as? RecomendationTableViewCell else { return UITableViewCell() }
             return recomendationCell
             
         }
         
     }

     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
 }
