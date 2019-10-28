(function (angular) {
    var app = angular.module('Aplikacija');
    app.controller('CoinsCtrl', ['$http', function($http) {
        var that = this;

        that.coinSel = {}

        that.coins = []

        that.fetchCoins = function() {


            $http.get('https://api.coinmarketcap.com/v1/ticker/').then(
                function(response) {
                    that.coins = response.data;
                },
                function(reason) {
                    console.log(reason);
                }
            );

        }

        that.selectCoin = function(coin){

            that.coinSel = coin;
        }

       // that.$scope.getSelectedItem = function(item){
  //console.log(item);//selected item
//}

        that.fetchCoins()
    }]);
})(angular);