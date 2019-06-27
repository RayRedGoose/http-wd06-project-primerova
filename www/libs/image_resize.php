<?php

function make_thumb($src, $dest, $desired_width, $desired_height) {

	/* read the source image */

	$kaboom = explode(".", $src);
	$fileExt = end($kaboom);

	if ($fileExt = 'jpg' || $fileExt = 'jpeg') {
		$source_image = imagecreatefromjpeg($src);
	} else if ($fileExt = 'png') {
		$source_image = imagecreatefrompng($src);
	} else if ($fileExt = 'gif') {
		$source_image = imagecreatefromgif($src);
	}

	$src_width = imagesx($source_image);
	$src_height = imagesy($source_image);

  $canvas = imagecreatetruecolor($desired_width, $desired_height);

  $resizedHeight = round($src_height * ($desired_width / $src_width));
  $resizedWithd = round($src_width * ($desired_height / $src_height));

  $centralRszX = ($resizedWithd - $desired_width) / -2;;
  $centralRszY = ($resizedHeight - $desired_height) / -2;

	if ($fileExt = 'jpg' || $fileExt = 'jpeg') {

		if ($src_width != $src_height) {

			if ($resizedHeight > $desired_height) {

				imagecopyresampled($canvas, $source_image, 0, $centralRszY, 0, 0, $desired_width, $resizedHeight, $src_width, $src_height);
	    	$result = imagejpeg($canvas, $dest);

			} else if ($resizedWithd > $desired_width) {

				imagecopyresampled($canvas, $source_image, $centralRszX, 0, 0, 0, $resizedWithd, $desired_height, $src_width, $src_height);
				$result = imagejpeg($canvas, $dest);

			}

		} else if ($src_width == $src_height) {

				if ($desired_width > $desired_height) {

					imagecopyresampled($canvas, $source_image, 0, $centralRszY, 0, 0, $desired_width, $resizedHeight, $src_width, $src_height);
					$result = imagejpeg($canvas, $dest);

				} else if ($desired_width <= $desired_height) {

					imagecopyresampled($canvas, $source_image, $centralRszX, 0, 0, 0, $resizedWithd, $desired_height, $src_width, $src_height);
		 			$result = imagejpeg($canvas, $dest);

				}
		}

	} else if ($fileExt = 'png') {

		if ($src_width != $src_height) {

			if ($resizedHeight > $desired_height) {

				imagecopyresampled($canvas, $source_image, 0, $centralRszY, 0, 0, $desired_width, $resizedHeight, $src_width, $src_height);
				$result = imagepng($canvas, $dest);

			} else if ($resizedWithd > $desired_width) {

				imagecopyresampled($canvas, $source_image, $centralRszX, 0, 0, 0, $resizedWithd, $desired_height, $src_width, $src_height);
				$result = imagepng($canvas, $dest);

			}

		} else if ($src_width == $src_height) {

				if ($desired_width > $desired_height) {

					imagecopyresampled($canvas, $source_image, 0, $centralRszY, 0, 0, $desired_width, $resizedHeight, $src_width, $src_height);
					$result = imagejpeg($canvas, $dest);

				} else if ($desired_width <= $desired_height) {

					imagecopyresampled($canvas, $source_image, $centralRszX, 0, 0, 0, $resizedWithd, $desired_height, $src_width, $src_height);
					$result = imagepng($canvas, $dest);

				}
		}

	} else if ($fileExt = 'gif'){

		if ($src_width != $src_height) {

			if ($resizedHeight > $desired_height) {

				imagecopyresampled($canvas, $source_image, 0, $centralRszY, 0, 0, $desired_width, $resizedHeight, $src_width, $src_height);
				$result = imagegif($canvas, $dest);

			} else if ($resizedWithd > $desired_width) {

				imagecopyresampled($canvas, $source_image, $centralRszX, 0, 0, 0, $resizedWithd, $desired_height, $src_width, $src_height);
				$result = imagegif($canvas, $dest);

			}

		} else if ($src_width == $src_height) {

				if ($desired_width > $desired_height) {

					imagecopyresampled($canvas, $source_image, 0, $centralRszY, 0, 0, $desired_width, $resizedHeight, $src_width, $src_height);
					$result = imagegif($canvas, $dest);

				} else if ($desired_width <= $desired_height) {

					imagecopyresampled($canvas, $source_image, $centralRszX, 0, 0, 0, $resizedWithd, $desired_height, $src_width, $src_height);
					$result = imagegif($canvas, $dest);

				}
		}

	} else {

		echo "Неверный формат файла";
	}

    return $result;

}

?>
