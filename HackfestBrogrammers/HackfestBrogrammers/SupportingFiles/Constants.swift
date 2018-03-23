//
//  Constants.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

//
//  Constans.swift
//  SOS
//
//  Created by ITLabAdmin on 12/13/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

struct Constants {
    
    static var lang: String?
    
    static var shared: Constants {
        struct Static {
            static let instance = Constants()
        }
        return Static.instance
    }
    
    struct Network {
        
        struct ErrorMessage {
            static var NO_INTERNET_CONNECTION = "no_internet_connection"
            static var UNABLE_LOAD_DATA = "unable_load_data"
            static let NO_HTTP_STATUS_CODE = "Unable to get response HTTP status code"
            static var UNAUTHORIZED = "unauthorized"
            
            init() {
                Network.ErrorMessage.NO_INTERNET_CONNECTION = "no_internet_connection"
                Network.ErrorMessage.UNABLE_LOAD_DATA = "unable_load_data"
                Network.ErrorMessage.UNAUTHORIZED = "unauthorized"
            }
        }
        
        struct EndPoints {
            static let Token_auth = "api/token-auth"
            static let Login = "api/user/login"
            static let UpdateUser = "api/user"
            static let SignUp = "api/user/signup"
            static let FinOffice = "api/fin-office"
            static let NewRossahar = "api/news/rossahar?limit=50&offset=0"
            static let LocalNews = "api/news/domestic?limit=50&offset=0"
            static let Expenses = "api/expenses"
            static let SugarJom = "api/sugar-jom"
            static let Currencies = "api/currency"
            static let Weather = "api/weather"
            static let GetUser = "api/user"
            static let GetFields = "api/field"
            static let GetServices = "api/service"
            static let GetTechnologies = "api/technology"
            static let GetSuppliers = "api/supplier"
            static let FieldExpenses = "api/expenses"
            static let BeetPoint = "api/beet-point"
            static let ChangePassword = "api/user/change-password"
            static let RegisterToken = "api/user/register-token"
        }
    }
}



