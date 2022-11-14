public class AbstractCat extends AbstractAnimal {
    public override void typeOfAnimal(){
        system.debug('This is abstract Child Class Cat');
    }
    public override void typeOfSound(){
        system.debug('Cat sound is like mew');
    }
}