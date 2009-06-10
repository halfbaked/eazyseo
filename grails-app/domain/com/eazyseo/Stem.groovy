package com.eazyseo;

/** 
 * A step is the root of a search phrase, or keyword phrase. It is often the product or service name
 */
import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Stem {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

	@Persistent
	String value

    @Persistent
    Site site

    @Persistent(mappedBy = "stem")
    @Order(extensions = @Extension(vendorName="datanucleus", key="list-ordering", value="averageKoi desc"))
    List<Cusp> cusps = new ArrayList<Cusp>()

    static constraints = {
        key (nullable:true)	    	
	}

    String toString() {
        return value
    }
}
