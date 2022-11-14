public class OpptStageUpdateClass {
    public static void opptyStatusUpdateMethod(List<Opportunity> triggernew)
    {
        List<Opportunity>opty = new List<Opportunity>();
        for(Opportunity Op : triggernew)
        {
            Op.Amount=0;
            if(Op.StageName == 'Qualification')
            {
                Op.Amount = Op.Amount + 1000;
            }
            else if(Op.StageName == 'Needs Analysis'){
                Op.Amount = Op.Amount + 2000;            }
        }
        
    }
   
}