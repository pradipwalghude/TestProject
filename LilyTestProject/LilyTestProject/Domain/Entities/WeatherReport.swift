
//
//  WheatherReport.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

struct WeatherReport : Codable, Equatable {
	let coord : Coord?
	let weather : [Weather]?
	let base : String?
	let main : Main?
	let visibility : Int?
	let wind : Wind?
	let clouds : Clouds?
	let dt : Int?
	let sys : Sys?
	let timezone : Int?
	let id : Int?
	let name : String?
	let cod : Int?
}

struct Clouds : Codable, Equatable {
    let all : Int?
}

struct Sys : Codable, Equatable {
    let type : Int?
    let id : Int64?
    let sunrise : Int?
    let sunset : Int?
}

struct Coord : Codable, Equatable {
    let lon : Double?
    let lat : Double?
}
 
struct Weather : Codable, Equatable {
    let id : Int64?
    let main : String?
    let description : String?
    let icon : String?
}

struct Main : Codable, Equatable {
    let temp : Double?
    let feels_like : Double?
    let temp_min : Double?
    let temp_max : Double?
    let pressure : Int?
    let humidity : Int?
}

struct Wind : Codable, Equatable {
    let speed : Double?
    let deg : Int?
    let gust : Double?
}
