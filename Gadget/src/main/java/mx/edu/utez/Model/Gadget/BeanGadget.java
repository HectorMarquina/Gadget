package mx.edu.utez.Model.Gadget;
import mx.edu.utez.Model.Address.BeanAddress;

public class BeanGadget {
    private long idGadget;
    private String name;
    private String date;
    private BeanAddress addressId;
    private int status;

    public BeanGadget() {
    }

    public BeanGadget(long idGadget, String name, String date, BeanAddress addressId, int status) {
        this.idGadget = idGadget;
        this.name = name;
        this.date = date;
        this.addressId = addressId;
        this.status = status;
    }

    public long getIdGadget() {
        return idGadget;
    }

    public void setIdGadget(long idGadget) {
        this.idGadget = idGadget;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BeanAddress getAddressId() {
        return addressId;
    }

    public void setAddressId(BeanAddress addressId) {
        this.addressId = addressId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
