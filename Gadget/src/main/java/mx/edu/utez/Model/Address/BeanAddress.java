package mx.edu.utez.Model.Address;

public class BeanAddress {
    private long idAddress;
    private String street;
    private String suburb;
    private int postalCode;
    private String state;
    private String country;

    public BeanAddress() {
    }

    public BeanAddress(long idAddress, String street, String suburb, int postalCode, String state, String country) {
        this.idAddress = idAddress;
        this.street = street;
        this.suburb = suburb;
        this.postalCode = postalCode;
        this.state = state;
        this.country = country;
    }

    public long getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(long idAddress) {
        this.idAddress = idAddress;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getSuburb() {
        return suburb;
    }

    public void setSuburb(String suburb) {
        this.suburb = suburb;
    }

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
        this.postalCode = postalCode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
