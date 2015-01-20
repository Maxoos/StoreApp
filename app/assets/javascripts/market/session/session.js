angular.module('sessionModule', ['Devise', 'ui.bootstrap', 'ui.bootstrap.showErrors']).
    controller('sessionController', ['$scope', 'Auth', '$modal', function ($scope, Auth, $modal) {

        $scope.user = null;

        //Devise lib method
        Auth.currentUser().then(function (user) {
            $scope.user = user.user
        }, function (error) {
            // unauthenticated error
        });

        $scope.$on('devise:new-registration', function(event, user) {
            $scope.user = user;
        });

        $scope.$on('devise:login', function(event, currentUser) {
            $scope.user = currentUser;
        });


        // Session modal handlers
        //open
        $scope.openSessionModal = function () {
            var modalInstance = $modal.open({
                templateUrl: '/shared/session_modal.html',
                size: 'small',
                controller: sessionModalController
            });
        };


        // this controls the session modal view
        var sessionModalController = function ($scope, $modalInstance) {
            $scope.setRegistationFormScope = function (scope) {
                $scope.registationFormScope = scope;
            };

            $scope.setLoginFormScope = function (scope) {
                $scope.loginFormScope = scope;
            };

            $scope.user = {};

            // registration action
            $scope.register = function () {
                // Devise lib method
                Auth.register($scope.user).then(function (registeredUser) {
                    $modalInstance.close();
                    $scope.redirect('productsController');
                }, function (error) {
                    $scope.railsHelpers.errorResponce(error, $scope.registationFormScope.registationForm);
                });

            };

            // login action
            $scope.login = function () {
                // Devise lib method
                Auth.login($scope.user).then(function (user) {
                    $modalInstance.close();
                    $scope.redirect('productsController');
                }, function (error) {
                    $scope.railsHelpers.errorResponce(error, $scope.loginFormScope.loginForm);
                });

            };

        };

    }]);
