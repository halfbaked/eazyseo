package com.eazyseo;

import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Invitation {
	
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
 	Key key

	@Persistent
	String email
	
	@Persistent
	String message

    @Persistent
    Site site
    
    @Persistent
    User invitor
    
    @Persistent
    User invitee
    
    static constraints = {
    	id(visible:false)
    	invitee(nullable:true)
    	message(nullable:true)
	}
	
	String toString() {
		return "invitation to $email"
	}
	
}
