//
//  AirportModel.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation

struct AirportModel : Codable {
    let items : [Items]?

    enum CodingKeys: String, CodingKey {

        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
    }

}

struct Items : Codable, Identifiable {
    let id = UUID()
    let icao : String?
    let iata : String?
    let name : String?
    let shortName : String?
    let municipalityName : String?
    let location : Location?
    let countryCode : String?

    enum CodingKeys: String, CodingKey {

        case icao = "icao"
        case iata = "iata"
        case name = "name"
        case shortName = "shortName"
        case municipalityName = "municipalityName"
        case location = "location"
        case countryCode = "countryCode"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icao = try values.decodeIfPresent(String.self, forKey: .icao)
        iata = try values.decodeIfPresent(String.self, forKey: .iata)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        municipalityName = try values.decodeIfPresent(String.self, forKey: .municipalityName)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
    }

}

struct Location : Codable {
    let lat : Double?
    let lon : Double?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lon = "lon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
    }

}
