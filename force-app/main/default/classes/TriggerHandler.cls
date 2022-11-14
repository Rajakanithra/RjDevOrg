public interface TriggerHandler {
void beforeInsert(List<SObject> newRecords);
}