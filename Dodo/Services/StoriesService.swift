import UIKit

final class StoriesService {
    
    static let shared = StoriesService()
    
    private init() {}
        
    func fetchStories(completion: @escaping (Result<[Story], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: API.Endpoint.stories.url) { data, response, error in
            guard let response = response as? HTTPURLResponse,  let data,  error == nil
            else {
                completion(.failure(.noData))
                return
            }
            
            if (200...299).contains(response.statusCode) {
                let decoder = JSONDecoder()
                
                do {
                    let storiesQuery = try decoder.decode([Story].self, from: data)
                    completion(.success(storiesQuery))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
        }.resume()
    }
    
}
