var publication = angular.module('PublicationService', []);

publication.factory('Publication', ['$resource', function($resource){
	
	var Publication = $resource(
	'http://squape.dev/publicaciones/:id.json', 
	{id: '@id'}, {
		update: {
			method: 'PUT'
		}
	});

	return Publication;
	
}]);

