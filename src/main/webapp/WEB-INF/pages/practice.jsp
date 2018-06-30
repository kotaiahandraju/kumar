<!DOCTYPE html>
<html  ng-app="myApp"  ng-init="myCol='lightblue';myCol1='yellow';person={fName:'John',lName:'Doe'};points=[1,15,19,2,40];names=[{name:'Jani',country:'Norway'},
{name:'Hege',country:'Sweden'},
{name:'Kai',country:'Denmark'}]">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script type="text/javascript" src="user/js/angular.js"></script>
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<style>
	
</style>
<body ng-controller="myCtrl">


<h3>{{myWelcome}}</h3>


 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
    	<thead><tr><th>Branch Name</th><th>Branch Code</th><th>Status</th><th>createTime</th><th>updatedTime</th></tr>
    	</thead><tbody>
    		<tr ng-repeat="list1 in myWelcome">
    		<td title={{list1.name}} ng-click="sendData(list1.id)">{{list1.name}} </td>
			<td title={{list1.address}}>{{list1.address}}</td>
			<td title={{list1.email}}>{{list1.email}}</td>
			<td title={{list1.mobile}}>{{list1.mobile}}</td>
			<td ng-click="deleteData(list1.name)"><input type="button" value="delete"></td></tr>
    	</tbody></table>

	<br>
	<form>
		Name:<input type="text" name="name" ng-model="name"><br>
		Email:<input type="text" name="email" ng-model="email"><br>
		Mobile:<input type="text" name="mobile" ng-model="mobile"><br>
		Address:<input type="text" name="address" ng-model="address">
		<input type="submit" name="" value="submit" ng-click="formSubmit()">
	</form>

	<br> <h1> name:{{name}} ,Email :{{email}} ,mobile :{{mobile}},address: {{address}} </h1>

	<br>
	<h1>{{greeting}}</h1>
	
	<br>
	 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
	<thead><tr><th> Name</th><th>address</th><th>email</th><th>mobile</th></tr>
    	</thead><tbody>
    		<tr ng-repeat="list1 in myWelcome1">
    		<td title={{list1.name}} ng-click="sendData(list1.id)">{{list1.name}} </td>
			<td title={{list1.address}}>{{list1.address}}</td>
			<td title={{list1.email}}>{{list1.email}}</td>
			<td title={{list1.mobile}}>{{list1.mobile}}</td>
			<td><input type="button" value="delete"></td></tr>
    	</tbody></table>

</body>
</html>
