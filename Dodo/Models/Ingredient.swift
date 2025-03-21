struct Ingredient: Decodable {
    let image: String
    let name: String
    let price: Int
    var isSelected: Bool
}
