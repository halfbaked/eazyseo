package com.eazyseo;

import com.google.appengine.api.datastore.*
class CompetitorController {

	def persistenceManager
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		def query = persistenceManager.newQuery( Competitor )
		def  competitorInstanceList = query.execute()
		def total = 0
		if(  competitorInstanceList &&  competitorInstanceList.size() > 0){
			total =  competitorInstanceList.size()
		}
		[  competitorInstanceList :  competitorInstanceList,  competitorInstanceTotal: total ]
    }

    def show = {
	    def competitorInstance = persistenceManager.getObjectById( Competitor.class, Long.parseLong( params.id )  )
        if(!competitorInstance) {
            flash.message = "Competitor not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ competitorInstance : competitorInstance ] }
    }

    def delete = {
	    def competitorInstance = persistenceManager.getObjectById( Competitor.class, Long.parseLong( params.id )  )
        if(competitorInstance) {
            try {
                persistenceManager.deletePersistent(competitorInstance)
                flash.message = "Competitor ${params.id} deleted"
                redirect(action:list)
            }
            catch(Exception e) {
                flash.message = "Competitor ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Competitor not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
	    def competitorInstance = persistenceManager.getObjectById( Competitor.class, Long.parseLong( params.id )  )
		if(!competitorInstance) {
            flash.message = "Competitor not found with id ${params.id}"
            redirect(action:list)
        }
        else {
			competitorInstance = persistenceManager.detachCopy( competitorInstance )    
        	return [ competitorInstance : competitorInstance ]
        }
    }

    def update = {
	 	def competitorInstance = persistenceManager.getObjectById( Competitor.class, Long.parseLong( params.id )  )
    
    	if(competitorInstance) {
            competitorInstance.properties = params
            if(!competitorInstance.hasErrors()){
	
				try{
					persistenceManager.makePersistent(competitorInstance)
				} catch( Exception e ){
				   	render(view:'edit',model:[competitorInstance:competitorInstance])
				}finally{
					flash.message = "Competitor ${params.id} updated"
	                redirect(action:show,id:competitorInstance.id)
				}        
 			}
            else {
                render(view:'edit',model:[competitorInstance:competitorInstance])
            }
        }
        else {
            flash.message = "Competitor not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def competitorInstance = new Competitor()
        competitorInstance.properties = params
        return ['competitorInstance':competitorInstance]
    }

    def save = {
        def competitorInstance = new Competitor(params)
		if(!competitorInstance.hasErrors() ) {
			try{
				persistenceManager.makePersistent(competitorInstance)
			} finally{
				flash.message = "Competitor ${competitorInstance.id} created"
				redirect(action:show,id:competitorInstance.id)	
			}
		}
   
		render(view:'create',model:[competitorInstance:competitorInstance])
        
    }
}
