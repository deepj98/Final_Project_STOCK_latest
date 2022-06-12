

import Foundation

var stocklist : [StockHolding] = []

 stocklist = [
    StockHolding(sharePrice : 45,currSharePrice: 87.8,numOfShare: 9,compName: "TATA"),
    StockHolding(sharePrice : 23.6,currSharePrice: 12,numOfShare: 15,compName: "WIPRO"),
    StockHolding(sharePrice : 67,currSharePrice: 87,numOfShare: 3,compName: "RELIANCE"),
    StockHolding(sharePrice : 98.2,currSharePrice: 35,numOfShare: 7, compName: "ZARA"),
    StockHolding(sharePrice : 12,currSharePrice: 113,numOfShare: 100,compName: "AMAZON"),
    
    StockHolding(sharePrice : 34,currSharePrice: 276.2,numOfShare: 23,compName: "BATA"),
    StockHolding(sharePrice : 122,currSharePrice: 89,numOfShare: 15,compName: "GOOGLE"),
    StockHolding(sharePrice : 56.1,currSharePrice: 90,numOfShare: 56,compName: "APPLE"),
    StockHolding(sharePrice : 78,currSharePrice: 15.1,numOfShare: 156,compName: "NIVEA"),
    StockHolding(sharePrice : 09,currSharePrice: 100,numOfShare: 89,compName: "PUMA")

   ]
stocklist.append(ForeignStockHolding(frgnSharePrice: 45.3, frgnCurrSharePrice: 12.3, frgnNumOfShare: 98, fgrnCompName: "ADIDAS", conversionRate: 2))
stocklist.append(ForeignStockHolding(frgnSharePrice: 89.1, frgnCurrSharePrice: 34, frgnNumOfShare: 7, fgrnCompName: "WALMART", conversionRate: 1.5))
stocklist.append(ForeignStockHolding(frgnSharePrice: 12.4, frgnCurrSharePrice: 46.1, frgnNumOfShare: 34, fgrnCompName: "BELL", conversionRate: 3.2))



var option : Int = 1


func objectOf(stocklist1 : StockHolding) -> String // to check to which type the object belongs
{
    if ((stocklist1 as? ForeignStockHolding) != nil)
    {
        return "Foreign"
    }
    else
    {
        return "Local"
    }
}

func addStocks( type : String) // to add stoks to the stocklist array
{
    print("Please enter the Stock name")
    let val1 = String(readLine()!)
    
    print("Please enter buy price of stock")
    let val2 = Float(readLine()!)
    
    print("Please enter Current price of stock")
    let val3 = Float(readLine()!)
    
    print("Please enter number of stock")
    let val4 = Int(readLine()!)
    
    if (type == "local"  )
    {
         stocklist.append(StockHolding(sharePrice: val2!, currSharePrice: val3!,
                    numOfShare: val4!, compName: val1))
        
    }
    else
    {
        print("Please enter conversion rate")
   
        let val5 = Float(readLine()!)
        stocklist.append(ForeignStockHolding(frgnSharePrice: val2!, frgnCurrSharePrice: val3!,
                                             frgnNumOfShare: val4!, fgrnCompName: val1,conversionRate: val5!))
    }
}

//func validateStock()->Bool   // to check whether the stocklist array is empty
//{
//   if stocklist.isEmpty
//    {
//        print("Please add some stocks and try again !!\n" )
//        return false
//    }
//   else
//   {
//        return true
//   }
//}

func calProfit(index : Int)-> Float // to calculate profit percentage for a given stock
{
    return ((stocklist[index].currentSharePrice - stocklist[index].purchaseSharePrice ) * 100
        / stocklist[index].purchaseSharePrice)
}

func showMenu()
{
print("\nChose option from (1-8) below :")
print("1 : Add Stock")
print("2 : Display Stock with lowest value")
print("3 : Display Stock with highest Value")
print("4 : Display most profitable Stock")
print("5 : Display least profitable Stock")
print("6 : Display stocks from A-Z")
print("7 : Display stocks lowest to highest Value")
print("8 : Exit")
}

