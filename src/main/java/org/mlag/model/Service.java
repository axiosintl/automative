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
@RooJpaActiveRecord(identifierColumn = "serviceid", identifierField = "serviceid", table = "SERVICE")
public class Service {

    /**
     */
    @NotNull
    @Size(max = 1000)
    private String servicedescription;

    /**
     */
    @NotNull
    @Size(max = 40)
    private String createdby;

    /**
     */
    @NotNull
    private Integer userId;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date createddate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date updateddate;
}
