public class AbstractDog extends AbstractAnimal {
    public override void typeOfAnimal(){
        system.debug('This is Abstract Child class Dog');
    }
    public override void typeOfSound(){
        system.debug('Dog sound is like bow bow');
    }
}