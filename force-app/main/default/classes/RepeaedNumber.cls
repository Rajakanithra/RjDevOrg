public class RepeaedNumber 
{
public static void consecutiveList(List<Integer> numList)
{
    Integer count = 0;
    for(Integer i=0; i<numList.size(); i++)
    {
       system.debug(numList[i]+' '+numList[i]);
       if(numList[i] == 2)
       {
           count++;
       }
    }
    system.debug('count------>'+count);
}
}