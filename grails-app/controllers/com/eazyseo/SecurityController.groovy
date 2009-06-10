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
		  
		  UserService userService = UserServiceFactory.getUserService();
		  
		  if(!userService.isUserLoggedIn()) {
		  
		  	def loginUrl = userService.createLoginURL("/")
		  	println "login url retrieved: $loginUrl"
		  	redirect(uri:loginUrl)
		  	 
		  }else if (!userService.isUserAdmin()){
		  
		  	println "logged in, but not an admin"
		  	render "use of this application currently restricted to admins"
		  	
		  }else {
		  	// retrieve user
		  	println "user is an admin"
			userService = UserServiceFactory.getUserService()    			
			def userEmail = userService.getCurrentUser().getEmail()
			def query = persistenceManager.newQuery(User.class)	
			query.setFilter("email == emailParam")
   			query.declareParameters("String emailParam")										
			def userList = (List<User>)query.execute(userEmail)
			println ("userList: $userList")
			if(userList.size() == 0) {
				println "User does not exist yet. Creating User"
				def user = new User(email:userEmail)						       
		        persistenceManager.makePersistent(user)		        
		    }		    
		  } 
	} 								
}