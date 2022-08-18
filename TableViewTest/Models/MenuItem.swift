//
//  MenuItem.swift
//  TableViewTest
//
//  Created by Богдан Баринов on 18.08.2022.
//

import Foundation

struct MenuItem {
    let name: String
    let description: String
    let imageName: String
    let weight: String
    let price: String
    let kkal: String
    
    init(name: String, description: String, imageName: String, weight: String, price: String, kkal: String) {
        self.name = name
        self.description = description
        self.imageName = imageName
        self.weight = weight
        self.price = price
        self.kkal = kkal
    }
    

}

struct MockData {
    static let menuItems = [
        MenuItem(
            name: "Биг Тейсти",
            description: "Биг Тейсти - это сандвич с большим, рубленым бифштексом из 100% натуральной свежей говядины на булочке «Биг Тейсти» с кунжутом. Особый шарм сандвичу придают 3 куска сыра «Эмменталь», два ломтика помидора, свежий салат, лук и пикантный соус «Гриль»",
            imageName: "Big Tasty",
            weight: "340 г",
            price: "249 руб",
            kkal: "812 ккал"),
        MenuItem(
            name: "Чизбургер",
            description: "Чизбургер - это рубленый бифштекс из натуральной цельной 100% говядины с кусочками сыра «Чеддер» на карамелизованной булочке, заправка из горчицы, кетчуп, лук и кусочки маринованного огурчика.",
            imageName: "Cheeseburger",
            weight: "113 г",
            price: "50 руб",
            kkal: "302 ккал"),
        MenuItem(
            name: "Гамбургер",
            description: "Гамбургер - это рубленый бифштекс из 100% натуральной говядины на карамелизованной булочке, заправка из горчицы, немного кетчупа, свежий лук и кусочки маринованного огурчика.",
            imageName: "Gamburger",
            weight: "99 г",
            price: "48 руб",
            kkal: "253 ккал"),
        MenuItem(
            name: "Картофель фри",
            description: "Картофель Фри - это порция хрустящих, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля.",
            imageName: "Fried potatoes",
            weight: "76 г",
            price: "48 руб",
            kkal: "231 ккал"),
        MenuItem(
            name: "Шримп Ролл",
            description: "Шримп Ролл - это нежные тигровые креветки в панировочных сухарях, свежий салат «Айсберг» и лук, завернутые в пресную пшеничную лепешку и заправленные специальным соусом.",
            imageName: "Shrimp roll",
            weight: "177 г",
            price: "169 руб",
            kkal: "445 ккал")
    ]
}
