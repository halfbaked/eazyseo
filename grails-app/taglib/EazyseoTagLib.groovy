class EazyseoTagLib {
	
	def orgLink = { attrs, body ->
		def orgId = attrs.orgId ? attrs.orgId : 0
		def orgProp = attrs.orgProperty ? attrs.orgProperty : stem
		def orgPropId = attrs.orgPropertyId ? attrs.orgPropertyId : 0
		
		out << "<a href='/org/$orgId/$orgProp/$orgPropId'>"
		body()
		out << "</a>"		
	}
	
	def stemLink = { attrs, body ->
		def stemId = attrs.orgId ? attrs.stemId : 0
		def stemProp = attrs.orgProperty ? attrs.stemProperty : cusp
		def stemPropId = attrs.orgPropertyId ? attrs.stemPropertyId : 0
		
		out << "<a href='/stem/$stemId/$stemProp/$stemPropId'>"
		body()
		out << "</a>"		
	}
	
}
