//
//  CarBrowseVC.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol CarBrowseVCProtocol {
    func setupView()
    func barItemSetup()
    func loadView()
    func fetchCarData()
    func pullDataFromPersistentStore()
    func callWebService()
    func stopActivityIndicator()
    func updateTableView()
    func getTableView() -> UITableView
    func getActivityIndicator() -> UIActivityIndicatorView
}

/* CarBrowseVC
 This is the UIViewcontroller class responsible for displaying the initial delivery list to the user
 */
class CarBrowseVC: UIViewController {
    
    private var carsList: CarsList? {
       didSet {
        DispatchQueue.main.async {
         if self.isViewLoaded {
            self.updateTableView()
         }
        }
     }
    }
    
    internal var webserviceManager = WebserviceManager()
    
    private var carListBrowseView: CarListBrowseView {
        view.backgroundColor = Colors.white
        return view as! CarListBrowseView
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
       setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCarData()
    }
}

extension CarBrowseVC: CarBrowseVCProtocol {
    
    func setupView() {
        barItemSetup()
    }

    func barItemSetup() {
        let image = UIImage(named: StringConstants.refreshButton.rawValue)?.withRenderingMode(.alwaysOriginal)
        let refreshBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(fetchCarData))
        self.navigationItem.rightBarButtonItem = refreshBarButton
    }

    override func loadView() {
        view = CarListBrowseView(frame: UIScreen.main.bounds)
        title = StringConstants.allCars.rawValue
        carListBrowseView.setupTable(dataSource: self, delegate: self)
    }
    
    func stopActivityIndicator() {
        self.carListBrowseView.activityView.stopAnimating()
        self.carListBrowseView.activityView.isHidden = true
    }
    
    
    func getActivityIndicator() -> UIActivityIndicatorView {
        return carListBrowseView.activityView
    }
    
    func getTableView() -> UITableView {
        return carListBrowseView.table
    }
    
    @objc func fetchCarData() {
        guard Reachability.isConnectedToNetwork() else {
            CommonFunctionality.presentAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: StringConstants.internetErrorMessageText.rawValue, callbackOnAffirmation:({
                guard Reachability.isConnectedToNetwork() else { return }
                self.callWebService()
            }), callbackOnNegation: {
                self.pullDataFromPersistentStore()
            })
            return
        }
        callWebService()
    }
    
    func pullDataFromPersistentStore() {
        guard let cars = PersistentStoreManager.shared.getObject(StringConstants.carsKey.rawValue, Array<Car>.self) as [Car]? else { return }
        self.carsList = CarsList(cars)
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.stopActivityIndicator()
            self.carListBrowseView.table.reloadData()
            self.carListBrowseView.setNeedsDisplay()
        }
    }
    
    func callWebService() {
        webserviceManager.getCarsList({ results in
            switch results {
            case .Success(let value):
                self.carsList = CarsList(value)
                PersistentStoreManager.shared.clearData(StringConstants.carsKey.rawValue)
                PersistentStoreManager.shared.setObject(key: StringConstants.carsKey.rawValue, value: value)
            case .Failure(_):
                CommonFunctionality.presentAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: StringConstants.issueWithTheServer.rawValue)
            }
        })
    }
    
}

extension CarBrowseVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let carsList = carsList as CarsList? else { return 0 }
        return carsList.getCars().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let carsList = carsList as CarsList?,
            carsList.getCars().count > indexPath.row else { return UITableViewCell() }
        let cell = carListBrowseView.table.dequeueReusableCell(withIdentifier: "\(CarCell.self)") as! CarCell
        let car = carsList.getCars()[indexPath.row]
        cell.imageView?.image = UIImage(named: StringConstants.defaultImage.rawValue)
        cell.configure(id: car.id, modelIdentifier: car.modelIdentifier, makeName: car.make, modelName: car.modelName, name: car.name, group: car.group, color: car.color, series: car.series, fuelType: car.fuelType, transmission: car.transmission, licensePlate: car.licensePlate, carImageUrl: car.carImageUrl, latitude: car.latitude, longitude: car.longitude, innerCleanliness: car.innerCleanliness, fuelLevel: car.fuelLevel, {
            let cellRect = tableView.rectForRow(at: indexPath)
            let completelyVisible = tableView.bounds.contains(cellRect)
            if completelyVisible && cell.imageView?.image == UIImage(named: StringConstants.defaultImage.rawValue) {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        })

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CarCell.thumbnailHeightWidth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let carsList = carsList as CarsList?,
        carsList.getCars().count > indexPath.row else { return }
        let carDetailVC = CarDetailVC.getCarDetailVC(car: carsList.getCars()[indexPath.row])
        navigationController?.pushViewController(carDetailVC, animated: true)
    }
}
