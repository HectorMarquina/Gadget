package mx.edu.utez.Model.Gadget;


import mx.edu.utez.Model.Address.BeanAddress;
import mx.edu.utez.Service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoGadget {
    private Connection con;
    private CallableStatement cstm;
    private ResultSet rs;
    final private Logger CONSOLE = LoggerFactory.getLogger(DaoGadget.class);

    public List<BeanGadget> findAll(){
        List<BeanGadget> listGadgets = new ArrayList<>();

        try {
            con = ConnectionMySQL.getConnection();
            cstm =con.prepareCall("{call sp_findGadget}");
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanGadget beanGadget = new BeanGadget();
                BeanAddress beanAddress = new BeanAddress();

                beanGadget.setIdGadget(rs.getLong("idGadget"));
                beanGadget.setName(rs.getString("nameGadget"));
                beanGadget.setDate(rs.getString("dateGadget"));
                beanGadget.setStatus(rs.getInt("statusGadget"));
                beanAddress.setIdAddress(rs.getLong("idAddress"));
                beanAddress.setStreet(rs.getString("street"));
                beanAddress.setSuburb(rs.getString("suburb"));
                beanAddress.setPostalCode(rs.getInt("postalCode"));
                beanAddress.setState(rs.getString("state"));
                beanAddress.setCountry(rs.getString("country"));
                beanGadget.setAddressId(beanAddress);
                listGadgets.add(beanGadget);
            }
        }catch (SQLException e){
            CONSOLE.error("Se ha encontrado el error:" + e);
        }finally {
            ConnectionMySQL.closeConnection(con,cstm,rs);
        }

        return listGadgets;
    }
    public boolean create(BeanGadget beanGadget){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_create(?,?,?,?,?,?,?)}");
            cstm.setString(1, beanGadget.getName());
            cstm.setString(2,beanGadget.getAddressId().getStreet());
            cstm.setString(3,beanGadget.getAddressId().getSuburb());
            cstm.setInt(4,beanGadget.getAddressId().getPostalCode());
            cstm.setString(5,beanGadget.getAddressId().getState());
            cstm.setString(6,beanGadget.getAddressId().getCountry());
            cstm.setString(7,beanGadget.getDate());
            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Se ha encontrado el error: " + e.getMessage());
        }finally{
        ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }
    public BeanGadget findById(long id){
        BeanGadget beanGadget = null;

        try {
            con = ConnectionMySQL.getConnection();
            cstm =con.prepareCall("{call sp_findById(?)}");
            cstm.setLong(1, id );
            rs = cstm.executeQuery();

            if(rs.next()){
                 beanGadget = new BeanGadget();
                BeanAddress beanAddress = new BeanAddress();

                beanGadget.setIdGadget(rs.getLong("idGadget"));
                beanGadget.setName(rs.getString("nameGadget"));
                beanGadget.setDate(rs.getString("dateGadget"));
                beanGadget.setStatus(rs.getInt("statusGadget"));
                beanAddress.setIdAddress(rs.getLong("idAddress"));
                beanAddress.setStreet(rs.getString("street"));
                beanAddress.setSuburb(rs.getString("suburb"));
                beanAddress.setPostalCode(rs.getInt("postalCode"));
                beanAddress.setState(rs.getString("state"));
                beanAddress.setCountry(rs.getString("country"));
                beanGadget.setAddressId(beanAddress);
            }
        }catch (SQLException e){
            CONSOLE.error("Se ha encontrado el error:" + e);
        }finally {
            ConnectionMySQL.closeConnection(con,cstm,rs);
        }

        return beanGadget;
    }
    public boolean update(BeanGadget beanGadget){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_update(?,?,?,?,?,?,?,?,?)}");
            cstm.setLong(1, beanGadget.getIdGadget());
            cstm.setLong(2,beanGadget.getAddressId().getIdAddress());
            cstm.setString(3, beanGadget.getName());
            cstm.setString(4,beanGadget.getAddressId().getStreet());
            cstm.setString(5,beanGadget.getAddressId().getSuburb());
            cstm.setInt(6,beanGadget.getAddressId().getPostalCode());
            cstm.setString(7,beanGadget.getAddressId().getState());
            cstm.setString(8,beanGadget.getAddressId().getCountry());
            cstm.setString(9,beanGadget.getDate());
            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Se ha encontrado el error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }
    public boolean delete(long id){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_delete(?)}");
            cstm.setLong(1, id);
            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Se ha encontrado el error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }
}
