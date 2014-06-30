//= require angular
//= require angular-animate
//= require angular-resource
//= require angular-route
//= require angular-touch
//= require_tree ./angular/models
//= require_tree ./angular/controllers
//= require angular-flash
//= require underscore-min.js

//= require angular-google-maps.min


app = angular.module('squapeApp', ['ngAnimate' , 'ngRoute', 'ngResource','PublicationService','PersonService','appCtrl', 'google-maps', 'ngTouch', 'flash']);

app.config(['$routeProvider','$locationProvider', '$httpProvider', 
	function($routeProvider,$locationProvider, $httpProvider){

		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

		$routeProvider.
		when('/publicaciones',{
			templateUrl: '../assets/index.html',
			controller: 'PublicationCtrl'
		}).
		when('/informacion/perfil',{
			templateUrl: '../assets/crear_perfil.html',
			controller: 'ProfileCtrl'
		}).
		when('/publicacion/nuevo', {
			templateUrl: '../assets/crear_publicacion.html',
			controller: 'CrearPublicacionCtrl'
		}).
		otherwise({
			redirectTo: '/publicaciones'
		});

		$locationProvider.html5Mode(true);
}]);