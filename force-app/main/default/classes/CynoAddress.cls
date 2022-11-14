public class CynoAddress {
    public string firstLineOfAddress{get;set;}
    public string secondLineOfAddress{get;set;}
    public string city{get;set;}
    public string postalCode{get;set;}
    public string state{get;set;}
    public string country{get;set;}
    public CynoAddress(String fAddress,
                        String sAddress,
                        String city,
                        String pcode,
                        String state,
                        String country){
        this.firstLineOfAddress=fAddress;
        this.secondLineOfAddress=sAddress;
        this.city=city;
        this.postalCode=pcode;
        this.state=state;
        this.country=country;
    } 
}