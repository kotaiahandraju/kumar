<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('myApp', []);

	app.controller("myCtrl", function($scope,$http) {
		//$scope.name = 'Koti';
		$scope.cVal=0;
		$scope.aVal=0;
		$scope.bVal=0;
		$scope.submitted=false;
		$scope.users=[];
		$scope.user={};
		$scope.states=['Andhra Pradesh','Telangana','Tamilnadu'];
		$scope.regFormSubmit=function(status){
			$scope.submitted=true;
			console.log($scope.user);
			if(status)
				{
					$http({
						method:'POST',
						url:'NewFile1',
						data:$scope.user
					}).then(function(response){
							$scope.users=[{'name':'Prqasad','email':'fdsfsfdsf','phno':'dsfsfds','state':'fdsf dsfds fdsf'},{'name':'Prqasad','email':'fdsfsfdsf','phno':'dsfsfds','state':'fdsf dsfds fdsf'},{'name':'Prqasad','email':'fdsfsfdsf','phno':'dsfsfds','state':'fdsf dsfds fdsf'}];
							if(response.msg)
								{
								$scope.users=response.users;
								$scope.user={};
								$scope.submitted=false;
								}
							else $scope.msg='User Already Exists';
					});
					//$scope.users.push($scope.user);		
					
				}
		},
		$scope.calVal=function(){
			$scope.cVal=($scope.aVal-0)+($scope.bVal-0);
		}
	});
</script>
</head>
<body ng-controller="myCtrl">
<form method="post" ng-submit="regFormSubmit(regForm.$valid)" novalidate name="regForm" id="regForm">
	<table align="center">
		<tr>
			<th>Name</th>
			<td>:</td>
			<td><input type="text" name="name" id="name" ng-model="user.name" ng-required="true" />
			<br />
			<span ng-show="submitted && regForm.name.$error.required">Enter Name</span>
			</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>:</td>
			<td><input type="email" name="email" id="email" ng-model="user.email" ng-required="true" />
			<br />
			<span ng-show="submitted && regForm.email.$error.required">Enter Email</span>
			<span ng-show="submitted && regForm.email.$error.email">Invalid Email</span></td>
		</tr>
		<tr>
			<th>Phone Number</th>
			<td>:</td>
			<td><input type="number" name="phno" id="phno" ng-model="user.phno" ng-required="true" ng-pattern="/^[0-8]$/"  />
			<br />
			<span ng-show="submitted && regForm.phno.$error.required">Enter Phone Number</span>
			<span ng-show="submitted && regForm.phno.$error.number">Enter Number</span>
			<span ng-show="submitted && regForm.phno.$error.pattern">Enter Valid Phone Number</span></td>
		</tr>
		<tr>
			<th>State</th>
			<td>:</td>
			<td>
			<select name="state" id="state" ng-model="user.state" ng-required="true">
			<option value="">Select State</option>
				<option ng-repeat="state in states">{{state}}</option>
			</select>
			<br />
			<span ng-show="submitted && regForm.state.$error.required">Enter State</span>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="submit" value="Submit"/>
		</tr>
	</table>
	</form>
	A: <input type="text" ng-model="aVal" ng-keyup="calVal()" /><br />
	B: <input type="text" ng-model="bVal" ng-keyup="calVal()"/><br />  
	C: {{cVal}}
	<table width="100%" rules="all" border="1" ng-if="users.length>0">
	<tr>
	<th>Name</th>
	<th>Email</th>
	<th>Phone Number</th>
	<th>State</th>
	</tr>
	<tr ng-repeat="user in users">
	<td>{{user.name}}</td>
	<td>{{user.email}}</td>
	<td>{{user.phno}}</td>
	<td>{{user.state}}</td>
	</tr>
	</table>	
	</div>
</body>
</html>