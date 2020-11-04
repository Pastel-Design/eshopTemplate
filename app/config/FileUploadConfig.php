<?php

namespace app\config;
/**
 * Config FileUploadConfig
 *
 * @package app\config
 */
class FileUploadConfig
{
    public static array $FileUpload = [
        "jpg" => 'image/jpeg',
        "png" => 'image/png',
        "gif" => 'image/gif',
        "pdf" => 'application/pdf',
        "mp4" => 'video/mp4',
        "csv" => 'text/csv'
    ];
}
