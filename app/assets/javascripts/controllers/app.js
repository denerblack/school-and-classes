var app = angular.module('schoolAndClasses', [
        'ui.router',
        'Devise'
]).run(['Auth', function (Auth) {
    Auth.currentUser().then(function(user) {
        console.log(user);
        console.log(Auth._currentUser);
    });
}]);

app.config(['$stateProvider','$urlRouterProvider','$locationProvider','$httpProvider',
        function($stateProvider, $urlRouterProvider,$locationProvider, $httpProvider) {
            $httpProvider.defaults.withCredentials = true;

            if (window.history && window.history.pushState) {
                $locationProvider.html5Mode(true);
            }
            $stateProvider.state('home', {
                url: '/',
                templateUrl: '/views/layout/application.erb.html'
            }).otherwise({
                redirectTo: '/'
            });
        }]);

