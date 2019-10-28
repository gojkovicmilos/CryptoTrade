(function (angular) {
    var app = angular.module('Aplikacija');
    app.controller('NavbarCtrl', ['loginService', '$state', '$scope', function(loginService, $state, $scope) {
        var that = this;
        that.loggedIn = false;

        var onLogin = function() {
            that.loggedIn = true;
        }

        var onLogout = function() {
            that.loggedIn = false;
        }

        loginService.addLoginListener($scope, onLogin);
        loginService.addLogoutListener($scope, onLogout);

        that.logout = function() {
            loginService.logout(function(){
                $state.go('home');
            }, function(){});
        }

        loginService.isLoggedIn(function() {
            that.loggedIn = true;
        },
        function() {
            that.loggedIn = false;
        });
    }]);
})(angular);