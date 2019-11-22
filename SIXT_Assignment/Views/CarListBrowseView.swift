//
//  CarListBrowseView.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol CarListBrowseViewProtocol {
    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate)
    func setupActivityIndicator()
}

/* CarListBrowseView
 This is the view which is used in CarListBrowseView ViewController
 */
final class CarListBrowseView: UIView, CarListBrowseViewProtocol {
    internal let table: UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: 480, height: 690)
        table.enableAutoLayout()
        return table
    } ()
    
    internal let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style:  UIActivityIndicatorView.Style.large)
        activityView.tintColor = UIColor.gray
        activityView.hidesWhenStopped = true
        return activityView
    } ()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
        table.backgroundColor = Colors.white
        table.separatorColor = Colors.blackish
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.topAnchor.constraint(equalTo: self.topAnchor).activate()
        table.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
        table.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
        table.bottomAnchor.constraint(equalTo: (self.bottomAnchor)).activate()
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.accessibilityIdentifier = StringConstants.carListTableIdentifier.rawValue
        setupActivityIndicator()
    }
    
    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        table.dataSource = dataSource
        table.delegate = delegate
        table.register(CarCell.self, forCellReuseIdentifier: "\(CarCell.self)")
    }
    
    func setupActivityIndicator() {
        activityView.center = self.center
        addSubview(activityView)
        activityView.startAnimating()
    }
}


