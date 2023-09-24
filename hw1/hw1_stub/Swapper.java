public class Swapper implements Runnable {
    private int offset;
    private Interval interval;
    private String content;
    private char[] buffer;

    public Swapper(Interval interval, String content, char[] buffer, int offset) {
        this.offset = offset;
        this.interval = interval;
        this.content = content;
        this.buffer = buffer;
    }

    @Override
    public void run() {
        // TODO: Implement me!
        int start = interval.getX();
        int end = interval.getY();
        int len = end - start + 1;
        for (int i = 0; i < len; i++) {
            buffer[offset + i] = content.charAt(start + i);
        }
    }
}