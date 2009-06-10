package com.eazyseo;


import com.google.appengine.api.datastore.*
class CuspController {

	def persistenceManager
    
    def index = { 
    println "calling cusp controller index action"
    
    redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST', show: 'GET']

    def list = {
    	Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger()).addChild(Stem.simpleName, params.stemId.toInteger()).getKey()
		
	    def stem = persistenceManager.getObjectById(Stem, k)
	    
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		
		def  cuspList = stem.cusps
		def total = 0
		if(  cuspList &&  cuspList.size() > 0){
			total =  cuspList.size()
		}
		[  cuspList :  cuspList,  cuspTotal: total , stem : stem]
    }

    def show = {
    	println "starting show action of cusp controller $params"
    	
    	Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger()).addChild(Stem.simpleName, params.stemId.toInteger()).addChild(Cusp.simpleName, params.id.toInteger()).getKey()
	    def cusp = persistenceManager.getObjectById( Cusp.class, k  )
	    
        if(!cusp) {
            flash.message = "Cusp not found with id ${params.id}"
            redirect(action:list)
        }
        
       
        else { 
         println "cusp properties: ${cusp.properties}"
        return [ cusp : cusp ] }
    }

    def delete = {
		Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger())
    		.addChild(Stem.simpleName, params.stemId.toInteger())
    		.addChild(Cusp.simpleName, params.id.toInteger()).getKey()
    		
    	def cusp = persistenceManager.getObjectById(Cusp, k)
        
        if(cusp) {
            try {
                persistenceManager.deletePersistent(cusp)
                flash.message = "Cusp deleted"                
            }
            catch(Exception e) {
                flash.message = "Cusp could not be deleted"                
            }
            
        } else {
            flash.message = "Cusp not found with id ${params.id}"
        }
        
        redirect(uri:"/site/${params.siteId}/stem/${params.stemId}/cusps")
    }

    def update = {
    	if (params.id) {
    		    	
        	Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger())
        		.addChild(Stem.simpleName, params.stemId.toInteger())
        		.addChild(Cusp.simpleName, params.id.toInteger()).getKey()
        		
        	def cusp = persistenceManager.getObjectById(Cusp, k)
        	
        	cusp.properties = params
        	
        	if(cusp.validate() ) {
        		persistenceManager.makePersistent(cusp)
        		flash.message = "Stem updated successfully"
        		redirect(uri:"/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${cusp.key.id}")
        	}
        } 
        
        render "bad call"
        
    }

    def add = {
    	if (request.method == 'GET') {
    		def cusp = new Cusp() 
    		if (params.stem?.id) {    			
    			Key k = new KeyFactory.Builder(Site.simpleName, 4).addChild(Stem.simpleName, params.stem.id.toInteger()).getKey()
    			cusp.stem = persistenceManager.getObjectById(Stem, k)
    		} 
    		render view: 'add', model: [cusp: cusp]
    		
    	} else {
    		def cusp = new Cusp(params['cusp'])    		
    		Key k = new KeyFactory.Builder(Site.simpleName, 4).addChild(Stem.simpleName, params.stem.id.toInteger()).getKey()
    		def stem = persistenceManager.getObjectById(Stem,k)
    		cusp.stem = stem
    		if(cusp.validate()) {
    			stem.cusps << cusp
    			persistenceManager.makePersistent(cusp)  
    			redirect controller: 'stem', id:"${params.stem.id}", action:'show'  			
    		} else {
    			render view:'add', model: [cusp:cusp]
    		}
    	}     
    }
    
    def create = {
        def cusp = new Cusp()
        cusp.properties = params
        return ['cusp':cusp, stems: persistenceManager.newQuery(Stem).execute()]
    }
    
    def save = {
        def cusp = new Cusp(params)
        Key k = new KeyFactory.Builder(Site.simpleName, params.siteId.toInteger()).addChild(Stem.simpleName, params.stemId.toInteger()).getKey()
        def stem = persistenceManager.getObjectById(Stem, k)
        cusp.stem = stem
        
        if (cusp.validate()) {
         	stem.cusps << cusp			
			persistenceManager.makePersistent(stem)
			flash.message = "Cusp created"
		
        } else {        	
        	flash.message = "Cusp creation failed"    
		}
		redirect(uri: "/site/${params.siteId}/stem/${params.stemId}")
		
    }
        
}
