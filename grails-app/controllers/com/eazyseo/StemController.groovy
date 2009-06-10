package com.eazyseo;


import com.google.appengine.api.datastore.*
class StemController {

	def persistenceManager
    
    def index = { redirect(action:list,params:params) }
    
    def list = {
    	params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
    	
    	def site = persistenceManager.getObjectById( Site.class, Long.parseLong( params.siteId )  )
    	
		def  stemList = site.stems //query.execute()
		def total = 0
		if(  stemList &&  stemList.size() > 0){
			total =  stemList.size()
		}
		[  stemList :  stemList,  stemTotal: total, site:site  ]
		
    }

    def show = {
        	
        Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger()).addChild(Stem.simpleName, params.id.toInteger()).getKey()		
	    def stem = persistenceManager.getObjectById(Stem, k)
        

        if(!stem) {
            flash.message = "Stem not found with id ${params.id}"
            redirect(action:list)
        
        } else { 
            def sortByParam = params.sortBy
	        if (sortByParam) {
	        	stem.cusps.sort { a, b ->
	        		def sa = a."$sortByParam"
	        		println "sorting .. sa: $sa"
	        		a."$sortByParam" <=> b."$sortByParam"
	        	}
	        }
	        println "returning stem"
        	return [ stem : stem ] 
        }
    }

    def delete = {
		if (params.id) {
    		println "update stem: $params"    	
        	Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger()).addChild(Stem.simpleName, params.id.toInteger()).getKey()
        	def stem = persistenceManager.getObjectById(Stem, k)
        	try {
        		persistenceManager.deletePersistent(stem)
        		flash.message = "Stem deleted"
        	} catch (Exception e){
        		flash.message = "Stem deletion failed"
        	}
        	redirect(uri:"/site/${params.siteId}/stems")
    	}        	
    }

    def create = {
        def stem = new Stem()
        stem.properties = params
        return ['stem':stem, sites: persistenceManager.newQuery(Site).execute()]
    }

    def save = {
        System.out.println "params: $params"
        
        def stem = new Stem(params)
        Key k = KeyFactory.createKey(Site.simpleName, params.siteId.toInteger())
        def site = persistenceManager.getObjectById(Site, k)
        stem.site = site
        
		if(stem.validate() ) {
                site.stems << stem			
				persistenceManager.makePersistent(stem)
				flash.message = "Stem ${stem.key.id} created"
				redirect(uri:"/site/${stem.site.key.id}")	
		} else {
    		render(view:'create',model:[stem:stem, sites: persistenceManager.newQuery(Site).execute()])
        }     
    }
    
    def update = {
    	if (params.id) {
    		println "update stem: $params"    	
        	Key k = new KeyFactory.Builder(Stem.simpleName, params.siteId.toInteger()).addChild(Stem.simpleName, params.id.toInteger()).getKey()
        	def stem = persistenceManager.getObjectById(Stem, k)
        	
        	stem.properties = params
        	
        	if(stem.validate() ) {
        		persistenceManager.makePersistent(stem)
        		flash.message = "Stem updated successfully"
        		redirect(uri:"/site/${stem.site.key.id}/stem/${stem.key.id}")
        	}
        } 
        
        render "bad call"
        
    }
    
}
