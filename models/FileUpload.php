<?php

class FileUpload
{
    static function uploadFiles()
    {
        if (count($_FILES) === 1) {
            if (count($_FILES[array_keys($_FILES)[0]]["name"]) === 1) {
                return self::uploadMultipleInputs();
            } else {
                return self::uploadSingleInputMultipleFiles();
            }
        } else {
            return self::uploadMultipleInputs();
        }
    }
    static function uploadMultipleInputs()
    {
        $return = array();
        $config = include('configs/config.php');
        foreach ($_FILES as $upfileName => $upfile) {
            try {
                // Undefined | Multiple Files | $_FILES Corruption Attack
                // If this request falls under any of them, treat it invalid.
                if (
                    !isset($_FILES[$upfileName]['error']) ||
                    is_array($_FILES[$upfileName]['error'])
                ) {
                    throw new RuntimeException('Invalid parameters.', 1);
                }
                // Check $_FILES[$upfileName]['error'] value.
                switch ($_FILES[$upfileName]['error']) {
                    case UPLOAD_ERR_OK:
                        break;
                    case UPLOAD_ERR_NO_FILE:
                        throw new RuntimeException('No file sent.', 1);
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        throw new RuntimeException('Exceeded filesize limit.', 1);
                    default:
                        throw new RuntimeException('Unknown errors.', 1);
                }
                // You should also check filesize here.
                if ($_FILES[$upfileName]['size'] > 75000000) {
                    throw new RuntimeException('Exceeded filesize limit.', 1);
                }
                // DO NOT TRUST $_FILES[$upfileName]['mime'] VALUE !!
                // Check MIME Type by yourself.
                $finfo = new finfo(FILEINFO_MIME_TYPE);
                if (false === $ext = array_search(
                    $finfo->file($_FILES[$upfileName]['tmp_name']),
                    $config->FileUpload,
                    true
                )) {
                    throw new RuntimeException('Invalid file format.', 1);
                }
                $type = explode("/", $finfo->file($_FILES[$upfileName]['tmp_name']))[0];

                switch ($type) {
                    case "image":
                        if (1 === $uploadError = self::uploadImage($upfileName, $ext)) {
                            array_push($return, " File: " . $upfile["name"] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    case "application":
                        if (1 === $uploadError = self::uploadApplication($upfileName, $ext)) {
                            array_push($return, " File: " . $upfile["name"] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    case "text":
                        if (1 === $uploadError = self::uploadTextfile($upfileName, $ext)) {
                            array_push($return, " File: " . $upfile["name"] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    case "video":
                        if (1 === $uploadError = self::uploadVideo($upfileName, $ext)) {
                            array_push($return, " File: " . $upfile["name"] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    default:
                        array_push($return, " File: " . $upfile["name"] . " failed to upload. " . "Unknown mime type.");
                        break;
                }
            } catch (RuntimeException $e) {
                if ($e->getCode() === 1) {
                    array_push($return, " File: " . $upfile["name"] . " failed to upload. " . $e->getMessage());
                }
            }
        }
        if (!empty($return)) {
            $returnMessage = "";
            foreach ($return as $ret) {
                $returnMessage .= $ret . "<br>";
            }
            return $returnMessage;
        } else return "Files uploaded successfully.";
    }
    static function uploadSingleInputMultipleFiles()
    {
        $return = array();
        $config = include('configs/config.php');
        $upfile = $_FILES[array_keys($_FILES)[0]];
        $upfileName = array_keys($_FILES)[0];
        foreach ($_FILES[$upfileName]["name"] as $key => $subFile) {
            try {
                // Undefined | Multiple Files | $_FILES Corruption Attack
                // If this request falls under any of them, treat it invalid.
                if (
                    !isset($_FILES[$upfileName]['error'][$key]) ||
                    is_array($_FILES[$upfileName]['error'][$key])
                ) {
                    throw new RuntimeException('Invalid parameters.', 1);
                }
                // Check $_FILES[$upfileName]['error'][$key] value.
                switch ($_FILES[$upfileName]['error'][$key]) {
                    case UPLOAD_ERR_OK:
                        break;
                    case UPLOAD_ERR_NO_FILE:
                        throw new RuntimeException('No file sent.', 1);
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        throw new RuntimeException('Exceeded filesize limit.', 1);
                    default:
                        throw new RuntimeException('Unknown errors.', 1);
                }
                // You should also check filesize here.
                if ($_FILES[$upfileName]['size'][$key] > 75000000) {
                    throw new RuntimeException('Exceeded filesize limit.', 1);
                }
                // DO NOT TRUST $_FILES[$upfileName]['mime'] VALUE !!
                // Check MIME Type by yourself.
                $finfo = new finfo(FILEINFO_MIME_TYPE);
                if (false === $ext = array_search(
                    $finfo->file($_FILES[$upfileName]['tmp_name'][$key]),
                    $config->FileUpload,
                    true
                )) {
                    throw new RuntimeException('Invalid file format.', 1);
                }
                $type = explode("/", $finfo->file($_FILES[$upfileName]['tmp_name'][$key]))[0];
                switch ($type) {
                    case "image":
                        if (1 === $uploadError = self::uploadImage($upfileName, $ext, $key)) {
                            array_push($return, " File: " . $upfile["name"][$key] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    case "application":
                        if (1 === $uploadError = self::uploadApplication($upfileName, $ext, $key)) {
                            array_push($return, " File: " . $upfile["name"][$key] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    case "text":
                        if (1 === $uploadError = self::uploadTextfile($upfileName, $ext, $key)) {
                            array_push($return, " File: " . $upfile["name"][$key] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    case "video":
                        if (1 === $uploadError = self::uploadVideo($upfileName, $ext, $key)) {
                            array_push($return, " File: " . $upfile["name"][$key] . " failed to upload. " . $uploadError[1]);
                        }
                        break;
                    default:
                        array_push($return, " File: " . $upfile["name"][$key] . " failed to upload. " . "Unknown mime type.");
                        break;
                }
            } catch (RuntimeException $e) {
                if ($e->getCode() === 1) {
                    array_push($return, " File: " . $upfile["name"][$key] . " failed to upload. " . $e->getMessage());
                }
            }
        }
        if (!empty($return)) {
            $returnMessage = "";
            foreach ($return as $ret) {
                $returnMessage .= $ret . "<br>";
            }
            return $returnMessage;
        } else return "Files uploaded successfully.";
    }
    static function uploadImage($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'images/fullView/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                ImageOptimizer::defaultImage($fileNameWDir);
                ImageOptimizer::makeThumbnail($fileNameWDir);
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'images/fullView/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                ImageOptimizer::defaultImage($fileNameWDir);
                ImageOptimizer::makeThumbnail($fileNameWDir);
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        }
    }
    static function uploadVideo($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'videos/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                //!OPTIMALIZACE VIDEA
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'videos/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                //!OPTIMALIZACE VIDEA
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        }
    }
    static function uploadApplication($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        }
    }

    static function uploadTextfile($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $e) {
                return [$e->getCode(), $e->getMessage()];
            }
        }
    }
}
