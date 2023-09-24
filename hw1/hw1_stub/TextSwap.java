import java.io.*;
import java.util.*;

public class TextSwap {

/*    Dear teaching assistant,
    My name is Yunfei Tang. I think that there is something wrong with the letters.txt.
    The real number of valid characters should be file.length()-2 since there are both space and newline characters in the file.
    But I still followed the instruction demonstrated in the code.
    I set the character number as file.length()-1 and deleted the space character in the letters.txt file.*/

    private static String readFile(String filename, int chunkSize) throws Exception {
        String line;
        StringBuilder buffer = new StringBuilder();
        File file = new File(filename);
        BufferedReader br = new BufferedReader(new FileReader(file));
        while ((line = br.readLine()) != null) {
            buffer.append(line);
        }
        br.close();
        return buffer.toString();
    }

    private static Interval[] getIntervals(int numChunks, int chunkSize) {
        // TODO: Implement me!
        // An interval: the start and end index of a chunk
        // if numChunks=5, chunkSize=4, interval[]: (0,3), (4,7), (8,11), (12,15), (16,19).
        Interval[] intervals = new Interval[numChunks];
        for (int i = 0; i < numChunks; i++) {
            intervals[i] = new Interval(i * chunkSize, i * chunkSize + chunkSize - 1);
        }
        // System.out.println(intervals[2].toString());
        return intervals;
    }

    private static List<Character> getLabels(int numChunks) {
        Scanner scanner = new Scanner(System.in);
        List<Character> labels = new ArrayList<Character>();
        int endChar = numChunks == 0 ? 'a' : 'a' + numChunks - 1;
        System.out.printf("Input %d character(s) (\'%c\' - \'%c\') for the pattern.\n", numChunks, 'a', endChar);
        for (int i = 0; i < numChunks; i++) {
            labels.add(scanner.next().charAt(0));
        }
        scanner.close();
        // System.out.println(labels);
        return labels;
    }

    private static char[] runSwapper(String content, int chunkSize, int numChunks) {
        List<Character> labels = getLabels(numChunks);
        Interval[] intervals = getIntervals(numChunks, chunkSize);
        // TODO: Order the intervals properly, then run the Swapper instances.
        char[] buffer = new char[content.length()];
        Thread[] threads = new Thread[numChunks];
        Runnable[] threadJobs = new Runnable[numChunks];
        for (int i = 0; i < numChunks; i++) {
            int order = labels.get(i) - 97;
            threadJobs[i] = new Swapper(intervals[order], content, buffer, i * chunkSize);
            threads[i] = new Thread(threadJobs[i]);
            threads[i].start();
        }
        return buffer;
    }

    private static void writeToFile(String contents, int chunkSize, int numChunks) throws Exception {
        char[] buff = runSwapper(contents, chunkSize, contents.length() / chunkSize);
        PrintWriter writer = new PrintWriter("output.txt", "UTF-8");
        writer.print(buff);
        writer.close();
    }

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java TextSwap <chunk size> <filename>");
            return;
        }
        String contents = "";
        int chunkSize = Integer.parseInt(args[0]);
        /* As the illustration of main(), fileSize and numChunk should be checked as follows.
            1. fileSize should be a multiple of chunk size.
            2. numChunk should not be more than 26. */
        try {
            File file = new File(args[1]);
            // The "-1" below is because of this:
            // https://stackoverflow.com/questions/729692/why-should-text-files-end-with-a-newline
            if ((file.length() - 1) % chunkSize != 0) {
                throw new Exception("File size must be a multiple of the chunk size");
            }
            if ((file.length() - 1) / chunkSize > 26) {
                throw new Exception("Chunk size too small");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.exit(1);
        }
        // numbers checked, start real work.
        try {
            contents = readFile(args[1], chunkSize);
            writeToFile(contents, chunkSize, contents.length() / chunkSize);
        } catch (Exception e) {
            System.out.println("Error with IO.");
            // e.printStackTrace();
            return;
        }
    }
}
