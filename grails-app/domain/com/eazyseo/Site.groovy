package com.eazyseo;

import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Site {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
 	Key key

	@Persistent
	String name

    @Persistent(mappedBy = "site")
    List<Stem> stems = new ArrayList<Stem>()
    
    static constraints = {
    	id( visible:false)
	}
	
	String toString() {
		return name
	}
}
