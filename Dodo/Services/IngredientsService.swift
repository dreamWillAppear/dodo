import Foundation

final class IngredientsService {
    
    static let shared = IngredientsService()
    
    private init() {}
    
    func fetchIngredientss(completion: @escaping (Result<[Ingredient],NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: API.Endpoint.ingredients.url) { data, response, error in
            guard let data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                completion(.failure(.noData))
                return
            }
            
            if (200...299).contains(response.statusCode) {
                
                let decoder = JSONDecoder()
                
                do {
                    let ingredientsQuery = try decoder.decode([Ingredient].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(ingredientsQuery))
                    }
                } catch {
                    let error = error
                    print(error.localizedDescription)
                    completion(.failure(.decodingFailed))
                }
                
            } else {
                completion(.failure(.statusCode(response.statusCode)))
            }
        }.resume()
    }
    
}

