import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;

public class Customer implements Runnable {
    private final Bakery bakery;
    private final Random rnd;
    private final List<BreadType> shoppingCart;
    private final int shopTime;
    private final int checkoutTime;
    private final CountDownLatch doneSignal;

    /**
     * Initialize a customer object and randomize its shopping cart
     */
    public Customer(Bakery bakery, CountDownLatch l) {
        // TODO
        this.bakery = bakery;
        doneSignal = l;
        rnd = new Random();
        shoppingCart = new LinkedList<>();
        fillShoppingCart();
        shopTime = rnd.nextInt(312) + 100;
        checkoutTime = rnd.nextInt(312) + 100;
    }

    /**
     * Run tasks for the customer
     */
    public void run() {
        // TODO
        System.out.println("Customer " + hashCode() + " starts shopping");
        try {
            // wait for shopTime
            Thread.sleep(shopTime);
            // Take bread from shelves
            for (BreadType bread : shoppingCart) {
                bakery.takeBreadFromShelf(bread);
                System.out.println("Customer " + hashCode() + " takes a loaf of " + bread + " from stock");
            }
            // wait for checkoutTime
            Thread.sleep(checkoutTime);
            // checkout(cashier), add sales(mutexSales)
            float money = getItemsValue();
            System.out.printf(this + ", consumptionAmount=%.2f\n", money);
            bakery.addSales(money);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Customer " + hashCode() + " finished shopping.");
        doneSignal.countDown();
    }

    /**
     * Return a string representation of the customer
     */
    public String toString() {
        return "Customer " + hashCode() + ": shoppingCart=" + Arrays.toString(shoppingCart.toArray()) + ", shopTime=" + shopTime + ", checkoutTime=" + checkoutTime;
    }

    /**
     * Add a bread item to the customer's shopping cart
     */
    private boolean addItem(BreadType bread) {
        // do not allow more than 3 items, chooseItems() does not call more than 3 times
        if (shoppingCart != null && shoppingCart.size() >= 3) {
            return false;
        }
        shoppingCart.add(bread);
        return true;
    }

    /**
     * Fill the customer's shopping cart with 1 to 3 random breads
     */
    private void fillShoppingCart() {
        int itemCnt = 1 + rnd.nextInt(3);
        while (itemCnt > 0) {
            addItem(BreadType.values()[rnd.nextInt(BreadType.values().length)]);
            itemCnt--;
        }
    }

    /**
     * Calculate the total value of the items in the customer's shopping cart
     */
    private float getItemsValue() {
        float value = 0;
        for (BreadType bread : shoppingCart) {
            value += bread.getPrice();
        }
        return value;
    }
}
