var app = angular.module("appCtrl", []);

app.controller('PublicationCtrl', ['Publication','Person', '$scope', '$timeout', function(Publication, Person, $scope, $timeout){
  $scope.publicaciones = Publication.query();

  $scope.map = {
    center: {
        latitude: -33.4262800,
        longitude: -70.5665600
    },
    options:{
      animation: google.maps.Animation.BOUNCE
    },
    zoom: 14
  };

  $scope.mapReady = false;
  $scope.ready = false;
  $scope.person = [];

  $scope.person = Person.query(function(data){
    if(!!data.start_latitude){
      $scope.map.center.latitude = data.start_latitude;
    }

    if(!!data.start_longitude){
      $scope.map.center.longitude = data.start_longitude;
    }
    
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

app.controller('CrearPublicacionCtrl', ['Publication','$scope', function(Publication, $scope){
  $scope.angularClass = "e-profile";
  $scope.tipoPropiedadValue =


  $scope.publicacion = {
    publication: {
      tipo_propiedad: 'depto',
      modalidad: 'venta',
      tipo_arriendo: 'mensual',
      amoblado: 'no',
      antiguedad: 'nueva',
      banios: 1,
      habitaciones: 1,
      metros_cuadrados: 20,
      precio: null
    }
  }

}]);


app.controller('ProfileCtrl', ['Person','$scope','$http','$location', function(Person, $scope, $http, $location){
  $scope.angularClass = "e-profile";
  $scope.newPerson = { person: {
    name: null,
    last_name: null,
    start_address: null,
    end_address: null,
    image_url: null,
    relationship_status: null,
    gender: null
  } };

  $scope.persona = Person.query();
  $scope.newPerson.person = Person.query();

  $scope.submitForm = function(){
    if ($scope.profileForm.$valid) {
      $scope.newPerson = Person.save($scope.newPerson);
      $location.path('/publicaciones');
    }
  };

}]);

