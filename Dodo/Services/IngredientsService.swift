final class IngredientsService {
    
    static let shared = IngredientsService()
    
    private init() {}
    
    private let ingredients: [Ingredient] = [
        Ingredient(image: IngredientsImageName.bacon, name: "Бекон", price: 126, isSelected: true),
        Ingredient(image: IngredientsImageName.hotChorizo, name: "Острый чоризо", price: 91, isSelected: false),
        Ingredient(image: IngredientsImageName.redOnion, name: "Красный лук", price: 84, isSelected: false),
        Ingredient(image: IngredientsImageName.bavarianSausages, name: "Баварские колбаски", price: 110, isSelected: false),
        Ingredient(image: IngredientsImageName.italianHerbs, name: "Итальянские травы", price: 86, isSelected: false),
        Ingredient(image: IngredientsImageName.shrimps, name: "Креветки", price: 56, isSelected: false),
        Ingredient(image: IngredientsImageName.bellPepper, name: "Болгарский перец", price: 132, isSelected: false),
        Ingredient(image: IngredientsImageName.jalapeno, name: "Халапеньо", price: 85, isSelected: false),
        Ingredient(image: IngredientsImageName.spicyBeef, name: "Острая говядина", price: 69, isSelected: false),
        Ingredient(image: IngredientsImageName.champignons, name: "Шампиньоны", price: 50, isSelected: false),
        Ingredient(image: IngredientsImageName.meatBalls, name: "Митболы", price: 56, isSelected: false),
        Ingredient(image: IngredientsImageName.spicyPepperoni, name: "Острый пепперони", price: 119, isSelected: false),
        Ingredient(image: IngredientsImageName.cheddarNParmesan, name: "Чеддер и пармезан", price: 134, isSelected: false),
        Ingredient(image: IngredientsImageName.mozzarella, name: "Моцарелла", price: 71, isSelected: false),
        Ingredient(image: IngredientsImageName.tenderChicken, name: "Нежная курица", price: 143, isSelected: false),
        Ingredient(image: IngredientsImageName.cheeseCubes, name: "Кубики брынзы", price: 96, isSelected: false),
        Ingredient(image: IngredientsImageName.pickles, name: "Огурцы маринованные", price: 78, isSelected: false),
        Ingredient(image: IngredientsImageName.tomato, name: "Томаты", price: 67, isSelected: false),
        Ingredient(image: IngredientsImageName.ham, name: "Ветчина", price: 108, isSelected: false),
        Ingredient(image: IngredientsImageName.pineapples, name: "Ананасы", price: 94, isSelected: false)
    ]
    
    func fetchIngredientss() -> [Ingredient] {
        ingredients
    }
}

