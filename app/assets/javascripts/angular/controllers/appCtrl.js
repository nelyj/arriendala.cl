var app = angular.module("appCtrl", []);


app.controller('PublicationCtrl', ['Publication','Person', '$scope', '$timeout', function(Publication, Person,$scope, $timeout){
  $scope.publicaciones = Publication.query();
  $scope.current_user = Person.query();
  $scope.ready = false;
  $scope.mapReady = false;
  $scope.angularClass = "e-profile";

  $scope.map = {
    center: {
        latitude: 45,
        longitude: -73
    },
    zoom: 10
  };

  $timeout(function(){
    $scope.ready = true;

    $timeout(function(){
      $scope.mapReady = true;
      $scope.map.control.refresh({latitude: 32.779680, longitude: -79.935493});
    }, 800);

  },1200);


}]);

app.controller('ProfileCtrl', ['Person','$scope','$http','$location', function(Person, $scope, $http, $location){
  $scope.angularClass = "e-profile";
  $scope.newPerson = { person: {
    name: null,
    last_name: null,
    address: null,
    address_work: null
  } };

  $scope.persona = Person.query();

  $scope.submitForm = function(){
    if ($scope.profileForm.$valid) {
      $scope.newPerson = Person.save($scope.newPerson);
      $location.path('/publicaciones');
    }
  };

}]);

