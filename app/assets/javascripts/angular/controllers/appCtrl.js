var app = angular.module("appCtrl", []);

app.controller('HomeCtrl', ['$scope', function($scope) {
  $scope.example = 'Hola!';
  $scope.isMenu = true;
  $scope.isMap = function(){
    if ($scope.isMenu){
      return true;
    }
  };

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

app.controller('PublicationCtrl', ['Publication', '$scope', '$timeout', function(Publication, $scope, $timeout){
  $scope.publicaciones = Publication.query();
  $scope.ready = false;

  $timeout(function(){
    $scope.ready = true;
  },600);

}]);