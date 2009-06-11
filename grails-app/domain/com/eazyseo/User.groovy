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
	
	@Persistent
	List<Key> sites = new ArrayList<Key>()
	
    static constraints = {
        key (nullable:true)	            
	}

    String toString() {
        return email
    }
    
    def getSites(){
	    // added, as known bug returns null for empty collections
		// on development environment
    	if(sites == null) {
    		sites = new ArrayList<Key>()
    	}
    	return sites
    }
    
}