public func displayIndividualStock (index : Int)
{

    if (stocklist.isEmpty)
    {
        print("No Stocks available !")
    }
    else
    {
   
        print("Company Name : \(stocklist[index].companyName)\nNumber of Shares : \(stocklist[index].numberOfShares) \nPurchase Price : \(stocklist[index].purchaseSharePrice)\nCurrent Price :  \(stocklist[index].currentSharePrice)\nCost in Dollars : \(stocklist[index].costInDollars())\nValue in Dollars : \(stocklist[index].valueInDollars())\nShare Type : \(objectOf(stocklist1: stocklist[index]))\n")
        
      }
}

public func diplaystocks()
{
    if (stocklist.isEmpty)
    {
     print("No Stocks available !")
    }
    else
    {
        for count in 0...stocklist.count-1
        {
         
            print("Number of Shares : \(stocklist[count].numberOfShares) \nPurchase Price : \(stocklist[count].purchaseSharePrice)\nCurrent Price :  \(stocklist[count].currentSharePrice)\nCompany Name : \(stocklist[count].companyName)\nCost in Dollars : \(stocklist[count].costInDollars())\nValue in Dollars : \(stocklist[count].valueInDollars())\nShare Type : \(objectOf(stocklist1: stocklist[count]))\n")
            
        }
    }
}



func main()
{
repeat
{
    while ((option >= 1 && option <= 7) )
    {
        showMenu()
       
        option = Int(readLine(strippingNewline: true)!)!
       
        switch option
        {
              case  1:// for adding a stock
            
                    print("Please select type of stock you want to choose :\n1 for Local Stocks\n2 for Foreign Stocks")
           
                    let a = Int(readLine()!)!
            
                    if (a == 1)
                    {
                    
                        addStocks ( type : "local")
                        displayIndividualStock(index: stocklist.count-1)
                    }
                    if (a == 2)
                    {
                        addStocks (type : "foriegn")
                        displayIndividualStock(index: stocklist.count-1)
                    }
            
              case  2://Diplay stock with least purchase price
            
                    if (stocklist.isEmpty)
                    {
                        print("No Stocks available !")
                        break
                    }
                    else{
          
                        print("Stock with lowest value is ==>")
            
            
                        stocklist.sort(by:{ $0.purchaseSharePrice < $1.purchaseSharePrice })
            
            
                        displayIndividualStock(index: 0)
                    }
              case  3://diplay stock with highest purchase price
              
                    if (stocklist.isEmpty)
                    {
                        print("No Stocks available !")
                        break
                    }
                    else
                    {
                        print("Stock with highest value is ==>")
                        stocklist.sort(by: { $0.purchaseSharePrice > $1.purchaseSharePrice }) // swathi
            
                        displayIndividualStock(index: 0)
                    }
              case  4://display Most profitable stock
            
                    if (stocklist.isEmpty)
                    {
                        print("No Stocks available !")
                        break
                    }
                    var temp :Int = 0
                    var max : Float = calProfit(index: 0)
            
                    for i in 0...stocklist.count-1
                    {
                        if (max < calProfit(index: i))
                        {
                            max = calProfit(index: i)
                            temp = i
                        }
                    }
                    print("Most profitable Stock with profit percentage of \(max) % is ==>")
                    displayIndividualStock(index: temp)
              case  5://display least profitable stock
                    if (stocklist.isEmpty)
                    {
                        print("No Stocks available !")
                        break
                    }
                    var temp :Int = 0
                    var min : Float = calProfit(index: 0)
            
                    for i in 0...stocklist.count-1
                    {
                        if (min > calProfit(index: i))
                        {
                            min = calProfit(index: i)
                            temp = i
                        }
                    }
                    print("Least profitable Stock with profit percentage of \(min) % is ==>")
                    displayIndividualStock(index: temp)
            
              case  6://Diplay stock from A-Z in ascending order of company name
                 
                    stocklist.sort(by: { $0.companyName < $1.companyName })
                    diplaystocks()
            
              case  7://Diplay stocks from lowest to highest purchase price
                     
                    stocklist.sort(by: { $0.purchaseSharePrice < $1.purchaseSharePrice })
                    diplaystocks()
              case  8: break
              default: break
            }
    }
}
while (option != 8)
print("Exiting Application..." )
 
}
main()


