import Foundation

final class ProductService {
    
    static let shared = ProductService()
    
    private init() {}
    

    
    func fetchCategories(completion: @escaping (Result<[Category], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: API.Endpoint.categories.url) { data, response, error in
            guard let data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                completion(.failure(.noData))
                return
            }
            
            if (200...299).contains(response.statusCode) {
                
                let decoder = JSONDecoder()
                
                do {
                    let categoriesQuery = try decoder.decode([Category].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(categoriesQuery))
                    }
                } catch {
                    completion(.failure(.decodingFailed))
                }
                
            } else {
                completion(.failure(.statusCode(response.statusCode)))
            }
            
        }.resume()
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: API.Endpoint.products.url) { data, response, error in
            
            guard let data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                completion(.failure(.noData))
                return
            }
            
      
            
            let decoder = JSONDecoder()
            
            do {
                let productQuery = try decoder.decode([Product].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(productQuery))
                }
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
    
}
