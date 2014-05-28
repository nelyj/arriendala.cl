var person = angular.module('PersonService', []);

person.factory('Person', ['$resource', function($resource){

	var Person = $resource(
	'http://squape.dev/perfil/:id.json', 
	{id: '@id'}, {
		update: {
			method: 'PUT'
		}
	});

	return Person;

}]);