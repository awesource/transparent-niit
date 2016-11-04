<?php
/*
 * @author: Samuel Adeshina
 * @
 *
 */

require 'vendor/autoload.php';

$settings = [
	'settings'=>[
		'determineRouteBeforeAppMiddleware' => true,
		'displayErrorDetails' => true
	]
];



$app = new Slim\App($settings);

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, Cache-Control, X-Requested-With');
header('Access-Control-Allow-Methods: GET, OPTIONS');

$app->group('/', function(){
	$this->group('course-catalog/', function(){
		$this->get('courses', function($request, $response, $args){
			$result = json_decode(file_get_contents("http://public.niitabuja.com/course-catalog/tables/json/Course.json"));

			return $response->withJson($result, 200);
		});

		$this->get('programs', function($request, $response, $args){
			$result = json_decode(file_get_contents("http://public.niitabuja.com/course-catalog/tables/json/Program.json"));

			return $response->withJson($result, 200);
		});

		$this->get('course-categories', function($request, $response, $args){
			$result = json_decode(file_get_contents("http://public.niitabuja.com/course-catalog/tables/json/CourseCategory.json"));

			return $response->withJson($result, 200);
		});

		$this->get('course-category-semesters', function($request, $response, $args){
			$result = json_decode(file_get_contents("http://public.niitabuja.com/course-catalog/tables/json/CourseCategorySemester.json"));

			return $response->withJson($result, 200);
		});

		$this->get('learnable-technologies', function($request, $response, $args){
			$result = json_decode(file_get_contents("http://public.niitabuja.com/course-catalog/tables/json/LearnableTechnologies.json"));

			return $response->withJson($result, 200);
		});
	});
});

$app->run();