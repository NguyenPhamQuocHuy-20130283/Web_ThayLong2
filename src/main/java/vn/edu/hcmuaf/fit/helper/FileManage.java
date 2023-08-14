package vn.edu.hcmuaf.fit.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class FileManage {

    public String upLoad(Part part, String folder) throws IOException {
        String file = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        Path path = Paths.get(folder);
        if (!Files.exists(path)) {
            Files.createDirectory(path);
        }
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            File outputFilePath = new File(Paths.get(path.toString(), file).toString());
            if (outputFilePath.exists()) {
                Random random = new Random();
                file = random.nextInt(1000000000) + "-" + file.replaceAll("\\s+", "-");
                outputFilePath = new File(Paths.get(path.toString(), file).toString());
            }
            inputStream = part.getInputStream();
            outputStream = Files.newOutputStream(outputFilePath.toPath());
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        } catch (Exception e) {
            e.printStackTrace();
            file = "";
        } finally {
            if (outputStream != null) {
                outputStream.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
        return file;
    }

    public void delete(String fileName, String folder) throws IOException {
        Path path = Paths.get(folder);
        System.out.println(path);
        try {
            File file = new File(Paths.get(path.toString(), fileName).toString());
            System.out.println(file.getCanonicalFile());
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public List<String> uploadFiles(String UPLOAD_DIR, HttpServletRequest request) {
        List<String> fileNames = new ArrayList<>();
        try {
            List<Part> parts = (List<Part>) request.getParts();
            if (parts.size() == 0) return new ArrayList<>();
            for (Part part : parts) {
                System.out.println(part.getName());
                if (part.getName().equalsIgnoreCase("link")) {
                    String fileName = getFileName(part);
                    System.out.println(fileName);
                    if (fileName == null || fileName.isEmpty()) return new ArrayList<String>();
                    String applicationPath = request.getServletContext().getRealPath("");
                    System.out.println(applicationPath);
                    String basePath = applicationPath + UPLOAD_DIR + File.separator;
                    System.out.println(basePath);
                    InputStream inputStream = null;
                    OutputStream outputStream = null;
                    try {
                        File outputFilePath = new File(basePath + fileName);
                        if (outputFilePath.exists()) {
                            Random random = new Random();
                            fileName = random.nextInt(1000000000) + "-" + fileName.replaceAll("\\s+", "-");
                            System.out.println(fileName);
                            outputFilePath = new File(basePath + fileName);
                        }
                        fileNames.add(fileName);
                        System.out.println(fileNames);
                        inputStream = part.getInputStream();
                        outputStream = new FileOutputStream(outputFilePath);
                        int read = 0;
                        final byte[] bytes = new byte[1024];
                        while ((read = inputStream.read(bytes)) != -1) {
                            System.out.println("asd");
                            outputStream.write(bytes, 0, read);
                        }
                    } catch (Exception ex) {
                        fileName = null;
                    } finally {
                        if (outputStream != null) {
                            outputStream.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                        }
                    }
                }
            }
        } catch (Exception e) {
            fileNames = null;
        }
        return fileNames;
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}