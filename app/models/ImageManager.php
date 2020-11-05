<?php

namespace app\models;

require("../vendor/autoload.php");

use app\config\ImageOptimizerConfig;
use Intervention\Image\ImageManagerStatic as Image;


/**
 * Manager ImageManager
 * pro více info http://image.intervention.io/getting_started/introduction
 *
 * @package app\models
 */
class ImageManager
{
    /**
     * Edits image to default parameters defined in ImageOptimizerConfig
     *
     * @param string $imgURL
     *
     * @return void
     */
    static function defaultImage(string $imgURL): void
    {
        $img = Image::make($imgURL);

        $height = $img->height();
        $width = $img->width();
        //na šířku
        if ($width > $height) {
            if ($width > ImageOptimizerConfig::$defaultImageWidth) {
                $img->resize(ImageOptimizerConfig::$defaultImageWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        } //na výšku
        else {
            if ($height > ImageOptimizerConfig::$defaultImageHeight) {
                $img->resize(null, ImageOptimizerConfig::$defaultImageHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        }
        $img->save($imgURL);
    }

    /**
     * Makes thumbnail version of image, by defined resolution in ImageOptimizerConfig
     *
     * @param string $imgURL
     *
     * @return void
     */
    static function makeThumbnail(string $imgURL): void
    {
        $img = Image::make($imgURL);
        $imgName = array_reverse(explode("/", $imgURL))[0];

        $height = $img->height();
        $width = $img->width();
        //na šířku
        if ($width > $height) {
            if ($width > ImageOptimizerConfig::$thumbnailWidth) {
                $img->resize(ImageOptimizerConfig::$thumbnailWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/" . $imgName);
            }
        } //na výšku
        else {
            if ($height > ImageOptimizerConfig::$thumbnailHeight) {
                $img->resize(null, ImageOptimizerConfig::$thumbnailHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/" . $imgName);
            }
        }
        $img->save("images/thumbnails/" . $imgName);
    }
}
