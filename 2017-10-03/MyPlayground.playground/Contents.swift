// Optionals
let number = Int("23")
print(number!)

let teachers = ["Dave", "Steve", "James"]
let index = teachers.index(of: "Dave")
print("Index of Dave is \(index)")

// Force Unwrap
//print("Forced index is \(index!)")


// Conditional Unwrap
if let unwrappedIndex = index {
  print("Value of index is \(unwrappedIndex)")
} else {
  print("Can't find value")
}

// Guarded Unwrap
func getIndex(name: String) {
  let index = teachers.index(of: name)
  
  guard let myIndex = index else {
    print("Need to pass a valid teacher name")
    return
  }
  
  print("Index of \(name) is \(myIndex)")
}
getIndex(name: "Morty")

// Casting
class Person {
  var name: String = ""
}

class Employee : Person {
  var salary: Int = 0
}

let dave = Person()
dave.name = "Dave"

let rick = Employee()
rick.name = "Rick"
rick.salary = 100000

var people = [Person]()
people.append(contentsOf: [dave, rick])

// Condinal Casting
let employeeFromArray = people[1] as? Employee
if let employee = employeeFromArray {
  print("\(employee.name) is making \(employee.salary)")
}

let emp2 = people[1] as! Employee
print("\(emp2.name) is making \(emp2.salary)")

// Generics

class Stack<T> {
  private var internalArray = [T]()
  
  public func add(item: T) {
    internalArray.append(item)
  }
  
  public func pop() -> T {
    return internalArray.popLast()!
  }
}

//let numberStack = Stack<Int>()


let cards = Stack<String>()
cards.add(item: "Ace of Clubs")
cards.add(item: "Two of Clubs")
cards.add(item: "Three of Clubs")
cards.add(item: "Four of Clubs")
cards.add(item: "Five of Clubs")

print(cards.pop())
print(cards.pop())
print(cards.pop())
print(cards.pop())
print(cards.pop())

class Card {
  // Access control
  private let value : Int
  private let suit : Suit
  
  enum CardError : Error {
    case InvalidValue(value: Int)
  }
  
  init(value: Int, suit: Suit) throws {
    if (value < 1 || value > 13) {
      throw CardError.InvalidValue(value: value)
    }
    
    self.value = value
    self.suit = suit
  }
  
  func cardName() -> String {
    if (value == 1) {
      return "Ace of \(suit.toString())"
    }
    
    return "\(value) of \(suit.toString())"
    
  }
  
  // Tuples
  func values() -> (Int, Suit) {
    return (value, suit)
  }
  
  // Custom Operators
  
  static func >(first: Card, second: Card) -> Bool {
    if (first.suit == second.suit) {
      return first.value > second.value
    } else {
      return false
    }
  }
  
  enum Suit {
    case Club
    case Spade
    case Heart
    case Diamond
    
    func toString() -> String {
      switch self {
      case .Club:
        return "Clubs"
      case .Diamond:
        return "Diamonds"
      case .Heart:
        return "Hearts"
      case .Spade:
        return "Spades"
      }
    }
  }
}
do {
  let badCard = try Card(value: 15, suit: .Heart)
} catch let error {
  // Error Handling
  if let cardError = error as? Card.CardError {
    switch cardError {
    case let .InvalidValue(value):
      print("<<<<<<")
      print("Card value must be between 1 and 13, value passed was: \(value)")
    }
  }
}

let deck = Stack<Card>()

do {
  deck.add(item: try Card(value: 1, suit: .Club))
  deck.add(item: try Card(value: 2, suit: .Club))
  deck.add(item: try Card(value: 3, suit: .Club))
  deck.add(item: try Card(value: 4, suit: .Club))
  deck.add(item: try Card(value: 5, suit: .Club))
  
  print(deck.pop().cardName())
  let aceOfSpades = try Card(value: 1, suit: .Spade)
  deck.add(item: aceOfSpades)
  print(deck.pop().cardName())
  
  // Tuples
  let (value, suit) = aceOfSpades.values()
  print("Ace of spades: Value: \(value); Suit: \(suit)")
  
  // Custom operators
  let kingOfSpades = try Card(value: 13, suit: .Spade)
  if kingOfSpades > aceOfSpades {
    print("King is good!")
  }
  
  let badCard = try Card(value: 0, suit: .Heart)
} catch let error {
  // Error Handling
  if let cardError = error as? Card.CardError {
    switch cardError {
    case let .InvalidValue(value):
      print("Card value must be between 1 and 13, value passed was: \(value)")
    }
  }
}