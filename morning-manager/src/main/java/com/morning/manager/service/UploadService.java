package com.morning.manager.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UploadService {

    public String upload(MultipartFile file) throws IOException, NoSuchAlgorithmException;
}
