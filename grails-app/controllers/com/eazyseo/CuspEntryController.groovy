package com.eazyseo;


import com.google.appengine.api.datastore.*
class CuspEntryController {

	def persistenceManager
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
    	Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger())
    		.addChild(Stem.simpleName, params.stemId.toInteger())
    		.addChild(Cusp.simpleName, params.cuspId.toInteger()).getKey()
		
	    def cusp = persistenceManager.getObjectById(Cusp, k)
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		
		def  cuspEntryList = cusp.cuspEntrys
		
		def total = 0
		if(  cuspEntryList &&  cuspEntryList.size() > 0){
			total =  cuspEntryList.size()
		}
		[  cuspEntryList :  cuspEntryList,  cuspEntryTotal: total, cusp: cusp ]
    }

    def show = {
    	Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger())
    		.addChild(Stem.simpleName, params.stemId.toInteger())
    		.addChild(Cusp.simpleName, params.cuspId.toInteger())
    		.addChild(CuspEntry.simpleName, params.id.toInteger()).getKey()
    		
	    def cuspEntry = persistenceManager.getObjectById( CuspEntry, k  )
	    
        if(!cuspEntry) {
            flash.message = "CuspEntry not found with id ${params.id}"
            redirect(uri: "/site/${params.siteId}/stem/${params.stemId}/cusp/${params.cuspId}/cuspEntrys")
        }
        else { return [ cuspEntry : cuspEntry ] }        
    }

    def delete = {
        Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger())
    		.addChild(Stem.simpleName, params.stemId.toInteger())
    		.addChild(Cusp.simpleName, params.cuspId.toInteger())
    		.addChild(CuspEntry.simpleName, params.id.toInteger()).getKey()
    		
    	def cuspEntry = persistenceManager.getObjectById(CuspEntry, k)
        
        if(cuspEntry) {
            try {
                persistenceManager.deletePersistent(cuspEntry)
                flash.message = "CuspEntry deleted"                
            }
            catch(Exception e) {
                flash.message = "CuspEntry could not be deleted"                
            }
            
        } else {
            flash.message = "CuspEntry not found with id ${params.id}"
        }
        
        redirect(uri:"/site/${params.siteId}/stem/${params.stemId}/cusp/${params.cuspId}")
    }

    def save = {
        def cuspEntry = new CuspEntry(params)
        def d = cuspEntry.demand
        
        if (d && cuspEntry.rawSupply)  
        	cuspEntry.kei = (d*d)/cuspEntry.rawSupply
        		
        if (d && cuspEntry.fineSupply)
        	cuspEntry.koi = (d*d)/cuspEntry.fineSupply	
        		
        Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger())
        	.addChild(Stem.simpleName, params.stemId.toInteger())
        	.addChild(Cusp.simpleName, params.cuspId.toInteger()).getKey()
        	
        def cusp = persistenceManager.getObjectById(Cusp, k)
        cuspEntry.cusp = cusp
        
		if(cuspEntry.validate()) {
			cusp.cuspEntrys << cuspEntry
			cusp.updateAverages()
			persistenceManager.makePersistent(cuspEntry)
			flash.message ="Cusp Entry Created"
		}else{
			cuspEntry.errors.allErrors.each {
				println "error: $it"
			}
			flash.message = "Cusp Entry Creation Failed"
		}
		redirect(uri: "/site/${params.siteId}/stem/${params.stemId}/cusp/${params.cuspId}/cuspEntrys")	
	}
   	
}
