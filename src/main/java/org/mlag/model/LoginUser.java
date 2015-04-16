package org.mlag.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "userId", identifierField = "userId", table = "LOGINUSER")
public class LoginUser {

    /**
     */
    @NotNull
    @Size(max = 40)
    private String username;

    /**
     */
    @NotNull
    @Size(max = 20)
    private String password;

    /**
     */
    @NotNull
    @Size(max = 30)
    private String emailId;

    /**
     */
    private Boolean enabled;

    /**
     */
    @NotNull
    @Size(max = 40)
    private String firstName;

    /**
     */
    @NotNull
    @Size(max = 40)
    private String lastName;

    /**
     */
    @NotNull
    @Size(max = 13)
    private String phone;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date dateOfBirth;
}
