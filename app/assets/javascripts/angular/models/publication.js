var publication = angular.module('PublicationService', []);

publication.factory('Publication', ['$resource', function($resource){
	
	var Publication = $resource(
	'/ublicaciones/:id.json', 
	{id: '@id'}, {
		update: {
			method: 'PUT'
		}
	});

	return Publication;
	
}]);

