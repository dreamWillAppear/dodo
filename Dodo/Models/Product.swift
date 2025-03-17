struct Product: Decodable {
    var name: String
    var details: String
    var price: Int
    var image: String
    let isAddition: Bool
}
