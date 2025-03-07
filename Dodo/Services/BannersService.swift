final class BannersService {
    
    static let shared = BannersService()
    
    private init() {}

    private let banners: [Banner] = [
        Banner(name: "Гавайская", price: 590, image: "hawaii"),
        Banner(name: "Маргарита", price: 650, image: "margarita"),
        Banner(name: "Пепперони", price: 710, image: "pepperoni"),
        Banner(name: "Гавайская", price: 590, image: "hawaii"),
        Banner(name: "Маргарита", price: 650, image: "margarita"),
        Banner(name: "Пепперони", price: 710, image: "pepperoni"),
        Banner(name: "Гавайская", price: 590, image: "hawaii"),
        Banner(name: "Маргарита", price: 650, image: "margarita"),
        Banner(name: "Пепперони", price: 710, image: "pepperoni")
    ]
    
    func fetchBanners() -> [Banner] {
        banners
    }
    
}
