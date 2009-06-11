package com.eazyseo;

/** 
 * Represents the relationship between a User and a Site
 */
import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class UserSite {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

	@Persistent
	String type // Name of relationship: Admin, Power, or Basic
	
	@Persistent
	Key user
	
	@Persistent
	Key site
	       
    static constraints = {
        key (nullable:true)	    	
	}

    String toString() {
        return type
    }
   
}