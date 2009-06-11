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


    	def siteList = new ArrayList<Site>()
    	def siteKeys = currentUser().sites
    	
    	siteKeys?.each { key ->
    		siteList << persistenceManager.getObjectById(Site.class,key)
    	}

		def total = 0
		if(  siteList &&  siteList.size() > 0){
			total =  siteList.size()
		}
		[  siteList :  siteList,  siteTotal: total ]
    }

    def show = {
    	Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
	    def site = persistenceManager.getObjectById( Site.class, k  )
        if(!site) {
            flash.message = "Site not found with id ${params.id}"
            redirect(action:list)
        }
        else { 
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
    	
		Key k = KeyFactory.createKey(Site.simpleName, params.id.toInteger())		
   	    site = persistenceManager.getObjectById( Site.class, k  )
		site.properties = params
		
		if(!site.hasErrors() ) {
			try{
				persistenceManager.makePersistent(site)			
				persistenceManager.makePersistent(userSite)
			} finally{
				flash.message = "Site ${site.name} updated"
				redirect(uri:"/sites")	
			}
		}
    }

    def save = {
    	
		def site = new Site(params)
		
		if(!site.hasErrors() ) {
			def user = persistenceManager.getObjectById(User.class, currentUser().key)
			site.users << currentUser().key			
			persistenceManager.makePersistent(site)
			currentUser().sites << site.key			
		
			flash.message = "Site ${site.name} created"
			redirect(uri:"/sites")		
			
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
