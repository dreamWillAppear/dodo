//
//  NetworkError.swift
//  Dodo
//
//  Created by dreamlogin on 17.03.2025.
//

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingFailed
    case noData
    case statusCode(Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "LOG" + "Некорректный URL"
        case .requestFailed:
            return "LOG" + "Ошибка запроса"
        case .invalidResponse:
            return "LOG" + "Некорректный ответ от сервера"
        case .decodingFailed:
            return "LOG" + "Ошибка декодирования данных"
        case .noData:
            return "LOG" + "Данные отсутствуют"
        case .statusCode(let code):
            return "LOG" + "Ошибка: код состояния \(code)"
        }
    }
}
