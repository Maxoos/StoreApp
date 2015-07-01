angular.module('sessionModule', ['Devise', 'ui.bootstrap', 'ui.bootstrap.showErrors']).
    controller('sessionController', ['$scope', 'Auth', '$modal', function ($scope, Auth, $modal) {

        var vm = this;
        vm.user = null;

        //Devise lib method
        Auth.currentUser().then(function (user) {
            vm.user = user.user
        }, function (error) {
            // unauthenticated error
        });

        $scope.$on('devise:new-registration', function(event, user) {
            vm.user = user;
        });

        $scope.$on('devise:login', function(event, currentUser) {
            vm.user = currentUser;
        });


        // Session modal handlers
        //open
        vm.openSessionModal = function () {
            var modalInstance = $modal.open({
                templateUrl: 'shared/session_modal.html',
                size: 'small',
                controller: sessionModalController
            });
        };


        // this controls the session modal view
        var sessionModalController = function ($scope, $modalInstance) {
            vm = this;
            vm.setRegistationFormScope = function (scope) {
                vm.registationFormScope = scope;
            };

            vm.setLoginFormScope = function (scope) {
                vm.loginFormScope = scope;
            };

            vm.user = {};

            // registration action
            vm.register = function () {
                // Devise lib method
                Auth.register(vm.user).then(function (registeredUser) {
                    $modalInstance.close();
                    $scope.redirect('productsController');
                }, function (error) {
                    $scope.railsHelpers.errorResponce(error, vm.registationFormScope.registationForm);
                });

            };

            // login action
            vm.login = function () {
                // Devise lib method
                Auth.login(vm.user).then(function (user) {
                    $modalInstance.close();
                    $scope.redirect('productsController');
                }, function (error) {
                    $scope.railsHelpers.errorResponce(error, vm.loginFormScope.loginForm);
                });

            };

        };

    }]);
