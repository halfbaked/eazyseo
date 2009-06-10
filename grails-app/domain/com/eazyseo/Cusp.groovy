package com.eazyseo;

/**
 * Cusp is an ackronym for Commonly Used Search Phrase. 
 */
import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Cusp {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

	@Persistent
	String value

    @Persistent(mappedBy = "cusp")
    @Order(extensions = @Extension(vendorName="datanucleus", key="list-ordering", value="date desc"))
    List<CuspEntry> cuspEntrys = new ArrayList<CuspEntry>()    

    @Persistent
    Stem stem

	@Persistent
	Double averageDemand
	
	@Persistent
	Double averageRawSupply
	
	@Persistent
	Double averageFineSupply

	@Persistent
	Double averageKei

	@Persistent		
	Double averageKoi
	
	void updateAverages() {
		if (this.cuspEntrys.size()) {
			def totalDemand = 0
			def totalRawSupply = 0
			def totalFineSupply = 0
			def totalKei = 0
			def totalKoi = 0
			
			def size = this.cuspEntrys.size()
			
			this.cuspEntrys.each { ce ->
				totalDemand += ce.demand
				totalRawSupply += ce.rawSupply
				totalFineSupply += ce.fineSupply
				totalKei += ce.kei
				totalKoi += ce.koi
			}
			this.averageDemand = totalDemand / size
			this.averageRawSupply = totalRawSupply / size
			this.averageFineSupply = totalFineSupply / size
			this.averageKei = totalKei / size
			this.averageKoi = totalKoi /size
		}	
	}
	
    static constraints = {
    	id( visible:false)
    	key nullable:true
    	averageDemand nullable:true
    	averageRawSupply nullable:true
    	averageFineSupply nullable:true
    	averageKei nullable:true
    	averageKoi nullable:true
	}
}
