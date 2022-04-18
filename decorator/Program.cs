using System;

class Program
{
    static void Main(string[] args)
    {
        // Result - Name: "American burger with 2x meat", Cost: 500
        Burger Burger1 = new AmericanBurger();
        Burger1 = new DoubleBurger(Burger1); 
 
        // Result - Name: "American burger with cheese", Cost: 430
        Burger Burger2 = new AmericanBurger();
        Burger2 = new CheeseBurger(Burger2); 

        // Result - Name: "Mexican burger with 2x meat and with cheese", Cost: 430
        Burger Burger3 = new MexicanBurger();
        Burger3 = new DoubleBurger(Burger3);
        Burger3 = new CheeseBurger(Burger3); 
    }
}
 
abstract class Burger
{
    public Burger(string name)
    {
        this.Name = name;
    }
    public string Name {get; protected set;}
    public abstract int GetCost();
}
 
class AmericanBurger : Burger
{
    public AmericanBurger() : base("American burger")
    { }
    public override int GetCost()
    {
        return 400;
    }
}
class MexicanBurger : Burger
{
    public MexicanBurger() : base("Mexican burger")
    { }
    public override int GetCost()
    {
        return 300;
    }
}
 
abstract class BurgerDecorator : Burger
{
    protected Burger Burger;
    public BurgerDecorator(string name, Burger burger) : base(name)
    {
        this.Burger = burger;
    }
}
 
class DoubleBurger : BurgerDecorator
{
    public DoubleBurger(Burger burger) 
        : base(burger.Name + " with x2 meat", burger) { }
 
    public override int GetCost()
    {
        return Burger.GetCost() + 100;
    }
}
 
class CheeseBurger : BurgerDecorator
{
    public CheeseBurger(Burger burger)
        : base(burger.Name + " with cheese", burger) { }
 
    public override int GetCost()
    {
        return Burger.GetCost() + 30;
    }
}