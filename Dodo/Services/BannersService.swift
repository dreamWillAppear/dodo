import Foundation

final class BannersService {
    
    static let shared = BannersService()
    
    private init() {}
    
    func fetchBanners(completion: @escaping (Result<[Banner], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: API.Endpoint.banners.url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("LOG fetchBanners StatusCode - \(response.statusCode)")
            }
            
            let decoder = JSONDecoder()
            
            do {
                let bannersQuery = try decoder.decode([Banner].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(bannersQuery))
                }
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
    
}
