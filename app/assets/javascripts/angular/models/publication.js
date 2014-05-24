var publication = angular.module('PublicationService', []);

publication.factory('Publication', ['$resource', function($resource){
	var Publication = $resource(
	'', 
	{id: '@id'}, {
		update: {
			method: 'PUT'
		}
	});

	return Todo;
}]);

