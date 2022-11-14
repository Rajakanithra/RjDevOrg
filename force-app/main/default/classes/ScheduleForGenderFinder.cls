public class ScheduleForGenderFinder implements Schedulable {
    public void execute(SchedulableContext sc){
        BatchForGenderFinder gf = new BatchForGenderFinder();
        dataBase.executeBatch(gf,100);
    }
}