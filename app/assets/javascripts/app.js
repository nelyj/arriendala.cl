//= require angular
//= require angular-animate
//= require angular-resource
//= require angular-route
//= require angular-touch
//= require_tree ./angular/models
//= require_tree ./angular/controllers
//= require_tree ./angular/directives
//= require underscore-min
//= require angular-google-maps.min

app = angular.module('squapeApp', ['ngAnimate' , 'ngRoute', 'ngResource','PublicationService','PersonService','appCtrl', 'google-maps', 'ngTouch']);

app.config(['$routeProvider','$locationProvider', 
	function($routeProvider,$locationProvider){
		$routeProvider.
		when('/publicaciones',{
			templateUrl: '../assets/index.html',
			controller: 'PublicationCtrl'
		}).
		when('/informacion/perfil',{
			templateUrl: '../assets/crear_perfil.html',
			controller: 'ProfileCtrl'
		}).
		otherwise({
			redirectTo: '/publicaciones'
		});

		$locationProvider.html5Mode(true);
}]);