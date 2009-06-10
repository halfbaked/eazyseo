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
	User user
	
	@Persistent
	Site site
	       
    static constraints = {
        key (nullable:true)	    	
	}

    String toString() {
        return type
    }
    
    def bind() {
    	//site?.userSites << site
    	//user?.userSites << site
    }
    
    def unbind() {
    	//site?.userSites - site
    	//user?.userSites - site
    }
}