public class MatchFetchAPI {
    public static void createMatches() {
        List<Match__c>matchList = new List<Match__c>();
        List<Team__c> teamList = new List<Team__c>();
        /*Http h = new Http();

HttpRequest req = new HttpRequest();
req.setEndpoint('/....');
req.setMethod('GET');

HttpResponse res = h.send(req);
String body = res.getBody();
*/
        // Assuming that this is the response that the API sends
        //String body = '{"matchDetails":[{"matchDetailsMap":{"key":"Sun, 16 Oct 2022","match":[{"matchInfo":{"matchId":42986,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"1st Match, Group A","matchFormat":"T20","startDate":"1665892800000","endDate":"1665905400000","state":"Complete","status":"Namibia won by 55 runs"}}]}},{"matchDetailsMap":{"key":"Sun, 16 Oct 2022","match":[{"matchInfo":{"matchId":42986,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"1st Match, Group A","matchFormat":"T20","startDate":"1665892800000","endDate":"1665905400000","state":"Complete","status":"Namibia won by 55 runs"}}]}},{"matchDetailsMap":{"key":"Sun, 16 Oct 2022","match":[{"matchInfo":{"matchId":42986,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"2nd Match, Group A","matchFormat":"T20","startDate":"1665892800000","endDate":"1665905400000","state":"Complete","status":"Namibia won by 55 runs"}}]}}]}';
        String body = '{"matchDetails":[{"matchDetailsMap":{"key":"Sun, 16 Oct 2022","match":[{"matchInfo":{"matchId":42986,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"1st Match, Group A","matchFormat":"T20","startDate":"1665892800000","endDate":"1665905400000","state":"Complete","status":"Namibia won by 55 runs","team1":{"teamId":161,"teamName":"Namibia","teamSName":"NAM","imageId":172229},"team2":{"teamId":5,"teamName":"Sri Lanka","teamSName":"SL","imageId":172119}}}]}}]}';
        // Deserialize the response
        MatchDetailsClass md = (MatchDetailsClass) JSON.deserialize(body, MatchDetailsClass.class);
        system.debug('Md is:'+md);
        // Save the Match info into Match__c
        /*integer sId,matchId;
        String SName,Description,format,State,Status;
        Datetime stDate,eddate;*/
        for(matchDetailsMapClass mdm : md.matchDetails){
            List<MatchInfoclass> matches = mdm.matchDetailsMap.match;
            system.debug('Matches:'+matches);
            for(MatchInfoclass mi : matches){
                system.debug('Mi:'+mi);
                Long startDateTime = long.valueOf(mi.matchInfo.startDate);
                Datetime sDate = Datetime.newInstance(startDateTime);
                system.debug('sDate is:'+sDate);
                Long endDateTime = long.valueOf(mi.matchInfo.endDate);
                Datetime eDate = Datetime.newInstance(endDateTime);
                system.debug('Enddate is:'+eDate);
                /*sId = mi.matchInfo.seriesId;
                matchId = mi.matchInfo.matchId;
                SName = mi.matchInfo.seriesName;
                Description = mi.matchInfo.matchDesc;
                format = mi.matchInfo.matchFormat;
                State = mi.matchInfo.state;
                Status = mi.matchInfo.status;*/
                Match__c mt = new Match__c();
                mt.Name = mi.matchInfo.seriesName;
                mt.MatchDesc__c = mi.matchinfo.matchDesc;
                mt.MatchFormat__c = mi.matchInfo.matchFormat;
                mt.matchId__c = mi.matchInfo.matchId;
                mt.SeriesId__c = mi.matchInfo.seriesId;
                mt.State__c = mi.matchInfo.state;
                mt.Status__c = mi.matchInfo.status;
                mt.StartDate__c = sDate;
                mt.EndDate__c = eDate;
                /*mt.Name = SName;
                mt.MatchDesc__c = Description;
                mt.MatchFormat__c = format;
                mt.State__c = State;
                mt.Status__c = Status;
                mt.SeriesId__c = sId;
                mt.matchId__c = matchId;*/
                matchList.add(mt);
                
            }
        }
        insert matchList;
        system.debug('Final Output:'+matchList);
        integer count = 0;
        for(matchDetailsMapClass mdm : md.matchDetails){
            List<MatchInfoclass> matches = mdm.matchDetailsMap.match;
            system.debug('Matches:'+matches);
            for(MatchInfoclass mi : matches){
                Team__c teams = new Team__c();
                teams.TeamId__c = mi.matchInfo.team1.teamId;
                teams.Name = mi.matchInfo.team1.teamName;
                teams.TeamSName__c = mi.matchInfo.team1.teamSName;
                teams.ImageId__c = mi.matchInfo.team1.imageId;
                teams.Match__c = matchList.get(count).Id;
                teamList.add(teams);
                Team__c teams1 = new Team__c();
                teams1.TeamId__c = mi.matchInfo.team2.teamId;
                teams1.Name = mi.matchInfo.team2.teamName;
                teams1.TeamSName__c = mi.matchInfo.team2.teamSName;
                teams1.ImageId__c = mi.matchInfo.team2.imageId;
                teams1.Match__c = matchList.get(count).Id;
                teamList.add(teams1);
            }
        }
        insert teamList;
        system.debug('TeamList is:'+teamList);
    }
    public class MatchDetailsClass{
        public List<matchDetailsMapClass> matchDetails;
    }
    public class MatchDetailsMapClass{
        public MatchClass matchDetailsMap;
    }
    public class MatchClass{
        public string key;
        public List<MatchInfoclass> match;
    }
    public class MatchInfoclass{
        public MatchInformationClass matchInfo;
    }   
    public class MatchInformationClass{
        public integer matchId;
        public integer seriesId;
        public string seriesName;
        public string matchDesc;
        public string matchFormat;
        public string state;
        public string status;
        public string startDate;
        public string endDate;
        public TeamClass team1;
        public TeamClass team2;
    }
    public class TeamClass{
        public Integer teamId;
        public string teamName;
        public string teamSName;
        public Integer imageId;
    }
    
}