//
//  StoreInfo.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//


import Foundation

struct StoreInfo : Codable, Equatable  {
    let stores : [Stores]?
}

struct Stores : Codable, Equatable  {
    let storeNumber : String?
    let id : String?
    let name : String?
    let phoneNumber : String?
    let coordinates : Coordinates?
    let address : Address?
    let brandName : String?
    let openStatusText : String?
    let warnings : [String]?
    let addressLines : [String]?
    let schedule : [Schedule]?
}

struct Address : Codable, Equatable  {
    let streetAddressLine1 : String?
    let streetAddressLine2 : String?
    let streetAddressLine3 : String?
    let city : String?
    let countrySubdivisionCode : String?
    let countryCode : String?
    let postalCode : String?
}

struct Schedule : Codable , Equatable {
    let dayName : String?
    let hours : String?
    let open : Bool?
    let holiday : String?
}

struct Coordinates : Codable, Equatable  {
    let latitude : Double?
    let longitude : Double?
}
