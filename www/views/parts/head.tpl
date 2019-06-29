<!DOCTYPE html>
<html lang="ru">

<head>
	<meta charset="UTF-8" />
	<title>
		<?php if ( @$title != '' ) {
			echo "$title - " . SITE_NAME ;
		} else {
			echo SITE_NAME;
		} ?>
	</title>
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"/><![endif]-->
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<!-- build:cssVendor css/vendor.css -->
	<link rel="stylesheet" href="<?=HOST?>views/assets/libs/normalize-css/normalize.css" />
	<link rel="stylesheet" href="<?=HOST?>views/assets/libs/bootstrap-4-grid/grid.min.css" />
	<!-- endbuild -->
	<!-- build:cssCustom css/main.css -->
	<link rel="stylesheet" href="<?=HOST?>views/assets/css/main.css" />
	<link rel="stylesheet" href="<?=HOST?>views/assets/css/tables.css" />
	<link rel="stylesheet" href="<?=HOST?>views/assets/css/custom.css" />

	<!-- endbuild -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&amp;subset=cyrillic-ext" rel="stylesheet">
	<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->
</head>
