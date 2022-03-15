//
//  AppError.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
public enum AppError: Error {
    case internalError
    case decodingError
    case serverError(code: Int, message: String)
    case nullParametersError
}
