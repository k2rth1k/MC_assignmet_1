//
//  RestTool.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/4/22.
//
import SwiftUI

class Network: ObservableObject{
    
    @Published var users: [User] = []
    @Published var link="https://6e13-2600-8800-1b03-2f00-f474-11c8-ab50-c985.ngrok.io"
    
    func getUsers() {
        guard let url = URL(string: link+"/users") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                        self.users = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func postUser(){
        guard let url = URL(string: link+"/poster") else { fatalError("Missing URL") }
        let body: [String: String] = ["username": "username", "password": "password"]
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod="POST"
        urlRequest.httpBody=finalBody
        urlRequest.setValue("\(String(describing: finalBody?.count))", forHTTPHeaderField: "Content-Length")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            print("-----> data: \(data)")
            print("-----> error: \(error)")
                        
                        guard let data = data, error == nil else {
                            print(error?.localizedDescription ?? "No data")
                            return
                        }
            let decoder = JSONDecoder()

            do {
                let people = try decoder.decode(PosterResp.self, from: data)
                print(people)
                self.posterResp.name = people.name
                self.posterResp.id = people.id
            } catch {
                print(error.localizedDescription)
            }
                        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                        print("-----1> responseJSON: \(responseJSON)")
                        if let responseJSON = responseJSON as? [String: Any] {
                            print("-----2> responseJSON: \(responseJSON)")
                        }
        }

        dataTask.resume()
    }
}
