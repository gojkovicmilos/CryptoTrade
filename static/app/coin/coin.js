(function (angular) {
    var app = angular.module('Aplikacija');
    app.controller('coinCtrl', ['$http', '$state', '$stateParams', 'loginService', function($http, $state, $stateParams,) {
        var that = this;

        that.coin = {}
        that.fetchCoin = function() {
            $http.get('https://api.coinmarketcap.com/v1/ticker/'+$stateParams.id).then(
                function(response) {
                    that.coin = response.data;
                },
                function(reason) {
                    console.log(reason);
                }
            );
        }

        
        
    }]);
})(angular);