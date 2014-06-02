var app = angular.module("appCtrl", []);

app.controller('PublicationCtrl', ['Publication','Person', '$scope', '$timeout', function(Publication, Person, $scope, $timeout){
  $scope.publicaciones = Publication.query();

  $scope.map = {
    center: {
        latitude: null,
        longitude: null
    },
    zoom: 16
  };



  $scope.person = Person.query(function(data){
    $scope.map.center.latitude = data.start_latitude;
    $scope.map.center.longitude = data.start_longitude;

    $scope.marker = {
      latitude: data.start_latitude,
      longitude: data.start_longitude
    };
  });

  $scope.ready = false;
  $scope.mapReady = false;
  $scope.angularClass = "e-profile";

  $timeout(function(){
    $scope.ready = true;

    $timeout(function(){
      $scope.mapReady = true;
    }, 800);

  },1200);


}]);

app.controller('ProfileCtrl', ['Person','$scope','$http','$location', function(Person, $scope, $http, $location){
  $scope.angularClass = "e-profile";
  $scope.newPerson = { person: {
    name: null,
    last_name: null,
    start_address: null,
    end_address: null
  } };

  $scope.persona = Person.query();

  $scope.submitForm = function(){
    if ($scope.profileForm.$valid) {
      $scope.newPerson = Person.save($scope.newPerson);
      $location.path('/publicaciones');
    }
  };

}]);

