package com.eazyseo;


import com.google.appengine.api.datastore.*


class UserController {

	def persistenceManager
    
    def list = {
    	println "user list called"
    	def redirect_url ="http://www.soccernet.com"
    	redirectToUrl("http://www.google.ie") 
    	//def q = persistenceManager.newQuery( User )
		//def  uList = q.execute()
		//uList.each{ user->
		//	persistenceManager.deletePersistent(user)
		//}
		
    	//def query = persistenceManager.newQuery( User )
    	//def userList = query.execute()
    	//[userList:userList]
    }
    
    def save = {
    
        System.out.println "params: $params"
        
        def user = new User(params)
        if (user.validate()) {
        	persistenceManager.makePersistent(user)        	
        	redirect(uri:"/sites")
        }else{
        	render "user creation failed"
        }						       		        	
    }
    
}
