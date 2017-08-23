import org.icepdf.core.exceptions.PDFException;
import org.icepdf.core.exceptions.PDFSecurityException;
import org.icepdf.core.pobjects.Document;
import org.icepdf.core.pobjects.PDimension;
import org.icepdf.core.pobjects.Page;
import org.icepdf.core.util.GraphicsRenderingHints;
import org.icepdf.ri.util.FontPropertiesManager;
import org.icepdf.ri.util.PropertiesManager;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by ZJUXP on 2016-12-21.
 */
public class TestIce {
    static String outputFilePath = "E:\\zhm\\叶老师项目\\数据库\\";

    public static void main (String[] args) {

        // Get a file from the command line to open
        String filePath = "E:\\zhm\\叶老师项目\\数据库\\1.pdf";

        // read/store the font cache.
        ResourceBundle messageBundle = ResourceBundle.getBundle(
                PropertiesManager.DEFAULT_MESSAGE_BUNDLE);
        PropertiesManager properties = new PropertiesManager(System.getProperties(),
                ResourceBundle.getBundle(PropertiesManager.DEFAULT_MESSAGE_BUNDLE));
        new FontPropertiesManager(properties, System.getProperties(), messageBundle);

        // start the capture
        TestIce testIce = new TestIce();
        testIce.capturePages(filePath);

    }

    public void capturePages (String filePath) {
        long beginTime = System.nanoTime();
        // open the url
        Document document = new Document();

        // setup two threads to handle image extraction.
        ExecutorService executorService = Executors.newFixedThreadPool(100);
        try {
            try {
				document.setFile(filePath);
			} catch (PDFException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (PDFSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            // create a list of callables.
            int pages = document.getNumberOfPages();
            java.util.List<Callable<Void>> callables = new ArrayList<Callable<Void>>(pages);
            /*for (int i = 1; i <= pages; i++) {*/
            callables.add(new CapturePage(document, 0));
           /* }*/
            executorService.invokeAll(callables);
            executorService.submit(new DocumentCloser(document)).get();

        } catch (InterruptedException e) {
            System.out.println("Error parsing PDF document " + e);
        } catch (ExecutionException e) {
            System.out.println("Error parsing PDF document " + e);
        }
        executorService.shutdown();
        long endTime = System.nanoTime();
        System.out.println("耗时: " + (endTime - beginTime) / 1000000000 + " 秒");
    }

    /**
     * Captures images found in a page  parse to file.
     */
    public class CapturePage implements Callable<Void> {
        private Document document;
        private int pageNumber;
        private float scale = 1f;
        private float rotation = 0f;

        private CapturePage (Document document, int pageNumber) {
            this.document = document;
            this.pageNumber = pageNumber;
        }

        public Void call () {
            Page page = document.getPageTree().getPage(pageNumber);
            page.init();
            PDimension sz = page.getSize(Page.BOUNDARY_CROPBOX, rotation, scale);

            int pageWidth = (int) sz.getWidth();
            int pageHeight = (int) sz.getHeight();

            BufferedImage image = new BufferedImage(pageWidth,
                    pageHeight,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = image.createGraphics();

            page.paint(g, GraphicsRenderingHints.PRINT,
                    Page.BOUNDARY_CROPBOX, rotation, scale);
            g.dispose();
            // capture the page image to file
            try {
                System.out.println("Capturing page " + pageNumber);
                File file = new File(outputFilePath + "imageCapture_" + pageNumber + ".png");
                ImageIO.write(image, "png", file);

            } catch (Throwable e) {
                e.printStackTrace();
            }
            image.flush();
            return null;
        }
    }

    /**
     * Disposes the document.
     */
    public class DocumentCloser implements Callable<Void> {
        private Document document;

        private DocumentCloser (Document document) {
            this.document = document;
        }

        public Void call () {
            if (document != null) {
                document.dispose();
                System.out.println("Document disposed");
            }
            return null;
        }
    }
}
