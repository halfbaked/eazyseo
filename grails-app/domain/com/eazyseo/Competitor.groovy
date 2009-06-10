package com.eazyseo;

import javax.jdo.annotations.*;
// import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Competitor {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Long id

	@Persistent
	String webUrl

    @Persistent
    String description

    @Persistent
	String keywords 

    // Competitive Directness is a value that rates how direct a competitor is
    @Persistent
    Integer competitiveDirectness

    // The ranking of the competitor URL
    @Persistent
    Integer pageRank

    static constraints = {
    	id( visible:false)
	}
}
