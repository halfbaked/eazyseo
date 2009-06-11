package com.eazyseo


import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import javax.jdo.Query;

abstract class SecurityController {
	
	def beforeInterceptor = [ action: this.&auth, except: ['login'] ]
	
	def currentUser() {
		UserService userService = UserServiceFactory.getUserService();     			
		def userEmail = userService.getCurrentUser().getEmail()
		def query = persistenceManager.newQuery(User.class)	
		query.setFilter("email == emailParam")
		query.declareParameters("String emailParam")								
		def user = query.execute(userEmail)?.get(0)
		return user
    }
    
	private auth() {
		  println "calling private auth method"
		  UserService userService = UserServiceFactory.getUserService();
		  
		  if(!userService.isUserLoggedIn()) {
		  	println "user is not logged in"
		  	def loginUrl = userService.createLoginURL("/sites")
		  	println "user not logged in. redirecting to login url:$loginUrl"
		  	redirectToUrl(loginUrl)
		  	println "finished redirect" 
		  }else if (!userService.isUserAdmin()){
		  
		  	println "logged in, but not an admin"
		  	render "use of this application currently restricted to admins"
		  	
		  }else {
		  	// retrieve user
		  	println "user logged in to Google, and is admin"
			userService = UserServiceFactory.getUserService()    			
			def userEmail = userService.getCurrentUser().getEmail()
			def query = persistenceManager.newQuery(User.class)	
			query.setFilter("email == emailParam")
   			query.declareParameters("String emailParam")										
			def userList = (List<User>)query.execute(userEmail)
			
			if(userList.size() == 0) {
				def user = new User(email:userEmail)										      
		        persistenceManager.makePersistent(user)
		    }		    
		  } 
	} 	
	
	// Used as redirects to external sites do not seem to be working on the app engine
	void redirectToUrl(url) {
		println "redirecting to url:$url"
		render ("<html><head><meta http-equiv=\"refresh\" content=\"0;url=$url\"></head><body></body></html>")
	}							
}