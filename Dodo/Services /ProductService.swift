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
    
    func fetchCategories() -> [Category] {
        categories
    }
    
    func fetchProducts() -> [Product] {
        products
    }
    
}
