package org.mlag.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "roleId", identifierField = "roleId", table = "USERROLES")
public class UserRoles {

    /**
     */
    @NotNull
    @Size(max = 40)
    private String roleName;

    /**
     */
    @NotNull
    private Integer userId;
}
