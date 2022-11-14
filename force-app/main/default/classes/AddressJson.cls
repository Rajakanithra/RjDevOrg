public class AddressJson {
    public class person{
        /*{
  "name": "John",
  "citiesLived": ["Chennai", "Hyderabad"],
  "addressesLived": [
    {
      "houseNumber": "123",
      "streetLine": "Someplace",
      "area": "Thiruvanmiyur",
      "city": "Chennai"
    },
    {
      "houseNumber": "456",
      "streetLine": "Someplace",
      "area": "Miyapur",
      "city": "Hyderabad"
    }
  ]
}*/
        public string Name;
        public List<string> citiesLived;
        public List<Address> addressesLived;
    }
    public class Address{
        public String houseNumber;
        public String streetLine;
        public String area;
        public string city;
    }
}