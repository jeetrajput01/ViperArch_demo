//
//  AppConstants.swift
//  ViperArchSwift
//
//  Created by Jeet Rajput  on 11/02/24.
//

import Foundation


enum apiURLs {
    
    static let apiKey  = "65c89ea0f6e57759384ae632"
    static let baseURL = "https://dummyapi.io/data/v1/"
    static let userList =  baseURL + "user?limit=10"
    static let userData = baseURL + "user/"
    static let addUser = baseURL + "user/create"
}
