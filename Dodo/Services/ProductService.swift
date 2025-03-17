import UIKit

final class ProductService {
    
    static let shared = ProductService()
    
    private init() {}
    
    private let categories: [Category] = [
        Category(label: "Новинки", isSelected: true),
        Category(label: "Пиццы", isSelected: false),
        Category(label: "Комбо", isSelected: false),
        Category(label: "Закуски", isSelected: false),
        Category(label: "Завтраки", isSelected: false),
        Category(label: "Напитки", isSelected: false)
    ]
    
    private let products: [Product] = [
        Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
        Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
        Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
        Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
        Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
        Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
        Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
        Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
        Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
        Product(name: "Барбекю", details: "", price: 66, image: "bbqSauce", isAddition: true),
        Product(name: "Сырный соус", details: "", price: 66, image: "cheeseSauce", isAddition: true),
        Product(name: "Сгущенное молоко", details: "", price: 57, image: "condensedMilk", isAddition: true),
        Product(name: "Чесночный соус", details: "", price: 75, image: "garlicSauce", isAddition: true),
        Product(name: "Горчичный соус", details: "", price: 51, image: "mustardSauce", isAddition: true),
        Product(name: "Малиновый джем", details: "", price: 65, image: "raspberryJam", isAddition: true)
    ]
    
    func fetchCategories() -> [Category] {
        categories
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: API.Endpoint.products.url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("LOG " + response.statusCode.description)
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
