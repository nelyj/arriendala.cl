var person = angular.module('PersonService', []);

person.factory('Person', ['$resource', function($resource){

	var Person = $resource(
	'/perfil/:id.json', 
	{id: '@id'}, {
		update: {
			method: 'PUT',
			cache : false

		},
		query:{
			isArray: false
		}
	});

	return Person;

}]);