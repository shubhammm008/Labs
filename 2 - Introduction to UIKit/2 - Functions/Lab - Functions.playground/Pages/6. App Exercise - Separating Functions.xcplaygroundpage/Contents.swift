/*:
## App Exercise - Separating Functions

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 One principle that can help in debugging and maintaining code is abstraction. For example, in your fitness tracking app some of your existing functions have been written to both perform a calculation and print a message. But it's very possible that you'll decide to change either the calculation or the message in the future. It will be easier to go back and change this if you separate the calculation from the message.

 As an example, write a function that only does a portion of what your previous `pacing` function did. This function will be called `calculatePace`. It should take three `Double` arguments called `currentDistance`, `totalDistance`, and `currentTime`, and should return a `Double` that will represent the time at which the user will finish the run based on the user's current distance and time. call the function and print the return value.
 */
func calculatePace(_ currentDistance:Double,_ totalDistance:Double , _ currentTime:Double) -> Double
{
    var speed=currentDistance/currentTime;
    var time=totalDistance/speed;
    return time;
}
var ok=calculatePace(100, 1000, 10);
print("Time",ok)
//:  Now write a function called `pacing` that takes four `Double` arguments called `currentDistance`, `totalDistance`, `currentTime`, and `goalTime`. The function should also return a `String`, which will be the message to show the user. The function should call `calculatePace`, passing in the appropriate values, and capture the return value. The function should then compare the returned value to `goalTime` and if the user is on pace return "Keep it up!", and return "You've got to push it just a bit harder!" otherwise. Call the function and print the return value.

func calculatePace(currentDistance: Double, currentTime: Double) -> Double {
    return currentTime / currentDistance
}
func pacing(currentDistance: Double, totalDistance: Double, currentTime: Double, goalTime: Double) -> String
{
    let currentPace = calculatePace(currentDistance: currentDistance, currentTime: currentTime)
    let projectedTime = currentPace * totalDistance  //0speed=distance/time
    if projectedTime <= goalTime
    {
        return "Keep it up!"
    }
    else
    {
        return "You've got to push it just a bit harder!"
    }
}
let result = pacing(currentDistance: 3.0, totalDistance: 5.0, currentTime: 18.0, goalTime: 30.0)
print(result)

/*:
 _Copyright © 2023 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 6 of 6
 */
