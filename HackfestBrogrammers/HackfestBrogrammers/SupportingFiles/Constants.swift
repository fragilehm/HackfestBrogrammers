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
            static let Categories = "categories"
            static let NeedMarkers = "need/categories"
            static let WantMarkers = "want/categories"
            static let Marker = "markers"
            static let Organizations = "organizations"
            static let User = "user"



        }
    }
    struct Settings {
        static let SettingsName = ["Добавить историю", "Выбрать язык"]
        static let SettingsImageName = ["language", "story"]
        static let SettingsTitle = ["Профиль", "Настройки", ""]
    }
    struct StartingPage {
        static let StartingTitle = ["Нуждаюсь в помощи", "Хочу помочь", "Метки"]
        static let StartingDescription = ["В этой категории вы сможете обратиться за помощью и найти на карте пользователей, которые смогут вам помочь. Также получить контакты, адреса, подробную информацию и посмотреть его историю действий. ", "В этой категории вы сможете найти на карте нуждающихся в помощи пользователей, а также посмотреть подробную информацию об этом пользователе, обратиться к нему и посмотреть его историю действий.", "Метки, которые вы увидите или оставите на карте могут быть трех цветов. Серые метки могут быть оставлены пользователями, которые не прошли психологическое анкетирование при регистрации и не привязаны к какой-либо организации. Им отдается меньшее предпочтение в предоставлении помощи."]
    }
    
    struct GoogleMaps {
        static let APIKey = "AIzaSyAN8gCpx3O-k75hB2OkAx1gGImHRad0msw"
    }
//    struct Main {
//        static let MarkerColors = ["": , "": , "": ""]
//    }
    

}



