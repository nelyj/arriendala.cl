var app = angular.module("appCtrl", []);


app.controller('PublicationCtrl', ['Publication', '$scope', '$timeout', function(Publication, $scope, $timeout){
  $scope.publicaciones = Publication.query();
  $scope.ready = false;
  $scope.mapReady = true;

  $scope.map = {
    center: {
        latitude: 45,
        longitude: -73
    },
    zoom: 8
  };

  $timeout(function(){
    $scope.ready = true;
  },600);

  $timeout(function(){
    $scope.mapReady = false;
  },1500);

}]);

app.controller('ProfileCtrl', ['Person','$scope','$http', function(Person, $scope, $http){
  $scope.angularClass = "e-profile";
  $scope.person = new Person();

  $scope.submitForm = function(){
   
  };

}]);

