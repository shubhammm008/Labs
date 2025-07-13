import UIKit
/*:
## Exercise - Guard Statements

 Imagine you want to write a function to calculate the area of a rectangle. However, if you pass a negative number into the function, you don't want it to calculate a negative area. Create a function called `calculateArea` that takes two `Double` parameters, `x` and `y`, and returns an optional `Double`. Write a guard statement at the beginning of the function that verifies each of the parameters is greater than zero and returns `nil` if not. When the guard has succeeded, calculate the area by multiplying `x` and `y` together, then return the area. Call the function once with positive numbers and once with at least one negative number.
 */
func calculateArea(k:Double,k1:Double) ->Double?
{
    guard k>0 && k1>0 else
    {
        return nil
    }
    return k*k1
}
var ok:Double?=calculateArea(k: 23, k1: 10)
if let k=ok{
    print("Area:",k)
}
else
{
    print("nil")
}
//:  Create a function called `add` that takes two optional integers as parameters and returns an optional integer. You should use one `guard` statement to unwrap both optional parameters, returning `nil` in the `guard` body if one or both of the parameters doesn't have a value. If both parameters can successfully be unwrapped, return their sum. Call the function once with non-`nil` numbers and once with at least one parameter being `nil`.
func add(_ k1:Int?, _ k2:Int?) -> Int?
{
    guard let k=k1 else
    {
        return nil
    }
    guard let k3=k2 else
    {
        return nil
    }
    return k+k3
}
var k:Int?=add(10,20)
if let n=k{
    print("Sum:",n)
}
else{
    print("nil")
}


var o:Int?=add(-10,nil)
if let j=o{
    print("Sum:",j)
}
else{
    print("nil")
}
/*:
 When working with UIKit objects, you will occasionally need to unwrap optionals to handle user input. For example, the text fields initialized below have `text` properties that are of type `String?`.

 Write a function below the given code called `createUser` that takes no parameters and returns an optional `User` object. Write a guard statement at the beginning of the function that unwraps the values of each text field's `text` property, and returns `nil` if not all values are successfully unwrapped. After the guard statement, use the unwrapped values to create and return and instance of `User`.
 */
struct User {
    var firstName: String
    var lastName: String
    var age: String
}

let firstNameTextField = UITextField()
let lastNameTextField = UITextField()
let ageTextField = UITextField()

firstNameTextField.text = "Christine"
lastNameTextField.text = "Huang"
ageTextField.text = "28"

func createUser() -> User?
{
    guard let firstName = firstNameTextField.text,
          let lastName = lastNameTextField.text,
          let age = ageTextField.text else {
        return nil
    }
    return User(firstName: firstName, lastName: lastName, age: age)
}


//:  Call the function you made above and capture the return value. Unwrap the `User` with standard optional binding and print a statement using each of its properties.
var n:User?=createUser()
if let p=n{
    print("First Name:",p.firstName,"Last Name:",p.lastName,"Age:",p.age)
}

/*:
page 1 of 2  |  [Next: App Exercise - Guard](@next)
 */
