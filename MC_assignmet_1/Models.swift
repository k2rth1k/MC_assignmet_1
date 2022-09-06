//
//  Models.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/4/22.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company

    struct Address: Decodable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo

        struct Geo: Decodable {
            var lat: String
            var lng: String
        }
    }

    struct Company: Decodable {
        var name: String
        var catchPhrase: String
        var bs: String
    }
}

struct PosterResp: Identifiable, Decodable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id=id
        self.name=name
    }
    
    
}
