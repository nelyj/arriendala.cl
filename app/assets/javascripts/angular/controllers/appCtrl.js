//= require angular-flash.js

var app = angular.module("appCtrl", ['flash','angularFileUpload']);

app.controller('PublicationCtrl', ['Publication','Person', '$scope', '$timeout','flash', function(Publication, Person, $scope, $timeout, flash){

  $scope.publicaciones = Publication.query();
  $scope.publicationShow = false;
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


  $scope.toggle = function(publicacion){
      $scope.publicationShow = false;
      $timeout(function(){
        $scope.publicationShow = true;
      }, 800);
      
      $scope.mapReady = false;
      

      $scope.publicacionShow = publicacion;
        $scope.map = {
          center: {
              latitude: $scope.publicacionShow.latitude,
              longitude: $scope.publicacionShow.longitude
          },
          options:{
          },
          zoom: 15
        };

         $scope.marker = {
            latitude: $scope.publicacionShow.latitude,
            longitude: $scope.publicacionShow.longitude
        };
  };

}]);

app.controller('CrearPublicacionCtrl', ['Publication','$scope', '$location','flash','$upload', function(Publication, $scope, $location, flash, $upload){
  $scope.step = 1;
  
  $scope.setStep = function(step){
    $scope.step = step;
  }

  $scope.angularClass = "e-profile";
  $scope.gPlace;

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
      precio: null,
      address: null,
      image_one: null
    }
  }

  $scope.onFileSelect = function($files) {
    for (var i = 0; i < $files.length; i++) {
      var file = $files[i];
      console.log(file);
      $scope.publicacion.publication.image_one = file;
      $scope.newState = Publication.save($scope.publicacion);


      //.error(...)
      //.then(success, error, progress); 
      //.xhr(function(xhr){xhr.upload.addEventListener(...)})// access and attach any event listener to XMLHttpRequest.
    }
    /* alternative way of uploading, send the file binary with the file's content-type.
       Could be used to upload files to CouchDB, imgur, etc... html5 FileReader is needed. 
       It could also be used to monitor the progress of a normal http post/put request with large data*/
    // $scope.upload = $upload.http({...})  see 88#issuecomment-31366487 for sample code.
  };


  $scope.submitForm = function(){
    if ($scope.crearPublicacionForm.$valid){
      $scope.newState = Publication.save($scope.publicacion);
      // flash([{ level: 'success', text: 'Ha creado una publicación satisfactoriamente' } ]);
      console.log($scope.newState);
      $location.path('/publicaciones');
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

app.directive('googleplace', function() {
    return {
        link: function(scope, element, attrs) {
                    var options = {
                        types: [],
                        componentRestrictions: {country: 'cl'}
                    };
                    scope.gPlace = new google.maps.places.Autocomplete(element[0], options);
                    element.blur(function(e) {
                        window.setTimeout(function() {
                            angular.element(element).trigger('input');
                        }, 0);
                    });
                }

    }
});
