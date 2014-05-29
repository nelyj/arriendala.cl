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
  },2000);

  $timeout(function(){
    $scope.mapReady = false;
  },2000);

}]);

app.controller('ProfileCtrl', ['Person','$scope','$http','$location', function(Person, $scope, $http, $location){
  $scope.angularClass = "e-profile";
  $scope.newPerson = [];
  $scope.persona = Person.query();

  $scope.submitForm = function(){
    if ($scope.profileForm.$valid) {
      console.log($scope.newPerson);
      $scope.newPerson = Person.save($scope.newPerson);
      console.log($scope.newPerson);
      console.log("waiting for save");
      console.log($scope.newPerson);
      console.log("save it");
      $location.path('/publicaciones');
    }
  };

}]);

