final class IngredientsService {
    
    static let shared = IngredientsService()
    
    private init() {}
    
    private let ingredients: [Ingredient] = [
        Ingredient(image: IngredientsImageName.bacon, name: "Бекон", price: 126),
        Ingredient(image: IngredientsImageName.hotChorizo, name: "Острый чоризо", price: 91),
        Ingredient(image: IngredientsImageName.redOnion, name: "Красный лук", price: 84),
        Ingredient(image: IngredientsImageName.bavarianSausages, name: "Баварские колбаски", price: 110),
        Ingredient(image: IngredientsImageName.italianHerbs, name: "Итальянские травы", price: 86),
        Ingredient(image: IngredientsImageName.shrimps, name: "Креветки", price: 56),
        Ingredient(image: IngredientsImageName.bellPepper, name: "Болгарский перец", price: 132),
        Ingredient(image: IngredientsImageName.jalapeno, name: "Халапеньо", price: 85),
        Ingredient(image: IngredientsImageName.spicyBeef, name: "Острая говядина", price: 69),
        Ingredient(image: IngredientsImageName.champignons, name: "Шампиньоны", price: 50),
        Ingredient(image: IngredientsImageName.meatBalls, name: "Митболы", price: 56),
        Ingredient(image: IngredientsImageName.spicyPepperoni, name: "Острый пепперони", price: 119),
        Ingredient(image: IngredientsImageName.cheddarNParmesan, name: "Чеддер и пармезан", price: 134),
        Ingredient(image: IngredientsImageName.mozzarella, name: "Моцарелла", price: 71),
        Ingredient(image: IngredientsImageName.tenderChicken, name: "Нежная курица", price: 143),
        Ingredient(image: IngredientsImageName.cheeseCubes, name: "Кубики брынзы", price: 96),
        Ingredient(image: IngredientsImageName.pickles, name: "Огурцы маринованные", price: 78),
        Ingredient(image: IngredientsImageName.tomato, name: "Томаты", price: 67),
        Ingredient(image: IngredientsImageName.ham, name: "Ветчина", price: 108),
        Ingredient(image: IngredientsImageName.pineapples, name: "Ананасы", price: 94)
    ]

    
    func fetchIngredientss() -> [Ingredient] {
        ingredients
    }
}

