class UrlMappings {
    static mappings = {
      
      // --- User Mappings
	  "/users" (controller: "user", action: [GET:"list", POST:"save"])
	  
      // --- Site Mappings
      "/sites" (controller: "site", action: [GET:"list", POST: "save"])      
      "/site/$id" (controller: "site", action: [GET:"show", POST: "save", DELETE: "delete"])
            
      // --- Stem Mappings
      "/site/$siteId/stems" (controller: "stem", action: [GET:"list", POST:"save"])
      "/site/$siteId/stem/$id" (controller: "stem", action: [GET:"show", DELETE:"delete", POST:"update"])
      
      // --- Cusp Mappings
      "/site/$siteId/stem/$stemId/cusps" (controller: "cusp", action: [GET:"list", POST:"save"])
      "/site/$siteId/stem/$stemId/cusp/$id" (controller: "cusp", action: [GET:"show", DELETE:"delete", POST:"update"])
      
      // --- Cusp Entry Mappings
      "/site/$siteId/stem/$stemId/cusp/$cuspId/cuspEntrys" (controller: "cuspEntry", action: [GET:"list", POST:"save"])
      "/site/$siteId/stem/$stemId/cusp/$cuspId/cuspEntry/$id" (controller: "cuspEntry", action: [GET:"show", DELETE:"delete", POST:"update"])
      
      "/"(view:"/index")
	  "500"(view:'/error')
	}
}
