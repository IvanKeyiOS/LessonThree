import UIKit

//: ## Home work 3

/*:
 ### Задание 1
 1.1 Представьте, что вы владелец розничного магазина и вам необходимо закупить товар, стоимость которого варьируется от его количества. Если количество закупаемого товара меньше 10 позиций, то цена равна 1000 рублей за штуку. От 10 до 20 единиц товара будет стоить вам 800 рублей за штуку. И вы заплатите 600 рублей за единцу при единовременно покупке от 20 единиц. Создайте условие для расчета цены за еденицу товара взависимости от его количества и подсичитайте общую сумму используя конструкцию `if-else`. Постарайтесь написать короткое и читаемое решение
 */

var amountProduct = 20
var price = 0
var finalSum = 0
if amountProduct < 10 {
    price = 1000
} else if amountProduct < 20 {
    price = 800
} else {
    price = 600
}

finalSum = amountProduct * price

print("Количество: \(amountProduct) шт, цена: \(price) рублей, общая сумма: \(finalSum) рублей")

/*:
 ## Упражнение - опциональные значения
 
 >Во время выполнения упражнений данного плейграунда, вы будете выводить в консоль опциональные значения.  Компилятор Swift выдаст предупреждение: «Expression implicitly coerced from `Int?` to Any».  Для целей выполнения заданий, можете данные предупреждения игнорировать.
 
 Ваше приложение запрашивает пользователя его возраст.  Введённые пользователем данные передаются вам в виде текста, `String`.  Однако, вам нужно сохранить значение в виде целого числа `Int`.  Пользователь может сделать ошибку и ввести неверные данные.
 
 Объявите константу `userInputAge` типа `String` и присвойте ей значение "34e" для моделирования опечатки.  Затем определите константу `userAge` типа `Int` и используйте конструктор `Int` для преобразования `userInputAge`.  Какую ошибку вы получаете?
 */

var userInputAge = "34"

//let userAge: Int = Int(userInputAge)


/*:
 Теперь поменяйте тип `userAge` на `Int?`, и напечатайте значение `userAge`.  Почему значение `userAge` равно `nil`?  Ответьте в комментарии или внутри команды print.
 */

var userAge: Int? = Int(userInputAge)

/*:
 Теперь исправьте опечатку в значении `userInputAge`.  Что-нибудь в результатах вывода кажется вам неуместным?
 
 Напечатайте `userAge` снова, но теперь извлеките `userAge` с помощью оператора «!».
 */

userInputAge = "34"
userAge = Int(userInputAge)
print(userAge!)

/*:
 Используйте привязку опционалов для извлечения `userAge`.  Если `userAge` содержит значение, выведите его в консоль.
 */

if let userAge = userAge {
    print(userAge)
}

/*:
 Теперь снова эмулируйте опечатку и попробуйте вывести на консоль целочисленное значение переменной `userInputAge`, при помощи оператора "!". Какую ошибку вы получите? Почему?
 */

userInputAge = "34e"
//print(Int(userInputAge)!)

/*:
 ### Задание 3
 3.1 Доработать свое собственное решение первой половны второго задания прошлого урока с использованием оператора ветвления if-else.
 */
let dayOfBirth = 4
let monthOfBirth = 4
let yearOfBirth = 1991

var currentDay = 1
var currentMonth = 11
var currentYear = 2023

let secondsPerDay = 60 * 60 * 24
let daysPerMonth = 30
let monthPerYear = 12

var yearsFromBirth = 0
var monthFromBirth = 0
var daysFromBirth = 0
var secondsFromBirth = 0

let birthdayIsDone = currentMonth >= monthOfBirth && currentDay >= dayOfBirth

if  birthdayIsDone {
    yearsFromBirth = currentYear - yearOfBirth
    monthFromBirth = (yearsFromBirth * monthPerYear) + (currentMonth - monthOfBirth)
    daysFromBirth = (monthFromBirth * daysPerMonth) + (currentDay - dayOfBirth)
} else {
    yearsFromBirth = currentYear - yearOfBirth
    monthFromBirth = (yearsFromBirth + 1) * monthPerYear + (currentMonth - monthOfBirth)
    daysFromBirth = (monthFromBirth * daysPerMonth) + (currentDay - dayOfBirth)
    
    if currentDay < dayOfBirth {
        monthFromBirth -= 1
    }
}

secondsFromBirth = daysFromBirth * secondsPerDay // Количество секунд

print("\(yearsFromBirth) years, \(monthFromBirth) months, \(daysFromBirth) days and \(secondsFromBirth) seconds have passed since my birth")

/*
 3.2 Вторую половину этого же задания необходимо выполнить, используя switch.
 */
switch monthOfBirth {
case 1...2:
    print("I was born in the first quarter")
case 3...5:
    print("I was born in the second quarter")
case 6...8:
    print("I was born in the third quarter")
case 9...11:
    print("I was born in the fourth quarter")
default:
    print("I was born in the first quarter")
}

/*:
 ### Задание 4
 4.1 Как вы знаете, после выполнения кода, расположенного в блоке `case`, происходит завершение работы конструкции `switch-case`. Однако в некоторых случаях требуется не завершать работу конструкции `switch-case`, а перейти к выполнению кода в следующем блоке `case`. Для этого в конце блока `case` указывается ключевое слово `fallthrough`. Представьте, что существует три уровня готовности к чрезвычайным ситуациям: **A**, **B** и **C**. Каждая степень предусматривает выполнение ряда мероприятий, причем каждый последующий уровень включает в себя мероприятия предыдущих уровней. В зависимости от переданного уровня необходимо вывести на консоль все предназначенные для выполнения мероприятия. При этом минимальный уровень готовности — это **C**, максимальный — **A** (включает в себя мероприятия уровней C и B). В случае возникновения ситуации **A** необходимо "Выключить все электрические приборы". **B** - "Закрыть входные двери и окна". **C** - "Соблюдать спокойствие"
 */

let level: Character = "A"

switch level {
case "A":
    print("Выключить все электрические приборы")
    fallthrough
case "B":
    print("Закрыть входные двери и окна")
    fallthrough
case "C":
    print("Соблюдать спокойствие")
default:
    break
}
/*:
 ### Задание 5
 5.1 С помощью блоков `case` вы определяете возможные значения, которые может принять выражение. Однако Swift позволяет в пределах одного блока case указать не только на значение рассматриваемого параметра, но и на зависимость от какого-либо условия. Данный функционал реализуется с помощью ключевого слова `where` в блоке `case`. В этом задании вам необходимо отсортировать конфеты **M&M's** по цвету и по начинке. В первую кучку нужно собрать красные конфеты с шоколадом внутри. Во вторую кучку собирите все желтые конфеты с орехами. А втретью кучку коричневые и зеленые с шоколадом внутри. Нужно реализовать только логику для сортировки конфет.
 
 */

let color = "Brown" 
let filling = "Chocolate"

switch color {
case "Red" where filling == "Chocolate":
    print("Положите эти конфеты в первую кучку")
case "Yellow" where filling == "Nut":
    print("Положите эти конфеты во вторую кучку")
case "Brown" where filling == "Chocolate",
     "Green" where filling == "Chocolate":
    print("Положите эти конфеты в третью кучку")
default:
    break
}




