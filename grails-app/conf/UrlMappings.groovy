class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(action: 'initial', controller: 'ecomm')
		"500"(controller: 'ecomm', action: 'errorPage')
	}
}
