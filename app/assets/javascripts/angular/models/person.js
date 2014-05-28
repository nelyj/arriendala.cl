var person = angular.module('PersonService', []);

person.factory('Person', ['$resource', function($resource){
	var Person = $resource(
		'http://squape.dev/perfil.json'
	);

	return Person;

}]);