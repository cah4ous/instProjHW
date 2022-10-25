//
//  RecentlyViewController.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 21.10.2022.
//

import UIKit

/// Экран недавних действий
final class RecentlyViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        enum Texts {
            static let forToday = "Сегодня"
            static let forWeek = "За эту неделю"
            static let photoImageName = "Photo"
            static let profileImageName = "Pic"
            static let firstInfoText = "muchas gracias aficiónados esto"
            static let secondInfoText = "gracias aficiónados esto para vosotros."
            static let thirdInfoText = "Sííííí!!!!!"
            static let forthInfoText = "my name is Alex"
            static let firstTimeText = "1 ч."
            static let secondTimeText = "3 ч."
            static let thirdTimeText = "7 ч."
            static let forthTimeText = "11 ч."
            static let todayText = "Cегодня"
            static let yesterdayText = "Вчера"
        }
        
        enum CellIdentifier {
            static let todayCell = "todayCell"
            static let todayCellName = "TodayTableViewCell"
            static let weekCell = "weekCell"
            static let weekCellName = "WeekTableViewCell"
        }
        
        enum TableCellTypes {
            case today
            case week
        }
        
        enum Colors {
            static let defaultBlackColor = "defaultBlack"
        }
    }

    // MARK: - IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private Visual Components
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private Properties
    private var tableCellTypes: [Constants.TableCellTypes] = [.today, .week]
    private var recentlies: [Recently] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    
    // MARK: - Private Methods
    @objc private func handleRefreshAction() {
         refresherControl.endRefreshing()
     }
    
    private func createRecently() {
        recentlies = [
            Recently(
                imageName: Constants.Texts.photoImageName,
                profileImageName: Constants.Texts.profileImageName,
                likeText: Constants.Texts.todayText,
                commentText: Constants.Texts.firstInfoText,
                timeText: Constants.Texts.firstTimeText,
            isSub: false),
            Recently(
                imageName: Constants.Texts.photoImageName,
                profileImageName: Constants.Texts.profileImageName,
                likeText: Constants.Texts.yesterdayText,
                commentText: Constants.Texts.secondInfoText,
                timeText: Constants.Texts.secondTimeText,
            isSub: false),
            Recently(
                imageName: Constants.Texts.photoImageName,
                profileImageName: Constants.Texts.profileImageName,
                likeText: Constants.Texts.yesterdayText,
                commentText: Constants.Texts.thirdInfoText,
                timeText: Constants.Texts.thirdTimeText,
            isSub: false),
            Recently(
                imageName: Constants.Texts.photoImageName,
                profileImageName: Constants.Texts.profileImageName,
                likeText: Constants.Texts.yesterdayText,
                commentText: Constants.Texts.forthInfoText,
                timeText: Constants.Texts.forthTimeText,
            isSub: true)
        ]
    }
    private func initMethods() {
        createTableViewSettings()
        createRecently()
        addTargers()
    }
    
    private func addTargers() {
        refresherControl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
    }
    
    private func createTableViewSettings() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.CellIdentifier.todayCellName,
                                 bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.todayCell)
        tableView.register(UINib(nibName: Constants.CellIdentifier.weekCellName,
                                 bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.weekCell)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(refresherControl)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension RecentlyViewController: UITableViewDelegate, UITableViewDataSource {

     func numberOfSections(in tableView: UITableView) -> Int {
         return tableCellTypes.count
     }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         let type = tableCellTypes[section]
         switch type {
         case .today:
             return recentlies.count
         case .week:
             return recentlies.count
         }
     }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         guard let header = view as? UITableViewHeaderFooterView else { return }
         header.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
         header.textLabel?.textColor = UIColor(named: Constants.Colors.defaultBlackColor)
     }

     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         switch section {
         case 0:
             return Constants.Texts.forToday
         default:
             return Constants.Texts.forWeek
         }
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let type = tableCellTypes[indexPath.section]
         switch type {
         case .today:
             let person = recentlies[indexPath.row]
             guard let todayCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.todayCell,
                                                                 for: indexPath) as? TodayTableViewCell else {
                 return UITableViewCell() }
             todayCell.refresh(person)
             return todayCell
         case .week:
             let person = recentlies[indexPath.row]
             guard let weekCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.weekCell,
                                                                 for: indexPath) as? WeekTableViewCell else {
                 return UITableViewCell() }
             weekCell.refresh(person)
             return weekCell
         }
     }
 }
