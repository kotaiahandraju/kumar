var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope,$location,$timeout,$interval,$http) {
    $scope.name="";
    $scope.address="";
    $scope.email="";
    $scope.mobile="";
    
    $scope.formSubmit=function(){
        alert($scope.name);
        var data={};
         data["name"] = $scope.name;
         data["address"] = $scope.address;
         data["email"] = $scope.email;
         data["mobile"] = $scope.mobile;
         $http({
        method : "POST",
        url : "sampleUrl1",
        data: data
     //   headers: { 'Content-Type': 'application/json; charset=utf-8'},
     //  transformRequest: angular.identity
    }).then(function mySuccess(response) {
        console.log(response);
        $scope.myWelcome1 = response.data.data;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    }
     
   $http({
        method : "POST",
        url : "http://localhost:8082/NBD/sampleUrl"
    }).then(function mySuccess(response) {
    	console.log(response);
        $scope.myWelcome = response.data.data;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    $scope.sendData = function (id) {
       
    alert(id);   
}

    
    $scope.deleteData = function (id) {
    	 var data={};
    	 data["name"] = id;
      	 alert(id);
      	
      	$http({
              method : "POST",
              url : "http://localhost:8082/NBD/sampleDeleteUrl",
             data:data
          }).then(function mySuccess(response) {
          	console.log(response);
              $scope.myWelcome = response.data.data;
          }, function myError(response) {
              $scope.myWelcome = response.statusText;
          });
    
    }
});

app.filter('myFormat', function() {
    return function(x) {
        var i, c, txt = "";
        for (i = 0; i < x.length; i++) {
            c = x[i];
            if (i % 2 == 0) {
                c = c.toUpperCase();
            }
            txt += c;
        }
        return txt;
    };
});
app.service('hexafy', function() {
    this.myFunc = function (x) {
        return x.toString(16);
    }
});

