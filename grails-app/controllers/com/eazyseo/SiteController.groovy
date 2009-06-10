package com.eazyseo;


import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.datastore.*
import javax.jdo.Query;

class SiteController extends SecurityController {

	def persistenceManager
	
	def eazyseoUserService
    
    def index = { 
    	println "Site index called"    	
    	redirect(uri: "/sites") 
    }
    
    def list = {
    	//def q = persistenceManager.newQuery( Site )
		//def  sList = q.execute()
		//sList.each{ site->
		//	persistenceManager.deletePersistent(site)
		//}
    	println "Site list called $params by ${this.currentUser().email}"
    	println "request: $request"
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		def query = persistenceManager.newQuery( Site )
		def  siteList = query.execute()
		def total = 0
		if(  siteList &&  siteList.size() > 0){
			total =  siteList.size()
		}
		[  siteList :  siteList,  siteTotal: total ]
    }

    def show = {
    	println "site show called: $params"
    	Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	    def site = persistenceManager.getObjectById( Site.class, k  )
        if(!site) {
            flash.message = "Site not found with id ${params.id}"
            redirect(action:list)
        }
        else { 
        println "returning site"
        return [ site : site ] }
    }

    def delete = {
    	println "Site delete called"
	    Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	    def site = persistenceManager.getObjectById( Site.class, k  )
        if(site) {
            try {
                persistenceManager.deletePersistent(site)
                flash.message = "Site ${params.id} deleted"
                redirect(action:list)
            }
            catch(Exception e) {
                flash.message = "Site ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Site not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
    	println "Site edit called"
	    Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	    def site = persistenceManager.getObjectById( Site.class, k  )	    
		if(!site) {
            flash.message = "Site not found with id ${params.id}"
            redirect(action:list)
        }
        else {
			site = persistenceManager.detachCopy( site )    
        	return [ site : site ]
        }
    }

    def update = {
    	println "Site update called"
	 	Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	    def site = persistenceManager.getObjectById( Site.class, k  )
    
    	if(site) {
            site.properties = params
            if(!site.hasErrors()){
	
				try{
					persistenceManager.makePersistent(site)
				} catch( Exception e ){
				   	render(view:'edit',model:[site:site])
				}finally{
					flash.message = "Site ${params.id} updated"
	                redirect(action:show,id:site.key.id)
				}        
 			}
            else {
                render(view:'edit',model:[site:site])
            }
        }
        else {
            flash.message = "Site not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
    	println "create Called for Site controller"
        def site = new Site()
        site.properties = params
        redirect (action:list)
    }

    def save = {
    	println "save action called in Sitecontroller"
    	
    	def site
    	if (params.id) {
    		Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	   	    site = persistenceManager.getObjectById( Site.class, k  )
    		site.properties = params
    	} else {
    		site = new Site(params)
    		
    	}
    	
		if(!site.hasErrors() ) {
			try{
				persistenceManager.makePersistent(site)
				def userSite = new UserSite(site:site, user:user, type:'admin')
				persistenceManager.makePersistent(userSite)
			} finally{
				flash.message = "Site ${site.name} created"
				redirect(action:show,id:site.key.id)	
			}
		}
		
		render(view:'create', model:[site:site])
    }
    
    // may move this to another controller, perhaps user when we have users in the future. 
    def home = {
    	Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	    def site = persistenceManager.getObjectById( Site.class, k  )
        if(!site) {
            flash.message = "Site not found with id ${params.id}"
            redirect(action:list)
        }
        else {
        	
        	// find all stems for this Site
        	
        	// find  
        	render (view: 'home', model:[ site : site ]) 
        }
    }
    
}
