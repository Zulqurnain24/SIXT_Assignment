//
//  WebserviceManager.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

protocol WebserviceManagerProtocol {
    func getCarsList(_ completion: @escaping (ResultType<[Car]>) -> Void)
}

/* WebserviceManager
 This class houses all the networking logic which is used for downloading the data from API Webservice
 */
final class WebserviceManager: NSObject, WebserviceManagerProtocol {

    // Get Cars from endpoint of CarsAPI
    func getCarsList(_ completion: @escaping (ResultType<[Car]>) -> Void) {
        
        guard let carsListURL = URL(string: "\(baseUrl)\(Endpoint.cars.rawValue)") else { return }
        
        var baseUrlRequest = URLRequest(url: carsListURL)
        baseUrlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        baseUrlRequest.httpMethod = "GET"

        let session = URLSession.shared
        
        session.dataTask(with: baseUrlRequest, completionHandler: { (data, response, error) in
            guard error == nil else {
                completion(ResultType.Failure(e: error!))
                return
            }
            
            guard let data = data else {
                completion(ResultType.Failure(e: error!))
                return
            }
            
            do {
                let jsonFromData =  try JSONDecoder().decode([Car].self, from: data)
                completion(ResultType.Success(jsonFromData))
            } catch DecodingError.dataCorrupted(let context) {
                completion(ResultType.Failure(e: DecodingError.dataCorrupted(context)))
            } catch DecodingError.keyNotFound(let key, let context) {
                completion(ResultType.Failure(e: DecodingError.keyNotFound(key, context)))
            } catch DecodingError.typeMismatch(let type, let context) {
                completion(ResultType.Failure(e: DecodingError.typeMismatch(type, context)))
            } catch DecodingError.valueNotFound(let value, let context) {
                completion(ResultType.Failure(e: DecodingError.valueNotFound(value, context)))
            } catch {
                completion(ResultType.Failure(e:JSONDecodingError.unknownError))
            }
            
        }).resume()
    }
}



