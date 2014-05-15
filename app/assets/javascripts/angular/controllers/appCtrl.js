var app = angular.module("appCtrl", []);

app.controller('HomeCtrl', ['$scope', function($scope) {
  $scope.example = 'Hola!';
  $scope.isMenu = true;



  $scope.map = {
    center: {
        latitude: 45,
        longitude: -73
    },
    zoom: 8
	};

	$scope.showmenu=true;

	$scope.toggleMenu = function(){
		$scope.showmenu=($scope.showmenu) ? false : true;
	}

}]);