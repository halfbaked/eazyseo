package com.eazyseo;

/**
 * A cusp entry is an entry of data relating to a cusp. Splitting out this data from the cusp classes allows us to keep historical records of a particular cusp. 
 */
import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class CuspEntry {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key
    
    @Persistent
    Cusp cusp
    
    // Monthly Searches
    @Persistent
    Long demand

	@Persistent
	Long rawSupply // Total search results returned

    @Persistent
    Long fineSupply // Total search results returned from allinanchor: search

	@Persistent
	Double kei
	
	@Persistent 	
	Double koi
	
    @Persistent
    Date date = new Date()
		
    static constraints = {    	
    	key nullable:true   
	}
	
}
