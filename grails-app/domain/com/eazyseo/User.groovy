package com.eazyseo;

/** 
 * A user of the application.
 */
import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class User {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

	@Persistent
	String email
	
    static constraints = {
        key (nullable:true)	            
	}

    String toString() {
        return email
    }
    
}
