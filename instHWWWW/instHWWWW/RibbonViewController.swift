//
//  RibbonViewController.swift
//  InstProjectHW
//
//  Created by Александр Троицкий on 19.10.2022.
//

import UIKit

/// Экран отвечает за ленту новостей
class RibbonViewController: UIViewController {
    private enum Constants {
        static let postTextKey = "PostTableViewCell"
        static let storiesTextKey = "StoriesTableViewCell"
        static let recomendationTextKey = "RecomendationTableViewCell"
    }
    
    // MARK: IBOutlet
    @IBOutlet var tableView: UITableView!
    
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
        
        tableView.register(UINib(nibName: Constants.postTextKey,
                                 bundle: nil), forCellReuseIdentifier: Constants.postTextKey)
        tableView.register(UINib(nibName: Constants.storiesTextKey,
                                 bundle: nil), forCellReuseIdentifier: Constants.storiesTextKey)
        tableView.register(UINib(nibName: Constants.recomendationTextKey,
                                 bundle: nil), forCellReuseIdentifier: Constants.recomendationTextKey)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension RibbonViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 6
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         switch indexPath.row {
         case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesTextKey, for: indexPath)
             return cell
         case 1:
             let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postTextKey, for: indexPath)
             return cell
         case 2:
             let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recomendationTextKey, for: indexPath)
             return cell
         default:
             let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postTextKey, for: indexPath)
             return cell
         }
     }

     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
 }
