public class ChangeRequestBusinessDayCalculation {
private static String WORKING_BUSINESS_HOUR = 'Working Hours Support';
    
    @InvocableMethod(label='Calculate the working day based on Planned Start Time' description='Returns Planned SLA Start Time' category='Case')
    public static List<DateTime> setPlannedSLAStartTime(List<FlowInputs> fInputs) {

        List<BusinessHours> bHours = [select Id from BusinessHours where Name =: WORKING_BUSINESS_HOUR];
        List<DateTime> plannedSLAStartTimes = new List<DateTime>();
        DateTime plannedSLAStartTime;


        if(!fInputs.isEmpty()){
            Integer businessDays = 0;
            if(fInputs.get(0).changeType == 'Internal'){
                businessDays = 8;
            }
            else if(fInputs.get(0).changeType == 'External'){
                businessDays = 5;
            }
            
            System.debug('businessDays : '+businessDays);
            System.debug('plannedSLAStartTime1 : '+plannedSLAStartTime);
            System.debug('fInputs.get(0).changeType : '+fInputs.get(0).changeType);

            if(businessDays != 0){
                plannedSLAStartTime = BusinessHours.add(bHours.get(0).Id, fInputs.get(0).plannedStartTime, -(businessDays*8*60*60*1000L));
                System.debug('plannedSLAStartTime2 : '+plannedSLAStartTime);
            }
            
            if((plannedSLAStartTime != null && plannedSLAStartTime < System.now()) || fInputs.get(0).changeType == 'Emergency'){
                plannedSLAStartTime = System.now().addDays(1);
            }

            plannedSLAStartTimes.add(plannedSLAStartTime);
        }

        return plannedSLAStartTimes;
    }

    public class FlowInputs{
    
        @InvocableVariable
        public DateTime plannedStartTime;
        
        @InvocableVariable
        public String changeType;
    }

}