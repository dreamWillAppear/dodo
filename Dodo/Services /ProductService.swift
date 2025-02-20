final class ProductService {
    
    static let shared = ProductService()
    
    private init() {}
    
    private let categories: [String] = [
        "Новинки",
        "Пиццы",
        "Комбо",
        "Закуски",
        "Завтраки",
        "Напитки"
    ]
    
    private let products: [Product] = [
        Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni"),
        Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni"),
        Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni")
    ]
    
    func fetchCategories() -> [String] {
        categories
    }
    
    func fetchProducts() -> [Product] {
        products
    }
    
}
