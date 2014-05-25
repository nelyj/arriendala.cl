var person = angular.module('PersonService', []);

person.factory('Person', ['$resource', function($resource){
	var Person = $resource(
		'',
		{ id: '@id' },
		{
			update: {
				method: 'PUT'
			}
	});

	return Person;

}]);