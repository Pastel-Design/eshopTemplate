<?php
require("vendor/autoload.php");

use Intervention\Image\ImageManagerStatic as Image;
// pro více info http://image.intervention.io/getting_started/introduction
class ImageOptimizer
{
    static function defaultImage($imgURL)
    {
        $config = include('configs/config.php');
        $img = Image::make($imgURL);

        $height = $img->height();
        $width = $img->width();
        if ($width > $height) { //na šířku
            if ($width > $config->defaultImageWidth) {
                $img->resize($config->defaultImageWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        } else { //na výšku
            if ($height > $config->defaultImageHeight) {
                $img->resize(null, $config->defaultImageHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        }
        $img->save($imgURL);
    }
    static function makeThumbnail($imgURL)
    {
        $config = include('configs/config.php');
        $img = Image::make($imgURL);
        $imgName = array_reverse(explode("/", $imgURL))[0];

        $height = $img->height();
        $width = $img->width();
        if ($width > $height) { //na šířku
            if ($width > $config->thumbnailWidth) {
                $img->resize($config->thumbnailWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/".$imgName);
            }
        } else { //na výšku
            if ($height > $config->thumbnailHeight) {
                $img->resize(null, $config->thumbnailHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/".$imgName);
            }
        }
        $img->save("images/thumbnails/".$imgName);
    }
}
