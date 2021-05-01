//
//  APIRequest.swift
//  MobileAppProject
//
//  Created by Laptop on 2021-04-10.
//  Copyright © 2021 Meghan Paris. All rights reserved.
//

import Foundation
enum APIError:Error{
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    let resourceURL:URL
    
    init(endpoint:String){
        let resourceString = "http://localhost:8080\(endpoint)"
        guard let resourceURL = URL(string:resourceString)else{ fatalError()}
        self.resourceURL = resourceURL
    }
    //save
    func save(_ userToSave:LoginObject,completion:@escaping(Result<LoginObject,APIError>) -> Void ){
        do {
            var urlRequest = URLRequest(url:resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(userToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200, let jsonData = data else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let messageData = try JSONDecoder().decode(LoginObject.self, from: jsonData)

                completion(.success(messageData))

            }catch{
                completion(.failure(.decodingProblem))
            }
            
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    
    //register
    func register(_ userToSave:RegisterObject,completion:@escaping(Result<RegisterObject,APIError>) -> Void ){
        do {
            var urlRequest = URLRequest(url:resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(userToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200, let jsonData = data else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let messageData = try JSONDecoder().decode(RegisterObject.self, from: jsonData)

                completion(.success(messageData))

            }catch{
                completion(.failure(.decodingProblem))
            }
            
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    //find
    func finduser(_ userToSave:FindUserObject,completion:@escaping(Result<FindUserObject,APIError>) -> Void ){
        do {
            var urlRequest = URLRequest(url:resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(userToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200, let jsonData = data
            else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let messageData = try JSONDecoder().decode(FindUserObject.self, from: jsonData)
                completion(.success(messageData))

            }catch{
                print("this is message data \(jsonData)")
                completion(.failure(.decodingProblem))
            }
            
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    //send request
    func userrequest(_ userToSave:RequestObject,completion:@escaping(Result<RequestObject,APIError>) -> Void ){
        do {
            var urlRequest = URLRequest(url:resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(userToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200, let jsonData = data
            else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let messageData = try JSONDecoder().decode(RequestObject.self, from: jsonData)
                completion(.success(messageData))

            }catch{
                print("this is message data \(jsonData)")
                completion(.failure(.decodingProblem))
            }
            
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    //balance sheet
        func balancesheetrequest(_ userToSave:BalancesheetObjects,completion:@escaping(Result<BalancesheetObjects,APIError>) -> Void ){
        do {
            var urlRequest = URLRequest(url:resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(userToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200, let jsonData = data
            else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let messageData = try JSONDecoder().decode(BalancesheetObjects.self, from: jsonData)
                completion(.success(messageData))

            }catch{
                print("this is message data \(jsonData)")
                completion(.failure(.decodingProblem))
            }
            
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    
    
}
