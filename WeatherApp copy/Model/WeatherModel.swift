//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let connection, vary, cdnPullZone, cdnUid: String
    let cdnRequestCountryCode, age, xWeatherapiQpmLeft, cdnProxyVer: String
    let cdnRequestPullSuccess, cdnRequestPullCode, cdnCachedAt, cdnEdgeStorageID: String
    let cdnStatus, cdnRequestID, cdnCache, acceptRanges: String
    let contentLength, cacheControl, contentType, date: String
    let server, via: String

    enum CodingKeys: String, CodingKey {
        case connection = "Connection"
        case vary = "Vary"
        case cdnPullZone = "CDN-PullZone"
        case cdnUid = "CDN-Uid"
        case cdnRequestCountryCode = "CDN-RequestCountryCode"
        case age = "Age"
        case xWeatherapiQpmLeft = "x-weatherapi-qpm-left"
        case cdnProxyVer = "CDN-ProxyVer"
        case cdnRequestPullSuccess = "CDN-RequestPullSuccess"
        case cdnRequestPullCode = "CDN-RequestPullCode"
        case cdnCachedAt = "CDN-CachedAt"
        case cdnEdgeStorageID = "CDN-EdgeStorageId"
        case cdnStatus = "CDN-Status"
        case cdnRequestID = "CDN-RequestId"
        case cdnCache = "CDN-Cache"
        case acceptRanges = "Accept-Ranges"
        case contentLength = "Content-Length"
        case cacheControl = "Cache-Control"
        case contentType = "Content-Type"
        case date = "Date"
        case server = "Server"
        case via = "Via"
    }
}

// MARK: - Welcome
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Int
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMB: Int
    let pressureIn: Double
    let precipMm, precipIn, humidity, cloud: Int
    let feelslikeC, feelslikeF: Double
    let visKM, visMiles, uv: Int
    let gustMph, gustKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String
    let code: Int
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
