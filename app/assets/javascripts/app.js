//= require angular
//= require angular-resource
//= require angular-route
//= require angular-touch
//= require_tree ./angular/directives
//= require_tree ./angular/controllers
//= require_tree ./angular/services
//= require underscore-min
//= require angular-google-maps.min

app = angular.module('squapeApp', ['ngRoute', 'appCtrl', 'google-maps', 'ngTouch']);

app.config(['$routeProvider','$locationProvider', 
	function($routeProvider,$locationProvider){

		$routeProvider.
		when('/publicaciones',{
			templateUrl: '../assets/index.html',
			controller: 'HomeCtrl'
		}).
		otherwise({
			redirectTo: '/publicaciones'
		});

		$locationProvider.html5Mode(true);
}]);